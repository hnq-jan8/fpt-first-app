import 'package:flutter/material.dart';
import '../../data/notif_manager.dart';

class NotifBlock extends StatefulWidget {
  final int notifType;
  final int index;
  const NotifBlock(this.notifType, this.index, {super.key});

  @override
  State<NotifBlock> createState() => _NotifBlockState();
}

class _NotifBlockState extends State<NotifBlock> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.black38,
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        onTap: () => setState(() => expanded = !expanded),
        borderRadius: BorderRadius.circular(15),
        highlightColor: Colors.white12,
        splashColor: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 9),
                child: Text(
                  NotifManager().getData(widget.notifType)[widget.index].title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10, bottom: 17),
                child: Text(
                  NotifManager()
                      .getData(widget.notifType)[widget.index]
                      .content,
                  maxLines: expanded ? null : 2,
                  overflow: expanded ? null : TextOverflow.ellipsis,
                  style: TextStyle(
                    height: 1.5,
                    color: Colors.white.withOpacity(0.87),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    NotifManager().getData(widget.notifType)[widget.index].date,
                    style: TextStyle(
                      color: Colors.orange[300],
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    NotifManager().getData(widget.notifType)[widget.index].time,
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
      ),
    );
  }
}
