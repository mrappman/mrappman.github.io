import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:maveli_mart/data/models/trivia_game_response.dart';
import 'package:maveli_mart/data/repositories/trivia_game_repo.dart';
import 'package:meta/meta.dart';

part 'trivia_game_event.dart';
part 'trivia_game_state.dart';


class TriviaGameBloc extends Bloc<TriviaGameEvent, TriviaGameState> {
  TriviaGameBloc() : super(TriviaGameInitial()) {
    on<GetTriviaGameEvent>(getTriviaGameEvent);
  }

  void getTriviaGameEvent(
    TriviaGameEvent event,
    Emitter<TriviaGameState> emit,
  ) async {
    emit(TriviaGameLoadingState());

    final Either<String, TriviaGameResponseModel> apiResponse =
        await TriviaGameRespository.triviaGameApiCall();

    emit(
      apiResponse.fold(
        (failure) => TriviaGameErrorState(errorMsg: failure),
        (success) => TriviaGameSuccessState(successResponse: success),
      ),
    );

    await Future.delayed(const Duration(seconds: 1));

    emit(
      apiResponse.fold(
        (failure) => TriviaGameEndState(status: false),
        (success) => TriviaGameEndState(status: true),
      ),
    );
  }
}
