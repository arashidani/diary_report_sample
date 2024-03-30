import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

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
              PieChart(
                dataMap: dateMap,
                chartLegendSpacing: 10,
                chartRadius: MediaQuery.of(context).size.width / 1.5,
                legendOptions: LegendOptions(
                  legendPosition: LegendPosition.bottom,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

List<String> getYearsList() {
  final List<String> yearsList = [];
  final thisYear = DateTime.now().year;

  for (int i = 0; i < 10; i++) {
    yearsList.add((thisYear - i).toString());
  }
  print(yearsList);
  return yearsList;
}
