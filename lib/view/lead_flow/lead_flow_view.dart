import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:lead_flow/core/helpers/extensions.dart';
import 'package:lead_flow/core/snack_bar.dart';
import 'package:lead_flow/view/lead_flow/controller/lead_flow_cubit.dart';
import 'component/control_buttons_row.dart';
import 'component/progress_bar.dart';

class LeadFlowView extends StatelessWidget {
  const LeadFlowView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<LeadFlowCubit, LeadFlowState>(
          listener: (context, state) {
            if (state is PostUserFormFailed || state is PostSpecificationFailed) {
              showErrorSnackBar(context, 'حدث خطأ ما, يرجى المحلاولة مجدداً');
            }
          },
          builder: (context, state) {
            final cubit = LeadFlowCubit.get(context);
            return Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.only(
                      start: width * 0.06, top: height * 0.02, bottom: height * 0.02, end: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Image.asset('assets/images/logo.png', width: width * 0.4),
                      TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(foregroundColor: Colors.black),
                          child: const Text('تخطي'))
                    ],
                  ),
                ),
                const ProgressBar(),
                Gap(height * 0.05),
                Expanded(
                  child: PageView.builder(
                    controller: cubit.pageController,
                    physics: const NeverScrollableScrollPhysics(),
                    onPageChanged: (index) => cubit.updateFlowIndex(index),
                    itemCount: cubit.screens.length,
                    itemBuilder: (context, index) {
                      return cubit.screens[index];
                    },
                  ),
                ),
                const ControlButtonsRow(),
              ],
            );
          },
        ),
      ),
    );
  }
}
