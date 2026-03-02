import 'package:flutter/material.dart';
import 'package:prueba_experis/app/presentation/modules/home/view/widgets/peliculas_card.dart';

import '../../../../../domain/models/pelicula_model.dart';

class PeliculasList extends StatelessWidget {
  final List<PeliculaModel> peliculas;

  const PeliculasList({required this.peliculas});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.7,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: peliculas.length,
      itemBuilder: (context, index) {
        final pelicula = peliculas[index];
        return PeliculaCard(pelicula: pelicula);
      },
    );
  }
}
