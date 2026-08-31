part of 'flower_list_bloc.dart';

@immutable
sealed class FlowerListEvent {}

class GetFlowerListEvent extends FlowerListEvent {
  GetFlowerListEvent();
}