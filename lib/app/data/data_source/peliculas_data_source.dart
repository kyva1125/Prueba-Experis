import 'package:dio/dio.dart';

class PeliculasDataSource {
  final Dio _dio;
  final String _baseUrl = 'https://devsapihub.com/api-movies';

  PeliculasDataSource({Dio? dio}) : _dio = dio ?? Dio();

  Future<List<dynamic>> getMovies() async {
    try {
      final response = await _dio.get(_baseUrl);

      if (response.statusCode == 200) {
        return response.data as List<dynamic>;
      } else {
        throw Exception('Failed to load movies: ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw Exception('Network error: ${e.message}');
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }


}
