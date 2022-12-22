
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/providers/my_provider.dart';
import 'package:todo_app/shared/styles/colors.dart';

class LanguageBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(11.0),
          child: InkWell(
            onTap: () {
              provider.changeLanguage('en');
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'English',
                  style: Theme.of(context).textTheme.subtitle1?.copyWith(
                    color: provider.languageCode == 'en'
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.onPrimary,),
                ),
                Icon(
                    Icons.done,
                    size: 30,
                    color: provider.languageCode == 'en'
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.onPrimary
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.all(11.0),
          child: InkWell(
            onTap: () {
              provider.changeLanguage('ar');
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Arabic',
                  style: Theme.of(context).textTheme.subtitle1?.copyWith(
                      color: provider.languageCode == 'ar'
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).colorScheme.onPrimary),
                ),
                Icon(
                    Icons.done,
                    size: 30,
                    color: provider.languageCode == 'ar'
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.onPrimary
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

