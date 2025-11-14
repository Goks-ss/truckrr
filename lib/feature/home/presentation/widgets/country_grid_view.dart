import 'package:flutter/material.dart';
import 'package:world/feature/home/domain/entities/country_entity.dart';
import 'package:world/feature/home/presentation/widgets/country_grid_item.dart';

class CountryGridView extends StatelessWidget {
  final List<CountryEntity> countries;

  const CountryGridView({super.key, required this.countries});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.fromLTRB(24, 0, 24, 24),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.80,
      ),
      itemCount: countries.length,
      itemBuilder: (context, index) {
        return CountryGridItem(country: countries[index], index: index);
      },
    );
  }
}
