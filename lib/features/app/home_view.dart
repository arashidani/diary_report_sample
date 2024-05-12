import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diary_report_sample/models/firebase/reports/reports.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_charts/flutter_charts.dart';
import '';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late List<dynamic> _reports;
  late String _selectedProjectId = 'OWqH6GA4TUN3dCTROpKw';
  double total_business = 0;
  double total_overtime = 0;
  double total_late_night = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('users')
          .doc('2Otf6iQfXlS54ZtTT5Mi')
          .collection('reports')
          .snapshots(), // ユーザーIDには実際のユーザーIDを指定
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return CircularProgressIndicator();
        }
        _reports = snapshot.data!.docs;

        // 選択されたprojectIdに基づいてフィルタリング
        var filteredReports = _reports.where((report) {
          var projects = report['projects'] as List<dynamic>;
          return projects
              .any((project) => project['projectId'] == _selectedProjectId);
        }).toList();
        for (var filteredReport in filteredReports) {
          print(filteredReport);
        }

        return Column(
          children: [
            DropdownButton<String>(
              value: _selectedProjectId,
              onChanged: (value) {
                setState(() {
                  _selectedProjectId = value!;
                });
              },
              items: _getDropdownItems(),
            ),
            Expanded(
              child: _buildReportList(filteredReports),
            ),
          ],
        );
      },
    );
  }

  List<DropdownMenuItem<String>> _getDropdownItems() {
    List<DropdownMenuItem<String>> items = [];
    // レポートからプロジェクトIDを収集
    for (var report in _reports) {
      var projects = report['projects'] as List<dynamic>;
      for (var project in projects) {
        var projectId = project['projectId'] as String;
        if (!items.any((item) => item.value == projectId)) {
          items.add(DropdownMenuItem<String>(
            value: projectId,
            child: Text(projectId),
          ));
        }
      }
    }
    return items;
  }

  Widget _buildReportList(List<dynamic> reports) {
    return ListView.builder(
      itemCount: reports.length,
      itemBuilder: (context, index) {
        var report = reports[index];
        var projects = report['projects'] as List<dynamic>;
        total_business = 0;
        total_overtime = 0;
        total_late_night = 0;

        for (var project in projects) {
          total_business += project['business'];
          total_overtime += project['over'];
          total_late_night += project['late'];
        }
        return ListTile(
          title: Text(
              "Date: ${total_business.toString()} ${total_overtime.toString()} ${total_late_night.toString()}"),
        );
      },
    );
  }
}

