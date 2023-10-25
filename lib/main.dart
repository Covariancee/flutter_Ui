import 'package:flutter/material.dart';
import 'package:flutter_ui/pages/first.dart';
import 'package:flutter_ui/pages/second.dart';
import 'package:flutter_ui/pages/third.dart';
import 'package:o3d/o3d.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UI 3D flutter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final O3DController _o3dController = O3DController();
  final PageController _mainPageController = PageController();
  final pageIndex = 0;
  bool thirdIsVisible = false;
  bool secondIsVisible = false;
  bool firstIsVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Walker'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          SizedBox(
            height: 800,
            child: O3D(
              src: 'assets/walking.glb',
              controller: _o3dController,
              ar: false,
              autoPlay: true,
              autoRotate: false,
              cameraControls: false,
              cameraTarget: CameraTarget(0.2, 0.5, 1.5),
              cameraOrbit: CameraOrbit(180, 80, 1),
            ),
          ),
          PageView(controller: _mainPageController, children: [
            Visibility(visible: firstIsVisible, child: const FirstPage()),
            Visibility(visible: secondIsVisible, child: const SecondPage()),
            Visibility(visible: thirdIsVisible, child: const ThirdPage()),
          ])
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: pageIndex,
          onTap: (pageIndex) {
            _mainPageController.animateToPage(pageIndex,
                duration: const Duration(milliseconds: 500),
                curve: Curves.ease);
            if (pageIndex == 0) {
              _o3dController.cameraTarget(0.2, 0.5, 1.5);
              _o3dController.cameraOrbit(180, 80, 1);
              visibilityController(0);
            } else if (pageIndex == 1) {
              _o3dController.cameraTarget(-1, 0.8, 0.2);
              _o3dController.cameraOrbit(90, 90, 1);
              visibilityController(1);
            } else if (pageIndex == 2) {
              _o3dController.cameraTarget(-0.2, 0.5, 3.4);
              _o3dController.cameraOrbit(180, 90, 1);
              visibilityController(2);
            }
            setState(() {});
          },
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.assistant_navigation),
              label: 'second',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.saved_search_outlined),
              label: 'third',
            ),
          ]),
    );
  }

  void visibilityController(index) {
    if (index == 0) {
      firstIsVisible = true;
      secondIsVisible = false;
      thirdIsVisible = false;
    } else if (index == 1) {
      firstIsVisible = false;
      secondIsVisible = true;
      thirdIsVisible = false;
    } else if (index == 2) {
      firstIsVisible = false;
      secondIsVisible = false;
      thirdIsVisible = true;
    }
  }
}
