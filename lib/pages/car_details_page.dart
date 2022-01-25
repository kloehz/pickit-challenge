import 'package:flutter/material.dart';
import 'package:pickit/models/vehicles_model.dart';
import 'package:pickit/pages/pages.dart';
import 'package:pickit/providers/services_list.dart';

import 'package:pickit/themes/colors.dart';

import 'package:animate_do/animate_do.dart';
import 'package:pickit/widgets/avatar.dart';
import 'package:pickit/widgets/checkbox_service.dart';
import 'package:provider/provider.dart';

class CarDetails extends StatelessWidget {

  final Vehicle vehicle;

  const CarDetails({ Key? key, required this.vehicle }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalles')
      ),
      floatingActionButton: SizedBox(
        height: 50,
        child: ElevatedButton(
          child: const Text('Nuevo Service', style: TextStyle(fontSize: 16)),
          onPressed: () => Navigator.pushNamed(context, 'newService', arguments: vehicle),
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
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Hero(
                    tag: vehicle.patent,
                    child: const Avatar(height: 100, width: 100, margin: EdgeInsets.only(right: 15))
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Hero(
                        tag: vehicle.owner.docNumber,
                        child: Material(
                          type: MaterialType.transparency,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                // TODO: Fix it
                                width: size.width * 0.6,
                                child: Text(
                                  '${vehicle.owner.lastName} ${vehicle.owner.name}', 
                                  style: const TextStyle(fontSize: 28, color: Colors.white),
                                  overflow: TextOverflow.ellipsis
                                ),
                              ),
                              Text('${vehicle.brand} ${vehicle.model}', style: const TextStyle(fontSize: 24, color: Colors.white),),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text('Pat: ${vehicle.patent}', style: const TextStyle(fontSize: 24, color: Colors.white),),
                      Text('Color: ${vehicle.color}', style: const TextStyle(fontSize: 24, color: Colors.white),),
                    ],
                  )
                ]
              ),
            ),
          ),
          _ServiceInformation(vehicle: vehicle),
        ],
      ),
    );
  }
}

class _ServiceInformation extends StatelessWidget {

  final Vehicle vehicle;

  const _ServiceInformation({ Key? key, required this.vehicle }) : super(key: key);


  @override
  Widget build(BuildContext context) {

    final servicesList = Provider.of<ServicesListProvider>(context).servicesList;
    final size = MediaQuery.of(context).size;

    return FadeInUp(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        height: size.height * 0.625,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight:  Radius.circular(50)
          )
        ),
        child: Column(
          children: [
            const Text(
              'Ultimo service realizado el dia: 12/12/22',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center
            ),
            const Divider(thickness: 2),
            Column(
              children: vehicle.lastService.toJson().entries.map((item) {
                return CheckBoxService(
                  value: item.value.state,
                  serviceText: item.value.description
                );
              }).toList(),
            ),
          ],
        )
      ),
    );
  }
}