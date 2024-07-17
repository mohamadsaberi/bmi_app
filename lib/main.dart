import 'package:bmi_app/pages/BmiCall.dart';
import 'package:bmi_app/theme/theme.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(const BmiCallApp());
}

class BmiCallApp extends StatelessWidget {
  const BmiCallApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: myTheme(),
      home: const BmiCallPage(),
    );





  }
}
