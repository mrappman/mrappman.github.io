part of 'flower_list_bloc.dart';

@immutable
sealed class FlowerListState {}

final class FlowerListInitial extends FlowerListState {}

final class FlowerListLoadingState extends FlowerListState {}

final class FlowerListSuccessState extends FlowerListState {
  final FlowerListResponseModel successResponse;
 FlowerListSuccessState({required this.successResponse});
}

final class FlowerListErrorState extends FlowerListState {
  final String errorMsg;
  FlowerListErrorState({required this.errorMsg});
}

final class FlowerListEndState extends FlowerListState {
  final bool status;
  FlowerListEndState({required this.status});
}
