import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tager/core/consts/consts.dart';
import 'package:tager/core/uitls/app_color.dart';
import 'package:tager/core/uitls/assets.dart';
import 'package:tager/core/widgets/custom_app_bar.dart';
import 'package:tager/core/widgets/custom_bottom.dart';
import 'package:tager/core/widgets/custom_text_bottom.dart';
import 'package:tager/core/widgets/custom_text_bottom_with_background.dart';
import 'package:tager/core/widgets/custom_text_form__feild_for_password.dart';
import 'package:tager/core/widgets/custom_text_form_feild.dart';
import 'package:tager/feature/auth_feature/presentaion/views/forget_password_view.dart';
import 'package:tager/feature/auth_feature/presentaion/views/sign_up_view.dart';
import 'package:tager/feature/auth_feature/presentaion/views/widgets/custom_divider.dart';
import 'package:tager/feature/auth_feature/presentaion/views/widgets/have_or_create_new_account.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: 'تسجيل دخول',),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kHoriztailPadding),
          child: Column(
            children: [              SizedBox(height:12),

              CustomTextFormFeild(
                hint: 'البريد الإلكتروني',
                textInputType: TextInputType.emailAddress,
              ),
              SizedBox(height: 16),
             CustomTextFormFieldForPasswoed(),
              SizedBox(height: 15),
              Align(
                alignment: Alignment.centerLeft,
                child: CustomTextBottom(
                  onPressed: (){
                    Navigator.pushNamed(context, ForgetPassWordView.routeName);
                  },
                  text: 'نسيت كلمة المرور؟',
                  textColor: AppColor.kPrimaryColorLight,
                ),
              ),
              SizedBox(height: 32),
              CustomTextBottomWithBackground(text: 'تسجيل دخول'),
              SizedBox(height: 32),
              CustomHaveOrCreateNewAcountTextWidget(
          fristText: 'لا تمتلك حساب ؟ ',
          secondText: 'قم أنشاء حساب',
          onTap: (){
            Navigator.pushNamed(context, SignUPView.routeName);
          },
              ),
              SizedBox(height: 32),
              CustomDivider(),
              SizedBox(height: 32),
              CustomBottom(
                text: 'تسجيل بواسطة جوجل',
                icon: SvgPicture.asset(Assets.assetsImagesGoogle),
              ),
              SizedBox(height: 16),

              CustomBottom(
                text: 'تسجيل بواسطة أبل',
                icon: SvgPicture.asset(Assets.assetsImagesApple),
              ),
              SizedBox(height: 16),
              CustomBottom(
                text: 'تسجيل بواسطة فيسبوك',
                icon: SvgPicture.asset(Assets.assetsImagesFacebook),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
