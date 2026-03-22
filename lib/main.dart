import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/Screens/dashboard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "EstiMax AI",
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const DashboardPage(),
    );
  }
}
