import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:word_game/core/utils/size_utils.dart';

class NormalTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final double height;
  final TextStyle textStyle;
  final bool isPassword;
  final validate;
  const NormalTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.labelText,
    required this.validate,
    required this.textStyle,
    required this.height,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      margin: EdgeInsets.symmetric(vertical: 8.v),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0, 4),
            blurRadius: 10,
          ),
        ],
      ),
      child: Center(
        child: TextFormField(
          controller: controller,
          obscureText: isPassword,
          style: textStyle,
          validator: validate,
          decoration: InputDecoration(
            hintText: hintText,
            label: Text(labelText),
            hintStyle: GoogleFonts.roboto(
              fontSize: 14.fSize,
              color: Colors.black,
            ),
            labelStyle: textStyle,
            contentPadding: EdgeInsets.symmetric(horizontal: 20.h),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}

class PasswordTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final TextStyle textStyle;
  final double height;
  final validate;
  final double iconSize;
  final bool isPassword;
  final VoidCallback function;
  const PasswordTextField({
    super.key,
    required this.controller,
    required this.function,
    required this.hintText,
    required this.labelText,
    required this.height,
    required this.textStyle,
    required this.validate,
    required this.iconSize,
    required this.isPassword,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      margin: EdgeInsets.symmetric(vertical: 8.v),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0, 4),
            blurRadius: 10,
          ),
        ],
      ),
      child: Center(
        child: TextFormField(
          controller: controller,
          obscureText: isPassword,
          style: textStyle,
          validator: validate,
          decoration: InputDecoration(
            suffixIcon: IconButton(
              onPressed: function,
              icon: isPassword
                  ? Icon(
                      Icons.visibility,
                      size: iconSize,
                    )
                  : Icon(
                      Icons.visibility_off,
                      size: iconSize,
                    ),
            ),
            label: Text(labelText),
            labelStyle: textStyle,
            contentPadding: EdgeInsets.symmetric(horizontal: 20.h),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
