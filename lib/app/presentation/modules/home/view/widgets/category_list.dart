import 'package:flutter/material.dart';

class CategoriasList extends StatelessWidget {
  final List<String> categorias;
  final String? categoriaSeleccionada;
  final Function(String) onCategoriaSelected;

  const CategoriasList({
    required this.categorias,
    required this.categoriaSeleccionada,
    required this.onCategoriaSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categorias.length + 1,
        itemBuilder: (context, index) {
          final isAllCategory = index == 0;
          final categoria = isAllCategory ? "Todas" : categorias[index - 1];
          final isSelected = isAllCategory
              ? categoriaSeleccionada == null
              : categoria == categoriaSeleccionada;

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: ChoiceChip(
              label: Text(categoria),
              selected: isSelected,
              onSelected: (_) {
                if (isAllCategory) {
                  onCategoriaSelected("");
                } else {
                  onCategoriaSelected(categoria);
                }
              },
            ),
          );
        },
      ),
    );
  }
}
