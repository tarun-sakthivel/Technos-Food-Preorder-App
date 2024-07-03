import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'info_event.dart';
part 'info_state.dart';

class InfoBloc extends Bloc<InfoEvent, InfoState> {
  InfoBloc() : super(InfoInitial()) {
    on<ShowInformation>((event, emit)async {
      // TODO: implement event handler
      emit((ShowingInfo()));
      await Future.delayed(Duration(seconds:3));
      emit(InfoInitial());
    });
  }
}
