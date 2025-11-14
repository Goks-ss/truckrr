import 'package:flutter/material.dart';
import 'package:world/feature/home/domain/entities/country_entity.dart';
import 'package:world/feature/home/presentation/widgets/country_list_item.dart';

class CountryListView extends StatelessWidget {
  final List<CountryEntity> countries;

  const CountryListView({super.key, required this.countries});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.fromLTRB(24, 0, 24, 24),
      itemCount: countries.length,
      itemBuilder: (context, index) {
        return CountryListItem(country: countries[index], index: index);
      },
    );
  }
}
