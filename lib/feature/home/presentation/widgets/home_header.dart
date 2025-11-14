
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:world/app/bloc/ui_bloc.dart';
import 'package:world/app/bloc/ui_event.dart';
import 'package:world/app/bloc/ui_state.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Discover',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.w800,
                color: Colors.white,
                letterSpacing: -0.5,
              ),
            ),
            Text(
              'Countries Around the World',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white.withOpacity(0.9),
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        BlocBuilder<UiBloc, UiState>(
          builder: (context, state) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(16),
                  onTap: () {
                    context.read<UiBloc>().add(ToggleViewModeEvent());
                  },
                  child: Padding(
                    padding: EdgeInsets.all(12),
                    child: Icon(
                      state.isGridView ? Icons.list_rounded : Icons.grid_view_rounded,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}