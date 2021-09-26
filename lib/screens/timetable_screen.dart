import 'package:flutter/material.dart';
import "package:mochily_timetable/widgets/timetable_widget.dart";
import 'package:mochily_timetable/setting/setting_value.dart';

class TimetableScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          'Mochily',
          style: TextStyle(color: ColorList.black),
        ),
        backgroundColor: ColorList.haikei,
        leading: Padding(
          padding: const EdgeInsets.all(8),
          child: IconButton(
            icon: Icon(Icons.dehaze_rounded),
            color: ColorList.black,
            iconSize: 30,
            onPressed: () async {
              showDialog(
                context: context,
                builder: (_) {
                  return AlertDialog(
                    title: Text("ハンバーガーメニュー"),
                    content: Text("まだつくってるとちゅう"),
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
          ),
        ),
      ),
      backgroundColor: ColorList.haikei,
      body: SafeArea(
        child: TimetableWidget(),
      ),
      /*
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "0",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.movie),
            label: "1",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "2",
          ),
        ],
        currentIndex: 0,
        //onTap: _onItemTapped,
      ),

       */
    );
  }
}
