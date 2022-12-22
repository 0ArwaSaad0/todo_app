
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/providers/my_provider.dart';
import 'package:todo_app/shared/component/bottom_sheet/lang_bottom_sheet.dart';
import 'package:todo_app/shared/component/bottom_sheet/theme_bottom_sheet.dart';
import 'package:todo_app/shared/styles/colors.dart';


class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var prov=Provider.of<MyProvider>(context);
    return Container(
      margin: EdgeInsets.only(top: 50, bottom: 11, right: 40, left: 30),
      //padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            AppLocalizations.of(context)!.language,
            style: Theme.of(context)
                .textTheme
                .headline1
                ?.copyWith(color: Theme.of(context).colorScheme.onSecondary),
          ),

             InkWell(
               onTap: ()=>showLangBottomSheet(context),
               child: Container(
                margin: EdgeInsets.all(11),
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                decoration: BoxDecoration(
                  border: Border.all(color: LIGHTPRIMARY),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  prov.languageCode=='en'?'English':"عربي",
                  style: Theme.of(context).textTheme.subtitle1,
                ),
            ),
             ),

          SizedBox(
            height: 30,
          ),
          InkWell(
            onTap: ()=>showThemeBottomSheet(context),
            child: Text(
              AppLocalizations.of(context)!.my_theme,
              style: Theme.of(context)
                  .textTheme
                  .headline1
                  ?.copyWith(color: Theme.of(context).colorScheme.onSecondary),
            ),
          ),
          Container(
            margin: EdgeInsets.all(11),
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            decoration: BoxDecoration(
              border: Border.all(color:LIGHTPRIMARY),
              borderRadius: BorderRadius.circular(15),
            ),
            child: InkWell(
              onTap: ()=>showThemeBottomSheet(context),
              child: Text(
                prov.currentTheme==ThemeMode.light? AppLocalizations.of(context)!.light: AppLocalizations.of(context)!.dark,
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),

    ),
      ])
    );
  }


  showThemeBottomSheet(context) {
    showModalBottomSheet(
      context: context,
      builder: (contex) => ThemeBottomSheet(),
    );

  }
  showLangBottomSheet(context){
    showModalBottomSheet(context: context, builder:(context)=>LanguageBottomSheet());
  }
}
