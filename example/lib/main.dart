import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool value = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Switch(
          value: value,
          activeColor: Colors.blue,
          activeTrackColor: Colors.blue[100],
          onChanged: (value) {
            setState(() {
              this.value = value;
            });
          },
        ),
      ),
    );
  }
}
