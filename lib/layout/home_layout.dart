import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/providers/my_provider.dart';

class HomeLayout extends StatelessWidget {
  static const routeName = 'home';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => MyProvider(),
        builder: (context, child) {
          var prov = Provider.of<MyProvider>(context);
          return Scaffold(
              extendBody: true,
              appBar: AppBar(
                title: Text(
                  'Todo App',
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              floatingActionButton: FloatingActionButton(
                shape: const StadiumBorder(
                    side: BorderSide(color: Colors.white, width: 3)),
                onPressed: () {},
                child: const Icon(Icons.add),
              ),
              bottomNavigationBar: BottomAppBar(
                elevation: 0,
                notchMargin: 11,
                shape: CircularNotchedRectangle(),
                child: BottomNavigationBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0.0,
                  currentIndex: prov.currentIndex,
                  onTap: (index) => prov.nevgateTabs(index),
                  items: [
                    BottomNavigationBarItem(
                        icon: Icon(Icons.list),
                        label: '',
                        backgroundColor: Colors.transparent),
                    const BottomNavigationBarItem(
                        icon: Icon(Icons.settings),
                        label: '',
                        backgroundColor: Colors.transparent),
                  ],
                ),
              ));
        });
  }
}
