import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../model/grid_item.dart';
import '../model/package_model.dart';
import '../sections/appointments_section.dart';
import '../sections/educational_stage_section.dart';
import '../sections/package_section.dart';
import '../sections/payment_section.dart';
import '../sections/payment_success_section.dart';
import '../sections/personal_info_section.dart';
import '../sections/subjects_section.dart';
import '../sections/subscribed_students_section.dart';

part 'lead_flow_state.dart';

class LeadFlowCubit extends Cubit<LeadFlowState> {
  LeadFlowCubit() : super(LeadFlowInitial());
  static LeadFlowCubit get(context) => BlocProvider.of(context);

  late double progress = 1 / screens.length;
  String? academicStage;
  String? theClass;
  String? curriculum;
  String? gender;
  String? nationality;
  String? difficulties;
  List<String> academicStages = [];
  List<String> theClasses = [];
  List<String> curriculums = [];
  bool isTermsChecked = false;
  int completeFlowIndex = 0;
  DateTime pickedBirthDate = DateTime.now();
  TextEditingController birthDateController = TextEditingController();
  TextEditingController remarksController = TextEditingController();
  TextEditingController creditCardNumberController = TextEditingController();
  TextEditingController expirationDateController = TextEditingController();
  TextEditingController cvvNumberController = TextEditingController();
  TextEditingController nameOnCardController = TextEditingController();
  FocusNode creditCardFocusNode = FocusNode();
  FocusNode expirationDateNode = FocusNode();
  FocusNode cvvNumberNode = FocusNode();
  FocusNode nameOnCardNode = FocusNode();
  GlobalKey<FormState> personalInfoFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> paymentFormKey = GlobalKey<FormState>();
  PageController pageController = PageController();

  List<Widget> screens = [
    const PersonalInfoSection(),
    const EducationalStageSection(),
    const SubjectsSection(),
    const SubscribedStudentsSection(),
    const AppointmentsSection(),
    const PackageSection(),
    const PaymentSection(),
    const PaymentSuccessSection(),
  ];

  final List<String> educationalLevelList = [
    'رياض أطفال',
    'التعليم الإبتدائي',
    'التعليم المتوسط',
    'التعليم الثانوي',
  ];
  final List<String> classesList = [
    'الصف الخامس',
    'الصف السادس',
    'الصف السابع',
    'الصف الثامن',
  ];
  final List<String> curriculumsList = [
    'المنهج البريطاني',
    'المنهج الأمريكي',
    'المنهج الموازي',
    'أخرى',
  ];
  final List<String> selectedEducationalLevelList = [];
  final List<String> selectedClassesList = [];
  final List<String> selectedCurriculumsList = [];

  //==============================
  final List<GridItem> subjectsList = [
    GridItem(text: 'الرياضيات', image: 'assets/images/math_icon.png'),
    GridItem(text: 'اللغة العربية', image: 'assets/images/arabic_icon.png'),
    GridItem(text: 'اللغة الألمانية', image: 'assets/images/germany_icon.png'),
    GridItem(text: 'اللغة الإنجليزية', image: 'assets/images/english_icon.png'),
    GridItem(text: 'علوم الحاسوب', image: 'assets/images/cs_icon.png'),
    GridItem(text: 'الكيمياء', image: 'assets/images/chemistry_icon.png'),
    GridItem(text: 'الأحياء', image: 'assets/images/biology_icon.png'),
    GridItem(text: 'الفيزياء', image: 'assets/images/physics_icon.png'),
    GridItem(text: 'اللغة الفرنسية', image: 'assets/images/french_icon.png'),
  ];
  List<GridItem> selectedSubjectsList = [];
  //==============================
  List<String> participatingStudentsList = [
    'طابب واحد',
    'طالبين',
    'ثلاث طلاب',
    'أكثر من ذلك',
  ];
  List<String> targetsList = [
    'تحضير لإختبار',
    'حل واجبات',
    'زيادة درجاتي',
    'أخرى',
  ];
  List<String> selectedParticipatingStudentsList = [];
  List<String> selectedTargetsList = [];
  //==============================
  List<String> daysList = [
    'السبت',
    'الأحد',
    'الأثنين',
    'الأربعاء',
    'الخميس',
    'الجمعة',
  ];
  List<String> timePeriodList = [
    'الفترة الصباحية',
    'الفترة المسائية',
  ];
  List<String> timesList = [
    '10:00 م',
    '11:00 م',
    '12:00 ص',
    '1:00 ص',
    '2:00 م',
  ];
  List<String> selectedDaysList = [];
  List<String> selectedTimePeriodList = [];
  List<String> selectedTimesList = [];

  //==============================
  List<String> weeklyLessonsList = [
    'حصة واحدة',
    'حصتين',
  ];
  List<String> hoursPerClassList = [
    'ساعة و نصف',
    'ساعتين',
    '30 دقيقة',
    'ساعة واحدة',
    'ساعتين و نصف',
  ];
  List<PackageModel> packagesList = [
    PackageModel(
      name: 'ثلاثة فصول دراسية',
      duration: 'اثنا عشر شهراً',
      price: 800,
      discount: 15,
    ),
    PackageModel(
      name: 'فصليين دراسيين',
      duration: 'ستة أشهر',
      price: 650,
      discount: 10,
    ),
    PackageModel(
      name: 'فصل دراسي',
      duration: 'ثلاث أشهر',
      price: 450,
      discount: 10,
    ),
  ];
  List<String> selectedWeeklyLessonsList = [];
  List<String> selectedHoursPerClassList = [];
  List<PackageModel> selectedPackagesList = [];
  //==============================

  void updateFlowIndex(int index) {
    completeFlowIndex = index;
    emit(ChangeProgressState());
  }

  void increaseProgress() {
    if (completeFlowIndex < screens.length - 1) {
      completeFlowIndex++;
      pageController.animateToPage(
        completeFlowIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.decelerate,
      );
      progress = (completeFlowIndex + 1) / (screens.length);
    }
    emit(ChangeProgressState());
  }

  void decreaseProgress() {
    if (completeFlowIndex > 0) {
      completeFlowIndex--;
      pageController.animateToPage(
        completeFlowIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.decelerate,
      );
      if (completeFlowIndex != 0) {
        progress = (completeFlowIndex + 1) / (screens.length);
      } else {
        progress = 1 / screens.length;
      }
    }
    emit(ChangeProgressState());
  }

  void checkTerms({required bool value}) {
    isTermsChecked = value;
    emit(CheckTermsState());
  }

  void emitState({required LeadFlowState state}) {
    emit(state);
  }
}
