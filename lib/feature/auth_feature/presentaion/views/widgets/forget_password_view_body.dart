import 'package:flutter/material.dart';
import 'package:tager/core/consts/consts.dart';
import 'package:tager/core/uitls/app_style.dart';
import 'package:tager/core/widgets/custom_app_bar.dart';
import 'package:tager/core/widgets/custom_text_bottom_with_background.dart';
import 'package:tager/core/widgets/custom_text_form_feild.dart';
import 'package:tager/feature/auth_feature/presentaion/views/otp_view.dart';

class ForgetPasswordViewBody extends StatelessWidget {
  const ForgetPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: 'نسيان كلمة المرور', wantedIconBack: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: kHoriztailPadding),
          child: Column(
            children: [
              SizedBox(height: 12),

              Text(
                'لا تقلق ، ما عليك سوى كتابة رقم هاتفك وسنرسل رمز التحقق.',
                style: AppStyle.styleSemiBold18(context),
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 32),
              CustomTextFormFeild(
                hint: 'رقم الهاتف',
                textInputType: TextInputType.phone,
              ),
              SizedBox(height: 32),
              CustomTextBottomWithBackground(
                text: 'نسيت كلمة المرور',
                ontap: () {
                  Navigator.pushNamed(context, OtpView.routeName);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
