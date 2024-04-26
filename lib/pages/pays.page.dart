import 'package:flutter/material.dart';

class PaysPage extends StatelessWidget {
  const PaysPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pays'),
      ),
      body: const Center(
        child: Text('Bienvenue sur la page Pays !'),
      ),
    );
  }
}
