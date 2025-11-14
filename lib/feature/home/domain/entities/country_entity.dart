class CountryEntity {
  final String commonName;
  final String officialName;
  final List<String> capital;
  final String region;
  final String subregion;
  final int population;
  final double area;
  final List<double> latlng;
  final Map<String, dynamic> currencies;
  final Map<String, String> languages;
  final List<String> timezones;
  final List<String> continents;
  final List<String> borders;
  final String flagPng;
  final String flagSvg;

  CountryEntity({
    required this.commonName,
    required this.officialName,
    required this.capital,
    required this.region,
    required this.subregion,
    required this.population,
    required this.area,
    required this.latlng,
    required this.currencies,
    required this.languages,
    required this.timezones,
    required this.continents,
    required this.borders,
    required this.flagPng,
    required this.flagSvg,
  });
}
