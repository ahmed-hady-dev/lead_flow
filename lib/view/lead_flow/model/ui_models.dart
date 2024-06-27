import '../model/classroom_model.dart';
import '../model/course_study_model.dart';
import '../model/grid_item.dart';
import '../model/package_model.dart';
import '../model/stage_model.dart';

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
