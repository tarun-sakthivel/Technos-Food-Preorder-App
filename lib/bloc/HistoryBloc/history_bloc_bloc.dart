import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'history_bloc_event.dart';
part 'history_bloc_state.dart';

class HistoryBlocBloc extends Bloc<HistoryBlocEvent, HistoryBlocState> {
  HistoryBlocBloc() : super(HistoryBlocInitial()) {
    on<GetLogData>((event, emit) {
      emit(dataSuccessfull(
        successMessage: 'Data successfull',
        selectedmonth: event.selectedmonth,
      ));
    });
  }
}
