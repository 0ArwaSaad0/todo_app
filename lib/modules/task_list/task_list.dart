import 'package:flutter/material.dart';
import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:todo_app/modules/task_list/task_item.dart';
import 'package:todo_app/shared/styles/colors.dart';

class TaskList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    DateTime CurrentDate = DateTime.now();
    return Container(
        child: Column(
      children: [
        CalendarTimeline(
          shrink: true,
          initialDate: CurrentDate,
          firstDate: DateTime.now().subtract(Duration(days: 365)),
          lastDate: DateTime.now().add(Duration(days: 365)),
          onDateSelected: (date) {
            // setState(() {});
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
        Expanded(
          child: ListView.builder(itemBuilder: (_,index)=>TaskItem(),
          itemCount: 15,),
        )
        
      ],
    ));
  }
}
