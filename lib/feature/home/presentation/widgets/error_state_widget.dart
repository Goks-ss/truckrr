import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:world/feature/home/presentation/bloc/country/country_bloc.dart';
import 'package:world/feature/home/presentation/bloc/country/country_event.dart';

class ErrorStateWidget extends StatelessWidget {
  final String error;

  const ErrorStateWidget({
    super.key,
    required this.error,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.red[50],
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.error_outline_rounded,
                size: 64,
                color: Colors.red[400],
              ),
            ),
            SizedBox(height: 24),
            Text(
              'Oops! Something went wrong',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.grey[900],
              ),
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                context.read<CountryBloc>().add(LoadCountriesEvent());
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF667eea),
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 0,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.refresh_rounded),
                  SizedBox(width: 8),
                  Text(
                    'Try Again',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}