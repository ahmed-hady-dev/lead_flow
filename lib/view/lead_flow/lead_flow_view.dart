import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:lead_flow/core/helpers/extensions.dart';
import 'package:lead_flow/core/router/router.dart';
import 'package:lead_flow/view/lead_flow/controller/lead_flow_cubit.dart';
import '../../core/helpers/utils.dart';
import '../home/home_view.dart';
import 'component/control_buttons_row.dart';
import 'component/progress_bar.dart';

class LeadFlowView extends StatelessWidget {
  const LeadFlowView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<LeadFlowCubit, LeadFlowState>(
          listener: (context, state) async {
            final cubit = LeadFlowCubit.get(context);
            if (state is PostUserFormFailed ||
                state is PostSpecificationFailed ||
                state is PostRequiredCoursesFailed ||
                state is GetAllPurposeFailed ||
                state is PostAdditionalInfoFailed ||
                state is GetAllDaysFailed ||
                state is PostTimePeriodFailed ||
                state is PostClassAndSubscriptionFailed ||
                state is PostPaymentFailed) {
              showErrorSnackBar(context, 'حدث خطأ ما, يرجى المحلاولة مجدداً');
            }
            if (state is PostUserFormSuccess) {
              cubit.increaseProgress();
            }
            if (state is PostSpecificationSuccess) {
              cubit.increaseProgress();
              await cubit.getAllMaterials();
            }
            if (state is PostRequiredCoursesSuccess) {
              cubit.increaseProgress();
              await cubit.getAllPurpose();
            }
            if (state is PostAdditionalInfoSuccess) {
              cubit.increaseProgress();
              await cubit.getAllDays();
            }
            if (state is PostTimePeriodSuccess) {
              cubit.increaseProgress();
              await cubit.getAllSubscription();
            }
            if (state is PostClassAndSubscriptionSuccess) {
              cubit.increaseProgress();
            }
            if (state is PostPaymentSuccess) {
              cubit.increaseProgress();
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
                          onPressed: () => GlobalRouter.navigateAndPopAll(const HomeView()),
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
