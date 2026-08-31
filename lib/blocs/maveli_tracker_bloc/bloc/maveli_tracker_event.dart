part of 'maveli_tracker_bloc.dart';

@immutable
sealed class MaveliTrackerEvent {}

class GetMaveliTrackerEvent extends MaveliTrackerEvent {
  GetMaveliTrackerEvent();
}
