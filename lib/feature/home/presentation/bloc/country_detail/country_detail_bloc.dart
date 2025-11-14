import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:world/feature/home/domain/repository/country_repository.dart';
import 'country_detail_event.dart';
import 'country_detail_state.dart';

class CountryDetailBloc extends Bloc<CountryDetailEvent, CountryDetailState> {
  final CountryRepository repository;

  CountryDetailBloc(this.repository) : super(const CountryDetailState()) {
    on<LoadCountryDetailEvent>((event, emit) async {
      emit(state.copyWith(loading: true, error: null));

      try {
        final result = await repository.getCountryByName(event.countryName);
        emit(state.copyWith(loading: false, country: result));
      } catch (e) {
        emit(state.copyWith(loading: false, error: e.toString()));
      }
    });
  }
}