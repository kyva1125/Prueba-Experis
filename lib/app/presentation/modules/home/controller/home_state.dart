import '../../../../domain/models/pelicula_model.dart';

class HomeState {
  final bool isLoading;
  final List<PeliculaModel> peliculas;
  final List<String> categorias;
  final String? error;
  final String? categoriaSeleccionada;
  final String title;

  HomeState({
    required this.isLoading,
    required this.peliculas,
    required this.categorias,
    required this.title,
    this.error,
    this.categoriaSeleccionada,
  });

  factory HomeState.initial() => HomeState(
    isLoading: false,
    peliculas: [],
    categorias: [],
    title: '',
  );

  HomeState copyWith({
    bool? isLoading,
    List<PeliculaModel>? peliculas,
    List<String>? categorias,
    String? error,
    String? categoriaSeleccionada,
    bool clearCategoriaSeleccionada = false,
    String? title,
  }) {
    return HomeState(
      isLoading: isLoading ?? this.isLoading,
      peliculas: peliculas ?? this.peliculas,
      categorias: categorias ?? this.categorias,
      error: error,
      title: title ?? this.title,
      categoriaSeleccionada: clearCategoriaSeleccionada
          ? null
          : (categoriaSeleccionada ?? this.categoriaSeleccionada),
    );
  }

  List<PeliculaModel> get peliculasFiltradas {
    if (categoriaSeleccionada == null || categoriaSeleccionada!.isEmpty) {
      return peliculas;
    }
    return peliculas.where((p) => p.genre == categoriaSeleccionada).toList();
  }
}
