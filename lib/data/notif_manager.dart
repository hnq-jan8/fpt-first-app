import './data_manager.dart';
import './notif_data.dart';

class NotifManager extends DataManager<Notif> {
  final List<Notif> _notifType1 = [
    Notif('Title 1', 'Content 1.', '17/04/23', '14:17:00'),
    Notif('Title 2', 'Content 2 is significantly longer than Content 1.',
        '17/04/23', '12:05:04'),
    Notif('Title 3', 'Content 3 is slightly shorter than Content 2.',
        '17/04/23', '09:15:30'),
    Notif(
        'Title 4',
        'Content 4 should be displayed right below '
            'this 16-font-size-unit title and should '
            'fit perfectly into this large container.',
        '16/04/23',
        '17:10:00'),
    Notif('Title 5', '5.', '16/04/23', '15:00:20'),
    Notif('Title 6', '6.', '16/04/23', '13:01:10'),
    Notif('Title 7', '7.', '16/04/23', '12:00:22'),
  ];

  final List<Notif> _notifType2 = [
    Notif('Title 1.1', 'Content 1.', '17/04/23', '14:00:00'),
    Notif('Title 2.1', 'Content 2 is significantly longer than 1.', '17/04/23',
        '12:00:00'),
    Notif('Title 3.1', 'Content 3 is now slightly longer than Content 2.',
        '17/04/23', '09:00:00'),
  ];

  final List<Notif> _notifType3 = [];

  @override
  List<Notif> getData([int? type]) {
    switch (type) {
      case 1:
        return _notifType1;
      case 2:
        return _notifType2;
      case 3:
        return _notifType3;
      default:
        throw Exception('Invalid data type');
    }
  }

  @override
  int getDataLength([int? type]) {
    switch (type) {
      case 1:
        return _notifType1.length;
      case 2:
        return _notifType2.length;
      case 3:
        return _notifType3.length;
      default:
        throw Exception('Invalid data type');
    }
  }
}
