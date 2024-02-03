import 'package:advanced_python_project/models/stock.dart';

class StockList {
  StockList({required this.data});
  List<Stock> data = [];
  factory StockList.fromJson(Map<String, dynamic> json) {
    List<Stock> temp = [];
    for (int i = 0; i < json['price'].length; i++) {
      temp.add(Stock(
        price: json['price'][i],
      ));
    }
    print(temp);
    return StockList(data: temp);
  }
}
