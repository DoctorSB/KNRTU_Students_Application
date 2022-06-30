import 'package:flutter/material.dart';
import 'package:kstuhelper/consts/theme_date.dart';

void main() => runApp(KSTUhelper());

class KSTUhelper extends StatelessWidget{
  const KSTUhelper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    bool _isDark = true;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'KNITU',
      theme: Styles.themeData(true, context),
      home: HomeScreen(),
    );
  }

}
