import 'package:flutter/material.dart';
import 'package:osg4_tugas_akhir/detail.dart';
import 'package:osg4_tugas_akhir/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final titleApp = 'OSG4-Tugas Akhir';

    return MaterialApp(
      title: titleApp,
      home: HomePage(title: titleApp),
      theme: ThemeData(primaryColor: Colors.black),
       routes: <String, WidgetBuilder>{
        '/HomePage': (BuildContext context) => new HomePage(title: titleApp),
        '/DetailPage': (BuildContext context) => new Detail(roots: null),
      },
    );
  }
}




