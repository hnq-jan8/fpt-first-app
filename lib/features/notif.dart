import 'package:flutter/material.dart';

class NotifScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      appBar: AppBar(
        backgroundColor: Colors.purple[900],
        title: const Text(
          'Thông báo',
          style: TextStyle(fontSize: 18),
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(8),
        itemCount: 30,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () => debugPrint('Choose ${index + 1}'),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  // color: Colors.purple[700],
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.only(top: 7, left: 25),
                  child: const Text(
                    'Notification Title',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 12,
                  ),
                  margin: const EdgeInsets.only(
                    top: 10,
                    left: 19,
                    right: 19,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black26,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    'Content should be displayed right '
                    'below this 16-font-size-unit title '
                    'and should fit into this container',
                    style: TextStyle(
                      height: 1.5,
                      color: Colors.white.withOpacity(0.9),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 12, bottom: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        // color: Colors.white30,
                        margin: const EdgeInsets.only(left: 25),
                        child: Text(
                          'dd:mm:yy',
                          style: TextStyle(color: Colors.orange[400]),
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        // color: Colors.white10,
                        margin: const EdgeInsets.only(right: 25),
                        child: Text(
                          'hh:mm:ss',
                          style: TextStyle(color: Colors.orange[400]),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(
          color: Colors.grey,
        ),
      ),
    );
  }
}
