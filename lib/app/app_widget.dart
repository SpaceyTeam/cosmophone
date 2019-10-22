import 'package:cosmophone/app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:cosmophone/app/pages/home/home_module.dart';

class AppWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      title: 'Cosmophone',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeModule(),
    );
  }
}
