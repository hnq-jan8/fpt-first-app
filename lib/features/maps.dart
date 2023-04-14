import 'package:flutter/material.dart';

class MapScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.deepPurple,
        appBar: AppBar(
          backgroundColor: Colors.purple[900],
          shadowColor: Colors.transparent.withOpacity(.5),
          title: const Text(
            'Bản đồ',
            style: TextStyle(fontSize: 18),
          ),
        ));
  }
}
