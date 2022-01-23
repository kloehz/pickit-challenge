import 'package:flutter/material.dart';

import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:pickit/widgets/color_picker.dart';
import 'package:provider/provider.dart';

import 'package:pickit/providers/services_list.dart';
import 'package:pickit/themes/colors.dart';
import 'package:pickit/widgets/avatar.dart';
import 'package:pickit/widgets/checkbox_service.dart';

class NewServicePage extends StatelessWidget {
  const NewServicePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Nuevo service'),
      ),
      floatingActionButton: SizedBox(
        height: 50,
        child: ElevatedButton(
          child: const Text('Registrar', style: TextStyle(fontSize: 16)),
          onPressed: () =>  Navigator.pushNamedAndRemoveUntil(
            context,
            'home',
            (Route<dynamic> route) => false,
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(primaryColor),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)
              )
            )
          )
        ),
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            width: double.infinity,
            color: primaryColor,
            padding: const EdgeInsetsDirectional.only(top: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Hero(tag: 'avatarTag', child: Avatar(height: 100, width: 130)),
                const SizedBox(height: 15),
                Hero(
                  tag: 'vehicleOwnerTag',
                  child: Material(
                    type: MaterialType.transparency,
                    child: Column(
                      children: const [
                        Text('Guido Cotelesso ', style: TextStyle(fontSize: 28, color: Colors.white)),
                        Text('Chevrolet Corsa', style: TextStyle(fontSize: 24, color: Colors.white)),
                      ]
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            height: size.height * 0.56,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50),
                topRight:  Radius.circular(50)
              )
            ),
            child: const ServicesList()
          )
        ],
      ),
    );
  }
}

class ServicesList extends StatelessWidget {
  const ServicesList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    // final services = Provider.of<ServicesListProvider>(context);

    return Column(
      children: [
        const CheckBoxService(
          serviceText: 'Cambio de aceite', value: true
        ),
        const CheckBoxService(
          serviceText: 'Cambio de filtro', value: true
        ),
        const CheckBoxService(
          serviceText: 'Cambio de correa', value: true
        ),
        const CheckBoxService(
          serviceText: 'Revision general', value: true
        ),
        const CheckBoxService(
          serviceText: 'Otros services', value: true
        ),
        ElevatedButton(
          child: const Text('Seleccione un color'),
          onPressed: () => showMaterialDialog(context),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(primaryColor),
          )
        ),
      ],
    );
  }
}