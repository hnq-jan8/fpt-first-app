import 'package:flutter/material.dart';

class CamScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.deepPurple,
        appBar: AppBar(
          backgroundColor: Colors.purple[900],
          shadowColor: Colors.transparent.withOpacity(.5),
          title: const Text(
            'Truy vết TSĐB',
            style: TextStyle(fontSize: 18),
          ),
        ));
  }
}
