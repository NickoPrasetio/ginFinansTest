import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:ginFinans/module/base_module.dart';
import 'package:ginFinans/presentation/welcomePage/welcome_page.dart';
import 'package:ginFinans/reusableUi/base_style.dart';
import 'package:ginFinans/util/app_localization.dart';
import 'package:ginFinans/util/palette.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initModule();
  runApp(GinFinansApp());
}

class GinFinansApp extends StatefulWidget {
  @override
  _GinFinansAppState createState() {
    return _GinFinansAppState();
  }
}

class _GinFinansAppState extends State<GinFinansApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        pageTransitionsTheme: const PageTransitionsTheme(builders: {
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        }),
        backgroundColor: Palette.white,
        brightness: Brightness.light,
        primarySwatch: Palette.materialWhite,
        accentColor: Palette.purpleBlue,
        scaffoldBackgroundColor: Palette.white,
        primaryIconTheme: IconThemeData(color: Palette.white),
        appBarTheme: AppBarTheme(
            elevation: 0,
            textTheme: TextTheme(
                title: TextStyle(
              fontSize: 18,
              color: Palette.white,
              fontFamily: FontFamilies.bold,
            ))),
      ),
      debugShowCheckedModeBanner: false,
      locale: const Locale('id', 'ID'),
      supportedLocales: [const Locale('id', 'ID')],
      localizationsDelegates: [
        AppLocalization.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      home: Scaffold(
        body: WelcomePage(),
      ),
    );
  }
}
