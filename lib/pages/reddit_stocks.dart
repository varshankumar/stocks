import 'dart:convert';
import 'dart:async';
import 'package:advanced_python_project/models/bar_chart_model.dart';
import 'package:advanced_python_project/models/stock_list.dart';
import 'package:advanced_python_project/pages/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RedditStocksPage extends StatefulWidget {
  const RedditStocksPage({Key? key, required this.ticker}) : super(key: key);
  final String ticker;
  //List<Stock> data;

  @override
  State<StatefulWidget> createState() => _RedditStocksPageState();
}

class _RedditStocksPageState extends State<RedditStocksPage> {
  Future<StockList> _loadData() async {
    final response = await http.get(Uri.parse(
        'https://redditstocks-api.herokuapp.com/stock/${widget.ticker}'));
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
                child: StockChart(
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
