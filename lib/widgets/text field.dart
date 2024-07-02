import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextFeild extends StatelessWidget {
  TextFeild({
    super.key,
    required this.hint,
    this.maxline = 1,
    this.onsave,this.onchange
  });

  final String hint;
  final int maxline;
  void Function(String?)? onsave;
  void Function(String)?onchange;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxline,
      onSaved: onsave,onChanged:onchange ,
      cursorColor: Color(0xff62FCD7),
      decoration: InputDecoration(
        focusedBorder: buildOutlineInputBorder(),
        hintText: hint,
        hintStyle: TextStyle(color: Color(0xff62FCD7)),
        border: buildOutlineInputBorder(),
        enabledBorder: buildOutlineInputBorder(),
      ),
      validator: (val) {
        if (val?.isEmpty == true) {
          return 'Required Field';
        }
      },
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(color: Colors.blueGrey));
  }
}
