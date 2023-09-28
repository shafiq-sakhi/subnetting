import 'package:flutter/material.dart';
import 'package:subnetting/pages/subnet_page.dart';

void main() {
  runApp(Subnetting());
}
class Subnetting extends StatefulWidget {
  const Subnetting({Key? key}) : super(key: key);

  @override
  State<Subnetting> createState() => _SubnettingState();
}

class _SubnettingState extends State<Subnetting> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0XFF0a041c),
        primaryColor: Color(0xFf2996d)
      ),
      home: Subnet_page(),
    );
  }
}
