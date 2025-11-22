import 'package:flutter/material.dart';
import 'package:tager/core/consts/consts.dart';
import 'package:tager/core/uitls/app_style.dart';
import 'package:tager/core/widgets/custom_app_bar.dart';
import 'package:tager/core/widgets/custom_text_bottom_with_background.dart';
import 'package:tager/core/widgets/custom_text_form_feild.dart';

class CreateNewPasswordView extends StatelessWidget {
  const CreateNewPasswordView({super.key});
  static const routeName = 'CreateNewPasswordView';

  @override
  Widget build(BuildContext context) {
    return const CreateNewPasswordViewBody();
  }
}

class CreateNewPasswordViewBody extends StatelessWidget {
  const CreateNewPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: 'كلمة مرور جديدة', wantedIconBack: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: kHoriztailPadding),
          child: Column(
            children: [
              SizedBox(height: 12),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                
                  
                  'قم بإنشاء كلمة مرور جديدة لتسجيل الدخول',
                  textAlign: TextAlign.start,
                  style: AppStyle.styleSemiBold16(
                    context,
                  ).copyWith(color: const Color(0xff0C0D0D)),
                ),
              ),
              SizedBox(height: 16),
              CustomTextFormFeild(
                hint: 'كلمة المرور',
                textInputType: TextInputType.visiblePassword,
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.visibility),
                ),
              ),
                   SizedBox(height: 16),
              CustomTextFormFeild(
                hint: 'كلمه مرور جديدة',
                textInputType: TextInputType.visiblePassword,
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.visibility),
                ),
              ),
                  SizedBox(height: 24),
                CustomTextBottomWithBackground(text: 'إنشاء كلمة مرور جديدة'),
            ],
          ),
        ),
      ),
    );
  }
}
