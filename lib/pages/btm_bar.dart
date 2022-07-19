import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:kstuhelper/pages/card.dart';
import 'package:kstuhelper/pages/categories.dart';
import 'package:kstuhelper/pages/home_page.dart';
import 'package:kstuhelper/pages/user.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({Key? key}) : super(key: key);

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

//страницы которые отображаются
class _BottomBarScreenState extends State<BottomBarScreen> {
  int _selectedIndex = 0;
  final List _pages = [
    const HomeScreen(),
    const CategoriesScreen(),
    const CardScreen(),
    const UserScreen(),
  ];

  void _selectedPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

//кнопки для навигационного бара и их иконки
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType
              .fixed, // эта строчка делает выбор кнопки без сдвига
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
