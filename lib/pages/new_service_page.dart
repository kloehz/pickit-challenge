import 'package:flutter/material.dart';
import 'package:pickit/themes/colors.dart';
import 'package:pickit/widgets/avatar.dart';

class NewServicePage extends StatelessWidget {
  const NewServicePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Nuevo service'),
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
                const Hero(tag: 'avatarTag', child: Avatar(height: 130, width: 130)),
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
          )
        ],
      ),
    );
  }
}