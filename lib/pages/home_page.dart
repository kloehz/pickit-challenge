import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:pickit/models/vehicles_model.dart';
import 'package:pickit/pages/car_details_page.dart';

import 'package:provider/provider.dart';

import 'package:pickit/services/get_vehicles.dart';
import 'package:pickit/themes/colors.dart';
import 'package:pickit/widgets/avatar.dart';

class HomePage extends StatelessWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final vehiclesList = Provider.of<GetVehicles>(context).vehiclesList;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Vehiculos')
      ),
      floatingActionButton: SpeedDial(
        icon: Icons.add,
        buttonSize: const Size(65.0, 65.0),
        childrenButtonSize: const Size(60.0, 60.0),
        children: [
          SpeedDialChild(
            child: const Icon(Icons.person_add, size: 30),
            backgroundColor: secondaryColor,
            foregroundColor: Colors.white,
            onTap: () => Navigator.pushNamed(context, 'newOwner')
          ),
          SpeedDialChild(
            child: const Icon(Icons.car_repair, size: 37),
            backgroundColor: secondaryColor,
            foregroundColor: Colors.white,
            onTap: () => Navigator.pushNamed(context, 'newCar')
          )
        ],
      ),
      body: vehiclesList.isNotEmpty
        ? _ItemsList(vehicles: vehiclesList)
        : const Center(child: CircularProgressIndicator()),
    );
  }
}

class _ItemsList extends StatelessWidget {

  final List<Vehicle> vehicles;

  const _ItemsList({
    Key? key,
    required this.vehicles,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container (
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: ListView.builder(
        itemCount: vehicles.length,
        clipBehavior: Clip.none,
        itemBuilder: (context, index) {
          return _ItemContainer(vehicle: vehicles[index]);
        },
      ),
    );
  }
}

class _ItemContainer extends StatelessWidget {

  final Vehicle vehicle;

  const _ItemContainer({
    Key? key,
    required this.vehicle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, 'carDetails', arguments: vehicle),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(-5,5)
            )
          ]
        ),
        margin: const EdgeInsets.symmetric(vertical: 12),
        padding: const EdgeInsets.all(5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Hero(
              tag: vehicle.patent,
              child: const Avatar(height: 50, width: 50, margin: EdgeInsets.only(right: 20))
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${vehicle.brand} ${vehicle.model}', style: const TextStyle(
                    fontSize: 22
                  )),
                  Text('${vehicle.owner.lastName} ${vehicle.owner.name}',
                    style: const TextStyle(fontSize: 20),
                    overflow: TextOverflow.ellipsis
                  )
                ],
              ),
            )
          ],
        )
      ),
    );
  }
}