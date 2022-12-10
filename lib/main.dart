import 'package:flutter/material.dart';
import 'package:todo_app/layout/home_layout.dart';
import 'package:todo_app/shared/styles/my_theme.dart';

void main() {
  runApp(TodoApp());
}

class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeLayout.routeName,
      routes: {
        HomeLayout.routeName: (c) => HomeLayout(),
      },
      theme: MyThemeData.lightTheme,
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.light,
    );
  }
}
