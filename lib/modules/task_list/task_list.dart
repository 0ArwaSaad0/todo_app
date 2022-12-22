import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:todo_app/model/tasks.dart';
import 'package:todo_app/modules/task_list/task_item.dart';
import 'package:todo_app/shared/network/local/firebase_utiles.dart';
import 'package:todo_app/shared/styles/colors.dart';

class TaskList extends StatefulWidget {
  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  DateTime currentDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        CalendarTimeline(
          shrink: true,
          initialDate: currentDate,
          firstDate: DateTime.now().subtract(Duration(days: 365)),
          lastDate: DateTime.now().add(Duration(days: 365)),
          onDateSelected: (date) {
            currentDate = date;
            setState(() {});
          },
          leftMargin: 20,
          monthColor: Theme.of(context).colorScheme.onPrimary,
          dayColor: Theme.of(context).colorScheme.onSecondary,
          activeDayColor: Theme.of(context).colorScheme.onBackground,
          activeBackgroundDayColor: Theme.of(context).colorScheme.onSecondary,
          dotsColor: Colors.white,
          selectableDayPredicate: (date) => true,
          locale: 'en_ISO',
        ),
        // Expanded(
        //   child: ListView.builder(itemBuilder: (_,index)=>TaskItem(),
        //   itemCount: 15,),
        // )

        StreamBuilder<QuerySnapshot<Tasks>>(
            stream: getTasksFromFirestore(currentDate),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Center(child: Text('Something went wrong'));
              }

              var tasks =
                  snapshot.data?.docs.map((doc) => doc.data()).toList() ?? [];
              print('length ${tasks.length}');
              if (tasks.isEmpty) {
                return Center(child: Text('No Data'));
              }

              return Expanded(
                child: ListView.builder(
                    itemBuilder: (_, index) => TaskItem(tasks[index]),
                    itemCount: tasks.length),
              );
            })
      ],
    ));
  }
}
