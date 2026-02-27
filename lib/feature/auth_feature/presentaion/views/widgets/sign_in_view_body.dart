import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
import 'package:tager/feature/auth_feature/presentaion/manager/auth_cubit/sign_in/sign_in_cubit.dart';
import 'package:tager/feature/auth_feature/presentaion/views/forget_password_view.dart';
import 'package:tager/feature/auth_feature/presentaion/views/sign_up_view.dart';
import 'package:tager/feature/auth_feature/presentaion/views/widgets/custom_divider.dart';
import 'package:tager/feature/auth_feature/presentaion/views/widgets/have_or_create_new_account.dart';

class SignInViewBody extends StatefulWidget {
  const SignInViewBody({super.key, required this.isLoading});
  final bool isLoading;

  @override
  State<SignInViewBody> createState() => _SignInViewBodyState();
}

class _SignInViewBodyState extends State<SignInViewBody> {
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? email, password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BuildAppBar(title: 'تسجيل دخول'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kHoriztailPadding),
          child: Form(
            key: formKey,
            autovalidateMode: autovalidateMode,

            child: Column(
              children: [
                SizedBox(height: 12),

                CustomTextFormFeild(
                  onSaved: (value) {
                    email = value;
                  },
                  hint: 'البريد الإلكتروني',
                  textInputType: TextInputType.emailAddress,
                ),
                SizedBox(height: 16),
                CustomTextFormFieldForPasswoed(
                  onSaved: (value) {
                    password = value;
                  },
                ),
                SizedBox(height: 15),
                Align(
                  alignment: Alignment.centerLeft,
                  child: CustomTextBottom(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        ForgetPassWordView.routeName,
                      );
                    },
                    text: 'نسيت كلمة المرور؟',
                    textColor: AppColor.kPrimaryColorLight,
                  ),
                ),
                SizedBox(height: 32),
                CustomTextBottomWithBackground(
                  text: 'تسجيل دخول',
                  isLoading: widget.isLoading,
                  ontap: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      context.read<SignInCubit>().signinWithEmailAndPassword(
                        email: email!,
                        password: password!,
                      );
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  },
                ),
                SizedBox(height: 32),
                CustomHaveOrCreateNewAcountTextWidget(
                  fristText: 'لا تمتلك حساب ؟ ',
                  secondText: 'قم أنشاء حساب',
                  onTap: () {
                    Navigator.pushNamed(context, SignUPView.routeName);
                  },
                ),
                SizedBox(height: 32),
                CustomDivider(),
                SizedBox(height: 32),
                CustomBottom(
                  text: 'تسجيل بواسطة جوجل',
                  icon: SvgPicture.asset(Assets.assetsImageSocialIconsGoogle),
                  onTap: () {
                    context.read<SignInCubit>().signinWithGoogle();
                  },
                ),
                SizedBox(height: 16),

                // CustomBottom(
                //   text: 'تسجيل بواسطة أبل',
                //   icon: SvgPicture.asset(Assets.assetsImagesApple),
                // ),
                // SizedBox(height: 16),
                CustomBottom(
                  onTap: () {
                    context.read<SignInCubit>().signInWithFacebook();
                  },
                  text: 'تسجيل بواسطة فيسبوك',
                  icon: SvgPicture.asset(Assets.assetsImageFacebook),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
