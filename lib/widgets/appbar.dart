import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomeAppBar extends StatelessWidget {
  const CustomeAppBar(
      {super.key,
      required this.title,
      required this.icon,
      required this.w,
      this.onpress});

  final String title;
  final IconData icon;
  final double w;
  final void Function()? onpress;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '$title',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          width: w,
        ),
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white.withOpacity(0.05)),
          child: IconButton(
            icon: Icon(
              icon,
              size: 25,
              color: Colors.white,
            ),
            onPressed: onpress,
          ),
        )
      ],
    );
  }
}
