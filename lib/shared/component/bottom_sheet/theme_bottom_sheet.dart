import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/providers/my_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ThemeBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var prov=Provider.of<MyProvider>(context);
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
          child: InkWell(
            onTap: (){
              prov.changeTheme(ThemeMode.light);
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Light',style: Theme.of(context).textTheme.subtitle1,),
                Icon(Icons.done,size:25 ,),
              ],
            ),
          ),
        ),
        InkWell(
          onTap: (){
            prov.changeTheme(ThemeMode.dark);
            Navigator.pop(context);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                child: Text('Dark',style: Theme.of(context).textTheme.subtitle1,),
              ),
              Icon(Icons.done,size: 25,),
            ],
          ),
        ),
      ],
    );
  }
}
