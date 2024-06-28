import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:lead_flow/components/custom_button.dart';
import 'package:lead_flow/core/helpers/extensions.dart';
import 'package:lead_flow/core/router/router.dart';
import 'package:lead_flow/core/snack_bar.dart';
import 'package:lead_flow/view/lead_flow/controller/lead_flow_cubit.dart';

import '../../../constants/app_colors.dart';
import '../../home/home_view.dart';
import '../model/ui_models.dart';

class ControlButtonsRow extends StatelessWidget {
  const ControlButtonsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LeadFlowCubit, LeadFlowState>(
      builder: (context, state) {
        final cubit = LeadFlowCubit.get(context);
        final isEndReached = LeadFlowCubit.get(context).completeFlowIndex == 7;
        final index = LeadFlowCubit.get(context).completeFlowIndex;
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.06, vertical: height * 0.02),
          child: isEndReached
              ? CustomButton(
                  text: 'توجه إلى جدولك الدراسي',
                  radius: 8,
                  onPressed: () {
                    GlobalRouter.navigateAndPopAll(const HomeView());
                  },
                )
              : Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () => cubit.decreaseProgress(),
                        icon: const Icon(Icons.keyboard_double_arrow_right, color: AppColors.primaryGreen),
                        label: const Text('السابق', style: TextStyle(color: AppColors.primaryGreen)),
                        style: ElevatedButton.styleFrom(
                          foregroundColor: AppColors.primaryGreen,
                          backgroundColor: Colors.white,
                          side: const BorderSide(color: AppColors.primaryGreen),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                      ),
                    ),
                    Gap(width * 0.03),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () async {
                          ScaffoldMessenger.of(context).hideCurrentSnackBar();
                          print('formId =>> ${cubit.formId}');
                          switch (index) {
                            case 0:
                              if (cubit.personalInfoFormKey.currentState!.validate()) {
                                await cubit.postUserForm();
                                cubit.increaseProgress();
                              }
                            case 1:
                              if (selectedStagesList.isEmpty) {
                                showErrorSnackBar(context, 'الرجاء اختيار المرحلة الدراسية');
                              } else if (selectedClassRoomsList.isEmpty) {
                                showErrorSnackBar(context, 'الرجاء اختيار الصف الدراسي');
                              } else if (selectedCourseStudyList.isEmpty) {
                                showErrorSnackBar(context, 'الرجاء اختيار المنهج الدراسي');
                              } else {
                                await cubit.postSpecification();
                              }
                            case 2:
                              if (selectedMaterialsList.isEmpty) {
                                showErrorSnackBar(context, 'الرجاء اختيار المواد التي ترغب في دراستها');
                              } else {
                                cubit.postRequiredCourses();
                              }
                            case 3:
                              if (selectedStudentCountList.isEmpty) {
                                showErrorSnackBar(context, 'الرجاء اختيار عدد الطلاب المشتركين');
                              } else if (selectedPurposesList.isEmpty) {
                                showErrorSnackBar(context, 'الرجاء اختيار أهدافك الدراسية');
                              } else {
                                cubit.postAdditionalInfo();
                              }
                            case 4:
                              if (selectedDaysList.isEmpty) {
                                showErrorSnackBar(context, 'الرجاء اختيار الأيام المناسبة لك');
                              } else if (selectedTimePeriodList.isEmpty) {
                                showErrorSnackBar(context, 'الرجاء اختيار الفترة الزمنية المناسبة لك');
                              } else if (selectedTimesList.isEmpty) {
                                showErrorSnackBar(context, 'الرجاء اختيار التوقيت المناسب لك');
                              } else {
                                cubit.postTimePeriod();
                              }
                            case 5:
                              if (selectedSessionsList.isEmpty) {
                                showErrorSnackBar(context, 'الرجاء اختيار عدد الحصص إسبوعياً');
                              } else if (selectedHoursPerSessionList.isEmpty) {
                                showErrorSnackBar(context, 'الرجاء اختيار عدد ساعات الحصة الواحدة');
                              } else if (selectedPackagesList.isEmpty) {
                                showErrorSnackBar(context, 'الرجاء اختيار مدة الإ شتراك');
                              } else {
                                cubit.postClassAndSubscription();
                              }
                            case 6:
                              if (cubit.paymentFormKey.currentState!.validate()) {
                                if (!cubit.isTermsChecked) {
                                  showErrorSnackBar(context, 'يجب الموافقه على الشروط والأحكام');
                                } else {
                                  cubit.postPayment();
                                }
                              }
                              break;
                            default:
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: AppColors.primaryGreen,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        ),
                        child: state is PostUserFormLoading ||
                                state is PostSpecificationLoading ||
                                state is PostRequiredCoursesLoading ||
                                state is PostAdditionalInfoLoading ||
                                state is PostTimePeriodLoading ||
                                state is PostClassAndSubscriptionLoading ||
                                state is PostPaymentLoading
                            ? const SizedBox(
                                height: 24,
                                width: 24,
                                child: CircularProgressIndicator.adaptive(
                                  strokeWidth: 2,
                                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                                ))
                            : const Row(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text('التالي'),
                                  Gap(8),
                                  Icon(Icons.keyboard_double_arrow_left),
                                ],
                              ),
                      ),
                    ),
                  ],
                ),
        );
      },
    );
  }
}
