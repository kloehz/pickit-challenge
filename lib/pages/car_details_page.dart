import 'package:flutter/material.dart';
import 'package:pickit/providers/services_list.dart';

import 'package:pickit/themes/colors.dart';

import 'package:animate_do/animate_do.dart';
import 'package:pickit/widgets/avatar.dart';
import 'package:provider/provider.dart';

class CarDetails extends StatelessWidget {
  const CarDetails({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: const _NewServiceButton(),
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
                  const Hero(
                    tag: 'avatarTag',
                    child: Avatar(height: 100, width: 100, margin: EdgeInsets.only(right: 15))
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('Guido Cotelesso ', style: TextStyle(fontSize: 28, color: Colors.white),),
                      Text('Chevrolet Corsa', style: TextStyle(fontSize: 24, color: Colors.white),),
                      SizedBox(height: 20),
                      Text('Pat: ABC123', style: TextStyle(fontSize: 24, color: Colors.white),),
                      Text('Mod: 0000', style: TextStyle(fontSize: 24, color: Colors.white),),
                      Text('Color: Rojo', style: TextStyle(fontSize: 24, color: Colors.white),),
                    ],
                  )
                ]
              ),
            ),
          ),
          ChangeNotifierProvider(
            create: ( _ ) => ServicesListProvider(),
            child: _ServiceInformation()
          )
        ],
      ),
    );
  }
}

class _NewServiceButton extends StatelessWidget {

  const _NewServiceButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInRight(
      child: SizedBox(
        height: 50,
        child: ElevatedButton(
          child: const Text('Nuevo Service', style: TextStyle(fontSize: 16)),
          onPressed: (){},
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
    );
  }
}

class _ServiceInformation extends StatelessWidget {

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
              children: servicesList.entries.map((item) {
              return _CheckBoxService(
                value: item.value['state'],
                serviceText: item.value['description']
              );
            }).toList(),
            ),
          ],
        )
      ),
    );
  }
}

class _CheckBoxService extends StatelessWidget {

  final bool value;
  final String serviceText;

  const _CheckBoxService({
    Key? key,
    required this.value,
    required this.serviceText
  }) : super(key:key);

  @override
  Widget build(BuildContext context) {

    return CheckboxListTile(
      onChanged: (state) {},
      value: value,
      title: Text(serviceText),
      controlAffinity: ListTileControlAffinity.leading,
      activeColor: primaryColor,
    );
  }
}