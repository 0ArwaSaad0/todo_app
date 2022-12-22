import 'package:flutter/material.dart';

ShowLoading(context, String message) {
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
            title: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  CircularProgressIndicator(),
                  SizedBox(
                    width: 5,
                  ),
                  Text(message)
                ],
              ),
            ),
          ));
}

HideLoading(context) {
  Navigator.pop(context);
}

ShowMessage(
    BuildContext context, String message, String posBtn, VoidCallback posAction,
    {String? negBtn, VoidCallback? negAction}) {
  showDialog(
    context: context,
    builder: (context) {
      List<Widget> Action = [
        TextButton(onPressed: posAction, child: Text(posBtn)),
      ];
      if (negBtn != null) {
        Action.add(TextButton(onPressed: negAction, child: Text(negBtn)));
      }
      return AlertDialog(
        title: Text(message),
        actions: Action,
      );
    },
  );
}
