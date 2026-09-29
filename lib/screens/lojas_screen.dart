import 'package:flutter/material.dart';
import '../models/loja.dart';
import '../services/loja_service.dart';
import 'cardapio_screen.dart';

class LojasScreen extends StatelessWidget {
  LojasScreen({super.key});

  final LojaService _lojaService = LojaService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lojas'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      body: FutureBuilder<List<Loja>>(
        future: _lojaService.getLojas(),
        builder: (context, snapshot) {
          // Estado de carregamento
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          // Estado de erro / vazio
          if (snapshot.hasError || !snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text(
                'Não foi possível carregar as lojas.',
                style: TextStyle(fontSize: 16),
              ),
            );
          }

          // Estado de sucesso
          final lojas = snapshot.data!;
          return ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 8),
            itemCount: lojas.length,
            itemBuilder: (context, index) {
              final loja = lojas[index];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    child: Text(
                      loja.lojaNome[0].toUpperCase(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  title: Text(
                    loja.lojaNome,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: loja.lojaTelefone != null
                      ? Text('Tel: ${loja.lojaTelefone}')
                      : null,
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => CardapioScreen(
                          idLoja: loja.idLoja,
                          lojaNome: loja.lojaNome,
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
