class Collateral {
  final String _code;
  final String _id;
  final String _status;

  /// 0: Ko, 1: Xanh, 2: Vàng, 3: Cam, 4: Đỏ
  final int _warningLevel;

  Collateral(this._code, this._id, this._status, this._warningLevel);

  String get code => _code;
  String get id => _id;
  String get status => _status;
  int get warningLevel => _warningLevel;
}
