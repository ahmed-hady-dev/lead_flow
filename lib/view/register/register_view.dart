import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:lead_flow/core/helpers/extensions.dart';
import 'package:lead_flow/core/router/router.dart';
import 'package:lead_flow/view/lead_flow/lead_flow_view.dart';
import 'package:lead_flow/view/register/component/social_button.dart';

import '../../components/custom_button.dart';
import '../../core/helpers/utils.dart';
import '../lead_flow/controller/lead_flow_cubit.dart';
import 'component/login_row.dart';
import 'component/register_form.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<LeadFlowCubit, LeadFlowState>(
        builder: (context, state) {
          final cubit = LeadFlowCubit.get(context);
          return ListView(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.06),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gap(height * 0.05),
                    Text(
                      'تسجيل جديد',
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(fontWeight: FontWeight.bold),
                    ),
                    Gap(height * 0.02),
                    const RegisterForm(),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: height * 0.025),
                      child: CustomButton(
                          text: 'تسجيل جديد',
                          onPressed: () {
                            if (cubit.registerFormKey.currentState!.validate()) {
                              if (cubit.passwordController.text != cubit.confirmPasswordController.text) {
                                showErrorSnackBar(context, 'كلمة المرور غير متطابقة');
                                return;
                              }
                              GlobalRouter.navigateTo(BlocProvider.value(
                                value: cubit,
                                child: const LeadFlowView(),
                              ));
                            }
                          }),
                    ),
                    Row(
                      children: [
                        const Expanded(child: Divider(color: Colors.grey, thickness: 1)),
                        Gap(width * 0.02),
                        Text('أو تسجيل الدخول باستخدام',
                            style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.grey)),
                        Gap(width * 0.02),
                        const Expanded(child: Divider(color: Colors.grey, thickness: 1)),
                      ],
                    ),
                    SocialButton(
                      onPressed: () {},
                      label: 'Google',
                      topPadding: height * 0.02,
                      image: 'assets/images/google_icon.png',
                    ),
                    SocialButton(
                      onPressed: () {},
                      label: 'Apple',
                      iconSize: 28,
                      topPadding: height * 0.01,
                      image: 'assets/images/apple_icon.png',
                    ),
                    Gap(height * 0.03),
                    const LoginRow(),
                    Gap(height * 0.02),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
