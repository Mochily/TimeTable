import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:mochily_timetable/setting/setting_value.dart';

import 'package:mochily_timetable/widgets/classDetails_textfield.dart';
import 'package:mochily_timetable/widgets/colorSelect_container.dart';
import 'package:mochily_timetable/model/hive_models.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mochily_timetable/providers.dart';

class RegisteringScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // DBや現在表示しているセル情報を取得
    final db = ref.watch(cellProvider);
    final currentCell = ref.read(currentCellIndexProvider);
    final currentClass = ref.watch(currentClassProvider);
    final currentRoom = ref.watch(currentRoomProvider);
    final currentTeacher = ref.watch(currentTeacherProvider);
    final currentColorInt = ref.watch(currentColorIntProvider);

    // 今のセルからDBを取得する。（pushnamedは上手くいかなかった）
    // edit画面からこの画面にうつる可能性がある。＊編集をこの画面で行うから
    // cellDataをとっている理由＊データを取れたら入力フィールドの初期値として渡すから
    // 空白のセルからきた時はcellDataに入っているclassName teacherName classRoomNameがnullなので空白を入れてる
    final cellData = db.get(currentCell.state);

    final classText = cellData?.className ?? "";
    final teacherText = cellData?.teacherName ?? "";
    final roomText = cellData?.classRoomName ?? "";
    // HiveはColorをそのまま保存できず、int型に変換して保存している。
    final cellColorInt =
        cellData?.containerColor ?? ColorList.defaultProp.value;

    final appBarTitle = SettingVal.indexToDayPeriod["${currentCell.state}"];
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pop();

        // すぐに初期化すると、遷移中に色が変更されて不自然
        await new Future.delayed(new Duration(milliseconds: 300));
        currentClass.state = "";
        currentTeacher.state = "";
        currentRoom.state = "";
        currentColorInt.state = ColorList.defaultProp.value;

        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            appBarTitle ?? "Debug | None index value",
            style: TextStyle(color: ColorList.black),
          ),
          backgroundColor: Color(currentColorInt.state),
          leading: IconButton(
            padding: EdgeInsets.only(left: 10.0),
            icon: Icon(
              Icons.clear,
              size: 30.0,
              color: ColorList.black,
            ),
            onPressed: () async {
              Navigator.of(context).pop();

              // すぐに初期化すると、遷移中に色が変更されて不自然
              await new Future.delayed(new Duration(milliseconds: 300));
              currentClass.state = "";
              currentTeacher.state = "";
              currentRoom.state = "";
              currentColorInt.state = ColorList.defaultProp.value;
            },
          ),
          actions: <Widget>[
            IconButton(
              padding: EdgeInsets.only(right: 10.0),
              icon: Icon(
                Icons.check,
                size: 30.0,
                color: ColorList.black,
              ),
              // ここに保存処理
              onPressed: () async {
                if (currentClass.state == "") {
                  showDialog(
                    context: context,
                    builder: (_) {
                      return AlertDialog(
                        title: Text("値が空欄です"),
                        content: Text("Classに何も入力されていません。"),
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
                } else {
                  var newCell = CellModel(
                    // 時間割を追加する時のために先に作っといた。0はとりあえず入れてる
                    screenNo: 0,
                    indexNo: currentCell.state,
                    className: currentClass.state,
                    teacherName: currentTeacher.state,
                    classRoomName: currentRoom.state,
                    containerColor: currentColorInt.state,
                  );

                  // hiveに保存
                  db.put(currentCell.state, newCell);

                  // popではない
                  Navigator.of(context).pushReplacementNamed("/timetable");
                  await new Future.delayed(new Duration(milliseconds: 300));
                  currentClass.state = "";
                  currentTeacher.state = "";
                  currentRoom.state = "";
                  currentColorInt.state = ColorList.defaultProp.value;
                }
              },
            ),
          ],
        ),
        backgroundColor: ColorList.haikei,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                // 科目
                ClassDetailsTextField(
                  name: '科目',
                  some_icon: Icons.book,
                  textProvider: currentClass,
                  someText: classText,
                ),
                SizedBox(
                  height: 10,
                ),
                // 教室
                ClassDetailsTextField(
                  name: '教室',
                  some_icon: Icons.location_on,
                  textProvider: currentRoom,
                  someText: roomText,
                ),
                SizedBox(
                  height: 10,
                ),
                // 担当
                ClassDetailsTextField(
                  name: '担当',
                  some_icon: Icons.person,
                  textProvider: currentTeacher,
                  someText: teacherText,
                ),
                SizedBox(
                  height: 10,
                ),
                ColorSelectContainer(),
                SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: 125,
                  height: 49,
                  child: ElevatedButton(
                    child: Text(
                      "保存",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: ColorList.lightBlue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    // TODO メソッドにまとめる
                    onPressed: () async {
                      if (currentClass.state == "") {
                        showDialog(
                          context: context,
                          builder: (_) {
                            return AlertDialog(
                              title: Text("値が空欄です"),
                              content: Text("Classに何も入力されていません。"),
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
                      } else {
                        var newCell = CellModel(
                          // 時間割を追加する時のために先に作っといた。0はとりあえず入れてる
                          screenNo: 0,
                          indexNo: currentCell.state,
                          className: currentClass.state,
                          teacherName: currentTeacher.state,
                          classRoomName: currentRoom.state,
                          containerColor: currentColorInt.state,
                        );

                        // hiveに保存
                        db.put(currentCell.state, newCell);

                        // popではない
                        Navigator.of(context)
                            .pushReplacementNamed("/timetable");
                        await new Future.delayed(
                            new Duration(milliseconds: 300));
                        currentClass.state = "";
                        currentTeacher.state = "";
                        currentRoom.state = "";
                        currentColorInt.state = ColorList.defaultProp.value;
                      }
                    },
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
