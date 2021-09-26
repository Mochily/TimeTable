import 'package:flutter/material.dart';
import "package:mochily_timetable/setting/setting_value.dart";

class DayOfWeek extends StatelessWidget {
  final List<String> dates = SettingVal.days_val;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: SettingVal.daysBoxSize_width),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(
              dates.length,
              (i) => _DayCell(date: dates[i]),
            ),
          ),
        ),
        const SizedBox(width: SettingVal.sideBlank),
      ],
    );
  }
}

class _DayCell extends StatelessWidget {
  final String date;

  _DayCell({required this.date});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: SettingVal.daysBoxSize_height,
        child: Center(
          child: Text(
            date,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