// class _HomeViewState extends State<HomeView> {
//   String dropdownValue = getYearsList().first;
//   //過去5カ月
//   double _man_month_sum = 70;
//   double _overtime_work_sum = 20;
//   double _late_night_sum = 20;
//   //当月
//   double total_business = 0;
//   double total_overtime = 0;
//   double total_late_night = 0;
//   String? _project_name = 'XXX開発';
//
//   List<List<double>> _data_rows = [
//     [0, 0, 0, 0, 0, 0],
//     [0, 0, 0, 0, 0, 0],
//     [0, 0, 0, 0, 0, 0],
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     final Map<String, double> dateMap = {
//       '工数合計': _man_month_sum,
//       '残業合計': _overtime_work_sum,
//       '深夜合計': _late_night_sum
//     };
//     final sum = _man_month_sum + _overtime_work_sum + _late_night_sum;
//     return PageView(
//       onPageChanged: (int index) async {
//         //todo　過去5monthのdateをとってくる
//
//         //todo　データを取得するメソッドをここに記載する
//         //projectIdと当月で絞り込む
//         //それぞれの工数合計をとる
//         final data = await FirebaseFirestore.instance
//             .collection('users')
//             .doc('2Otf6iQfXlS54ZtTT5Mi')
//             .collection('reports')
//             .get();
//         total_business = 0;
//         total_overtime = 0;
//         total_late_night = 0;
//
//         for (var doc in data.docs) {
//           Reports report = Reports.fromJson(doc.data() as Map<String, dynamic>);
//           for (Map<dynamic, dynamic> project in report.projects) {
//             total_business += project['business'];
//             total_overtime += project['over'];
//             total_late_night += project['late'];
//           }
//         }
//         setState(() {
//           _data_rows = [
//             [130.0, 20.0, 5.0, 30.0, 5.0, total_business],
//             [30.0, 60.0, 16.0, 10.0, 12.0, total_overtime],
//             [25.0, 40.0, 20.0, 80.0, 12.0, total_late_night],
//           ];
//         });
//
//         print('前$_data_rows');
//       },
//       children: [
//         Column(
//           children: [
//             ExpansionTile(
//               title: Text('総工数:160'),
//               children: <Widget>[
//                 DropdownButton<String>(
//                   items: getYearsList()
//                       .map<DropdownMenuItem<String>>((String value) {
//                     return DropdownMenuItem<String>(
//                       value: value,
//                       child: Text(value),
//                     );
//                   }).toList(),
//                   onChanged: (String? value) {
//                     setState(() {
//                       dropdownValue = value!;
//                     });
//                   },
//                   value: dropdownValue,
//                 ),
//                 Row(
//                   children: [
//                     Expanded(
//                       child: ListTile(
//                         title: Text('予定出勤時間:0'),
//                       ),
//                     ),
//                     Expanded(
//                       child: ListTile(
//                         title: Text('工数合計:140'),
//                       ),
//                     ),
//                   ],
//                 ),
//                 Row(
//                   children: [
//                     Expanded(
//                       child: ListTile(
//                         title: Text('残業工数合計:20'),
//                       ),
//                     ),
//                     Expanded(
//                       child: ListTile(
//                         title: Text('深夜工数合計:20'),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//             Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text('総工数/下限：$sum/140',
//                         style: TextStyle(
//                             fontSize: 30, fontWeight: FontWeight.bold)),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text('工数合計：$_man_month_sum',
//                         style: TextStyle(
//                             fontSize: 20, fontWeight: FontWeight.bold)),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text("残業合計：$_overtime_work_sum",
//                         style: TextStyle(
//                             fontSize: 20, fontWeight: FontWeight.bold)),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text('深夜合計：$_late_night_sum',
//                         style: TextStyle(
//                             fontSize: 20, fontWeight: FontWeight.bold)),
//                   ),
//                   chartToRun(_data_rows)
//                 ],
//               ),
//             ),
//           ],
//         ),
//         Column(
//           children: [
//             DropdownButton<String>(
//               items: const [
//                 DropdownMenuItem(
//                   child: Text('XXX開発'),
//                   value: 'XXX開発',
//                 ),
//                 DropdownMenuItem(
//                   child: Text('XXX保守'),
//                   value: 'XXX保守',
//                 ),
//                 DropdownMenuItem(
//                   child: Text('XXX運用'),
//                   value: 'XXX運用',
//                 ),
//               ],
//               onChanged: (String? value) {
//                 setState(() {
//                   _project_name = value;
//                 });
//               },
//               value: _project_name,
//             ),
//             const SizedBox(
//               height: 32,
//             ),
//             Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text('総工数/下限：$sum/140',
//                         style: TextStyle(
//                             fontSize: 30, fontWeight: FontWeight.bold)),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text('工数合計：$_man_month_sum',
//                         style: TextStyle(
//                             fontSize: 20, fontWeight: FontWeight.bold)),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text("残業合計：$_overtime_work_sum",
//                         style: TextStyle(
//                             fontSize: 20, fontWeight: FontWeight.bold)),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text('深夜合計：$_late_night_sum',
//                         style: TextStyle(
//                             fontSize: 20, fontWeight: FontWeight.bold)),
//                   ),
//                   chartToRun(_data_rows)
//                 ],
//               ),
//             ),
//           ],
//         )
//       ],
//     );
//   }
// }

Widget chartToRun(List<List<double>> dataRows) {
  LabelLayoutStrategy? xContainerLabelLayoutStrategy;
  ChartData chartData;
  ChartOptions chartOptions = const ChartOptions();
  print(dataRows);

  xContainerLabelLayoutStrategy = DefaultIterativeLabelLayoutStrategy(
    options: chartOptions,
  );
  chartData = ChartData(
    // dataRows: [
    //   [130.0, 20.0, 5.0, 30.0, 5.0, total_business,
    //   [30.0, 60.0, 16.0, 10.0, 12.0, 30.0],
    //   [25.0, 40.0, 20.0, 80.0, 12.0, 90.0],
    // ],
    dataRows: dataRows,
    xUserLabels: ['11月', '12月', '1月', '2月', '3月', '4月'],
    dataRowsLegends: [
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
