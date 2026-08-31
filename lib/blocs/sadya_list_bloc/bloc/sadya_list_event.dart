part of 'sadya_list_bloc.dart';

@immutable
sealed class SadyaListEvent {}

class GetSadyaListEvent extends SadyaListEvent {
  GetSadyaListEvent();
}