import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tager/core/consts/consts.dart';
import 'package:tager/core/helpers/show_snack_bar.dart';
import 'package:tager/core/widgets/custom_app_bar.dart';
import 'package:tager/core/widgets/custom_text_bottom_with_background.dart';
import 'package:tager/core/widgets/custom_text_form__feild_for_password.dart';
import 'package:tager/core/widgets/custom_text_form_feild.dart';
import 'package:tager/feature/auth_feature/presentaion/manager/auth_cubit/sign_up/sign_up_cubit.dart';
import 'package:tager/feature/auth_feature/presentaion/views/widgets/condition_widget.dart';
import 'package:tager/feature/auth_feature/presentaion/views/widgets/have_or_create_new_account.dart';

class SignUPViewBody extends StatefulWidget {
  const SignUPViewBody({super.key, required this.isLoadingState});
  final bool isLoadingState;

  @override
  State<SignUPViewBody> createState() => _SignUPViewBodyState();
}

class _SignUPViewBodyState extends State<SignUPViewBody> {
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? name, email, password;
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BuildAppBar(title: 'تسجيل دخول', wantedIconBack: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: kHoriztailPadding),
          child: Form(
            autovalidateMode: autovalidateMode,
            key: formKey,
            child: Column(
              children: [
                SizedBox(height: 12),

                CustomTextFormFeild(
                  onSaved: (value) {
                    name = value;
                  },
                  hint: 'الاسم كامل',
                  textInputType: TextInputType.name,
                ),
                SizedBox(height: 16),
                CustomTextFormFeild(
                  onSaved: (value) {
                    email = value;
                  },
                  hint: 'البريد الإلكتروني',
                  textInputType: TextInputType.emailAddress,
                ),
                // SizedBox(height: 16),
                // CustomTextFormFeild(

                //   hint: 'ؤقم الهاتف',
                //   textInputType: TextInputType.phone,
                // ),
                SizedBox(height: 16),
                CustomTextFormFieldForPasswoed(
                  onSaved: (value) {
                    password = value;
                  },
                ),

                SizedBox(height: 16),
                CondtionWidget(
                  onChanged: (value) {
                    isChecked = value;
                    setState(() {});
                  },
                ),
                SizedBox(height: 16),
                CustomTextBottomWithBackground(
                  isLoading: widget.isLoadingState,
                  text: 'إنشاء حساب جديد',
                  ontap: () async {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();

                      if (isChecked) {
                        context
                            .read<CreateUserWithEmailAndPasswordCubit>()
                            .createUserWithEmailAndPassword(
                              email: email!,
                              password: password!,
                              name: name!,
                            );
                      } else {
                        showSnackBarMessage(
                          context,
                          'يجب الموافقة على الشروط والأحكام لإنشاء حساب جديد',
                        );
                      }
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  },
                ),
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
      ),
    );
  }
}
