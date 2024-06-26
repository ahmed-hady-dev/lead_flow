import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:lead_flow/components/custom_button.dart';
import 'package:lead_flow/core/helpers/extensions.dart';
import 'package:lead_flow/core/router/router.dart';
import 'package:lead_flow/view/Register/controller/auth_cubit.dart';
import 'package:lead_flow/view/register/component/login_row.dart';

import '../../components/widget_with_vertical_divider.dart';
import '../../core/snack_bar.dart';
import 'component/choose_role_row.dart';
import 'register_view.dart';

class ChooseRoleView extends StatelessWidget {
  const ChooseRoleView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.06),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: height * 0.05),
                  child: Text(
                    'تسجيل جديد',
                    style: Theme.of(context).textTheme.displaySmall!.copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                Gap(height * 0.02),
                const WidgetWithVerticalDivider(
                    text:
                        'هل انت طالب تسعى لتوسيع افاقك و فتح أبواب المعرفه؟ أم ولي أمر تود متابعة رحلة ابنك التعليمية و دعمه في اكتشاف شغفه'),
                Gap(height * 0.015),
                const ChooseRoleRow(),
                Gap(height * 0.015),
                BlocBuilder<AuthCubit, AuthState>(
                  builder: (context, state) {
                    final cubit = AuthCubit.get(context);
                    return CustomButton(
                      text: 'التالي',
                      onPressed: () {
                        if (AuthCubit.get(context).isChosen == null) {
                          showErrorSnackBar(context, 'يجب تحديد نوع المستخدم');
                        } else {
                          GlobalRouter.navigateTo(BlocProvider.value(value: cubit, child: const RegisterView()));
                        }
                      },
                    );
                  },
                ),
                const Spacer(),
                const LoginRow(),
                Gap(height * 0.02),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
