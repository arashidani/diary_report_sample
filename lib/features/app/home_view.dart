import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_charts/flutter_charts.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String dropdownValue = getYearsList().first;
  final double _man_month_sum = 70;
  final double _overtime_work_sum = 20;
  final double _late_night_sum = 20;

  @override
  Widget build(BuildContext context) {
    final Map<String, double> dateMap = {
      '工数合計': _man_month_sum,
      '残業合計': _overtime_work_sum,
      '深夜合計': _late_night_sum
    };
    final sum = _man_month_sum + _overtime_work_sum + _late_night_sum;
    return Column(
      children: [
        ExpansionTile(
          title: Text('総工数:160'),
          children: <Widget>[
            DropdownButton<String>(
              items:
                  getYearsList().map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? value) {
                setState(() {
                  dropdownValue = value!;
                });
              },
              value: dropdownValue,
            ),
            Row(
              children: [
                Expanded(
                  child: ListTile(
                    title: Text('予定出勤時間:0'),
                  ),
                ),
                Expanded(
                  child: ListTile(
                    title: Text('工数合計:140'),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: ListTile(
                    title: Text('残業工数合計:20'),
                  ),
                ),
                Expanded(
                  child: ListTile(
                    title: Text('深夜工数合計:20'),
                  ),
                ),
              ],
            ),
          ],
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('総工数/下限：$sum/140',
                    style:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('工数合計：$_man_month_sum',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("残業合計：$_overtime_work_sum",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('深夜合計：$_late_night_sum',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ),
              chartToRun()
            ],
          ),
        ),
      ],
    );
  }
}

Widget chartToRun() {
  LabelLayoutStrategy? xContainerLabelLayoutStrategy;
  ChartData chartData;
  ChartOptions chartOptions = const ChartOptions();
  // Example shows an explicit use of the DefaultIterativeLabelLayoutStrategy.
  // The xContainerLabelLayoutStrategy, if set to null or not set at all,
  //   defaults to DefaultIterativeLabelLayoutStrategy
  // Clients can also create their own LayoutStrategy.

  xContainerLabelLayoutStrategy = DefaultIterativeLabelLayoutStrategy(
    options: chartOptions,
  );
  chartData = ChartData(
    dataRows: const [
      [10.0, 20.0, 5.0, 30.0, 5.0, 20.0],
      [30.0, 60.0, 16.0, 10.0, 12.0, 30.0],
      [25.0, 40.0, 20.0, 80.0, 12.0, 90.0],
    ],
    xUserLabels: const ['11月', '12月', '1月', '2月', '3月', '4月'],
    dataRowsLegends: const [
      '工数合計',
      '残業合計',
      '深夜合計',
    ],
    chartOptions: chartOptions,
    dataRowsColors: [Color(0xFFA3FFD6), Color(0xFF7BC9FF), Color(0xFF8576FF)],
  );
  // chartData.dataRowsDefaultColors(); // if not set, called in constructor
  var verticalBarChartContainer = VerticalBarChartTopContainer(
    chartData: chartData,
    xContainerLabelLayoutStrategy: xContainerLabelLayoutStrategy,
  );

  var verticalBarChart = VerticalBarChart(
    painter: VerticalBarChartPainter(
      verticalBarChartContainer: verticalBarChartContainer,
    ),
  );
  return Container(
    height: 370,
    width: 390,
    child: verticalBarChart,
  );
}

List<String> getYearsList() {
  final List<String> yearsList = [];
  final thisYear = DateTime.now().year;

  for (int i = 0; i < 10; i++) {
    yearsList.add((thisYear - i).toString());
  }
  return yearsList;
}
