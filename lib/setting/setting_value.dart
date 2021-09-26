import 'dart:ui';
import 'package:flutter/material.dart';

class SettingVal {
  SettingVal._();

  // TODO +してる値はレイアウトの微調整中。未確定
  // 曜日設定
  static const List<String> days_val = ["月", "火", "水", "木", "金"];
  // 曜日のサイズ
  static const daysBoxSize_height = 24.0;
  static const daysBoxSize_width = 24.0 + 18;

  // TimeTableの横に置く時間割表
  static const List<String> periods_val = ["1", "2", "3", "4", "5", "etc"];
  // 時間割表のサイズ
  static const periodBoxSize_height = 93.0 + 10;
  static const periodBoxSize_width = 24.0 + 18;

  // セルの1マスの高さ
  static const cellSize_height = 93.0 + 10;

  // 時間割1マスの余白
  static const cellPadding = 2.5;

  // 時間割1マスの角丸の比率
  static const rectR = 5.5;

  // 時間割が入力されていないセルの色
  static const emptyCellColor = Color.fromARGB(255, 239, 242, 243);

  // 横余白
  static const sideBlank = 4.0;

  //const _largeCellHeight = 80.0;
  static const Map<String, String> indexToDayPeriod = {
    "0_0": '月曜1限',
    "0_1": '火曜1限',
    "0_2": '水曜1限',
    "0_3": '木曜1限',
    "0_4": '金曜1限',
    "1_0": '月曜2限',
    "1_1": '火曜2限',
    "1_2": '水曜2限',
    "1_3": '木曜2限',
    "1_4": '金曜2限',
    "2_0": '月曜3限',
    "2_1": '火曜3限',
    "2_2": '水曜3限',
    "2_3": '木曜3限',
    "2_4": '金曜3限',
    "3_0": '月曜4限',
    "3_1": '火曜4限',
    "3_2": '水曜4限',
    "3_3": '木曜4限',
    "3_4": '金曜4限',
    "4_0": '月曜5限',
    "4_1": '火曜5限',
    "4_2": '水曜5限',
    "4_3": '木曜5限',
    "4_4": '金曜5限',
    "5_0": '月曜etc限',
    "5_1": '火曜etc限',
    "5_2": '水曜etc限',
    "5_3": '木曜etc限',
    "5_4": '金曜etc限',
  };
}

//色をまとめる
class ColorList {
  ColorList._();

  static const Color white = Color(0xfff8fcfb);
  static const grey = Colors.grey;
  static const white70 = Colors.white70;
  static const red = Colors.red;
  static const Color pinkAccent = Color(0xffFC9CAA);
  static const Color deepPurpleAccent = Color(0xffAC85E3);
  static const deepPurple = Colors.deepPurple;
  static const indigo = Colors.indigo;
  static const blue = Colors.blue;
  static const lightBlue = Color(0xff00B2D1);
  static const Color cyan = Color(0xff70D9FF);
  static const teal = Colors.teal;
  static const green = Colors.green;
  static const Color greenAccent = Color(0xff7DDECA);
  static const lime = Colors.lime;
  static const yellow = Colors.yellow;
  static const Color amber = Color(0xffFFBD48);
  static const orange = Colors.orange;
  static const deepOrange = Colors.deepOrange;
  static const brown = Colors.brown;
  static const black = Colors.black;
  // デフォ値
  static const defaultProp = Color(0xffffffff);
  // コンテナの影の色
  static const shadow = Color.fromARGB(63, 192, 210, 216);
  // 背景の色
  static const haikei = Color.fromARGB(255, 239, 242, 243);
  //static const haikei = Color(0xfff8fcfb);
  static const kouho2 = Color(0xffD6D6D6);
}
