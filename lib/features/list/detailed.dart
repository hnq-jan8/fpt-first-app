import 'package:flutter/material.dart';
import './category.dart';

class DetailedView extends StatelessWidget {
  final int index;

  const DetailedView(this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      appBar: AppBar(
        backgroundColor: Colors.purple[900],
        title: const Text(
          'Chi tiết',
          style: TextStyle(fontSize: 18),
        ),
      ),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 600, maxHeight: 500),
          margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          padding: const EdgeInsets.symmetric(
            vertical: 15,
            horizontal: 20,
          ),
          decoration: BoxDecoration(
            color: Colors.black38,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            children: categories(index, isDetailed: true),
          ),
        ),
      ),
    );
  }
}
