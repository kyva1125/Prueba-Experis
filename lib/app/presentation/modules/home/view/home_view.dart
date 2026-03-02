import 'package:flutter/material.dart';
import 'package:flutter_meedu/consumer/consumer_widget.dart';
import 'package:prueba_experis/app/presentation/modules/home/view/widgets/category_list.dart';
import 'package:prueba_experis/app/presentation/modules/home/view/widgets/pelicula_list.dart';

import '../controller/home_controller.dart';
import '../controller/home_provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      homeProvider.read().add(ObtenerPeliculas());
      homeProvider.read().  add(CargarTitle());

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Consumer(
          builder: (context, ref , _) {
            final controller = ref.watch(homeProvider);

            return Text(controller.state.title);
          }
        ),
        elevation: 0,
      ),
      body: Consumer(
        builder: (context, ref, _) {
          final controller = ref.watch(homeProvider);
          final state = controller.state;

          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.error != null) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Error: ${state.error}', textAlign: TextAlign.center),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () => controller.add(ObtenerPeliculas()),
                    child: const Text('Reintentar'),
                  ),
                ],
              ),
            );
          }

          if (state.peliculas.isEmpty) {
            return const Center(child: Text('No hay películas disponibles'));
          }

          return Column(
            children: [

              CategoriasList(
                categorias: state.categorias,
                categoriaSeleccionada: state.categoriaSeleccionada,
                onCategoriaSelected: (categoria) {
                  controller.add(
                    SeleccionarCategoria(categoria),
                  );
                },
              ),



              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  children: [
                    Text(
                      'Mostrando ${state.peliculasFiltradas.length} películas',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),
              ),

              Expanded(
                child: PeliculasList(
                  peliculas: state.peliculasFiltradas,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}






