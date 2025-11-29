import 'package:flutter/material.dart';
import 'package:tager/core/consts/consts.dart';
import 'package:tager/core/uitls/app_color.dart';
import 'package:tager/core/uitls/app_style.dart';

class CondtionWidget extends StatefulWidget {
  const CondtionWidget({super.key, required this.onChanged});

  final ValueChanged<bool> onChanged;

  @override
  State<CondtionWidget> createState() => _CondtionWidgetState();
}

class _CondtionWidgetState extends State<CondtionWidget> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(14, 0),
      child: Row(
        children: [
          Checkbox(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(6),
            ),
            value: isChecked,
            onChanged: (value) {
              isChecked = value!;
              widget.onChanged(value);
              setState(() {});
            },
          ),
          //highliht in vs by crtl +D
          SizedBox(
            width:
                MediaQuery.sizeOf(context).width - 2 * kHoriztailPadding - 48,
            child: Text.rich(
              textAlign: TextAlign.right,
              TextSpan(
                children: [
                  TextSpan(
                    text: 'من خلال إنشاء حساب ، فإنك توافق',
                    style: AppStyle.styleSemiBold13(
                      context,
                    ).copyWith(color: const Color(0xff949D9E)),
                  ),
                  TextSpan(
                    text: '  على الشروط والأحكام الخاصة بنا',
                    style: AppStyle.styleSemiBold13(
                      context,
                    ).copyWith(color: AppColor.kPrimaryColorLight),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
