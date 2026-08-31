part of 'sadya_list_bloc.dart';

@immutable
sealed class SadyaListState {}

final class SadyaListInitial extends SadyaListState {}

final class SadyaListLoadingState extends SadyaListState {}

final class SadyaListSuccessState extends SadyaListState {
  final List<SadyaListResponseModel> successResponse;
 SadyaListSuccessState({required this.successResponse});
}

final class SadyaListErrorState extends SadyaListState {
  final String errorMsg;
  SadyaListErrorState({required this.errorMsg});
}

final class SadyaListEndState extends SadyaListState {
  final bool status;
  SadyaListEndState({required this.status});
}
