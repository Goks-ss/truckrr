import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:world/app/bloc/ui_bloc.dart';
import 'package:world/app/bloc/ui_state.dart';
import 'package:world/app/service/service_locator.dart';
import 'package:world/feature/home/presentation/bloc/country/country_bloc.dart';
import 'package:world/feature/home/presentation/bloc/country/country_event.dart';
import 'package:world/feature/home/presentation/bloc/country/country_state.dart';
import 'package:world/feature/home/presentation/widgets/country_grid_view.dart';
import 'package:world/feature/home/presentation/widgets/country_list_view.dart';
import 'package:world/feature/home/presentation/widgets/empty_state_widget.dart';
import 'package:world/feature/home/presentation/widgets/error_state_widget.dart';
import 'package:world/feature/home/presentation/widgets/home_header.dart';
import 'package:world/feature/home/presentation/widgets/loading_state_widget.dart';
import 'package:world/feature/home/presentation/widgets/search_bar_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => sl<CountryBloc>()..add(LoadCountriesEvent()),
        ),
        BlocProvider(create: (_) => UiBloc()),
      ],
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Scaffold(
          backgroundColor: Color(0xFFF8F9FE),
          body: Stack(
            children: [
              Container(
                height: 280,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xFF667eea), Color(0xFF764ba2)],
                  ),
                ),
              ),
              SafeArea(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(24, 20, 24, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          HomeHeader(),
                          SizedBox(height: 24),
                          SearchBarWidget(),
                        ],
                      ),
                    ),
                    SizedBox(height: 24),
                    
                    Expanded(
                      child: BlocBuilder<UiBloc, UiState>(
                        builder: (context, uiState) {
                          return BlocBuilder<CountryBloc, CountryState>(
                            builder: (context, countryState) {
                              if (countryState.loading) {
                                return LoadingStateWidget();
                              }

                              if (countryState.error != null) {
                                return ErrorStateWidget(
                                  error: countryState.error!,
                                );
                              }

                              final filteredCountries = countryState.countries
                                  .where((country) {
                                    if (uiState.searchQuery.isEmpty) {
                                      return true;
                                    }
                                    return country.commonName
                                        .toLowerCase()
                                        .contains(uiState.searchQuery);
                                  })
                                  .toList();

                              if (filteredCountries.isEmpty) {
                                return EmptyStateWidget();
                              }

                              return uiState.isGridView
                                  ? CountryGridView(
                                      countries: filteredCountries,
                                    )
                                  : CountryListView(
                                      countries: filteredCountries,
                                    );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
