import 'package:flutter_meedu/notifiers.dart';
import 'package:prueba_experis/app/presentation/modules/home/controller/home_state.dart';

import '../../../../data/helpers/app_preferences.dart';
import '../../../../domain/repositories/peliculas_repository.dart';


class HomeController extends Bloc<PeliculaEvent, HomeState> {

  final AppPreferences _prefs;

  HomeController({
    required PeliculasRepository peliculasRepository,
    AppPreferences? prefs,
  })  : _prefs = prefs ?? AppPreferences(),
        super(HomeState.initial()) {

    on<CargarTitle>((event, emit) async {
      final title = await _prefs.getStartupText();
      emit(state.copyWith(title: title));
    });

    on<ObtenerPeliculas>((event, emit) async {
      emit(state.copyWith(isLoading: true));
      try {
        final peliculas = await peliculasRepository.getMovies();

        final categorias = <String>{};
        for (final pelicula in peliculas) {
          categorias.add(pelicula.genre);
        }

        emit(
          state.copyWith(
            isLoading: false,
            peliculas: peliculas,
            categorias: categorias.toList(),
            error: null,
          ),
        );
      } catch (e) {
        emit(state.copyWith(isLoading: false, error: e.toString()));
      }
    });

    on<SeleccionarCategoria>((event, emit) {
      if (event.categoria.isEmpty) {
        emit(state.copyWith(clearCategoriaSeleccionada: true));
      } else {
        emit(state.copyWith(categoriaSeleccionada: event.categoria));
      }
    });


  }
}

abstract class PeliculaEvent {}

class ObtenerPeliculas extends PeliculaEvent {}
class CargarTitle extends PeliculaEvent {}


class SeleccionarCategoria extends PeliculaEvent {
  final String categoria;

  SeleccionarCategoria(this.categoria);
}
