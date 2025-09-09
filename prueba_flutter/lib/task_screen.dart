import 'package:flutter/material.dart';

// Pantalla de inicio de la app después del login
class TaskScreen extends StatelessWidget {
  // Variable para guardar el correo que se recibe desde el login
  final String email;

  // Constructor de la clase: el correo es obligatorio (required)
  const TaskScreen({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    // Scaffold construye la estructura visual de la pantalla:
    // AppBar, body y FloatingActionButton
    return Scaffold(
      appBar: AppBar(
        // Título que aparece en la barra superior
        title: const Text(
          "Inicio",
          style: TextStyle(
            color: Color.fromARGB(
              255,
              245,
              245,
              245,
            ), // Color del texto en el AppBar (blanco/gris claro)
            fontWeight: FontWeight.bold, // Texto en negrita
          ),
        ),
        backgroundColor: const Color.fromARGB(
          255,
          7,
          7,
          112,
        ), // Color de fondo del AppBar (azul oscuro)
        centerTitle: true, // Centra el título en el AppBar
      ),

      // Contenido principal de la pantalla
      body: Center(
        // Centra el texto en el medio de la pantalla
        child: Text(
          "Bienvenido, $email a clinica cruz del sur  ", // Muestra un saludo con el correo recibido
          style: const TextStyle(
            fontSize: 22, // Tamaño del texto
            fontWeight: FontWeight.bold, // Negrita
            color: Color.fromARGB(255, 7, 7, 112), // Color azul oscuro
          ),
          textAlign: TextAlign.center, // Centra el texto
        ),
      ),

      // Botón flotante típico de Material Design
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Aquí se define qué pasará al presionar el botón.
          // Por ahora no tiene funcionalidad.
        },
        child: const Icon(Icons.add), // Ícono (+) en el botón
      ),
    );
  }
}
