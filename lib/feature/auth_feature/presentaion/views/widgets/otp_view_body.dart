import 'package:flutter/material.dart';
import 'package:tager/core/consts/consts.dart';
import 'package:tager/core/uitls/app_color.dart';
import 'package:tager/core/uitls/app_style.dart';
import 'package:tager/core/widgets/custom_app_bar.dart';
import 'package:tager/core/widgets/custom_text_bottom.dart';
import 'package:tager/core/widgets/custom_text_bottom_with_background.dart';
import 'package:tager/feature/auth_feature/presentaion/views/create_new_password_view.dart';
import 'package:tager/feature/auth_feature/presentaion/views/widgets/otp_list.dart';

class OtpViewBody extends StatelessWidget {
  const OtpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: 'التحقق من الرمز', wantedIconBack: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: kHoriztailPadding),
          child: Column(
            children: [
              SizedBox(height: 12),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'أدخل الرمز الذي أرسلناه إلى عنوان بريد التالي Maxxx@email.com',
                  style: AppStyle.styleSemiBold18(context),
                  textAlign: TextAlign.start,
                ),
              ),
              SizedBox(height: 30),
              OtpList(),
              SizedBox(height: 30),
              CustomTextBottomWithBackground(
                text: 'تحقق من الرمز',
                ontap: () {
                  Navigator.pushNamed(context, CreateNewPasswordView.routeName);
                },
              ),
              SizedBox(height: 30),
              CustomTextBottom(
                text: 'إعادة إرسال الرمز',
                textColor: AppColor.kPrimaryColorLight,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
