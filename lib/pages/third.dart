import 'package:flutter/material.dart';

class ThirdPage extends StatefulWidget {
  const ThirdPage({Key? key}) : super(key: key);

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(160.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text('Daily Goals', style: TextStyle(fontSize: 40)),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('%'),
              Text('85', style: TextStyle(fontSize: 120)),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: SizedBox(
              width: 150,
              child: Row(
                children: [
                  Icon(Icons.local_fire_department),
                  SizedBox(
                    width: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text('Calories'), Text('2000')],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: SizedBox(
              width: 150,
              child: Row(
                children: [
                  Icon(Icons.directions_walk_rounded),
                  SizedBox(
                    width: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text('Steps'), Text('8756')],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: SizedBox(
              width: 150,
              child: Row(
                children: [
                  Icon(Icons.shield_moon),
                  SizedBox(
                    width: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Sleep'),
                        Text('8h'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
