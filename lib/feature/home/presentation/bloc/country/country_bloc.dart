import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/repository/country_repository.dart';
import 'country_event.dart';
import 'country_state.dart';

class CountryBloc extends Bloc<CountryEvent, CountryState> {
  final CountryRepository repository;

  CountryBloc(this.repository) : super(const CountryState()) {
    on<LoadCountriesEvent>((event, emit) async {
      emit(state.copyWith(loading: true));

      try {
        final result = await repository.getAllCountries();
        emit(state.copyWith(loading: false, countries: result));
      } catch (e) {
        emit(state.copyWith(loading: false, error: e.toString()));
      }
    });
  }
}
