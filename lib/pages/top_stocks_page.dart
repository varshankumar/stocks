import 'dart:convert';
import 'dart:async';
import 'package:advanced_python_project/models/stock_list.dart';
import 'package:advanced_python_project/models/top_stock_chart.dart';
import 'package:advanced_python_project/pages/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TopStocksPage extends StatefulWidget {
  const TopStocksPage({Key? key, required this.ticker}) : super(key: key);
  final String ticker;
  //List<Stock> data;

  @override
  State<StatefulWidget> createState() => _TopStocksPageState();
}

class _TopStocksPageState extends State<TopStocksPage> {
  Future<StockList> _loadData() async {
    final response = await http.get(Uri.parse(
        'https://redditstocks-api.herokuapp.com/call/wallstreetbets'));
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      //print(response.body);
      return StockList.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load stonks');
    }
  }

  @override
  Widget build(BuildContext context) {
    Future<StockList> loadedData = _loadData();
    return FutureBuilder(
        future: loadedData,
        builder: (BuildContext context, AsyncSnapshot<StockList> snapshot) {
          if (snapshot.hasData) {
            return Scaffold(
              appBar: AppBar(
                backgroundColor: const Color.fromARGB(255, 22, 35, 40),
              ),
              body: Container(
                color: const Color.fromRGBO(34, 52, 60, 1),
                child: TopStockChart(
                  title: widget.ticker,
                  data: snapshot.data!,
                ),
              ),
            );
          } else {
            return const LoadingScreen();
          }
        });
  }
}
