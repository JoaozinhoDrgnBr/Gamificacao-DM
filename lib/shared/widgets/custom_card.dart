import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String titulo;
  final String descricao;
  final int estrelas; // de 0 a 5

  const CustomCard({
    Key? key,
    required this.titulo,
    required this.descricao,
    required this.estrelas,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Gera lista de ícones com base no número de estrelas
    List<Widget> buildEstrelas(int count) {
      return List.generate(5, (index) {
        return Icon(
          index < count ? Icons.star : Icons.star_border,
          color: Colors.amber,
          size: 20,
        );
      });
    }

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.all(12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Topo com título e estrelas
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  titulo,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(children: buildEstrelas(estrelas)),
              ],
            ),
            const SizedBox(height: 12),
            // Descrição expandida
            Text(descricao, style: const TextStyle(fontSize: 14)),
          ],
        ),
      ),
    );
  }
}
