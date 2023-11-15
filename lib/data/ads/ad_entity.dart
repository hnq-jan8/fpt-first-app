class DataPackage {
  final String _title;
  final String _description;
  final String _highlight;

  DataPackage(this._title, this._description, this._highlight);

  String get title => _title;
  String get description => _description;
  String get highlight => _highlight;
}
