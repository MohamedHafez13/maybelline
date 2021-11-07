import 'package:flutter/material.dart';
import 'package:maybelline/layout/Test.dart';
import 'package:maybelline/layout/home.dart';
import 'package:provider/provider.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
     // home: TestCubit(),
      home: Home(),
    );
  }
}
