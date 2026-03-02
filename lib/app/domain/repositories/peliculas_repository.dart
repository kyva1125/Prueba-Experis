import '../models/pelicula_model.dart';

abstract class PeliculasRepository {

  Future<List<PeliculaModel>> getMovies();
}
