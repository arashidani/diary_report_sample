import 'package:flutter/material.dart';

class TableView extends StatefulWidget {
  const TableView({super.key});

  @override
  State<TableView> createState() => _TableViewState();
}

class _TableViewState extends State<TableView> {
  String dropdownValue = getYearsList(10).first; // 今年を取得
  String initMonth = DateTime.now().month.toString(); // 今月を取得
  final month = <String>[
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12'
  ];
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
    final _deviceWidth = MediaQuery.of(context).size.width;
    final _deviceHeight = MediaQuery.of(context).size.height;
    final appBarHeight = MediaQuery.of(context).padding.top + kToolbarHeight;

    return Scaffold(
      body: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              DropdownButton<String>(
                items: getYearsList(10)
                    .map<DropdownMenuItem<String>>((String value) {
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
              DropdownButton(
                value: initMonth,
                items: month
                    .map((list) =>
                        DropdownMenuItem(value: list, child: Text(list)))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    initMonth = value!;
                  });
                },
              ),
            ],
          ),
          SizedBox(
            height: _deviceHeight - appBarHeight,
            // padding: EdgeInsets.all(4),
            // 配列を元にリスト表示
            child: ListView.builder(
              itemCount: dataList.length,
              itemBuilder: (context, index) {
                return SizedBox(
                    height: 50,
                    //color: listItems[index]['color'],
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Spacer(),
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
        onPressed: () {
          _showModal(context, _deviceHeight);
        },
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

// 直近n年を取得するメソッド
List<String> getYearsList(int years) {
  final List<String> yearsList = [];
  final thisYear = DateTime.now().year;
  for (int i = 0; i < years; i++) {
    yearsList.add((thisYear - i).toString());
  }
  return yearsList;
}

void _showModal(BuildContext context, double _deviceHeight) {
  showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    //ackgroundColor: Colors.transparent,
    builder: (BuildContext context) {
      var width;
      return Container(
        height: _deviceHeight,
        child: SingleChildScrollView(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              children: [
                Expanded(flex: 1, child: Container()),
                Expanded(
                  flex: 8,
                  child: Text(
                    '日報追加',
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('日付を選択'),
                SizedBox(
                  width: 250,
                  child: DropdownButton(
                    isExpanded: true,
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
                    onChanged: (String? value) {},
                  ),
                ),
                Text('案件を選択'),
                SizedBox(
                  width: 250,
                  child: DropdownButton(
                    isExpanded: true,
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
                    onChanged: (String? value) {},
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('工数'),
                SizedBox(
                  width: 50,
                ),
                SizedBox(
                  width: 100,
                  height: 50,
                  child: TextFormField(
                    decoration: InputDecoration(),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('残業'),
                SizedBox(
                  width: 50,
                ),
                SizedBox(
                  width: 100,
                  height: 50,
                  child: TextFormField(
                    decoration: InputDecoration(),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('深夜'),
                SizedBox(
                  width: 50,
                ),
                SizedBox(
                  width: 100,
                  height: 50,
                  child: TextFormField(
                    decoration: InputDecoration(),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: _deviceHeight / 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('送信する'),
                ),
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('続けて入力'),
                ),
              ],
            ),
          ],
        )),
      );
    },
  );
}
