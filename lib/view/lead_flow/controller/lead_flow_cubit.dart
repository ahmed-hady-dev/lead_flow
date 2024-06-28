import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lead_flow/core/helpers/dio_helper.dart';
import 'package:lead_flow/view/lead_flow/model/day_model.dart';
import 'package:lead_flow/view/lead_flow/model/form_model.dart';
import 'package:lead_flow/view/lead_flow/model/period_model.dart';
import 'package:lead_flow/view/lead_flow/model/purpose_model.dart';
import 'package:meta/meta.dart';

import '../../../core/helpers/utils.dart';
import '../model/additional_info_model.dart';
import '../model/class_model.dart';
import '../model/material_model.dart';
import '../model/payment_model.dart';
import '../model/required_courses_model.dart';
import '../model/specification_model.dart';
import '../model/subscription_model.dart';
import '../model/ui_models.dart';
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
  int? formId;
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

//==== role screen ====
  bool? isChosen;
  bool? isStudent;
  void changeChosen() {
    isChosen = isChosen == null ? true : null;
    emit(RoleChangedState());
  }

  void changeRole({required bool isStudent}) {
    isChosen = true;
    this.isStudent = isStudent;
    emit(RoleChangedState());
  }

//==== lead flow screen ====
  int completeFlowIndex = 0;
  late double progress = 1 / screens.length;
  late PageController pageController = PageController();
  void updateFlowIndex(int index) => completeFlowIndex = index;
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

  void resetProgress() {
    completeFlowIndex = 0;
    progress = 1 / screens.length;
    emit(ChangeProgressState());
  }

  void emitState({required LeadFlowState state}) {
    emit(state);
  }

