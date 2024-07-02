import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomeButton extends StatelessWidget {
   CustomeButton({super.key,  this.onTap, this.isloading = false, required this.w, required this.text, required this.font});

  final void Function()? onTap;
  final isloading;
  final double w,font;
   final String text;


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Color(0xff62FCD7)),
        height: 60,
        child: Center(
          child: isloading == true
              ? CircularProgressIndicator()
              : Text(
                  text,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: font,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
        ),
      ),
    );
  }
}
