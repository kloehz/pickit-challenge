import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

import 'package:provider/provider.dart';

import 'package:pickit/providers/owner_form.dart';
import 'package:pickit/services/register_service.dart';
import 'package:pickit/themes/colors.dart';
import 'package:pickit/widgets/basic_dialog.dart';

class NewOwner extends StatelessWidget {

  const NewOwner({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final registerService = Provider.of<RegisterService>(context);
    final ownerFormProvider = Provider.of<OwnerProvider>(context);
    
    return Scaffold(
      appBar: AppBar(),
      body: Theme(
        child: registerService.isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
            padding: const EdgeInsets.all(25),
            child: ListView(
              children: [
                const CarForm(),
                ElevatedButton(
                  onPressed: () async {
                    if( !ownerFormProvider.isValidForm() ) return;
          
                    try {
                      await registerService.registerNewOwner({});
                      basicDialog(context, text: 'Registro realizado con exito', title: 'Exito');
                    } catch (err) {
                      basicDialog(context, title: 'Error', text: err);
                    }
                  },
                  child: const Text('Aceptar'),
                )
              ]
            ),
          ),
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

  @override
  Widget build(BuildContext context) {

    final ownerFormProvider = Provider.of<OwnerProvider>(context);

    return Form(
      key: ownerFormProvider.formKey,
      child: Column(
        children: [
          const Text('Datos del propietario',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            )
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 12),
            child: TextFormField(
              validator: (value) {
                if(value!.isEmpty){
                  return 'Ingrese un nombre';
                }
              },
              onChanged: (value) => ownerFormProvider.name = value,
              decoration: const InputDecoration(
                label: Text('Nombre'),
                icon: Icon(Icons.person),
                labelStyle: TextStyle(color: primaryColor),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 12),
            child: TextFormField(
              validator: (value) {
                if(value!.isEmpty){
                  return 'Ingrese un apellido';
                }
              },
              onChanged: (value) => ownerFormProvider.lastName,
              decoration: const InputDecoration(
                label: Text('Apellido'),
                icon: Icon(Icons.person),
                labelStyle: TextStyle(color: primaryColor),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 12),
            child: TextFormField(
              validator: (value) {
                if(value!.isEmpty){
                  return 'Ingrese un DNI';
                }
              },
              onChanged: (value) => ownerFormProvider.docNumber,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                label: Text('DNI'),
                icon: Icon(Icons.credit_card),
                labelStyle: TextStyle(color: primaryColor),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 12),
            child: TextFormField(
              validator: (value) {
                return null;
              },
              onChanged: (value) => ownerFormProvider.phone,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                label: Text('Telefono'),
                icon: Icon(Icons.call),
                labelStyle: TextStyle(color: primaryColor),
              ),
            ),
          ),
          const SizedBox(height: 50),
          const Text('Datos del vehiculo',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            )
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 12),
            child: TextFormField(
              validator: (value) {
                if(value!.isEmpty){
                  return 'Ingrese una marca';
                }
              },
              onChanged: (value) => ownerFormProvider.brand,
              decoration: const InputDecoration(
                label: Text('Marca'),
                icon: Icon(Icons.car_rental),
                labelStyle: TextStyle(color: primaryColor),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 12),
            child: TextFormField(
              validator: (value) {
                if(value!.isEmpty){
                  return 'Ingrese el modelo';
                }
              },
              onChanged: (value) => ownerFormProvider.model,
              decoration: const InputDecoration(
                label: Text('Modelo'),
                icon: Icon(Icons.car_repair_rounded),
                labelStyle: TextStyle(color: primaryColor),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 12),
            child: TextFormField(
              validator: (value) {
                if(value!.isEmpty){
                  return 'Ingrese el año';
                }
              },
              onChanged: (value) => ownerFormProvider.year,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                label: Text('Año'),
                icon: Icon(Icons.construction),
                labelStyle: TextStyle(color: primaryColor),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 12),
            child: TextFormField(
              validator: (value) {
                if(value!.isEmpty){
                  return 'Ingrese la patente';
                }
              },
              onChanged: (value) => ownerFormProvider.patent,
              decoration: const InputDecoration(
                label: Text('Patente'),
                icon: Icon(Icons.content_copy),
                labelStyle: TextStyle(color: primaryColor),
              ),
            ),
          ),
          // ElevatedButton(
          //   child: const Text('Seleccione un color'),
          //   onPressed: () => showColorPicker(context),
          //   style: ButtonStyle(
          //     backgroundColor: MaterialStateProperty.all<Color>(primaryColor),
          //   )
          // ),
          GestureDetector(
            onTap: () => showColorPicker(context, ownerFormProvider),
            child: TextFormField(
              enabled: false,
              initialValue: ownerFormProvider.color,
              decoration: const InputDecoration(
                disabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                label: Text('Color'),
                icon: Icon(Icons.color_lens),
                labelStyle: TextStyle(color: primaryColor),
              ),
            ),
          ),
        ],
      )
    );
  }
}


void showColorPicker(BuildContext context, OwnerProvider ownerFormProvider) {
  showDialog(
    context: context,
    builder: (context) {

      return AlertDialog(
        title: const Text('Colores disponibles', textAlign: TextAlign.center),
        content: BlockPicker(
          pickerColor: Colors.white,
          onColorChanged: (Color color) {
            ownerFormProvider.setColor = color.toString();
            Navigator.of(context).pop();
          },
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