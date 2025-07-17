import 'package:flutter/material.dart';

import '../../core/constants/fonts.dart';
import '../../core/constants/style.dart';

class CommonTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool? obscureText;
  final IconButton? suffixIcon;
  final Function(dynamic value) onChanged;

  FormFieldValidator? validator;
  var formKey;

   CommonTextFormField({
    required this.controller,
    required this.hintText,
    required this.onChanged,
    this.obscureText,
    this.suffixIcon,
    this.validator,
     required this.formKey,
    super.key});

  @override
  Widget build(BuildContext context) {
    return  Form(
      key: formKey,
      child: TextFormField(
        validator: validator,
        obscureText: obscureText ?? false,
        textAlign:TextAlign.start,
        controller: controller,
        onChanged: onChanged,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: Style.lightTextColor,
          fontFamily: Fonts.sfUI,
          fontSize: 16,
        ),
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.transparent),
          ),

          hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontFamily: Fonts.sfUI,
            fontSize: 16,
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.transparent),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.transparent),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.transparent),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          fillColor: Style.lightGrayColor,
          filled: true,

        ),
      ),
    );
  }
}
