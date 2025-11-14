import '../../domain/entities/country_entity.dart';
import '../../domain/repository/country_repository.dart';
import '../datasource/country_remote_datasource.dart';

class CountryRepositoryImpl implements CountryRepository {
  final CountryRemoteDataSource remote;

  CountryRepositoryImpl(this.remote);

  @override
  Future<List<CountryEntity>> getAllCountries() async {
    return await remote.fetchCountries();
  }

  @override
  Future<CountryEntity> getCountryByName(String name) async {
    return await remote.fetchCountryByName(name);
  }
}
