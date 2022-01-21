import 'package:flutter/material.dart';
import 'package:pickit/themes/colors.dart';

class CheckBoxService extends StatelessWidget {

  final bool value;
  final String serviceText;
  final void Function(bool?)? onChange;

  const CheckBoxService({
    Key? key,
    required this.value,
    required this.serviceText,
    this.onChange,
  }) : super(key:key);

  @override
  Widget build(BuildContext context) {

    return CheckboxListTile(
      onChanged: onChange ?? (state) {},
      value: value,
      title: Text(serviceText),
      controlAffinity: ListTileControlAffinity.leading,
      activeColor: primaryColor,
    );
  }
}