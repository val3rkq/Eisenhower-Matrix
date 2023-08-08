import 'package:eisenhower_matrix/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'generated/l10n.dart';
import 'pages/home_page/home_screen.dart';
import 'ui_constants.dart';

void main() async {
  await Hive.initFlutter();
  var box = await Hive.openBox(boxName);
  // await box.deleteAll(box.keys);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Inter',
        appBarTheme: const AppBarTheme(
          titleTextStyle: appBarTextStyle,
          elevation: 0,
          scrolledUnderElevation: 0,
          color: Colors.white,
        ),
      ),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
