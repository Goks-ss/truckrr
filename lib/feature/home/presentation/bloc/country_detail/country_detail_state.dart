import 'package:equatable/equatable.dart';
import 'package:world/feature/home/domain/entities/country_entity.dart';

class CountryDetailState extends Equatable {
  final bool loading;
  final CountryEntity? country;
  final String? error;

  const CountryDetailState({this.loading = false, this.country, this.error});

  CountryDetailState copyWith({
    bool? loading,
    CountryEntity? country,
    String? error,
  }) {
    return CountryDetailState(
      loading: loading ?? this.loading,
      country: country ?? this.country,
      error: error,
    );
  }

  @override
  List<Object?> get props => [loading, country, error];
}
