import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:kstuhelper/widgets/text_widget.dart';
import 'package:provider/provider.dart';

import '../provider/dark_theme_provider.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final TextEditingController _adressTextController =
      TextEditingController(text: "");
  @override
  void dispose() {
    _adressTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    final Color color = themeState.getDarkTheme
        ? Colors.white
        : Colors.black; //использование разных цветов при разных темах
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 15,
              ),
              RichText(
                  text: const TextSpan(
                      text: "Hi, ",
                      style: TextStyle(
                          color: Colors.cyan,
                          fontSize: 27,
                          fontWeight: FontWeight.bold),
                      children: <TextSpan>[
                    TextSpan(
                        text: 'My name',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 27,
                            fontWeight: FontWeight.normal))
                  ])),
              TextWidget(text: 'Email@gmail.com', color: color, textSize: 18),
              const Divider(
                thickness: 1,
              ),
              _listTiles(
                  title: "Profile",
                  icon: IconlyLight.profile,
                  color: color,
                  onPressed: () {}),
              // Divider(
              //   thickness: 1,
              // ),
              _listTiles(
                  title: "Adress",
                  subtitle: "example",
                  icon: IconlyLight.discovery,
                  color: color,
                  onPressed: () async {
                    await _showAdressDialog();
                  }),
              // Divider(
              //   thickness: 1,
              // ),
              _listTiles(
                  title: "Wishlist",
                  icon: IconlyLight.heart,
                  color: color,
                  onPressed: () {}),
              // Divider(
              //   thickness: 1,
              // ),
              _listTiles(
                  title: "Settings",
                  icon: IconlyLight.setting,
                  color: color,
                  onPressed: () {}),
              // Divider(
              //   thickness: 1,
              // ),
              _listTiles(
                  title: "Orders",
                  icon: IconlyLight.bag,
                  color: color,
                  onPressed: () {}),
              // Divider(
              //   thickness: 1,
              // ),
              SwitchListTile(
                title: TextWidget(
                    text: themeState.getDarkTheme ? "Dark Mode" : "Light mode",
                    color: color,
                    textSize: 16),
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
              // Divider(
              //   thickness: 1,
              // ),
              _listTiles(
                  title: "Log out",
                  icon: IconlyLight.logout,
                  color: color,
                  onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _showAdressDialog() async {
    await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Update Adress"),
            content: TextField(
              onChanged: (value) {
                //_adressTextController.text = value;
              },
              controller: _adressTextController,
              //maxLines: 5,
              decoration: const InputDecoration(hintText: "Enter your adress"),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Cancel")),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Update"))
            ],
          );
        });
  }

  Widget _listTiles({
    // конструктор по созданию кнопок
    required String title,
    String? subtitle,
    required IconData icon,
    required Function onPressed,
    required Color color,
  }) {
    return ListTile(
      title: TextWidget(
        text: title,
        color: color,
        textSize: 16,
        //isTitle: true, //если надо сделать все жирным
      ),
      subtitle: TextWidget(
        text: subtitle == null ? "" : subtitle,
        color: color,
        textSize: 12,
      ),
      leading: Icon(icon),
      trailing: const Icon(IconlyLight.arrowRight2),
      onTap: () {
        onPressed();
      },
    );
  }
}
