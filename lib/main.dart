import 'package:flutter/material.dart';
import 'login.dart';

void main() {
  runApp(EnergyPlanApp());
}

class EnergyPlanApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EnergyPlan',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Login(),
    );
  }
}
