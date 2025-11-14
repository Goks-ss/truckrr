// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:world/app/service/service_locator.dart';

import 'package:world/feature/home/presentation/bloc/country_detail/country_detail_bloc.dart';
import 'package:world/feature/home/presentation/bloc/country_detail/country_detail_event.dart';
import 'package:world/feature/home/presentation/bloc/country_detail/country_detail_state.dart';

import 'widgets/country_detail_appbar.dart';
import 'widgets/country_detail_info_card.dart';
import 'widgets/country_detail_loading.dart';
import 'widgets/country_detail_error.dart';
import 'widgets/population_formatter.dart';

class CountryDetailScreen extends StatelessWidget {
  final String countryName;

  const CountryDetailScreen({super.key, required this.countryName});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          sl<CountryDetailBloc>()..add(LoadCountryDetailEvent(countryName)),
      child: Scaffold(
        backgroundColor: const Color(0xFFF8F9FE),
        body: BlocBuilder<CountryDetailBloc, CountryDetailState>(
          builder: (context, state) {
            if (state.loading) {
              return const CountryDetailLoading();
            }

            if (state.error != null) {
              return CountryDetailError(message: state.error!);
            }

            if (state.country == null) {
              return const CountryDetailError(message: "Country not found");
            }

            final country = state.country!;

            return CustomScrollView(
              slivers: [
                CountryDetailAppBar(country: country),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          country.commonName,
                          style: const TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w800,
                            color: Color(0xFF1a1f36),
                            letterSpacing: -0.5,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          country.officialName,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[600],
                            fontWeight: FontWeight.w500,
                          ),
                        ),

                        const SizedBox(height: 24),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFF667eea).withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Icon(
                                Icons.public_rounded,
                                size: 18,
                                color: Color(0xFF667eea),
                              ),
                              SizedBox(width: 8),
                              Text(
                                "Region",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF667eea),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 32),
                        CountryDetailInfoCard(
                          icon: Icons.people_rounded,
                          title: "Population",
                          value: formatPopulation(country.population),
                          color: const Color(0xFF667eea),
                        ),
                        const SizedBox(height: 16),

                        CountryDetailInfoCard(
                          icon: Icons.location_on_rounded,
                          title: "Coordinates",
                          value: country.latlng.isNotEmpty
                              ? "${country.latlng[0].toStringAsFixed(2)}°, "
                                    "${country.latlng[1].toStringAsFixed(2)}°"
                              : "N/A",
                          color: const Color(0xFF764ba2),
                        ),
                        const SizedBox(height: 16),

                        CountryDetailInfoCard(
                          icon: Icons.location_city_rounded,
                          title: "Capital",
                          value: country.capital.isNotEmpty
                              ? country.capital.join(", ")
                              : "N/A",
                          color: const Color(0xFF46c2c2),
                        ),
                        const SizedBox(height: 16),

                        CountryDetailInfoCard(
                          icon: Icons.map_rounded,
                          title: "Subregion",
                          value: country.subregion.isNotEmpty
                              ? country.subregion
                              : "N/A",
                          color: const Color(0xFFff8c42),
                        ),
                        const SizedBox(height: 16),

                        CountryDetailInfoCard(
                          icon: Icons.access_time_filled_rounded,
                          title: "Timezones",
                          value: country.timezones.isNotEmpty
                              ? country.timezones.join(", ")
                              : "N/A",
                          color: const Color(0xFF32a852),
                        ),
                        const SizedBox(height: 16),

                        CountryDetailInfoCard(
                          icon: Icons.public_rounded,
                          title: "Continent",
                          value: country.continents.isNotEmpty
                              ? country.continents.join(", ")
                              : "N/A",
                          color: const Color(0xFF8a56f0),
                        ),
                        const SizedBox(height: 16),

                        CountryDetailInfoCard(
                          icon: Icons.language_rounded,
                          title: "Languages",
                          value: country.languages.isNotEmpty
                              ? country.languages.values.join(", ")
                              : "N/A",
                          color: const Color(0xFFff4f81),
                        ),
                        const SizedBox(height: 16),

                        CountryDetailInfoCard(
                          icon: Icons.currency_exchange_rounded,
                          title: "Currencies",
                          value: country.currencies.isNotEmpty
                              ? country.currencies.values
                                    .map((e) => e["name"])
                                    .join(", ")
                              : "N/A",
                          color: const Color(0xFF0099ff),
                        ),
                        const SizedBox(height: 16),

                        CountryDetailInfoCard(
                          icon: Icons.border_all_rounded,
                          title: "Borders",
                          value: country.borders.isNotEmpty
                              ? country.borders.join(", ")
                              : "No Borders",
                          color: const Color(0xFFff3d3d),
                        ),
                        const SizedBox(height: 16),

                        CountryDetailInfoCard(
                          icon: Icons.area_chart_rounded,
                          title: "Area",
                          value: "${country.area.toStringAsFixed(2)} km²",
                          color: const Color(0xFF3d5afe),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
