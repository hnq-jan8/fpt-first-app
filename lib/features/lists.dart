import 'package:flutter/material.dart';
import '../data/collateral_manager.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      appBar: AppBar(
        backgroundColor: Colors.purple[900],
        title: const Text(
          'Danh sách PTVT cần sử lý',
          style: TextStyle(fontSize: 18),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        itemCount: 4,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () => debugPrint('Choose ${index + 1}'),
            borderRadius: BorderRadius.circular(18),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black38,
                borderRadius: BorderRadius.circular(15),
              ),
              margin: const EdgeInsets.all(5),
              padding: const EdgeInsets.symmetric(
                vertical: 15,
                horizontal: 20,
              ),
              child: Column(
                children: [
                  categories(index, 'Mã PTVT'),
                  categories(index, 'Biển số'),
                  categories(index, 'Trạng thái'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Row categories(int index, String label) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('$label:'),
        Text(
          label == 'Biển số'
              ? CollateralManager().getData()[index].id
              : label == 'Trạng thái'
                  ? CollateralManager().getData()[index].status
                  : CollateralManager().getData()[index].code,
          style: TextStyle(
            height: 2,
            color: Colors.orange[300],
          ),
        ),
      ],
    );
  }
}
