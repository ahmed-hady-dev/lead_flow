import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lead_flow/core/helpers/dio_helper.dart';
import 'package:lead_flow/view/lead_flow/model/form_model.dart';
import 'package:meta/meta.dart';

import '../model/material_model.dart';
import '../model/specification_model.dart';
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

  late double progress = 1 / screens.length;
  bool? isChosen;
  bool? isStudent;
  bool isTermsChecked = false;
  int completeFlowIndex = 0;
  String? academicStage;
  String? theClass;
  String? curriculum;
  String? gender;
  String? nationality;
  String? difficulties;
  List<String> academicStages = [];
  List<String> theClasses = [];
  List<String> curriculums = [];
  late DateTime pickedBirthDate = DateTime.now();
  late PageController pageController = PageController();
  GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> personalInfoFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> paymentFormKey = GlobalKey<FormState>();
  late TextEditingController firstNameController = TextEditingController();
  late TextEditingController lastNameController = TextEditingController();
  late TextEditingController phoneController = TextEditingController();
  late TextEditingController emailController = TextEditingController();
  late TextEditingController passwordController = TextEditingController();
  late TextEditingController confirmPasswordController = TextEditingController();
  late TextEditingController birthDateController = TextEditingController();
  late TextEditingController descriptionController = TextEditingController();
  late TextEditingController creditCardNumberController = TextEditingController();
  late TextEditingController expirationDateController = TextEditingController();
  late TextEditingController cvvNumberController = TextEditingController();
  late TextEditingController nameOnCardController = TextEditingController();

  FocusNode firstNameNode = FocusNode();
  FocusNode lastNameNode = FocusNode();
  FocusNode phoneNode = FocusNode();
  FocusNode emailNode = FocusNode();
  FocusNode passwordNode = FocusNode();
  FocusNode confirmPasswordNode = FocusNode();
  FocusNode creditCardNode = FocusNode();
  FocusNode expirationDateNode = FocusNode();
  FocusNode cvvNumberNode = FocusNode();
  FocusNode nameOnCardNode = FocusNode();
  FormModel? formModel;

  SpecificationModel? specificationModel;
  List<MaterialModel>? materialsList;
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

  void changeChosen() {
    isChosen = isChosen == null ? true : null;
    emit(RoleChangedState());
  }

  void changeRole({required bool isStudent}) {
    isChosen = true;
    this.isStudent = isStudent;
    emit(RoleChangedState());
  }

  int calculateAge(DateTime birthDate) {
    DateTime today = DateTime.now();
    int age = today.year - birthDate.year;
    if (today.month < birthDate.month || (today.month == birthDate.month && today.day < birthDate.day)) {
      age--;
    }
    return age;
  }

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

  void checkTerms({required bool value}) {
    isTermsChecked = value;
    emit(CheckTermsState());
  }

  void emitState({required LeadFlowState state}) {
    emit(state);
  }

  Future<void> postUserForm() async {
    emit(PostUserFormLoading());
    try {
      // String? ip = await NetworkHelper.getIpAddress();
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
      formModel = FormModel.fromJson(response.data);
      formId = formModel!.id;
      emit(PostUserFormSuccess());
    } on DioException catch (e) {
      debugPrint(e.error.toString());
      emit(PostUserFormFailed());
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrint(s.toString());
      emit(PostUserFormFailed());
    }
  }

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

  Future<void> getAllMaterials() async {
    emit(GetAllMaterialsLoading());
    try {
      final response = await DioHelper.getData(url: 'material/');
      materialsList = (response.data as List).map((e) => MaterialModel.fromJson(e)).toList();
      print('|==|' * 22);
      print(materialsList);
      print('|==|' * 22);
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
