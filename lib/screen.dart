import 'package:flutter/material.dart';
import 'package:TTest/randomizer.dart';

class RandomColorScreen extends StatefulWidget {
  RandomColorScreen({Key key}) : super(key: key);

  @override
  _RandomColorScreenState createState() => _RandomColorScreenState();
}

class _RandomColorScreenState extends State<RandomColorScreen> {
  @override
  Widget build(BuildContext context) {
    final randomizer = ColorsRandomizer();
    return Container(
      child: MaterialApp(
        home: GestureDetector(
          onTap: () {
            print('Screen tapped');
            randomizer.updateColor();
          },
          child: StreamBuilder<Color>(
            stream: randomizer.randomColor,
            initialData: Colors.grey,
            builder: (context, snapshot) {
              return Scaffold(
                backgroundColor: snapshot.data,
                body: Center(
                  child: Text(
                    "Hey there",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
