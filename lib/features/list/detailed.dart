import 'package:flutter/material.dart';
import './category.dart';
import './list.dart';

class DetailedView extends StatelessWidget {
  final int index;

  const DetailedView(this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              constraints: const BoxConstraints(maxWidth: 600),
              margin: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 20,
              ),
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
              decoration: BoxDecoration(
                color: Colors.black38,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: categories(index, isDetailed: true),
              ),
            ),
            FloatingActionButton.extended(
              heroTag: 'goBack',
              elevation: 0,
              splashColor: Colors.transparent,
              highlightElevation: 0,
              onPressed: () => Navigator.pop(context),
              backgroundColor: Colors.deepPurple,
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 21,
              ),
              label: const Text(
                'Quay lại ',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
