class Notif {
  final String _title;
  final String _content;
  final String _date;
  final String _time;

  Notif(this._title, this._content, this._date, this._time);

  String get title => _title;
  String get content => _content;
  String get date => _date;
  String get time => _time;
}
