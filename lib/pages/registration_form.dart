import 'package:flutter/material.dart';
import 'package:pickit/themes/colors.dart';
import 'package:pickit/widgets/basic_input.dart';

class RegistrationForm extends StatelessWidget {
  const RegistrationForm({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Theme(
        child: const CarForm(),
        data: Theme.of(context).copyWith(
        colorScheme: const ColorScheme.light(
          primary: primaryColor,
        ),
      ))
    );
  }
}


class CarForm extends StatefulWidget {
  const CarForm({ Key? key }) : super(key: key);

  @override
  _CarFormState createState() => _CarFormState();
}

class _CarFormState extends State<CarForm> {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
      child: Form(
        key: _formKey,
        child: ListView(
          children: [
            const Text('Datos del propietario',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              )
            ),
            BasicInput(
              name: 'Nombre',
              icon: const Icon(Icons.person),
              validator: (String? value) {
                if(value!.isEmpty){
                  return 'Debe ingresar un nombre';
                }
              },
            ),
            BasicInput(
              name: 'Apellido',
              icon: const Icon(Icons.person_outline_outlined),
              validator: (String? value) {
                if(value!.isEmpty){
                  return 'Debe ingresar un apellido';
                }
              },
            ),
            BasicInput(
              name: 'Telefono',
              icon: const Icon(Icons.call), inputType: TextInputType.phone,
              validator: (String? value) {
                return null;
              },
            ),
            const SizedBox(height: 50),
            const Text('Datos del vehiculo',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              )
            ),
            BasicInput(
              name: 'Marca',
              icon: const Icon(Icons.car_rental),
              validator: (String? value) {
                if(value!.isEmpty){
                  return 'Ingresar una marca';
                }
              },
            ),
            BasicInput(
              name: 'Modelo',
              icon: const Icon(Icons.car_repair_rounded),
              validator: (String? value) {
                if(value!.isEmpty){
                  return 'Ingresar el modelo';
                }
              },
            ),
            BasicInput(
              name: 'Año',
              icon: const Icon(Icons.construction), inputType: TextInputType.number,
              validator: (String? value) {
                if(value!.isEmpty){
                  return 'Ingresar el año';
                }
              },
            ),
            BasicInput(
              name: 'Patente',
              icon: const Icon(Icons.content_copy),
              validator: (String? value) {
                if(value!.isEmpty){
                  return 'Ingresar la patente';
                }
              },
            ),
            BasicInput(
              name: 'Color',
              icon: const Icon(Icons.color_lens),
              validator: (String? value) {
                if(value!.isEmpty){
                  return 'Ingresar el color';
                }
              },
            ),
          ],
        )
      ),
    );
  }
}