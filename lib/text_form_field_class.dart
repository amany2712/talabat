import 'package:flutter/material.dart';

class TextFormFieldClass extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final IconData prefixIcon;

  const TextFormFieldClass({
    required this.controller,
    required this.labelText,
    required this.prefixIcon,
  }) ;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
                cursorColor: Color(0xFFF55540),
                controller: controller,
                decoration: InputDecoration(
                  label: Text(labelText),
                  labelStyle: TextStyle(
                    color: Color(0xFFF55540),
                    fontSize: 16
                  ),
                  prefixIcon: Icon(prefixIcon, color: Color(0xFFF55540),),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(45),
                    borderSide: BorderSide(color: Color(0xFFF55540)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(45),
                    borderSide: BorderSide(color: Color(0xFFF55540)),
                  )

                ),
              );
  }
}