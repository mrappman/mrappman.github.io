import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:maveli_mart/data/models/flower_list_response.dart';
import 'package:maveli_mart/data/repositories/flower_list_repo.dart';
import 'package:meta/meta.dart';

part 'flower_list_event.dart';
part 'flower_list_state.dart';


class FlowerListBloc extends Bloc<FlowerListEvent, FlowerListState> {
  FlowerListBloc() : super(FlowerListInitial()) {
    on<GetFlowerListEvent>(getFlowerListEvent);
  }

  void getFlowerListEvent(
    FlowerListEvent event,
    Emitter<FlowerListState> emit,
  ) async {
    emit(FlowerListLoadingState());

    final Either<String, FlowerListResponseModel> apiResponse =
        await FlowerListRespository.flowerListApiCall();

    emit(
      apiResponse.fold(
        (failure) => FlowerListErrorState(errorMsg: failure),
        (success) => FlowerListSuccessState(successResponse: success),
      ),
    );

    await Future.delayed(const Duration(seconds: 1));

    emit(
      apiResponse.fold(
        (failure) => FlowerListEndState(status: false),
        (success) => FlowerListEndState(status: true),
      ),
    );
  }
}
