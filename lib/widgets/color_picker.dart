import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

void showMaterialDialog(BuildContext context) {

  void changeColor(Color color){
    Navigator.of(context).pop();
  }

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Colores disponibles', textAlign: TextAlign.center),
        content: BlockPicker(
          pickerColor: Colors.white,
          onColorChanged: changeColor,
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cerrar')
          )
        ],
      );
    }
  );
}