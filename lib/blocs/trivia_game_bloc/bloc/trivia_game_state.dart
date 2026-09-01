part of 'trivia_game_bloc.dart';

@immutable
sealed class TriviaGameState {}

final class TriviaGameInitial extends TriviaGameState {}

final class TriviaGameLoadingState extends TriviaGameState {}

final class TriviaGameSuccessState extends TriviaGameState {
  final  TriviaGameResponseModel successResponse;
 TriviaGameSuccessState({required this.successResponse});
}

final class TriviaGameErrorState extends TriviaGameState {
  final String errorMsg;
  TriviaGameErrorState({required this.errorMsg});
}

final class TriviaGameEndState extends TriviaGameState {
  final bool status;
  TriviaGameEndState({required this.status});
}
