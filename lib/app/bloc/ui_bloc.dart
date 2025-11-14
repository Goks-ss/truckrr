import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:world/app/bloc/ui_event.dart';
import 'package:world/app/bloc/ui_state.dart';

class UiBloc extends Bloc<UiEvent, UiState> {
  UiBloc() : super(const UiState()) {
    on<ToggleViewModeEvent>((event, emit) {
      emit(state.copyWith(isGridView: !state.isGridView));
    });

    on<UpdateSearchQueryEvent>((event, emit) {
      emit(state.copyWith(searchQuery: event.query.toLowerCase()));
    });

    on<ClearSearchEvent>((event, emit) {
      emit(state.copyWith(searchQuery: ''));
    });
  }
}