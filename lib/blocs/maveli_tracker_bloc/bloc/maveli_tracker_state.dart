part of 'maveli_tracker_bloc.dart';

@immutable
sealed class MaveliTrackerState {}

final class MaveliTrackerInitial extends MaveliTrackerState {}

final class MaveliTrackerLoadingState extends MaveliTrackerState {}

final class MaveliTrackerSuccessState extends MaveliTrackerState {
  final MaveliTrackerModel successResponse;
  MaveliTrackerSuccessState({required this.successResponse});
}

final class MaveliTrackerErrorState extends MaveliTrackerState {
  final String errorMsg;
  MaveliTrackerErrorState({required this.errorMsg});
}

final class MaveliTrackerEndState extends MaveliTrackerState {
  final bool status;
  MaveliTrackerEndState({required this.status});
}
