import 'package:flutter/material.dart';
import 'package:pages/elements/ActionElement.dart';
import 'package:pages/pages/FirstPage.dart';

void main() => runApp(const MaterialApp(home: MainPage(),));

class MainPage extends StatelessWidget {

const MainPage({Key? key}) : super(key: key);

@override
Widget build(BuildContext context) {
  return MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    // home: const FirstPage(title: "First Page"),
    home: const FirstPage(),
  );
}
}