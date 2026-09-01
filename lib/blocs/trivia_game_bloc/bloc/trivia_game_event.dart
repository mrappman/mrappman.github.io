part of 'trivia_game_bloc.dart';

@immutable
sealed class TriviaGameEvent {}

class GetTriviaGameEvent extends TriviaGameEvent {
  GetTriviaGameEvent();
}