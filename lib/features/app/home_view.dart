import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diary_report_sample/models/firebase/monthly_reports/monthly_reports.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_charts/flutter_charts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/firebase/reports/reports.dart';
import '../../providers/current_user_provider.dart';

class HomeView extends ConsumerStatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  final now = DateTime.now();
  double _total_man_month = 0.0;
  double _businessSum = 0.0;
  double _overtimeSum = 0.0;
  double _lateNightSum = 0.0;
  List<double> _chartSum = [];
  List<MonthlyReports> _monthly_reports = [];
  List<double> _current_month_reports = [];
  @override
  Widget build(BuildContext context) {
    final currentUser = ref.watch(currentUserDataProvider);

    return currentUser.when(
      data: (user) {
        return Scaffold(
          body: PageView(
            onPageChanged: (int index) async {
              var monthly_reports = await fetchMonthlyReports();
              var current_month_reports = await fetchReports();
              // fetchReports();
              // var man_month = calculateSums(monthly_reports);
              setState(() {
                // _total_man_month = man_month[0];
                // _businessSum = man_month[1];
                // _overtimeSum = man_month[2];
                // _lateNightSum = man_month[3];
                // _chartSum = man_month;

                _monthly_reports = monthly_reports;
                _current_month_reports = current_month_reports;
              });
            },
            children: [
              Column(
                children: [
                  ExpansionTile(
                    title: Text('総工数:160'),
                    children: <Widget>[
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
                              title: Text('残業工数合計:$_overtimeSum'),
                            ),
                          ),
                          Expanded(
                            child: ListTile(
                              title: Text('深夜工数合計:$_lateNightSum'),
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
                          child: Text('総工数/下限：$_total_man_month/140',
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('工数合計：$_businessSum',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("残業合計：$_overtimeSum",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('深夜合計：$_lateNightSum',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                        ),
                        if (_monthly_reports.isNotEmpty)
                          chartToRun(_chartSum, _monthly_reports,
                              _current_month_reports)
                      ],
                    ),
                  ),
                ],
              ),
              Text('Page 2'),
            ],
          ),
        );
      },
      loading: () => CircularProgressIndicator(),
      error: (_, __) => Text('エラーが発生しました'),
    );
  }

  Future<List<MonthlyReports>> fetchMonthlyReports() async {
    // print(now);
    // print(now.month);
    // print(now.month - 1);
    final snapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc("2Otf6iQfXlS54ZtTT5Mi")
        .collection('monthly_Reports') // 必要に応じて適切なサブコレクションに変更
        .orderBy('initialDate', descending: true)
        .startAfter(
            [Timestamp.fromDate(DateTime(now.year, now.month, 2, 0, 0))])
        .limit(5)
        .get();
    final docs = snapshot.docs;
    final list = docs
        .map((doc) => MonthlyReports.fromFirestore(doc.data(), doc.id))
        .toList();
    // for (var l in list) {
    //   print(l.initialDate);
    // }
    return list;
  }

  Future<List<double>> fetchReports() async {
    double total_current_month_business = 0;
    double total_current_month_late = 0;
    double total_current_month_over = 0;
    List<double> total_current_month_reports = [];

    final snapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc("2Otf6iQfXlS54ZtTT5Mi")
        .collection('reports') // 必要に応じて適切なサブコレクションに変更
        .orderBy('date')
        .startAt([Timestamp.fromDate(DateTime(now.year, 7, 1, 0, 0))])
        .limit(31)
        .get();
    final docs = snapshot.docs;
    final list =
        docs.map((doc) => Reports.fromFirestore(doc.data(), doc.id)).toList();

    for (var reports in list) {
      for (var projects in reports.projects) {
        total_current_month_business += projects.business;
        total_current_month_late += projects.late;
        total_current_month_over += projects.over;
      }
    }
    total_current_month_reports = [
      total_current_month_business,
      total_current_month_late,
      total_current_month_over
    ];
    return total_current_month_reports;
  }

//   List<double> calculateSums(List<MonthlyReports> reports) {
//     print(reports);
//     double businessSum = 0.0;
//     double overtimeSum = 0.0;
//     double lateNightSum = 0.0;
//
//     for (var report in reports) {
//       for (var project in report.projects) {
//         businessSum += project.business;
//         overtimeSum += project.over;
//         lateNightSum += project.late;
//       }
//     }
//
//     double total = businessSum + overtimeSum + lateNightSum;
//     return [total, businessSum, overtimeSum, lateNightSum];
//   }
// }

  Widget chartToRun(
      List<double> chartSum,
      List<MonthlyReports> _monthly_reports,
      List<double> current_month_reports) {
    if (chartSum.length < 4) {
      chartSum = [0.0, 0.0, 0.0, 0.0];
    }
    final now = getPastSixMonths();

    LabelLayoutStrategy? xContainerLabelLayoutStrategy;
    ChartData chartData;
    ChartOptions chartOptions = const ChartOptions();

    xContainerLabelLayoutStrategy = DefaultIterativeLabelLayoutStrategy(
      options: chartOptions,
    );
    chartData = ChartData(
      dataRows: [
        [
          _monthly_reports[4].totalBusiness,
          _monthly_reports[3].totalBusiness,
          _monthly_reports[2].totalBusiness,
          _monthly_reports[1].totalBusiness,
          _monthly_reports[0].totalBusiness,
          current_month_reports[0]
        ],
        [
          _monthly_reports[4].totalOver,
          _monthly_reports[3].totalOver,
          _monthly_reports[2].totalOver,
          _monthly_reports[1].totalOver,
          _monthly_reports[0].totalOver,
          current_month_reports[1]
        ],
        [
          _monthly_reports[4].totalLate,
          _monthly_reports[3].totalLate,
          _monthly_reports[2].totalLate,
          _monthly_reports[1].totalLate,
          _monthly_reports[0].totalLate,
          current_month_reports[2]
        ],
      ],
      xUserLabels: [
        '${now[5]}月',
        '${now[4]}月',
        '${now[3]}月',
        '${now[2]}月',
        '${now[1]}月',
        '${now[0]}月'
      ],
      dataRowsLegends: const [
        '工数合計',
        '残業合計',
        '深夜合計',
      ],
      chartOptions: chartOptions,
      dataRowsColors: [Color(0xFFA3FFD6), Color(0xFF7BC9FF), Color(0xFF8576FF)],
    );

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

  List<int> getPastSixMonths() {
    List<int> months = [];
    DateTime now = DateTime.now();

    for (int i = 0; i < 6; i++) {
      DateTime pastMonth = DateTime(now.year, now.month - i, now.day);
      months.add(pastMonth.month);
    }

    return months;
  }
}
