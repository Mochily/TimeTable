import 'package:flutter/material.dart';
import 'package:mochily_timetable/model/hive_models.dart';
import 'package:mochily_timetable/setting/setting_value.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mochily_timetable/providers.dart';

class CellWidget extends ConsumerWidget {
  final String cellXY;

  CellWidget({
    required this.cellXY,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = ref.watch(cellProvider);
    final cellData = value.get(cellXY);

    // DBにデータが無かったら初期セルを返す
    if (cellData == null) {
      return _CellEmpty(
        cellXY: cellXY,
      );
    } else {
      return _CellFill(
        cellXY: cellXY,
        cellData: cellData,
      );
    }
  }
}

class _CellFill extends ConsumerWidget {
  final String cellXY;

  final CellModel cellData;

  _CellFill({
    required this.cellXY,
    required this.cellData,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final classText = cellData.className;
    final teacherText = cellData.className;
    final roomText = cellData.classRoomName;
    // HiveはColorをそのまま保存できず、int型に変換して保存している。
    final cellColorInt = cellData.containerColor;

    final currentCell = ref.watch(currentCellIndexProvider);

    return SizedBox(
      height: SettingVal.cellSize_height,
      child: Padding(
        padding: const EdgeInsets.all(SettingVal.cellPadding),
        child: GestureDetector(
          onTap: () {
            // 現在のCell番号を記憶しておく
            currentCell.state = cellXY;
            Navigator.pushNamed(context, "/edit");
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(SettingVal.rectR),
              color: Color(cellColorInt),
              boxShadow: [
                BoxShadow(
                  color: ColorList.shadow,
                  offset: Offset(3.0, 4.0),
                  blurRadius: 4.0,
                )
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  child: Text(
                    classText,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                  ),
                ),
                Container(
                  child: Text(
                    roomText,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                  ),
                ),
              ],
            ),
            /*
            child: Container(
              child: Text(
                classText,
                textAlign: TextAlign.center,
              ),
            ),
             */
            //color: SettingVal.emptyCellColor,
            //height: CellSize.height,
            //child: const Center(child: Text('')),
          ),
        ),
      ),
    );
  }
}

class _CellEmpty extends ConsumerWidget {
  final String cellXY;

  _CellEmpty({
    required this.cellXY,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentCell = ref.watch(currentCellIndexProvider);

    return SizedBox(
      height: SettingVal.cellSize_height,
      child: Padding(
        padding: const EdgeInsets.all(SettingVal.cellPadding),
        child: GestureDetector(
          onTap: () {
            // 現在のCell番号を記憶しておく
            currentCell.state = cellXY;
            Navigator.pushNamed(context, "/regis");
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(SettingVal.rectR),
              color: ColorList.white,
              //color: ColorList.kouho2,
              boxShadow: [
                BoxShadow(
                  color: ColorList.shadow,
                  offset: Offset(3.0, 4.0),
                  blurRadius: 4.0,
                )
              ],
            ),
            /*
            child: Container(
              child: Text(
                "None",
                textAlign: TextAlign.center,
              ),
            ),

             */
            //color: SettingVal.emptyCellColor,
            //height: CellSize.height,
            //child: const Center(child: Text('')),
          ),
        ),
      ),
    );
  }
}
