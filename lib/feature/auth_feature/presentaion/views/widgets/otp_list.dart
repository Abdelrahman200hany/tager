import 'package:flutter/material.dart';
import 'package:tager/core/widgets/custom_otp_text_field.dart';

class OtpList extends StatelessWidget {
  const OtpList({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomOptTextFormField(),
        CustomOptTextFormField(),
        CustomOptTextFormField(),
        CustomOptTextFormField(),
      ],
    );
  }
}
