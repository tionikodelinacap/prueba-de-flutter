import 'package:flutter/material.dart';
import 'package:prueba_flutter/login_screen.dart';

void main() {
  runApp(
    const MainApp(),
  ); // Función principal: ejecuta la aplicación usando el widget MainApp
}

class MainApp extends StatelessWidget {
  // Define una clase MainApp que no puede cambiar (es inmutable)
  const MainApp({
    super.key,
  }); // Constructor de la clase, que permite usar claves únicas para el widget

  @override
  Widget build(BuildContext context) {
    // Define cómo se ve el widget
    return MaterialApp(
      title: "cruz del sur clinica", // Título de la aplicación
      home:
          const LoginScreen(), // La primera pantalla que se muestra es LoginScreen
    );
  }
}
