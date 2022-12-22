import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/model/tasks.dart';
import 'package:todo_app/providers/my_provider.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:todo_app/shared/component/alert_dialog.dart';
import 'package:todo_app/shared/network/local/firebase_utiles.dart';
import 'package:todo_app/shared/styles/colors.dart';

import '../providers/my_provider.dart';

class AddTaskList extends StatefulWidget {
  @override
  State<AddTaskList> createState() => _AddTaskListState();
}

class _AddTaskListState extends State<AddTaskList> {
  var selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyProvider(),
      builder: (context, child) {
        var prov = Provider.of<MyProvider>(context);
        return Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(AppLocalizations.of(context)!.add_new_task,
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .headline1
                        ?.copyWith(color: LIGHTPRIMARY)),
              ),
              Form(
                key: prov.formKey,
                child: Container(
                  margin: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextFormField(
                        validator: (text) {
                          if (text == '') {
                            return 'Please Enter Title';
                          }
                          return null;
                        },
                        controller: prov.titleController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          label: Text(AppLocalizations.of(context)!.task_title,
                              style: Theme.of(context).textTheme.subtitle1),
                        ),
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      TextFormField(
                        validator: (text) {
                          if (text == '') {
                            return 'Please Enter Description';
                          }
                          return null;
                        },
                        controller: prov.detailCoontroller,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          label: Text(
                              AppLocalizations.of(context)!.task_description,
                              style: Theme.of(context).textTheme.subtitle1),
                        ),
                      ),
                      const SizedBox(
                        height: 22,
                      ),
                      Text(
                        AppLocalizations.of(context)!.select_date,
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                      InkWell(
                        onTap: () {
                          ShowPicker(context);
                        },
                        child: Text(
                          '${selectedDate.year}/${selectedDate.month}/${selectedDate.day}',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.subtitle1,
                        ),

                      ),
                      const SizedBox(
                        height: 22,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (prov.formKey.currentState!.validate()) {
                            Tasks taskData = Tasks(
                              title: prov.titleController.text,
                              description: prov.detailCoontroller.text,
                              date: DateUtils.dateOnly(selectedDate)
                                  .microsecondsSinceEpoch,
                            );
                            ShowLoading(context, 'Loading........');
                            HideLoading(context);
                            ShowMessage(
                                context,
                                " Are you sure Add Task",
                                "Yes",
                                () {
                                  addTaskToFirebase(taskData);
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                },
                                negBtn: 'Cancel',
                                negAction: () {
                                  HideLoading(context);
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                });
                          }
                        },
                        child: Text(
                          AppLocalizations.of(context)!.add_task,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1
                              ?.copyWith(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void ShowPicker(BuildContext context) async {
    DateTime? chosenDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(
        Duration(days: 365),
      ),
    );
    if (chosenDate == null) return;
    selectedDate = chosenDate;
    setState(() {});
  }
}

