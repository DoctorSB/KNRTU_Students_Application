import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';

import '../provider/dark_theme_provider.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            _listTiles(
                title: "Profile", icon: IconlyLight.profile, onPressed: () {}),
            _listTiles(
                title: "Adress",
                subtitle: "example",
                icon: IconlyLight.discovery,
                onPressed: () {}),
            _listTiles(
                title: "Wishlist", icon: IconlyLight.heart, onPressed: () {}),
            _listTiles(
                title: "Settings", icon: IconlyLight.setting, onPressed: () {}),
            _listTiles(
                title: "Orders", icon: IconlyLight.bag, onPressed: () {}),
            SwitchListTile(
              title: const Text('Тема'),
              secondary: Icon(themeState.getDarkTheme
                  ? Icons.dark_mode_outlined
                  : Icons.light_mode_outlined),
              onChanged: (bool value) {
                setState(() {
                  themeState.setDarkTheme = value;
                });
              },
              value: themeState.getDarkTheme,
            ),
            _listTiles(
                title: "Log out", icon: IconlyLight.logout, onPressed: () {}),
          ],
        ),
      ),
    );
  }

  Widget _listTiles({
    // конструктор по созданию кнопок
    required String title,
    String? subtitle,
    required IconData icon,
    required Function onPressed,
  }) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.normal,
        ),
      ),
      subtitle: Text(subtitle == null ? "" : subtitle),
      leading: Icon(icon),
      trailing: const Icon(IconlyLight.arrowRight2),
      onTap: () {
        onPressed();
      },
    );
  }
}
