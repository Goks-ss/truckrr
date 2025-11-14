
import 'package:equatable/equatable.dart';

abstract class CountryDetailEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadCountryDetailEvent extends CountryDetailEvent {
  final String countryName;

  LoadCountryDetailEvent(this.countryName);

  @override
  List<Object?> get props => [countryName];
}