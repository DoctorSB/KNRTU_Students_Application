import 'package:flutter/material.dart';
import 'package:kstuhelper/pages/home_page.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen ({Key? key}) : super(key: key);

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {

  List _pages = [
    HomeScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
