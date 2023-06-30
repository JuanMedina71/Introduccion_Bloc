import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children:  [
          ListTile(
            title: const Text('Cubits'),
            subtitle: const Text('Gestor de estado simple'),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),

            // Aquí se manda a llamar desde el goRouter con el path especificado. 
            onTap: () => context.push('/cubits'),
            
          ),
          ListTile(
            title: const Text('Bloc'),
            subtitle: const Text('Gestor de estado compuesto'),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),

            // Aquí se manda a llamar desde el goRouter con el path especificado. 
            onTap: () => context.push('/counter-bloc'),
            
          ),
        ],
      ),

    );
  }
}