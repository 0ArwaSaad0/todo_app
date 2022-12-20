import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/providers/my_provider.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todo_app/shared/styles/colors.dart';

class AddTaskList extends StatelessWidget {
  var selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyProvider(),
      builder: (context, child) {
        var prov = Provider.of<MyProvider>(context);
        return SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                    AppLocalizations.of(context)!.add_new_task,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline1?.copyWith(color: LIGHTPRIMARY)),
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
                          label: Text(
                            AppLocalizations.of(context)!.task_title,
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1

                          ),
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
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1
                          ),
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
                        //onTap: () => prov.DisplayPicker(context),
                        child: DateTimePicker(
                          type: DateTimePickerType.dateTimeSeparate,
                          dateMask: 'd MMM, yyyy',
                          initialValue: selectedDate.toString(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime.now().add(Duration(days: 365)),
                          icon: Icon(Icons.event),
                          dateLabelText: 'Date',
                          timeLabelText: "Hour",
                          selectableDayPredicate: (date) {
                            // Disable weekend days to select from the calendar
                            // if (date.weekday == 6 || date.weekday == 7) {
                            //   return false;
                            // }

                            return true;
                          },
                          onChanged: (val) => print(val),
                          validator: (val) {
                            print(val);
                            return null;
                          },
                          onSaved: (val) => print(val),
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
                          AppLocalizations.of(context)!.add_task,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1?.copyWith(color:Colors.white),
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
}
