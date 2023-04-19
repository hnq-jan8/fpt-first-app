import 'package:flutter/material.dart';
import './login.dart';
import 'features/cam/cam.dart';
import 'features/maps/maps.dart';
import 'features/list/list.dart';
import 'features/notif/notif.dart';

Route toFeature(String featureName) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) {
      switch (featureName) {
        case 'Truy vết TSĐB':
          return const CamScreen();
        case 'Bản đồ':
          return const MapScreen();
        case 'Danh sách\nPTVT cần xử lý':
          return const ListScreen();
        case 'Thông báo':
          return const NotifScreen();
        default:
          return const LoginScreen();
      }
    },
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = const Offset(1.0, 0.0);
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
          signOutButton(context),
        ],
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.only(bottom: 70),
          height: 400,
          width: isPortrait ? 400 : 800,
          child: Center(
            child: GridView.count(
              crossAxisCount: isPortrait ? 2 : 4,
              crossAxisSpacing: 30,
              mainAxisSpacing: 25,
              padding: const EdgeInsets.symmetric(horizontal: 50),
              shrinkWrap: true,
              children: [
                for (final feature in features.entries)
                  InkWell(
                    onTap: () => Navigator.of(context).push(
                      toFeature(feature.value),
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                    splashColor: Colors.transparent,
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
        ),
      ),
    );
  }

  IconButton signOutButton(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.logout_rounded),
      tooltip: 'Đăng xuất',
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            title: const Text('Đăng xuất', style: TextStyle(fontSize: 18)),
            titlePadding: const EdgeInsets.only(top: 23, left: 24),
            content: const Text('Bạn có muốn đăng xuất ?'),
            contentPadding:
                const EdgeInsets.only(top: 20, left: 24, bottom: 17),
            actionsPadding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
            actions: [
              TextButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7),
                  )),
                  padding: MaterialStateProperty.all(
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  ),
                ),
                onPressed: () => Navigator.pop(context),
                child: Text('Không',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.purple[300],
                    )),
              ),
              ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7),
                  )),
                  padding: MaterialStateProperty.all(
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                  ),
                ),
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
    );
  }
}
