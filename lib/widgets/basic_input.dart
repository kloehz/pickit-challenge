import 'package:flutter/material.dart';
import 'package:pickit/providers/providers.dart';
import 'package:pickit/themes/colors.dart';
import 'package:provider/provider.dart';

class BasicInput extends StatelessWidget {

  final String name;
  final Icon icon;
  final TextInputType inputType;
  final String? Function(String?) validator;

  const BasicInput({
    Key? key,
    required this.name,
    required this.icon,
    required this.validator,
    this.inputType = TextInputType.text
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final ownerFormProvider = Provider.of<OwnerProvider>(context);

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      child: TextFormField(
        keyboardType: inputType,
        validator: (value) => validator(value),
        decoration: InputDecoration(
          label: Text(name),
          icon: icon,
          labelStyle: const TextStyle(color: primaryColor),
        ),
      ),
    );
  }
}