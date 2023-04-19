import './data_manager.dart';
import './collateral_data.dart';

class CollateralManager extends DataManager<Collateral> {
  final List<Collateral> _listPTVT = [
    Collateral('001', '11122', 'Đã xử lý', 4),
    Collateral('002', '12345', 'Đã xử lý', 3),
    Collateral('003', '11234', 'Chưa xử lý', 1),
    Collateral('004', '12344', 'Đã xử lý', 1),
    Collateral('005', '22313', 'Chưa xử lý', 4),
    Collateral('006', '45324', 'Đã xử lý', 2),
  ];

  @override
  List<Collateral> getData() => _listPTVT;

  @override
  int getDataLength() => _listPTVT.length;
}
