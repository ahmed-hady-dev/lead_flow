import 'package:lead_flow/view/lead_flow/model/studen_count_model.dart';
import 'package:lead_flow/view/lead_flow/model/subscription_model.dart';

import '../model/classroom_model.dart';
import '../model/course_study_model.dart';
import '../model/stage_model.dart';
import 'material_model.dart';

final List<StageModel> stagesList = [
  StageModel(id: 'kg', name: 'رياض أطفال'),
  StageModel(id: 'primery', name: 'التعليم الإبتدائي'),
  StageModel(id: 'secondary ', name: 'التعليم المتوسط'),
  StageModel(id: 'high_school', name: 'التعليم الثانوي'),
];
final List<ClassRoomModel> classRoomsList = [
  ClassRoomModel(id: 'kg_1', name: 'رياض الأطفال 1'),
  ClassRoomModel(id: 'kg_2', name: 'رياض الأطفال 2'),
  ClassRoomModel(id: 'first', name: 'الصف الأول'),
  ClassRoomModel(id: 'second', name: 'الصف الثاني'),
  ClassRoomModel(id: 'third', name: 'الصف الثالث'),
  ClassRoomModel(id: 'fourth', name: 'الصف الرابع'),
  ClassRoomModel(id: 'fifth', name: 'الصف الخامس'),
  ClassRoomModel(id: 'six', name: 'الصف السادس'),
  ClassRoomModel(id: 'seven', name: 'الصف السابع'),
  ClassRoomModel(id: 'eight', name: 'الصف الثامن'),
  ClassRoomModel(id: 'nine', name: 'الصف التاسع'),
  ClassRoomModel(id: 'ten', name: 'الصف العاشر'),
  ClassRoomModel(id: 'eleven', name: 'الصف الحادي عشر'),
  ClassRoomModel(id: 'twelve', name: 'الصف الثاني عشر'),
];
final List<CourseStudyModel> courseStudyList = [
  CourseStudyModel(id: 'ig', name: 'المنهج البريطاني'),
  CourseStudyModel(id: 'sat', name: 'المنهج الأمريكي'),
  CourseStudyModel(id: 'normal', name: 'المنهج الموازي'),
  CourseStudyModel(id: 'other', name: 'أخرى'),
];
List<String> selectedStagesList = [];
List<String> selectedClassRoomsList = [];
List<String> selectedCourseStudyList = [];

//==============================
List<MaterialModel> selectedMaterialsList = [];
//==============================
List<StudentCountModel> studentCountList = [
  StudentCountModel(count: 1, name: 'طالب واحد'),
  StudentCountModel(count: 2, name: 'طالبين'),
  StudentCountModel(count: 3, name: 'ثلاث طلاب'),
  StudentCountModel(count: 4, name: 'أكثر من ذلك'),
];
List<String> selectedStudentCountList = [];
List<String> selectedPurposesList = [];
//==============================

List<String> timePeriodList = [
  'الفترة الصباحية',
  'الفترة المسائية',
];
List<String> timesList = [
  '12:00',
  '15:00',
];
List<String> selectedDaysList = [];
List<String> selectedTimePeriodList = [];
List<String> selectedTimesList = [];

//==============================
List<String> sessionsList = [
  'حصة واحدة',
  'حصتين',
];
List<String> hoursPerSessionList = [
  '30 دقيقة',
  'ساعة واحدة',
  'ساعة و نصف',
  'ساعتين',
  'ساعتين و نصف',
];
List<String> selectedSessionsList = [];
List<String> selectedHoursPerSessionList = [];
List<SubscriptionModel> selectedPackagesList = [];
//==============================
