import 'package:flutter/material.dart';
import 'package:pickit/themes/colors.dart';

Future<dynamic> basicDialog(BuildContext context, {required String title, required dynamic text}) {
  return showDialog(
    context: context,
    builder: (BuildContext context){
      return AlertDialog(
        title: Text(title),
        content: Text(text.toString()),
        actions: [
          TextButton(
            onPressed: (){
              Navigator.of(context).pop();
            },
            child: const Text('Aceptar', style: TextStyle(color: primaryColor))
          )
        ]
      );
    }
  );
}