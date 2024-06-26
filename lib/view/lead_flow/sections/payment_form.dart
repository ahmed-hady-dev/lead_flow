import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lead_flow/core/helpers/extensions.dart';
import 'package:lead_flow/view/lead_flow/controller/lead_flow_cubit.dart';
import 'package:lead_flow/view/lead_flow/sections/cridet_card_container.dart';

import '../../../components/custom_text_field.dart';
import '../component/expiration_date_field.dart';

class PaymentForm extends StatelessWidget {
  const PaymentForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = LeadFlowCubit.get(context);

    return Form(
      key: cubit.paymentFormKey,
      child: Column(
        children: <Widget>[
          const CridetCardContainer(),
          Gap(height * 0.01),
          CustomTextField(
            controller: cubit.creditCardNumberController,
            hint: 'رقم البطاقة',
            type: TextInputType.number,
            onFieldSubmitted: (_) => cubit.expirationDateNode.requestFocus(),
            prefix: const Icon(Icons.lock_outline_rounded, color: Colors.grey),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'هذا الحقل مطلوب';
              }

              return null;
            },
          ),
          Gap(height * 0.01),
          ExpirationDateField(
            controller: cubit.expirationDateController,
            focusNode: cubit.expirationDateNode,
            onFieldSubmitted: (_) => cubit.creditCardFocusNode.requestFocus(),
          ),
          Gap(height * 0.01),
          CustomTextField(
            controller: cubit.creditCardNumberController,
            focusNode: cubit.creditCardFocusNode,
            prefix: const Icon(Icons.help_outline_rounded, color: Colors.grey),
            type: TextInputType.number,
            onFieldSubmitted: (_) => cubit.nameOnCardNode.requestFocus(),
            hint: 'رمز الحماية',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'هذا الحقل مطلوب';
              }

              return null;
            },
          ),
          Gap(height * 0.01),
          CustomTextField(
            controller: cubit.nameOnCardController,
            focusNode: cubit.nameOnCardNode,
            type: TextInputType.name,
            hint: 'الإسم على البطاقة',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'هذا الحقل مطلوب';
              }

              return null;
            },
          ),
        ],
      ),
    );
  }
}
