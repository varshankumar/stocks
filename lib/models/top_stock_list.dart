import 'package:advanced_python_project/models/stock.dart';

class TopStockList {
  TopStockList({required this.data});
  List<Stock> data = [];
  factory TopStockList.fromJson(Map<String, dynamic> json) {
    List<Stock> temp = [];
    for (int i = 0; i < json['data']['0'].length; i++) {
      temp.add(Stock(
        name: json['data']['0'][i]['1'],
        price: json['data']['0'][i]['0'],
      ));
    }
    print(temp);
    return TopStockList(data: temp);
  }
}