//==== register screen ====
  GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  late TextEditingController firstNameController = TextEditingController();
  late TextEditingController lastNameController = TextEditingController();
  late TextEditingController phoneController = TextEditingController();
  late TextEditingController emailController = TextEditingController();
  late TextEditingController passwordController = TextEditingController();
  late TextEditingController confirmPasswordController = TextEditingController();
  FocusNode firstNameNode = FocusNode();
  FocusNode lastNameNode = FocusNode();
  FocusNode phoneNode = FocusNode();
  FocusNode emailNode = FocusNode();
  FocusNode passwordNode = FocusNode();
  FocusNode confirmPasswordNode = FocusNode();
  FormModel? formModel;
  Future<void> postUserForm() async {
    emit(PostUserFormLoading());
    try {
      final response = await DioHelper.postData(
        url: 'form/',
        data: {
          "first_name": firstNameController.value.text.trim(),
          "family_name": lastNameController.value.text.trim(),
          "age": calculateAge(pickedBirthDate),
          "gender": gender ?? '',
          "nationality": nationality ?? '',
          "whatsapp": phoneController.value.text.trim(),
          "email": emailController.value.text.trim(),
          "difficulties": difficulties ?? 'No',
          "description": descriptionController.value.text.trim(),
          // "subject": "math",
          // "user_ip": ip,
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        formModel = FormModel.fromJson(response.data);
        formId = formModel!.id;
        emit(PostUserFormSuccess());
      } else {
        emit(PostUserFormFailed());
      }
    } on DioException catch (e) {
      debugPrint(e.error.toString());
      emit(PostUserFormFailed());
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrint(s.toString());
      emit(PostUserFormFailed());
    }
  }

  //==== PersonalInfoSection ====
  DateTime? pickedBirthDate;
  String? gender;
  String? nationality;
  String? difficulties;
  late TextEditingController birthDateController = TextEditingController();
  late TextEditingController descriptionController = TextEditingController();
  GlobalKey<FormState> personalInfoFormKey = GlobalKey<FormState>();

  //==== EducationalStageSection ====
  SpecificationModel? specificationModel;
  Future<void> postSpecification() async {
    emit(PostSpecificationLoading());
    try {
      List<String> stages = [];
      List<String> classes = [];
      List<String> courseStudies = [];
      for (var selectedStage in selectedStagesList) {
        var stage = stagesList.firstWhere((element) => element.name == selectedStage).id;
        stages.add(stage);
      }
      for (var selectedClass in selectedClassRoomsList) {
        var classRoom = classRoomsList.firstWhere((element) => element.name == selectedClass).id;
        classes.add(classRoom);
      }
      for (var e in selectedCourseStudyList) {
        var x = courseStudyList.firstWhere((element) => element.name == e).id;
        courseStudies.add(x);
      }

      final response = await DioHelper.postData(
        url: 'specify/',
        data: {
          "form": formId,
          "stage": stages,
          "classroom": classes,
          "course_study": courseStudies,
        },
      );
      specificationModel = SpecificationModel.fromJson(response.data);
      if (specificationModel!.form.runtimeType != int) {
        throw Exception(specificationModel!.form.toString());
      }
      emit(PostSpecificationSuccess());
    } on DioException catch (e) {
      debugPrint(e.error.toString());
      emit(PostSpecificationFailed());
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrint(s.toString());
      emit(PostSpecificationFailed());
    }
  }

  //==== SubjectsSection ====
  List<MaterialModel>? materialsList;
  RequiredCoursesModel? requiredCoursesModel;
  Future<void> getAllMaterials() async {
    materialsList = null;
    emit(GetAllMaterialsLoading());
    try {
      final response = await DioHelper.getData(url: 'material/');
      materialsList = (response.data as List).map((e) => MaterialModel.fromJson(e)).toList();
      emit(GetAllMaterialsSuccess());
    } on DioException catch (e) {
      debugPrint(e.error.toString());
      emit(GetAllMaterialsFailed());
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrint(s.toString());
      emit(GetAllMaterialsFailed());
    }
  }

  Future<void> postRequiredCourses() async {
    requiredCoursesModel = null;
    emit(PostRequiredCoursesLoading());
    try {
      List<int> materials = [];
      for (var selectedStage in selectedMaterialsList) {
        var material = materialsList!.firstWhere((element) => element.id == selectedStage.id).id;
        materials.add(material!);
      }
      final response = await DioHelper.postData(
        url: 'course/',
        data: {
          "form": formId,
          "materials": materials,
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        requiredCoursesModel = RequiredCoursesModel.fromJson(response.data);
        if (requiredCoursesModel!.form.runtimeType != int) {
          throw Exception(requiredCoursesModel!.form.toString());
        }
        emit(PostRequiredCoursesSuccess());
      } else {
        emit(PostRequiredCoursesFailed());
      }
    } on DioException catch (e) {
      debugPrint(e.error.toString());
      emit(PostRequiredCoursesFailed());
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrint(s.toString());
      emit(PostRequiredCoursesFailed());
    }
  }

  //==== SubscribedStudentsSection ====
  List<PurposeModel>? purposesList;
  List<String>? chipPurposesList;
  AdditionalInfoModel? additionalInfoModel;
  Future<void> getAllPurpose() async {
    purposesList = null;
    emit(GetAllPurposeLoading());
    try {
      final response = await DioHelper.getData(url: 'purpose/');
      purposesList = (response.data as List).map((e) => PurposeModel.fromJson(e)).toList();
      if (response.statusCode == 200 || response.statusCode == 201) {
        chipPurposesList = purposesList!.map((e) => e.arabicData!).toList();
        emit(GetAllPurposeSuccess());
      } else {
        emit(GetAllPurposeFailed());
      }
    } on DioException catch (e) {
      debugPrint(e.error.toString());
      emit(GetAllPurposeFailed());
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrint(s.toString());
      emit(GetAllPurposeFailed());
    }
  }

  Future<void> postAdditionalInfo() async {
    additionalInfoModel = null;
    emit(PostAdditionalInfoLoading());
    try {
      List<int> studentCount = [];
      List<int> purposes = [];
      switch (selectedStudentCountList) {
        case ['طالب واحد']:
          studentCount = [1];
          break;
        case ['طالبين']:
          studentCount = [2];
          break;
        case ['ثلاث طلاب']:
          studentCount = [3];
          break;
        case ['أكثر من ذلك']:
          studentCount = [4];
          break;
        default:
          studentCount = [1];
      }

      for (var selectedPurpose in selectedPurposesList) {
        var purpose = purposesList!.firstWhere((element) => element.arabicData == selectedPurpose).id;
        purposes.add(purpose!);
      }

      final response = await DioHelper.postData(
        url: 'count/',
        data: {
          "form": formId,
          "student_count": studentCount.first,
          "purposes": purposes,
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        additionalInfoModel = AdditionalInfoModel.fromJson(response.data);
        if (additionalInfoModel!.form.runtimeType != int) {
          throw Exception(additionalInfoModel!.form.toString());
        }
        emit(PostAdditionalInfoSuccess());
      } else {
        emit(PostAdditionalInfoFailed());
      }
    } on DioException catch (e) {
      debugPrint(e.error.toString());
      emit(PostAdditionalInfoFailed());
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrint(s.toString());
      emit(PostAdditionalInfoFailed());
    }
  }
  //==== AppointmentsSection ====

  List<DayModel>? daysList;
  List<String>? chipDaysList;
  PeriodModel? periodModel;

  Future<void> getAllDays() async {
    daysList = null;
    emit(GetAllDaysLoading());
    try {
      final response = await DioHelper.getData(url: 'day/');
      daysList = (response.data as List).map((e) => DayModel.fromJson(e)).toList();
      if (response.statusCode == 200 || response.statusCode == 201) {
        chipDaysList = daysList!.map((e) => e.arabicData!).toList();
        emit(GetAllDaysSuccess());
      } else {
        emit(GetAllDaysFailed());
      }
    } on DioException catch (e) {
      debugPrint(e.error.toString());
      emit(GetAllDaysFailed());
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrint(s.toString());
      emit(GetAllDaysFailed());
    }
  }

  Future<void> postTimePeriod() async {
    periodModel = null;
    emit(PostTimePeriodLoading());
    try {
      List<String> shift = [];
      List<int> days = [];
      switch (selectedTimePeriodList) {
        case ['الفترة الصباحية']:
          shift = ['day'];
          break;
        case ['الفترة المسائية']:
          shift = ['night'];
          break;
        default:
          shift = ['day'];
      }
      for (var selectedDay in selectedDaysList) {
        var day = daysList!.firstWhere((element) => element.arabicData == selectedDay).id;
        days.add(day!);
      }
      final response = await DioHelper.postData(
        url: 'period/',
        data: {
          "form": formId,
          "shift": shift.first,
          "time": selectedTimesList.first,
          "day": days,
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        periodModel = PeriodModel.fromJson(response.data);
        if (periodModel!.form.runtimeType != int) {
          throw Exception(periodModel!.form.toString());
        }
        emit(PostTimePeriodSuccess());
      } else {
        emit(PostTimePeriodFailed());
      }
    } on DioException catch (e) {
      debugPrint(e.error.toString());
      emit(PostTimePeriodFailed());
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrint(s.toString());
      emit(PostTimePeriodFailed());
    }
  }

  //==== PackageSection ====
  List<SubscriptionModel>? subscriptionsList;
  ClassModel? classModel;

  Future<void> getAllSubscription() async {
    subscriptionsList = null;
    emit(GetAllSubscriptionLoading());
    try {
      final response = await DioHelper.getData(url: 'subsription/');
      subscriptionsList = (response.data as List).map((e) => SubscriptionModel.fromJson(e)).toList();
      if (response.statusCode == 200 || response.statusCode == 201) {
        emit(GetAllSubscriptionSuccess());
      } else {
        emit(GetAllSubscriptionFailed());
      }
    } on DioException catch (e) {
      debugPrint(e.error.toString());
      emit(GetAllSubscriptionFailed());
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrint(s.toString());
      emit(GetAllSubscriptionFailed());
    }
  }

  Future<void> postClassAndSubscription() async {
    classModel = null;
    emit(PostClassAndSubscriptionLoading());
    try {
      List<String> sessions = [];
      List<String> hours = [];
      switch (selectedSessionsList) {
        case ['حصة واحدة']:
          sessions = ['one'];
          break;
        case ['حصتين']:
          sessions = ['two'];
          break;
        default:
          sessions = ['one'];
      }

      switch (selectedHoursPerSessionList) {
        case ['30 دقيقة']:
          hours = ['00:30'];
          break;
        case ['ساعة واحدة']:
          hours = ['01:00'];
          break;
        case ['ساعة و نصف']:
          hours = ['01:30'];
          break;
        case ['ساعتين']:
          hours = ['02:00'];
          break;
        case ['ساعتين و نصف']:
          hours = ['02:30'];
          break;
        default:
          hours = ['00:30'];
      }

      final response = await DioHelper.postData(
        url: 'class/',
        data: {
          "form": formId,
          "session": sessions.first,
          "hour": hours.first,
          "subscription": selectedPackagesList.first.id,
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        classModel = ClassModel.fromJson(response.data);
        if (classModel!.form.runtimeType != int) {
          throw Exception(classModel!.form.toString());
        }
        emit(PostClassAndSubscriptionSuccess());
      } else {
        emit(PostClassAndSubscriptionFailed());
      }
    } on DioException catch (e) {
      debugPrint(e.error.toString());
      emit(PostClassAndSubscriptionFailed());
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrint(s.toString());
      emit(PostClassAndSubscriptionFailed());
    }
  }

  //==== PaymentSection ====
  bool isTermsChecked = false;
  GlobalKey<FormState> paymentFormKey = GlobalKey<FormState>();
  late TextEditingController creditCardNumberController = TextEditingController();
  late TextEditingController expirationDateController = TextEditingController();
  late TextEditingController cvvNumberController = TextEditingController();
  late TextEditingController nameOnCardController = TextEditingController();
  FocusNode creditCardNode = FocusNode();
  FocusNode expirationDateNode = FocusNode();
  FocusNode cvvNumberNode = FocusNode();
  FocusNode nameOnCardNode = FocusNode();
  PaymentModel? paymentModel;

  void checkTerms({required bool value}) {
    isTermsChecked = value;
    emit(CheckTermsState());
  }

  Future<void> postPayment() async {
    paymentModel = null;
    emit(PostPaymentLoading());
    try {
      final response = await DioHelper.postData(
        url: 'pay/',
        data: {
          "form": formId,
          "card_number": creditCardNumberController.value.text.trim(),
          "cvc": cvvNumberController.value.text.trim(),
          "exp_date": expirationDateController.value.text.trim(),
          "card_holder": nameOnCardController.value.text.trim(),
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        paymentModel = PaymentModel.fromJson(response.data);
        if (response.data == ["message': 'Class not found"]) {
          throw Exception(response.data[0].toString());
        }
        emit(PostPaymentSuccess());
      } else {
        emit(PostPaymentFailed());
      }
    } on DioException catch (e) {
      debugPrint(e.error.toString());
      emit(PostPaymentFailed());
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrint(s.toString());
      emit(PostPaymentFailed());
    }
  }

  dispose() {
    birthDateController.dispose();
    descriptionController.dispose();
    creditCardNumberController.dispose();
    expirationDateController.dispose();
    cvvNumberController.dispose();
    nameOnCardController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    firstNameNode.dispose();
    lastNameNode.dispose();
    phoneNode.dispose();
    emailNode.dispose();
    passwordNode.dispose();
    confirmPasswordNode.dispose();
    creditCardNode.dispose();
    expirationDateNode.dispose();
    cvvNumberNode.dispose();
    nameOnCardNode.dispose();
    pageController.dispose();
  }
}
