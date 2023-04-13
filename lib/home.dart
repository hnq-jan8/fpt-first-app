import 'package:flutter/material.dart';
import './login.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final Map<IconData, String> features = {
    Icons.camera_alt: 'Truy vết TSĐB',
    Icons.map: 'Bản đồ',
    Icons.list_rounded: 'Danh sách\nPTVT cần xử lý',
    Icons.notifications_rounded: 'Thông báo',
  };

  @override
  Widget build(BuildContext context) {
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Scaffold(
      backgroundColor: Colors.purple[900],
      appBar: AppBar(
        backgroundColor: Colors.purple[900],
        shadowColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.menu_rounded),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout_rounded),
            tooltip: 'Đăng xuất',
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  title:
                      const Text('Đăng xuất', style: TextStyle(fontSize: 18)),
                  titlePadding: const EdgeInsets.only(top: 23, left: 24),
                  content: const Text('Bạn có muốn đăng xuất ?'),
                  contentPadding:
                      const EdgeInsets.only(top: 20, left: 24, bottom: 12),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text('Không',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.purple[300],
                          )),
                    ),
                    ElevatedButton(
                      onPressed: () => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          )),
                      child: const Text('Đồng ý',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                          )),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: GridView.count(
          crossAxisCount: isPortrait ? 2 : 4,
          crossAxisSpacing: 30,
          mainAxisSpacing: 25,
          padding: const EdgeInsets.only(left: 50, right: 50, bottom: 90),
          shrinkWrap: true,
          children: [
            for (final feature in features.entries)
              InkWell(
                onTap: () {},
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                splashColor: Colors.black12,
                highlightColor: Colors.black12,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: isPortrait ? 32 : 40),
                    Icon(
                      feature.key,
                      size: 40,
                      color: Colors.deepOrange[300],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      feature.value,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.94),
                        height: 1.25,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
