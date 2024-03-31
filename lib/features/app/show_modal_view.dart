import 'package:diary_report_sample/converter/dateTime_fomatter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';

class ShowModalView extends StatefulWidget {
  const ShowModalView({super.key, required this.deviceHeight});
  final double deviceHeight;

  @override
  ShowModalState createState() => ShowModalState();
}

class ShowModalState extends State<ShowModalView> {
  DateTime? _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.deviceHeight,
      child: SingleChildScrollView(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            children: [
              Expanded(
                flex: 1,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.clear,
                    size: 30,
                  ),
                ),
              ),
              Expanded(
                flex: 8,
                child: Text(
                  '日報追加',
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(flex: 1, child: Container()),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('日付を選択'),
              TextButton(
                  onPressed: () {
                    DatePicker.showDatePicker(context,
                        showTitleActions: true,
                        minTime: DateTime(2010, 1, 1),
                        maxTime: DateTime(2040, 12, 31),
                        onChanged: (date) {}, onConfirm: (date) {
                      setState(() {
                        _selectedDate = date;
                        print(_selectedDate);
                      });
                    }, currentTime: DateTime.now(), locale: LocaleType.jp);
                  },
                  child: Text(
                    formatDateString(_selectedDate!),
                    style: TextStyle(color: Colors.blue),
                  )),
              const Text('案件を選択'),
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
              const Text('工数'),
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
              const Text('残業'),
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
              const Text('深夜'),
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
            height: widget.deviceHeight / 10,
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
  }
}
