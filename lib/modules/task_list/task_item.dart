import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_app/model/tasks.dart';
import 'package:todo_app/modules/task_list/task_edit.dart';
import 'package:todo_app/shared/network/local/firebase_utiles.dart';
import 'package:todo_app/shared/styles/colors.dart';

class TaskItem extends StatelessWidget {
  Tasks task;
  TaskItem(this.task);
  @override
  Widget build(BuildContext context) {
    return Slidable(
      startActionPane: ActionPane(
        motion: ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {
              deleteTaskFromFirebase(task.id);
            },
            label: 'Delete',
            backgroundColor: Colors.red,
            icon: Icons.delete,
          ),
          SlidableAction(
            onPressed: (context) {
              //TaskEdit();
              Navigator.pushNamed(context, TaskEdit.routeName, arguments: task);
            },
            label: 'Update',
            backgroundColor: Colors.blue,
            icon: Icons.edit,
          )
        ],
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        padding: const EdgeInsets.all(11),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    task.title,
                    style: task.isDone
                        ? Theme.of(context)
                            .textTheme
                            .headline1
                            ?.copyWith(color: GREENCOLOR)
                        : Theme.of(context).textTheme.headline1,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    task.description,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
               if( !task.isDone){
                 updateDone(task);
               }
              },
              child: task.isDone
                  ? Text('Done!',
                      style: Theme.of(context)
                          .textTheme
                          .headline1
                          ?.copyWith(color: GREENCOLOR))
                  : Container(
                      padding: const EdgeInsets.all(11),
                      margin: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      child: const Icon(
                        Icons.done,
                        size: 25,
                      )),
            )
          ],
        ),
      ),
    );
  }
}
