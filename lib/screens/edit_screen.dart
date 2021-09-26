import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mochily_timetable/model/hive_models.dart';
import 'package:mochily_timetable/setting/setting_value.dart';
import 'package:mochily_timetable/app_theme.dart';
import 'package:mochily_timetable/widgets/color_button.dart';
import 'package:mochily_timetable/widgets/colorSelect_container.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mochily_timetable/providers.dart';

class EditScreen extends ConsumerStatefulWidget {
  @override
  _EditScreenState createState() => _EditScreenState();
}

class _EditScreenState extends ConsumerState<EditScreen> {
  // デフォ色
  Color themeColor = AppTheme.lightTheme.scaffoldBackgroundColor;

  @override
  Widget build(BuildContext context) {
    // DBや現在表示しているセル情報を取得
    // hiveDB
    final db = ref.watch(cellProvider);
    // 今のセル番号がX_Y形式で入っている
    final currentCell = ref.read(currentCellIndexProvider);
    final currentColor = ref.watch(currentColorIntProvider);
    final currentClass = ref.watch(currentClassProvider);
    final currentRoom = ref.watch(currentRoomProvider);
    final currentTeacher = ref.watch(currentTeacherProvider);
    final currentColorInt = ref.watch(currentColorIntProvider);

    // 今のセルからDBを取得する。（pushnamedは上手くいかなかった）
    final cellData = db.get(currentCell.state);

    final classText = cellData?.className ?? "";
    final teacherText = cellData?.teacherName ?? "";
    final roomText = cellData?.classRoomName ?? "";
    // HiveはColorをそのまま保存できず、int型に変換して保存している。
    final cellColorInt =
        cellData?.containerColor ?? ColorList.defaultProp.value;

    final appBarTitle = SettingVal.indexToDayPeriod["${currentCell.state}"];

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          appBarTitle ?? "Debug | None index value",
          style: TextStyle(color: ColorList.black),
        ),
        backgroundColor: Color(cellColorInt),
        leading: IconButton(
          padding: EdgeInsets.only(bottom: 10.0),
          icon: Icon(
            Icons.arrow_back_ios_new,
            size: 30.0,
            color: ColorList.black,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      backgroundColor: ColorList.haikei,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(24.0),
                  height: 400.0,
                  decoration: BoxDecoration(
                    color: ColorList.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: ColorList.shadow,
                        offset: Offset(3.0, 4.0),
                        blurRadius: 4.0,
                      )
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ColorButton(some_color: Color(cellColorInt)),
                      Text(
                        classText,
                        style: TextStyle(fontSize: 30),
                        maxLines: 3,
                      ),
                      Text(
                        roomText,
                        style: TextStyle(fontSize: 24),
                        maxLines: 2,
                      ),
                      Text(
                        teacherText,
                        style: TextStyle(fontSize: 24),
                        maxLines: 2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          IconButton(
                            icon: Icon(Icons.edit),
                            color: ColorList.black,
                            iconSize: 45,
                            onPressed: () {
                              currentClass.state = classText;
                              currentRoom.state = roomText;
                              currentTeacher.state = teacherText;
                              currentColorInt.state = cellColorInt;
                              Navigator.pushNamed(context, "/regis");
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.delete),
                            color: ColorList.black,
                            iconSize: 45,
                            onPressed: () {
                              // HiveのDBから削除コマンド
                              db.delete(currentCell.state);
                              Navigator.of(context)
                                  .pushReplacementNamed("/timetable");
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
