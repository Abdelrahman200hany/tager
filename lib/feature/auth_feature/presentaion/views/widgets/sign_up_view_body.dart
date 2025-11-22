import 'package:flutter/material.dart';
import 'package:tager/core/consts/consts.dart';
import 'package:tager/core/widgets/custom_app_bar.dart';
import 'package:tager/core/widgets/custom_text_bottom_with_background.dart';
import 'package:tager/core/widgets/custom_text_form_feild.dart';
import 'package:tager/feature/auth_feature/presentaion/views/widgets/condition_widget.dart';
import 'package:tager/feature/auth_feature/presentaion/views/widgets/have_or_create_new_account.dart';

class SignUPViewBody extends StatelessWidget {
  const SignUPViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: 'تسجيل دخول', wantedIconBack: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: kHoriztailPadding),
          child: Column(
            children: [
              SizedBox(height: 12),

              CustomTextFormFeild(
                hint: 'الاسم كامل',
                textInputType: TextInputType.name,
              ),
              SizedBox(height: 16),
              CustomTextFormFeild(
                hint: 'البريد الإلكتروني',
                textInputType: TextInputType.emailAddress,
              ),
              SizedBox(height: 16),
              CustomTextFormFeild(
                hint: 'ؤقم الهاتف',
                textInputType: TextInputType.phone,
              ),
              SizedBox(height: 16),
              CustomTextFormFeild(
                hint: 'كلمة المرور',
                textInputType: TextInputType.visiblePassword,
                isHidden: true,
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.visibility),
                ),
              ),
              SizedBox(height: 16),
              CondtionWidget(),
              SizedBox(height: 16),
              CustomTextBottomWithBackground(text: 'إنشاء حساب جديد'),
              SizedBox(height: 16),
              CustomHaveOrCreateNewAcountTextWidget(
                fristText: 'تمتلك حساب بالفعل ؟ ',
                secondText: 'تسجيل دخول',
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
