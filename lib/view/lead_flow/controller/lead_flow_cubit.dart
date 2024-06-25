import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../personal_info_section.dart';

part 'lead_flow_state.dart';

class LeadFlowCubit extends Cubit<LeadFlowState> {
  LeadFlowCubit() : super(LeadFlowInitial());
  static LeadFlowCubit get(context) => BlocProvider.of(context);
  int completeFlowIndex = 0;
  DateTime pickedBirthDate = DateTime.now();
  TextEditingController birthDateController = TextEditingController();
  TextEditingController remarksController = TextEditingController();
  GlobalKey<FormState> personalInfoFormKey = GlobalKey<FormState>();
  String? gender;
  String? nationality;
  String? difficulties;
  PageController pageController = PageController();
  List<Widget> screens = [
    const PersonalInfoSection(),
    Container(color: Colors.red, width: 50, height: 100),
    Container(color: Colors.green, width: 50, height: 100),
    Container(color: Colors.blue, width: 50, height: 100),
    Container(color: Colors.yellow, width: 50, height: 100),
    Container(color: Colors.purple, width: 50, height: 100),
    Container(color: Colors.orange, width: 50, height: 100),
    Container(color: Colors.pink, width: 50, height: 100),
  ];
  late double progress = 1 / screens.length;
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
      progress = completeFlowIndex / (screens.length - 1);
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
        progress = completeFlowIndex / (screens.length - 1);
      } else {
        progress = 1 / screens.length;
      }
    }

    emit(ChangeProgressState());
  }

  void emitState({required LeadFlowState state}) {
    emit(state);
  }
}
