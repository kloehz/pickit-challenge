import 'package:flutter/material.dart';
import 'package:pickit/themes/colors.dart';
import 'package:pickit/widgets/basic_input.dart';
import 'package:pickit/widgets/color_picker.dart';

class NewCar extends StatelessWidget {
  const NewCar({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        child: ListView(
          children: [
            const Text('Datos del vehiculo',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              )
            ),
            const SizedBox(height: 20),
            const _SelectOwner(),
            BasicInput(
              name: 'Marca',
              icon: const Icon(Icons.car_rental),
              validator: (String? value) {
                if(value!.isEmpty){
                  return 'Ingrese una marca';
                }
              },
            ),
            BasicInput(
              name: 'Modelo',
              icon: const Icon(Icons.car_repair_rounded),
              validator: (String? value) {
                if(value!.isEmpty){
                  return 'Ingrese el modelo';
                }
              },
            ),
            BasicInput(
              name: 'Año',
              icon: const Icon(Icons.construction), inputType: TextInputType.number,
              validator: (String? value) {
                if(value!.isEmpty){
                  return 'Ingrese el año';
                }
              },
            ),
            BasicInput(
              name: 'Patente',
              icon: const Icon(Icons.content_copy),
              validator: (String? value) {
                if(value!.isEmpty){
                  return 'Ingrese la patente';
                }
              },
            ),
            const _SelectColor(),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Aceptar'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(primaryColor),
              )
            )
          ],
        ),
      ),
    );
  }
}

class _SelectColor extends StatelessWidget {
  const _SelectColor({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showMaterialDialog(context),
      child: TextFormField(
        enabled: false,
        decoration: const InputDecoration(
          disabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
          label: Text('Color'),
          icon: Icon(Icons.color_lens),
          labelStyle: TextStyle(color: primaryColor),
        ),
      ),
    );
  }
}

class _SelectOwner extends StatelessWidget {
  const _SelectOwner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {


    final size = MediaQuery.of(context).size;

    return GestureDetector(
      child: TextFormField(
        enabled: false,
        decoration: const InputDecoration(
          disabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
          label: Text('Propietario'),
          icon: Icon(Icons.person),
          labelStyle: TextStyle(color: primaryColor),
        ),
      ),
      onTap: () => showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: TextFormField(
              decoration: const InputDecoration(
                label: Text('Propietario'),
                icon: Icon(Icons.search),
                labelStyle: TextStyle(color: primaryColor),
              ),
            ),
            content: SizedBox (
              width: size.width * 0.8, // Change as per your requirement
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 15,
                itemBuilder: (BuildContext context, int index) {
                  return const ListTile(
                    title: Text('kjhk'),
                  );
                },
              ),
            )
          );
        }
      ),
    );
  }
}
