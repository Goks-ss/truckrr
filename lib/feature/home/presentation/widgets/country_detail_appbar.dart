import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:world/feature/home/domain/entities/country_entity.dart';

class CountryDetailAppBar extends StatelessWidget {
  final CountryEntity country;

  const CountryDetailAppBar({super.key, required this.country});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 300,
      pinned: true,
      backgroundColor: const Color(0xFF667eea),
      systemOverlayStyle: SystemUiOverlayStyle.light,
      leading: Padding(
        padding: const EdgeInsets.all(8),
        child: _buildBackButton(context),
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          fit: StackFit.expand,
          children: [
            _buildBackgroundGradient(),
            _buildFlagImage(),
          ],
        ),
      ),
    );
  }

  Widget _buildBackButton(BuildContext context) => Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.2),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: () => Navigator.pop(context),
            child:
                const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
          ),
        ),
      );

  Widget _buildBackgroundGradient() => Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF667eea), Color(0xFF764ba2)],
          ),
        ),
      );

  Widget _buildFlagImage() => Positioned(
        top: 100,
        left: 24,
        right: 24,
        child: Hero(
          tag: 'flag_${country.commonName}',
          child: Container(
            height: 180,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 30,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Image.network(
                country.flagPng,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      );
}
