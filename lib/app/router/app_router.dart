import 'package:go_router/go_router.dart';
import 'package:world/app/router/app_route_constants.dart';
import 'package:world/feature/home/presentation/country_detail_screen.dart';
import 'package:world/feature/home/presentation/home_screen.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: AppRouteConstants.homePath,
    routes: [
      GoRoute(
        path: AppRouteConstants.homePath,
        name: AppRouteConstants.homeName,
        builder: (context, state) => const HomeScreen(),
        routes: [
          GoRoute(
            path: AppRouteConstants.detailsPath,
            name: AppRouteConstants.detailsName,
            builder: (context, state) {
              final countryName = state.extra as String;
              return CountryDetailScreen(countryName: countryName);
            },
          ),
        ],
      ),
    ],
  );
}
