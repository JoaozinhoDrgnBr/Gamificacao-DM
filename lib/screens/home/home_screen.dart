import 'package:atividade4/shared/widgets/custom_appbar.dart';
import 'package:atividade4/shared/widgets/custom_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Column(
        children: [
          SizedBox(height: 16),
          const Center(
            child: Text(
              'Bem-vindo ao app da Atividade 4',
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CustomCard(
                    titulo: 'Card 1',
                    descricao: 'Descrição do Card 1',
                    estrelas: 5,
                  ),
                  CustomCard(
                    titulo: 'Card 2',
                    descricao: 'Descrição do Card 2',
                    estrelas: 3,
                  ),
                  CustomCard(
                    titulo: 'Card 3',
                    descricao: 'Descrição do Card 3',
                    estrelas: 4,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
