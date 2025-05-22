import 'package:flutter/material.dart';

class EmptyListPension extends StatelessWidget {
  const EmptyListPension({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 48.0, vertical: 36.0),
      child: Text(
        'Nenhum resultado foi encontrado para os filtros selecionados.',
        textAlign: TextAlign.center,
      ),
    );
  }
}
