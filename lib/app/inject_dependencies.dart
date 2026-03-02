import 'package:flutter_meedu/providers.dart';
import 'package:prueba_experis/app/data/repositories_impl/peliculas_repository_impl.dart';
import 'package:prueba_experis/app/domain/repositories/peliculas_repository.dart';

final peliculasProvider = Provider<PeliculasRepository>(
      (_) => PeliculasRepositoryImpl());
