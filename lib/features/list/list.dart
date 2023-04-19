import 'package:flutter/material.dart';
import '../../data/collateral_manager.dart';
import './detailed.dart';
import './category.dart';
import '../maps/maps.dart';

Route toMaps() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) {
      return const MapScreen();
    },
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = const Offset(0.0, 1.0);
      var end = Offset.zero;
      var curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      appBar: AppBar(
        backgroundColor: Colors.purple[900],
        title: const Text(
          'Danh sách PTVT cần xử lý',
          style: TextStyle(fontSize: 18),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(context, toMaps()),
        backgroundColor: Colors.orange,
        child: const Icon(
          Icons.map,
          color: Colors.black87,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: CollateralManager().getDataLength() == 0
          ? const Center(child: Text('No data found'))
          : listView(),
    );
  }

  Center listView() {
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 500),
        child: ListView.builder(
          padding: const EdgeInsets.only(
            top: 10,
            bottom: 84,
            left: 15,
            right: 15,
          ),
          itemCount: CollateralManager().getDataLength(),
          itemBuilder: (BuildContext context, int index) {
            return listElement(context, index);
          },
        ),
      ),
    );
  }

  Container listElement(BuildContext context, int index) {
    return Container(
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.black38,
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        highlightColor: Colors.white12,
        splashColor: Colors.transparent,
        borderRadius: BorderRadius.circular(15),
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailedView(index),
          ),
        ),
        child: Container(
          padding: const EdgeInsets.only(
            top: 12,
            bottom: 15,
            left: 20,
            right: 20,
          ),
          child: Column(
            children: categories(index),
          ),
        ),
      ),
    );
  }
}
