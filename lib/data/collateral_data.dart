class Collateral {
  final String _code;
  final String _id;
  final String _status;

  Collateral(this._code, this._id, this._status);

  String get code => _code;
  String get id => _id;
  String get status => _status;
}
