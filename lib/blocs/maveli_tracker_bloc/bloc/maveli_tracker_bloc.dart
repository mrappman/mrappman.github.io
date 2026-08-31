import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:maveli_mart/data/models/maveli_tracker_response.dart';
import 'package:maveli_mart/data/repositories/maveli_tracker_repo.dart';
import 'package:meta/meta.dart';

part 'maveli_tracker_event.dart';
part 'maveli_tracker_state.dart';

class MaveliTrackerBloc extends Bloc<MaveliTrackerEvent, MaveliTrackerState> {
  MaveliTrackerBloc() : super(MaveliTrackerInitial()) {
    on<GetMaveliTrackerEvent>(getMaveliTrackerEvent);
  }

  void getMaveliTrackerEvent(
    MaveliTrackerEvent event,
    Emitter<MaveliTrackerState> emit,
  ) async {
    emit(MaveliTrackerLoadingState());

    final Either<String, MaveliTrackerModel> apiResponse =
        await MaveliTrackerRespository.maveliTrackApiCall();

    emit(
      apiResponse.fold(
        (failure) => MaveliTrackerErrorState(errorMsg: failure),
        (success) => MaveliTrackerSuccessState(successResponse: success),
      ),
    );

    await Future.delayed(const Duration(seconds: 1));

    emit(
      apiResponse.fold(
        (failure) => MaveliTrackerEndState(status: false),
        (success) => MaveliTrackerEndState(status: true),
      ),
    );
  }
}
