import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'hive_models.g.dart';

@HiveType(typeId: 0)
class CellModel extends HiveObject {
  @HiveField(0)
  // 画面を増やす
  int screenNo;

  @HiveField(1)
  // セルのインデックス番号はX_Yの形式で扱う。
  String indexNo;

  @HiveField(2)
  String className;

  @HiveField(3)
  String teacherName;

  @HiveField(4)
  String classRoomName;

  @HiveField(5)
  // HiveはColorを保存できないかもしれない
  // https://github.com/hivedb/hive/issues/241
  int containerColor;

  CellModel({
    required this.screenNo,
    required this.indexNo,
    required this.className,
    required this.teacherName,
    required this.classRoomName,
    required this.containerColor,
  });
}

@HiveType(typeId: 1)
class PeriodModel extends HiveObject {
  @HiveField(0)
  // 画面を増やす
  int screenNo;

  @HiveField(1)
  // セルのインデックス番号はX_Yの形式で扱う。
  String periodNo;

  @HiveField(2)
  String timeTop;

  @HiveField(3)
  String timeBottom;

  PeriodModel({
    required this.screenNo,
    required this.periodNo,
    required this.timeTop,
    required this.timeBottom,
  });
}
