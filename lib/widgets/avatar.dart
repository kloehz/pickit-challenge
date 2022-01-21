import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {

  final double height;
  final double width;
  final EdgeInsetsGeometry? margin;

  const Avatar({
    Key? key,
    required this.height,
    required this.width,
    this.margin
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      height: height,
      width: width,
      decoration: const BoxDecoration(
        color: Colors.blue,
        shape: BoxShape.circle
      )
    );
  }
}
