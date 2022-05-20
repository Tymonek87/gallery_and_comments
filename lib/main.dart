import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:the_code_brothers/presentation/pages/main/home_page.dart';

void main() {
  runApp(const MyApp());
  SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown]);
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'The Code Brothers',
        theme: ThemeData(
        ),
        home: const HomePage()
        );
  }
}
