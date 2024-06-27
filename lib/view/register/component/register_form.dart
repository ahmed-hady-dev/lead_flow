import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:lead_flow/components/custom_text_field.dart';
import 'package:lead_flow/core/helpers/extensions.dart';
import '../../lead_flow/controller/lead_flow_cubit.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LeadFlowCubit, LeadFlowState>(
      builder: (context, state) {
        final cubit = LeadFlowCubit.get(context);
        return Form(
          key: cubit.registerFormKey,
          child: Column(
            children: <Widget>[
              CustomTextField(
                controller: cubit.firstNameController,
                focusNode: cubit.firstNameNode,
                hint: 'الإسم الأول',
                type: TextInputType.name,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'هذا الحقل مطلوب';
                  }

                  return null;
                },
                onFieldSubmitted: (_) => cubit.lastNameNode.requestFocus(),
              ),
              Gap(height * 0.01),
              CustomTextField(
                controller: cubit.lastNameController,
                focusNode: cubit.lastNameNode,
                hint: 'إسم العائله',
                type: TextInputType.name,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'هذا الحقل مطلوب';
                  }
                  return null;
                },
                onFieldSubmitted: (_) => cubit.phoneNode.requestFocus(),
              ),
              Gap(height * 0.01),
              CustomTextField(
                controller: cubit.phoneController,
                focusNode: cubit.phoneNode,
                hint: 'رقم الموبايل',
                type: TextInputType.phone,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(11),
                ],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'هذا الحقل مطلوب';
                  }
                  if (value.length < 11) {
                    return 'الرجاء إدخال رقم صحيح';
                  }
                  return null;
                },
                onFieldSubmitted: (_) => cubit.emailNode.requestFocus(),
              ),
              Gap(height * 0.01),
              CustomTextField(
                controller: cubit.emailController,
                focusNode: cubit.emailNode,
                hint: 'البريد الالكتروني',
                type: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'هذا الحقل مطلوب';
                  }
                  final regex = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');
                  if (!regex.hasMatch(value)) {
                    return 'الرجاء إدخال بريد إلكتروني صحيح';
                  }
                  return null;
                },
                onFieldSubmitted: (_) => cubit.passwordNode.requestFocus(),
              ),
              Gap(height * 0.01),
              CustomTextField(
                controller: cubit.passwordController,
                focusNode: cubit.passwordNode,
                hint: 'كلمة المرور',
                type: TextInputType.visiblePassword,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'هذا الحقل مطلوب';
                  } else if (value.length < 6) {
                    return 'كلمة المرور يجب أن تكون على الأقل 6 حروف';
                  }

                  return null;
                },
                onFieldSubmitted: (_) => cubit.confirmPasswordNode.requestFocus(),
              ),
              Gap(height * 0.01),
              CustomTextField(
                controller: cubit.confirmPasswordController,
                focusNode: cubit.confirmPasswordNode,
                hint: 'تأكيد كلمة المرور',
                type: TextInputType.visiblePassword,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'هذا الحقل مطلوب';
                  } else if (value.length < 6) {
                    return 'كلمة المرور يجب أن تكون على الأقل 6 حروف';
                  }

                  return null;
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
