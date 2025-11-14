import 'package:dio/dio.dart';
import 'package:world/feature/home/data/models/country_model.dart';

abstract class CountryRemoteDataSource {
  Future<List<CountryModel>> fetchCountries();
  Future<CountryModel> fetchCountryByName(String name);
}

class CountryRemoteDataSourceImpl implements CountryRemoteDataSource {
  final Dio dio;

  CountryRemoteDataSourceImpl(this.dio);

  @override
  Future<List<CountryModel>> fetchCountries() async {
    try {
      final response = await dio.get("https://restcountries.com/v3.1/name/all");

      if (response.statusCode == 200) {
        final List data = response.data;
        return data.map((e) => CountryModel.fromJson(e)).toList();
      } else {
        throw Exception("Failed to load countries");
      }
    } on DioException catch (e) {
      throw Exception("Dio error: ${e.message}");
    } catch (e) {
      throw Exception("Unknown error: $e");
    }
  }

  @override
  Future<CountryModel> fetchCountryByName(String name) async {
    try {
      final encodedName = Uri.encodeComponent(name);
      final response = await dio.get(
        "https://restcountries.com/v3.1/name/$encodedName",
      );

      if (response.statusCode == 200) {
        final List data = response.data;
        if (data.isEmpty) {
          throw Exception("Country not found");
        }
        return CountryModel.fromJson(data.first);
      } else {
        throw Exception("Failed to load country");
      }
    } on DioException catch (e) {
      throw Exception("Dio error: ${e.message}");
    } catch (e) {
      throw Exception("Unknown error: $e");
    }
  }
}
