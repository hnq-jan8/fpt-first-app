import 'package:flutter/material.dart';
import '../../data/collateral_manager.dart';

/// index: index of the item in the list
List<Widget> categories(int index, {bool isDetailed = false}) {
  String localLabel = '';
  String data = '';
  int warningLevel = CollateralManager().getData()[index].warningLevel;

  List warningColors = [
    Colors.white.withOpacity(0.8),
    Colors.green,
    Colors.yellow,
    Colors.orange[600],
    Colors.red,
  ];

  var textDataColor = Colors.white.withOpacity(0.8);
  // isDetailed ? Colors.white.withOpacity(0.8) : Colors.orange[300];

  return [
    for (int i = 1; i <= 3; i++)
      (int index, int label) {
        switch (label) {
          case 1:
            data = CollateralManager().getData()[index].code;
            localLabel = 'Mã PTVT';
            break;
          case 2:
            data = CollateralManager().getData()[index].id;
            localLabel = 'Biển số';
            break;
          case 3:
            data = CollateralManager().getData()[index].status;
            localLabel = 'Trạng thái';
            break;
        }

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '$localLabel:',
              style: const TextStyle(height: 2),
            ),
            Text(
              data,
              style: TextStyle(
                height: 2,
                color: textDataColor,
              ),
            ),
          ],
        );
      }(index, i),
    if (isDetailed) ...[
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const Text("Mức độ cảnh báo: ", style: TextStyle(height: 2)),
          Container(
            height: 20,
            width: 64,
            decoration: BoxDecoration(
              color: warningColors[warningLevel],
              borderRadius: BorderRadius.circular(5),
            ),
          )
        ],
      ),
      Container(
        margin: const EdgeInsets.only(top: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('Cập nhật CV: '),
            DropdownButton<String>(
              items: ['Chưa xử lý', 'Đã xử lý']
                  .map((String value) => DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      ))
                  .toList(),
              onChanged: (Object? value) {},
              icon: const Icon(Icons.arrow_drop_down_rounded, size: 45),
              underline: Container(),
            )
          ],
        ),
      ),
    ]
  ];
}
