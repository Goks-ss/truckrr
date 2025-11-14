import 'package:equatable/equatable.dart';

abstract class CountryEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadCountriesEvent extends CountryEvent {}
