import 'package:company_owners/main-page.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(backgroundColor: Renk.tacao),
      ),
      home: SOdev(),
    );
  }
}


class Renk{
  static Color tacao= Color.fromRGBO( 242, 166, 135,1);
}