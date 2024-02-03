import 'package:advanced_python_project/models/stock_list.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartData {
  ChartData(this.x, this.y);
  final double x;
  final double y;
}

class StockChart extends StatelessWidget {
  const StockChart({Key? key, required this.data, required this.title}) : super(key: key);

  final StockList data;
  final String title;

  @override
  Widget build(BuildContext context) {
    double index = -1;
    final List<ChartData> chartData = data.data.map((e) {
      index++;
      return ChartData(index, e.price);
    }).toList();

    return Container(
        color: const Color.fromRGBO(34, 52, 60, 1),
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.1,
              child: Center(
                child: Text(
                "$title" ,
                  style: TextStyle(fontSize: 60, color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.8,
              child: SfCartesianChart(series: <ChartSeries>[
                LineSeries<ChartData, double>(
                    dataSource: chartData,
                    xValueMapper: (ChartData data, _) => data.x,
                    yValueMapper: (ChartData data, _) => data.y)
              ]),
            ),
          ],
        ));
  }
}
