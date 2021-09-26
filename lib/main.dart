import 'package:flutter/material.dart';
import 'package:mochily_timetable/screens/edit_screen.dart';
import 'app_theme.dart';
import "package:mochily_timetable/screens/timetable_screen.dart";
import 'screens/registering_screen.dart';
import 'screens/timetable_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import "model/hive_models.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'providers.dart';

Future<void> main() async {
  await Hive.initFlutter();

  Hive.registerAdapter(CellModelAdapter());
  Hive.registerAdapter(PeriodModelAdapter());

  var getCellBox = await Hive.openBox<CellModel>("cell");
  var getPeriodsBox = await Hive.openBox<PeriodModel>("periods");

  runApp(
    ProviderScope(
      overrides: [
        // awaitが終わったら、providerの値を上書きする。
        cellProvider.overrideWithValue(getCellBox),
        periodsProvider.overrideWithValue(getPeriodsBox),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //initialRoute: '/timetable',
      routes: <String, WidgetBuilder>{
        '/timetable': (BuildContext context) => TimetableScreen(),
        "/regis": (BuildContext context) => RegisteringScreen(),
        '/edit': (BuildContext context) => EditScreen(),
      },
      //theme: AppTheme.lightTheme,
      home: TimetableScreen(),
    );
  }
}
