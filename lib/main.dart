import 'package:flutter/material.dart';
import 'package:kstuhelper/consts/theme_date.dart';
import 'package:kstuhelper/provider/dark_theme_provider.dart';
import 'package:provider/provider.dart';

import 'pages/home_page.dart';

void main() => runApp(KSTUhelper());

class KSTUhelper extends StatefulWidget{
  KSTUhelper({Key? key}) : super(key: key);

  @override
  State<KSTUhelper> createState() => _KSTUhelperState();
}

class _KSTUhelperState extends State<KSTUhelper> {
  DarkThemeProvider themeChengeProvider = DarkThemeProvider();

  void getCurrentAppTheme() async{
    themeChengeProvider.setDarkTheme = await
      themeChengeProvider.darkThemePrefs.getTheme();
  }

  @override

  void initState() {
    getCurrentAppTheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_){
            return themeChengeProvider;
          })
        ],
      child: Consumer<DarkThemeProvider>( //для consumer нужно 3 аргумента
        builder: (context, themeProvider, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'KNITU',
            theme: Styles.themeData(themeProvider.getDarkTheme, context),
            home: HomeScreen());
        }
      ),
    );
  }
}
