import './data_manager.dart';
import './collateral_data.dart';

class CollateralManager extends DataManager<Collateral> {
  final List<Collateral> _listPTVT = [
    Collateral('001', '11122', 'Đã xử lý'),
    Collateral('002', '12345', 'Đã xử lý'),
    Collateral('003', '11234', 'Chưa xử lý'),
    Collateral('004', '12344', 'Đã xử lý'),
    Collateral('005', '22313', 'Chưa xử lý'),
    Collateral('006', '45324', 'Đã xử lý'),
  ];

  @override
  List<Collateral> getData() => _listPTVT;

  @override
  int getDataLength() => _listPTVT.length;
}
