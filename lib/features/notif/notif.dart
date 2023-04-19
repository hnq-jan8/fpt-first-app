import 'package:flutter/material.dart';
import './notif_block.dart';
import '../../data/notif_manager.dart';

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
          splashBorderRadius: BorderRadius.circular(20),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          unselectedLabelColor: Colors.white54,
          indicatorColor: Colors.white,
          indicatorSize: TabBarIndicatorSize.label,
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
        return AnimatedSize(
          duration: const Duration(milliseconds: 250),
          curve: Curves.fastOutSlowIn,
          child: NotifBlock(notifType, index),
        );
      },
    );
  }
}

