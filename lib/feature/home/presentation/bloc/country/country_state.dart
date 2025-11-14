import 'package:equatable/equatable.dart';
import '../../../domain/entities/country_entity.dart';

class CountryState extends Equatable {
  final bool loading;
  final List<CountryEntity> countries;
  final String? error;

  const CountryState({
    this.loading = false,
    this.countries = const [],
    this.error,
  });

  CountryState copyWith({
    bool? loading,
    List<CountryEntity>? countries,
    String? error,
  }) {
    return CountryState(
      loading: loading ?? this.loading,
      countries: countries ?? this.countries,
      error: error,
    );
  }

  @override
  List<Object?> get props => [loading, countries, error];
}
