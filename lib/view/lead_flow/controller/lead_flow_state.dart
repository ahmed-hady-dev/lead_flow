part of 'lead_flow_cubit.dart';

@immutable
sealed class LeadFlowState {}

final class LeadFlowInitial extends LeadFlowState {}

final class RoleChangedState extends LeadFlowState {}

final class ChangeProgressState extends LeadFlowState {}

final class ChangeDateState extends LeadFlowState {}

final class UpdatePersonalInfoState extends LeadFlowState {}

final class CheckTermsState extends LeadFlowState {}

class PostUserFormLoading extends LeadFlowState {}

class PostUserFormSuccess extends LeadFlowState {}

class PostUserFormFailed extends LeadFlowState {}

class PostSpecificationLoading extends LeadFlowState {}

class PostSpecificationSuccess extends LeadFlowState {}

class PostSpecificationFailed extends LeadFlowState {}

class GetAllMaterialsLoading extends LeadFlowState {}

class GetAllMaterialsSuccess extends LeadFlowState {}

class GetAllMaterialsFailed extends LeadFlowState {}
