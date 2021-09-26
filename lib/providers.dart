import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import "model/hive_models.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'setting/setting_value.dart';

// Cell
final cellProvider = Provider<Box<CellModel>>((ref) {
  throw UnimplementedError();
});

// Periods
final periodsProvider = Provider<Box<PeriodModel>>((ref) {
  throw UnimplementedError();
});

// 新規作成用Provider

// セルのインデックス番号はX_Yの形式で扱う。
final currentCellIndexProvider = StateProvider((ref) => "");
// registeringで使う。各フィールドの値の格納先
final currentClassProvider = StateProvider((ref) => "");
final currentTeacherProvider = StateProvider((ref) => "");
final currentRoomProvider = StateProvider((ref) => "");
final currentColorIntProvider =
    StateProvider((ref) => ColorList.defaultProp.value);
