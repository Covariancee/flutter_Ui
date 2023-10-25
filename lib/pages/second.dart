import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(80.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Journal', style: TextStyle(fontSize: 40)),
          const Text('18', style: TextStyle(fontSize: 120)),
          const Text('September 2020'),
        ],
      ),
    );
  }
}
