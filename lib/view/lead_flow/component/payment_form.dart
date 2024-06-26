import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:lead_flow/core/helpers/extensions.dart';
import 'package:lead_flow/view/lead_flow/controller/lead_flow_cubit.dart';
import 'package:lead_flow/view/lead_flow/component/cridet_card_container.dart';

import '../../../components/custom_text_field.dart';
import 'expiration_date_field.dart';

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
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(16),
            ],
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'هذا الحقل مطلوب';
              }
              if (value.length != 16) {
                return 'يجب عليك ادخال رقم بطاقة بطاقة صحيحة';
              }

              return null;
            },
          ),
          Gap(height * 0.01),
          ExpirationDateField(
            controller: cubit.expirationDateController,
            focusNode: cubit.expirationDateNode,
            onFieldSubmitted: (_) => cubit.cvvNumberNode.requestFocus(),
          ),
          Gap(height * 0.01),
          CustomTextField(
            controller: cubit.cvvNumberController,
            focusNode: cubit.cvvNumberNode,
            prefix: const Icon(Icons.help_outline_rounded, color: Colors.grey),
            type: TextInputType.number,
            onFieldSubmitted: (_) => cubit.nameOnCardNode.requestFocus(),
            hint: 'رمز الحماية',
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(3),
            ],
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
