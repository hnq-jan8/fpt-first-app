import 'package:flutter/material.dart';
import '../../data/collateral_manager.dart';

/// index: index of the item in the list
List<Widget> categories(int index, {bool isDetailed = false}) {
  String localLabel = '';
  String data = '';
  String warningLevel = CollateralManager().getData()[index].warningLevel;
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
    if (isDetailed)
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const Text("Mức độ cảnh báo: ", style: TextStyle(height: 2)),
          Container(
            height: 20,
            width: 64,
            decoration: BoxDecoration(
              color: warningLevel == '4'
                  ? Colors.red[400]
                  : warningLevel == '3'
                      ? Colors.orange[400]
                      : warningLevel == '2'
                          ? Colors.yellow[400]
                          : warningLevel == '1'
                              ? Colors.green[400]
                              : Colors.grey[400],
              borderRadius: BorderRadius.circular(5),
            ),
          )
        ],
      )
  ];
}
