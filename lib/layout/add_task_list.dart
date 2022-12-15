import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/providers/my_provider.dart';

class AddTaskList extends StatefulWidget {
  @override
  State<AddTaskList> createState() => _AddTaskListState();
}

class _AddTaskListState extends State<AddTaskList> {
  var selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    var titleController = TextEditingController();
    var detailCoontroller = TextEditingController();

    return ChangeNotifierProvider(
      create: (context) => MyProvider(),
      builder: (context, child) {
        var prov = Provider.of<MyProvider>(context);
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                'Add New Task',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.subtitle1,
              ),
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

                      controller: titleController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        label: Text(
                          'Enter your Title Task ',
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1
                              ?.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    TextFormField(
                      // focusNode: f_detail,
                      maxLines: 3,
                      validator: (text) {
                        if (text == '') {
                          return 'Please Enter Description';
                        }
                        return null;
                      },
                      controller: detailCoontroller,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        label: Text(
                          'Description',
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1
                              ?.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 22,
                    ),
                    Text(
                      'Select Date',
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    InkWell(
                      onTap: () => DisplayPicker(context),
                      child: Text(
                        '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}',
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1
                            ?.copyWith(color: Colors.black),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(
                      height: 22,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (prov.formKey.currentState!.validate()) {
                          //regx Email
                        }
                      },
                      child: Text(
                        'Add Task',
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1
                            ?.copyWith(color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  DisplayPicker(context) async {
    DateTime? chosenDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(
        const Duration(days: 365),
      ),
    );
    if (chosenDate == null) return;
    selectedDate = chosenDate;
    setState(() {});
  }
}
