import '../../domain/entities/country_entity.dart';

class CountryModel extends CountryEntity {
  CountryModel({
    required super.commonName,
    required super.officialName,
    required super.capital,
    required super.region,
    required super.subregion,
    required super.population,
    required super.area,
    required super.latlng,
    required super.currencies,
    required super.languages,
    required super.timezones,
    required super.continents,
    required super.borders,
    required super.flagPng,
    required super.flagSvg,
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
      commonName: json["name"]["common"] ?? "",
      officialName: json["name"]["official"] ?? "",
      capital: json["capital"] != null
          ? List<String>.from(json["capital"])
          : <String>[],
      region: json["region"] ?? "",
      subregion: json["subregion"] ?? "",
      population: json["population"] ?? 0,
      area: (json["area"] ?? 0).toDouble(),
      latlng: json["latlng"] != null
          ? List<double>.from(json["latlng"].map((e) => e.toDouble()))
          : <double>[],
      currencies: json["currencies"] ?? {},
      languages: json["languages"] != null
          ? Map<String, String>.from(json["languages"])
          : {},
      timezones: json["timezones"] != null
          ? List<String>.from(json["timezones"])
          : <String>[],
      continents: json["continents"] != null
          ? List<String>.from(json["continents"])
          : <String>[],
      borders: json["borders"] != null
          ? List<String>.from(json["borders"])
          : <String>[],
      flagPng: json["flags"]["png"] ?? "",
      flagSvg: json["flags"]["svg"] ?? "",
    );
  }
}
