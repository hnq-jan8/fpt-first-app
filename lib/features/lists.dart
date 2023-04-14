import 'package:flutter/material.dart';

class ListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
        appBar: AppBar(
          backgroundColor: Colors.purple[900],
          shadowColor: Colors.transparent.withOpacity(.5),
          title: const Text(
            'Danh sách PTVT cần sử lý',
            style: TextStyle(fontSize: 18),
          ),
        ));
  }
}
