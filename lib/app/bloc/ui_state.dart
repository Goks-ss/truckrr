import 'package:equatable/equatable.dart';

class UiState extends Equatable {
  final bool isGridView;
  final String searchQuery;

  const UiState({this.isGridView = false, this.searchQuery = ''});

  UiState copyWith({bool? isGridView, String? searchQuery}) {
    return UiState(
      isGridView: isGridView ?? this.isGridView,
      searchQuery: searchQuery ?? this.searchQuery,
    );
  }

  @override
  List<Object?> get props => [isGridView, searchQuery];
}
