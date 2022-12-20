import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/layout/home_layout.dart';
import 'package:todo_app/providers/my_provider.dart';
import 'package:todo_app/shared/styles/my_theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (BuildContext context) => MyProvider(), child: TodoApp()));
}

class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<MyProvider>(context);
    return MaterialApp(
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale("en"), // English, no country code
        Locale("ar"), // Arabic, no country code
      ],
      locale: Locale(prov.languageCode),
      debugShowCheckedModeBanner: false,
      initialRoute: HomeLayout.routeName,
      routes: {
        HomeLayout.routeName: (c) => HomeLayout(),
      },
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
      themeMode: prov.currentTheme,
    );
  }
}
