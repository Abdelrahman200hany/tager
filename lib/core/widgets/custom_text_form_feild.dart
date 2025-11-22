import 'package:flutter/material.dart';
import 'package:tager/core/uitls/app_style.dart';

class CustomTextFormFeild extends StatelessWidget {
  const CustomTextFormFeild({
    super.key,
    required this.hint,
    this.suffixIcon,
    required this.textInputType,
    this.isHidden=false,
  });

  final String hint;
  final IconButton? suffixIcon;
  final TextInputType textInputType;
  final bool isHidden;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 54,
      width: double.infinity,
      child: TextFormField(
        obscureText: isHidden,
        keyboardType: textInputType,
        decoration: InputDecoration(
          
          fillColor: const Color(0xffF9FAFA),
          
          filled: true,
          hintText: hint,
          hintStyle: AppStyle.styleBold13(context),
          suffixIcon: suffixIcon,

          border: buildBoreder(),

          enabledBorder: buildBoreder(),
          focusedBorder: buildBoreder(),
        ),
      ),
    );
  }
}

OutlineInputBorder buildBoreder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(4),
    borderSide: BorderSide(width: 1, color: const Color(0xFFE6E9E9)),
  );
}
