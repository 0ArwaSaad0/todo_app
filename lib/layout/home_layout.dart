
import 'package:flutter/material.dart';

class HomeLayout extends StatelessWidget {
static const routeName='home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo App'),
      ),
    );
  }
}
