import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:kstuhelper/pages/card.dart';
import 'package:kstuhelper/pages/categories.dart';
import 'package:kstuhelper/pages/home_page.dart';
import 'package:kstuhelper/pages/user.dart';
import 'package:provider/provider.dart';

import '../provider/dark_theme_provider.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({Key? key}) : super(key: key);

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

//страницы которые отображаются
class _BottomBarScreenState extends State<BottomBarScreen> {
  int _selectedIndex = 3; //стартовая страница
  final List<Map<String, dynamic>> _pages = [
    {"page": const HomeScreen(), "title": "HomeScreen"},
    {"page": const CategoriesScreen(), "title": "CategoriesScreen"},
    {"page": const CardScreen(), "title": "CardScreen"},
    {"page": const UserScreen(), "title": "UserScreen"},
  ];

  void _selectedPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

//кнопки для навигационного бара и их иконки
  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    bool _isDark = themeState.getDarkTheme;
    return Scaffold(
      // appBar: AppBar(
      //   //верхняя плашка
      //   title: Text(_pages[_selectedIndex]
      //       ["title"]), //берет название страницы со списка List
      // ),
      body: _pages[_selectedIndex]["page"],
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: _isDark // если темная тема кнопки белые
              ? Theme.of(context).cardColor
              : Colors.white,
          type: BottomNavigationBarType
              .fixed, // эта строчка делает выбор кнопки без сдвига
          selectedItemColor: _isDark
              ? Colors.white //цвет при темной теме и выбранной иконке
              : Colors.black87, //цвет при светлой теме и выбранной иконке
          unselectedItemColor: _isDark
              ? Colors.lightBlue //цвет при темной теме и не выбранной иконке
              : Colors.black87, //цвет при светлой теме и не выбранной иконке
          showSelectedLabels: false, //убирает подписи у выбранной категории
          showUnselectedLabels: //убирает подписи у не выбранной категории
              false, //убирает подпись у невыбранных категориях
          currentIndex: _selectedIndex,
          onTap: _selectedPage,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(
                    _selectedIndex == 0 ? IconlyBold.home : IconlyLight.home),
                label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(_selectedIndex == 1
                    ? IconlyBold
                        .category //если выбранна данная категория ставит жжирныую иконку
                    : IconlyLight.category),
                label: "Categories"),
            BottomNavigationBarItem(
                icon: Icon(_selectedIndex == 2
                    ? IconlyBold
                        .search //если выбранна данная категория ставит жжирныую иконку
                    : IconlyLight.search),
                label: "Search"),
            BottomNavigationBarItem(
                icon: Icon(_selectedIndex == 3
                    ? IconlyBold
                        .user2 //если выбранна данная категория ставит жжирныую иконку
                    : IconlyLight.user2),
                label: "User"),
          ]),
    );
  }
}
