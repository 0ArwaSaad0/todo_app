import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/layout/add_task_list.dart';
import 'package:todo_app/modules/settings/settings.dart';
import 'package:todo_app/modules/task_list/task_list.dart';
import 'package:todo_app/providers/my_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeLayout extends StatelessWidget {
  static const routeName = 'home';

  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<MyProvider>(context);
    return Scaffold(
      //resizeToAvoidBottomInset: true,
      extendBody: true,
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.app_title,
          style: Theme.of(context)
              .textTheme
              .headline1
              ?.copyWith(color: Colors.white),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        shape: const StadiumBorder(
            side: BorderSide(color: Colors.white, width: 3)),
        onPressed: () {
          showBottomSheet(context);
        },
        child: const Icon(Icons.add,color: Colors.white,),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        notchMargin: 9,
        shape: const CircularNotchedRectangle(),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          currentIndex: prov.currentIndex,
          onTap: (index) => prov.nevgateTabs(index),
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.list),
                label: '',
                backgroundColor: Colors.transparent),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: '',
                backgroundColor: Colors.transparent),
          ],
        ),
      ),
      body: tabs[prov.currentIndex],
    );
  }
}

List<Widget> tabs = [TaskList(), Settings()];
showBottomSheet(context) {
  showModalBottomSheet(context: context, builder: (c) => AddTaskList());
}
