import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:world/app/bloc/ui_bloc.dart';
import 'package:world/app/bloc/ui_event.dart';
import 'package:world/app/bloc/ui_state.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({super.key});

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UiBloc, UiState>(
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 20,
                offset: Offset(0, 10),
              ),
            ],
          ),
          child: TextField(
            controller: _searchController,
            onChanged: (value) {
              if (value.length > 0 || value.isEmpty) {
                context.read<UiBloc>().add(UpdateSearchQueryEvent(value));
              }
            },
            decoration: InputDecoration(
              hintText: 'Search for a country...',
              hintStyle: TextStyle(
                color: Colors.grey[400],
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
              prefixIcon: Padding(
                padding: EdgeInsets.only(left: 20, right: 12),
                child: Icon(
                  Icons.search_rounded,
                  color: Color(0xFF667eea),
                  size: 24,
                ),
              ),
              suffixIcon: state.searchQuery.isNotEmpty
                  ? Padding(
                      padding: EdgeInsets.only(right: 12),
                      child: IconButton(
                        icon: Icon(
                          Icons.close_rounded,
                          color: Colors.grey[400],
                          size: 20,
                        ),
                        onPressed: () {
                          _searchController.clear();
                          context.read<UiBloc>().add(ClearSearchEvent());
                        },
                      ),
                    )
                  : null,
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 18),
            ),
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        );
      },
    );
  }
}
