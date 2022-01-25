import 'package:flutter/material.dart';
import 'package:pickit/models/vehicles_model.dart';

import 'package:pickit/widgets/color_picker.dart';

import 'package:pickit/themes/colors.dart';
import 'package:pickit/widgets/avatar.dart';
import 'package:pickit/widgets/checkbox_service.dart';

class NewServicePage extends StatelessWidget {

  final Vehicle vehicle;

  const NewServicePage({ Key? key, required this.vehicle }) : super(key: key);

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
                Hero(tag: vehicle.patent, child: const Avatar(height: 100, width: 130)),
                const SizedBox(height: 15),
                Hero(
                  tag: vehicle.owner.docNumber,
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
            child: _ServicesList(vehicle: vehicle)
          )
        ],
      ),
    );
  }
}

class _ServicesList extends StatelessWidget {

  final Vehicle vehicle;

  const _ServicesList({
    Key? key,
    required this.vehicle
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    List<CheckBoxService> serviceList = [];
    
    vehicle.lastService.toJson().entries.map((item) {
      serviceList.add(CheckBoxService(
        value: item.value.state,
        serviceText: item.value.description
      ));
    });

    return SingleChildScrollView(
      child: Column(
        children: vehicle.lastService.toJson().entries.map((item) {
            return CheckBoxService(
              value: item.value.state,
              serviceText: item.value.description
            );
          }).toList()
          // ElevatedButton(
          //   child: const Text('Seleccione un color'),
          //   onPressed: () => showColorPicker(context),
          //   style: ButtonStyle(
          //     backgroundColor: MaterialStateProperty.all<Color>(primaryColor),
          //   )
          // ),
      ),
    );
  }
}