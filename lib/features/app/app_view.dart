import 'package:diary_report_sample/converter/diary_report_converter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../constant/japanese_day.dart';

class AppView extends ConsumerWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size.height;
    // final state = ref.watch(appNotifierProvider);
    // final notifier = ref.watch(appNotifierProvider.notifier);
    //
    // return state.maybeMap(
    //   init: (data) => _body(context, notifier, state),
    //   data: (data) => _body(context, notifier, state),
    //   orElse: () => _body(context, notifier, state),
    // final state = ref.watch(currentTimeNotifierProvider);
    // ref.listen(currentTimeNotifierProvider, (previous, next) {
    //   debugPrint("$previous,$next");
    // });
    final currentDay = DateTime.now().toLocal();

    final List<DateTime> list =
        getMonthRange(currentDay.year, currentDay.month);
    return Column(
      children: [
        const Divider(),
        Flexible(
          child: ListView.separated(
            itemCount: list.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                onTap: () {
                  showModal(context, size, list[index]);
                },
                title: Text(
                    '${list[index].day} (${getJapaneseDay(list[index].weekday)})'),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const Divider(
                height: 1,
              );
            },
          ),
        ),
      ],
    );
  }
}

void showModal(BuildContext context, double size, DateTime selectedDay) {
  showModalBottomSheet<void>(
    isScrollControlled: false, // trueにするとフルスクリーンで表示されるようになる
    context: context,
    builder: (BuildContext context) {
      return Container(
        // height: size * 0.95,
        child: SingleChildScrollView(
            child: Column(
          children: <Widget>[
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    child: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        // ボタンを押した際の処理
                      },
                    ),
                  ),
                  Container(child: Text('詳細', style: TextStyle(fontSize: 18))),
                  Container(
                    child: IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () {
                        // ボタンを押した際の処理
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ]),
            ListTile(
              leading: Icon(Icons.calendar_today),
              title: Text(
                  '${selectedDay.year}年${selectedDay.month}月${selectedDay.day}日 (${getJapaneseDay(selectedDay.weekday)})'),
              onTap: () async => {
                await showDatePicker(
                    context: context,
                    initialDate: selectedDay,
                    firstDate: DateTime(2010),
                    lastDate: DateTime(2030))
              },
            ),
            const ListTile(
              leading: Icon(Icons.photo_album),
              title: Text('Photos'),
              subtitle: Text('Select your favorite photos'),
            ),
            const ListTile(
              leading: Icon(Icons.videocam),
              title: Text('Video'),
              subtitle: Text('Select your favorite video'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Close'),
            ),
          ],
        )),
      );
    },
  );
}
