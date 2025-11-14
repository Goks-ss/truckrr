import 'package:equatable/equatable.dart';

abstract class UiEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ToggleViewModeEvent extends UiEvent {}

class UpdateSearchQueryEvent extends UiEvent {
  final String query;

  UpdateSearchQueryEvent(this.query);

  @override
  List<Object?> get props => [query];
}

class ClearSearchEvent extends UiEvent {}