part of 'lead_flow_cubit.dart';

@immutable
sealed class LeadFlowState {}

final class LeadFlowInitial extends LeadFlowState {}

final class ChangeProgressState extends LeadFlowState {}

final class ChangeDateState extends LeadFlowState {}

final class UpdatePersonalInfoState extends LeadFlowState {}
