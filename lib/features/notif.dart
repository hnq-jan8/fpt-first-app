import 'package:flutter/material.dart';
import '../data/notif_manager.dart';

class NotifScreen extends StatefulWidget {
  const NotifScreen({super.key});

  @override
  State<NotifScreen> createState() => _NotifScreenState();
}

class _NotifScreenState extends State<NotifScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

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
        bottom: TabBar(
          controller: _tabController,
          unselectedLabelColor: Colors.white54,
          indicatorColor: Colors.white,
          indicatorPadding: const EdgeInsets.symmetric(horizontal: 32),
          tabs: const [
            Tab(text: 'Loại 1'),
            Tab(text: 'Loại 2'),
            Tab(text: 'Loại 3'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          notifTabView(1),
          notifTabView(2),
          notifTabView(3),
        ],
      ),
    );
  }

  notifTabView(int notifType) {
    if (NotifManager().getDataLength(notifType) == 0) {
      return const Center(child: Text('No notifications'));
    }
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      itemCount: NotifManager().getDataLength(notifType),
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () => debugPrint('Choose $notifType.${index + 1}'),
          borderRadius: BorderRadius.circular(18),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black38,
              borderRadius: BorderRadius.circular(15),
            ),
            margin: const EdgeInsets.all(5),
            padding: const EdgeInsets.only(
              top: 17,
              bottom: 10,
              left: 20,
              right: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  NotifManager().getData(notifType)[index].title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10, bottom: 15, left: 1),
                  child: Text(
                    NotifManager().getData(notifType)[index].content,
                    // maxLines: 2,
                    // overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      height: 1.5,
                      color: Colors.white.withOpacity(0.9),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      NotifManager().getData(notifType)[index].date,
                      style: TextStyle(
                        color: Colors.orange[300],
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      NotifManager().getData(notifType)[index].time,
                      style: TextStyle(
                        color: Colors.orange[400],
                        fontSize: 12,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
