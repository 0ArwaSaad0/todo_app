import 'package:flutter/material.dart';
import 'package:todo_app/model/tasks.dart';
import 'package:todo_app/shared/component/alert_dialog.dart';
import 'package:todo_app/shared/network/local/firebase_utiles.dart';
import 'package:todo_app/shared/styles/colors.dart';

class TaskEdit extends StatefulWidget {
  static String routeName='update';

  @override
  State<TaskEdit> createState() => _TaskEditState();
}

class _TaskEditState extends State<TaskEdit> {

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late  TextEditingController titleEditController;
  late TextEditingController detailEditCoontroller;
  var selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    var task=ModalRoute.of(context)!.settings.arguments as Tasks;
  titleEditController = TextEditingController(text:task.title);
  detailEditCoontroller = TextEditingController(text: task.description);
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text('Edit Task',
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .headline1
                      ?.copyWith(color: LIGHTPRIMARY)),
            ),
            Form(
              key: formKey,
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
                      controller: titleEditController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        label: Text('New Title Task',
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
                      controller: detailEditCoontroller,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        label: Text('Add New Description',
                            style: Theme.of(context).textTheme.subtitle1),
                      ),
                    ),
                    const SizedBox(
                      height: 22,
                    ),
                    Text(
                      'Select New Date',
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
                        if (formKey.currentState!.validate()) {
                          Tasks taskData = Tasks(
                            title: titleEditController.text,
                            description: detailEditCoontroller.text,
                            date: DateUtils.dateOnly(selectedDate)
                                .microsecondsSinceEpoch,
                          );
                          ShowLoading(context, 'Loading........');
                          HideLoading(context);
                          ShowMessage(
                            context,
                            " Edit Success",
                            "OK",
                            () {
                              updateTaskFromFirebase(task.id,taskData);
                              Navigator.pop(context);
                              Navigator.pop(context);

                            },
                          );
                        }
                      },
                      child: Text(
                        "Save Change",
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
      ),
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
