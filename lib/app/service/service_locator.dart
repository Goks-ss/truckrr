import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:world/feature/home/data/datasource/country_remote_datasource.dart';
import 'package:world/feature/home/data/repositories/country_repository_impl.dart';
import 'package:world/feature/home/domain/repository/country_repository.dart';
import 'package:world/feature/home/presentation/bloc/country/country_bloc.dart';
import 'package:world/feature/home/presentation/bloc/country_detail/country_detail_bloc.dart';

final sl = GetIt.instance;

void setupLocator() {
  sl.registerLazySingleton<Dio>(() {
    return Dio(
      BaseOptions(
        baseUrl: "https://restcountries.com",
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
      ),
    );
  });

  sl.registerLazySingleton<CountryRemoteDataSource>(
    () => CountryRemoteDataSourceImpl(sl()),
  );

  sl.registerLazySingleton<CountryRepository>(
    () => CountryRepositoryImpl(sl()),
  );

  sl.registerFactory(() => CountryBloc(sl()));
  
  sl.registerFactory(() => CountryDetailBloc(sl<CountryRepository>()));
}
