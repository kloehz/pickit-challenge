import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:pickit/themes/colors.dart';

class CarDetails extends StatelessWidget {
  const CarDetails({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: const _NewServiceButton(),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            color: primaryColor,
          ),
          _ServiceInformation(size: size)
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
  const _ServiceInformation({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      child: Container(
        height: size.height * 0.6,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight:  Radius.circular(50)
          )
        ),
      ),
    );
  }
}