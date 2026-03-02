import 'package:dio/dio.dart';
import '../../domain/models/pelicula_model.dart';
import '../../domain/repositories/peliculas_repository.dart';
import '../data_source/peliculas_data_source.dart';

class PeliculasRepositoryImpl implements PeliculasRepository {
  final PeliculasDataSource _dataSource;

  PeliculasRepositoryImpl({PeliculasDataSource? dataSource})
      : _dataSource = dataSource ?? PeliculasDataSource();

  @override
  Future<List<PeliculaModel>> getMovies() async {
    try {
      final response = await _dataSource.getMovies();
      return PeliculaModel.listFromJson(response);
    } catch (e) {
      throw Exception('Error al obtener películas: $e');
    }
  }


}
