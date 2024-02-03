import 'package:advanced_python_project/models/stock_list.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class TopChartData {
  TopChartData(this.x, this.y);
  final String x;
  final double y;
}

class TopStockChart extends StatelessWidget {
  const TopStockChart({Key? key, required this.data, required this.title}) : super(key: key);

  final StockList data;
  final String title;

  @override
  Widget build(BuildContext context) {
    final List<TopChartData> chartData = data.data.map((e) {
      return TopChartData(e.name!, e.price);
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
                LineSeries<TopChartData, String>(
                    dataSource: chartData,
                    xValueMapper: (TopChartData data, _) => data.x,
                    yValueMapper: (TopChartData data, _) => data.y)
              ]),
            ),
          ],
        ));
  }
}
