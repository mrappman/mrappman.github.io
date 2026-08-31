import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:maveli_mart/data/models/sadya_list_response.dart';
import 'package:maveli_mart/data/repositories/sadya_list_repo.dart';
import 'package:meta/meta.dart';

part 'sadya_list_event.dart';
part 'sadya_list_state.dart';


class SadyaListBloc extends Bloc<SadyaListEvent, SadyaListState> {
  SadyaListBloc() : super(SadyaListInitial()) {
    on<GetSadyaListEvent>(getSadyaListEvent);
  }

  void getSadyaListEvent(
    SadyaListEvent event,
    Emitter<SadyaListState> emit,
  ) async {
    emit(SadyaListLoadingState());

    final Either<String, List<SadyaListResponseModel>> apiResponse =
        await SadyaListRespository.sadyaListApiCall();

    emit(
      apiResponse.fold(
        (failure) => SadyaListErrorState(errorMsg: failure),
        (success) => SadyaListSuccessState(successResponse: success),
      ),
    );

    await Future.delayed(const Duration(seconds: 1));

    emit(
      apiResponse.fold(
        (failure) => SadyaListEndState(status: false),
        (success) => SadyaListEndState(status: true),
      ),
    );
  }
}
