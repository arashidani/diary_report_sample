import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TableView extends StatefulWidget {
  const TableView({super.key, required this.title});

  final String title;

  @override
  State<TableView> createState() => _TableViewState();
}

class _TableViewState extends State<TableView> {
  List<DiaryData> dataList = [
    // サンプルデータを生成してリストに追加
    DiaryData(DateTime(2024, 12, 11), 8.5, 1.0, 0.0, true),
    DiaryData(DateTime(2024, 3, 2), 9.0, 2.5, 0.5, false),
    DiaryData(DateTime(2024, 3, 3), 8.0, 1.0, 1.0, true),
    DiaryData(DateTime(2024, 3, 4), 10.25, 10.25, 10.25, false),
    DiaryData(DateTime(2024, 3, 5), 0.0, 0.0, 0.0, false),
    DiaryData(DateTime(2024, 3, 6), 9.5, 2.0, 0.0, true),
    DiaryData(DateTime(2024, 3, 7), 8.0, 1.5, 0.5, false),
    DiaryData(DateTime(2024, 3, 8), 8.0, 1.0, 0.0, true),
    DiaryData(DateTime(2024, 3, 9), 9.0, 2.0, 0.0, false),
    DiaryData(DateTime(2024, 3, 10), 8.5, 1.5, 1.0, true),
    DiaryData(DateTime(2024, 12, 11), 8.5, 1.0, 0.0, true),
    DiaryData(DateTime(2024, 3, 2), 9.0, 2.5, 0.5, false),
    DiaryData(DateTime(2024, 3, 3), 8.0, 1.0, 1.0, true),
    DiaryData(DateTime(2024, 3, 4), 10.25, 10.25, 10.25, false),
    DiaryData(DateTime(2024, 3, 5), 0.0, 0.0, 0.0, false),
    DiaryData(DateTime(2024, 3, 6), 9.5, 2.0, 0.0, true),
    DiaryData(DateTime(2024, 3, 7), 8.0, 1.5, 0.5, false),
    DiaryData(DateTime(2024, 3, 8), 8.0, 1.0, 0.0, true),
    DiaryData(DateTime(2024, 3, 9), 9.0, 2.0, 0.0, false),
    DiaryData(DateTime(2024, 3, 10), 8.5, 1.5, 1.0, true),
    DiaryData(DateTime(2024, 12, 11), 8.5, 1.0, 0.0, true),
    DiaryData(DateTime(2024, 3, 2), 9.0, 2.5, 0.5, false),
    DiaryData(DateTime(2024, 3, 3), 8.0, 1.0, 1.0, true),
    DiaryData(DateTime(2024, 3, 4), 10.25, 10.25, 10.25, false),
    DiaryData(DateTime(2024, 3, 5), 0.0, 0.0, 0.0, false),
    DiaryData(DateTime(2024, 3, 6), 9.5, 2.0, 0.0, true),
    DiaryData(DateTime(2024, 3, 7), 8.0, 1.5, 0.5, false),
    DiaryData(DateTime(2024, 3, 8), 8.0, 1.0, 0.0, true),
    DiaryData(DateTime(2024, 3, 9), 9.0, 2.0, 0.0, false),
    DiaryData(DateTime(2024, 3, 10), 8.5, 1.5, 1.0, true),
  ];

  @override
  Widget build(BuildContext context) {
    String? isSelectedItem = 'aaa';
    tenYearsAgo();

    final _deviceWidth = MediaQuery.of(context).size.width;
    final _deviceHeight = MediaQuery.of(context).size.height;
    final appBer = MediaQuery.of(context).padding.top + kToolbarHeight;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
        title: const Text("一覧画面"),
      ),
      body: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              DropdownButton(
                //4
                items: const [
                  //5
                  DropdownMenuItem(
                    child: Text('aaa'),
                    value: 'aaa',
                  ),
                  DropdownMenuItem(
                    child: Text('bbb'),
                    value: 'bbb',
                  ),
                  DropdownMenuItem(
                    child: Text('ccc'),
                    value: 'ccc',
                  ),
                ],
                //6
                onChanged: (String? value) {
                  setState(() {
                    isSelectedItem = value;
                  });
                },
                //7
                value: isSelectedItem,
              ),
              DropdownButton(
                //4
                items: const [
                  //5
                  DropdownMenuItem(
                    child: Text('aaa'),
                    value: 'aaa',
                  ),
                  DropdownMenuItem(
                    child: Text('bbb'),
                    value: 'bbb',
                  ),
                  DropdownMenuItem(
                    child: Text('ccc'),
                    value: 'ccc',
                  ),
                ],
                //6
                onChanged: (String? value) {
                  setState(() {
                    isSelectedItem = value;
                  });
                },
                //7
                value: isSelectedItem,
              ),
            ],
          ),
          Container(
            height: _deviceHeight - appBer,
            padding: EdgeInsets.all(4),
            // 配列を元にリスト表示
            child: ListView.builder(
              itemCount: dataList.length,
              itemBuilder: (context, index) {
                return Container(
                    height: 50,
                    //color: listItems[index]['color'],
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Spacer(),
                        SizedBox(
                          width: _deviceWidth * 0.25,
                          child: Row(
                            children: [
                              Text(dataList[index].day.month.toString() + '月'),
                              Text(dataList[index].day.day.toString() + '日'),
                              Text('(' +
                                  weekDayToStr(dataList[index].day.weekday) +
                                  ')'),
                            ],
                          ),
                        ),
                        VerticalDivider(),
                        SizedBox(
                            width: _deviceWidth * 0.135,
                            child: Text(
                              dataList[index].syukkin.toString(),
                              textAlign: TextAlign.center,
                            )),
                        VerticalDivider(),
                        SizedBox(
                            width: _deviceWidth * 0.135,
                            child: Text(
                              dataList[index].zangyo.toString(),
                              textAlign: TextAlign.center,
                            )),
                        VerticalDivider(),
                        SizedBox(
                            width: _deviceWidth * 0.135,
                            child: Text(
                              dataList[index].sinya.toString(),
                              textAlign: TextAlign.center,
                            )),
                        VerticalDivider(),
                        SizedBox(
                          width: _deviceWidth * 0.135,
                          child: Text(
                            dataList[index].isApproval ? '承認' : '拒否',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ));
              },
            ),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class Person {
  int? age;
  String name = "金築";
  String address = "090-6845-0000";
}

class DiaryData {
  DateTime day; // 日付
  double syukkin; // 出勤
  double zangyo;
  double sinya;
  bool isApproval; //　承認
  DiaryData(this.day, this.syukkin, this.zangyo, this.sinya, this.isApproval);
}

String weekDayToStr(int weekday) {
  var jpWeekday = '';

  switch (weekday) {
    case 1:
      jpWeekday = "日";
      break;
    case 2:
      jpWeekday = "月";
      break;
    case 3:
      jpWeekday = "火";
      break;
    case 4:
      jpWeekday = "水";
      break;
    case 5:
      jpWeekday = "木";
      break;
    case 6:
      jpWeekday = "金";
      break;
    case 7:
      jpWeekday = "土";
      break;
    default:
      jpWeekday = "";
      break;
  }
  return jpWeekday;
}

List<DropdownMenuItem> tenYearsAgo() {
  final List<DropdownMenuItem> yearList = [];
  final thisYear = new DateTime.now().year;
  for (int i = 0; i < 10; i++) {
    yearList.add(DropdownMenuItem(
      value: "&{thisYear - i}",
      child: Text("${thisYear - i}"),
    ));
  }
  print(yearList);
  return yearList;
}
