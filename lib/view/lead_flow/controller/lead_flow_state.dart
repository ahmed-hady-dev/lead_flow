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

class PostRequiredCoursesLoading extends LeadFlowState {}

class PostRequiredCoursesSuccess extends LeadFlowState {}

class PostRequiredCoursesFailed extends LeadFlowState {}

class GetAllPurposeLoading extends LeadFlowState {}

class GetAllPurposeSuccess extends LeadFlowState {}

class GetAllPurposeFailed extends LeadFlowState {}

class PostAdditionalInfoLoading extends LeadFlowState {}

class PostAdditionalInfoSuccess extends LeadFlowState {}

class PostAdditionalInfoFailed extends LeadFlowState {}

class GetAllDaysLoading extends LeadFlowState {}

class GetAllDaysSuccess extends LeadFlowState {}

class GetAllDaysFailed extends LeadFlowState {}

class PostTimePeriodLoading extends LeadFlowState {}

class PostTimePeriodSuccess extends LeadFlowState {}

class PostTimePeriodFailed extends LeadFlowState {}

class GetAllSubscriptionLoading extends LeadFlowState {}

class GetAllSubscriptionSuccess extends LeadFlowState {}

class GetAllSubscriptionFailed extends LeadFlowState {}

class PostClassAndSubscriptionLoading extends LeadFlowState {}

class PostClassAndSubscriptionSuccess extends LeadFlowState {}

class PostClassAndSubscriptionFailed extends LeadFlowState {}

class PostPaymentLoading extends LeadFlowState {}

class PostPaymentSuccess extends LeadFlowState {}

class PostPaymentFailed extends LeadFlowState {}
