import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "package:mochily_timetable/setting/setting_value.dart";
import 'package:mochily_timetable/model/hive_models.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mochily_timetable/providers.dart';

class PeriodsWeek extends StatelessWidget {
  final List<String> periods = SettingVal.periods_val;

  @override
  Widget build(BuildContext context) {
    return Container(
      /*
      decoration: BoxDecoration(
        color: ColorList.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: ColorList.shadow,
            offset: Offset(3.0, 4.0),
            blurRadius: 4.0,
          )
        ],
      ),

       */
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          periods.length,
          (i) => _PeriodCell(period: periods[i]),
        ),
      ),
    );
  }
}

class _PeriodCell extends ConsumerWidget {
  final String period;

  _PeriodCell({required this.period});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final db = ref.watch(periodsProvider);

    return GestureDetector(
      // タップ範囲を拡大する下のコードを付けるかchildにcolor付きコンテナを指定しないとtextしか反応しない。
      behavior: HitTestBehavior.opaque,

      onTap: () async {
        // 鍵は 1限　とか 3限とかにします。
        final periodData = db.get("$period" + "限");

        showDialog(
          context: context,
          builder: (_) {
            return AlertDialog(
              title: Text("$period限目"),
              content: Text("まだつくってるとちゅう$period"),
              actions: <Widget>[
                // ボタン領域
                FlatButton(
                  child: Text("はい"),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            );
          },
        );
      },
      child: SizedBox(
        height: SettingVal.periodBoxSize_height,
        width: SettingVal.periodBoxSize_width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "00:00",
              style: const TextStyle(
                fontWeight: FontWeight.w300,
              ),
            ),
            Text(
              period,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "00:00",
              style: const TextStyle(
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
