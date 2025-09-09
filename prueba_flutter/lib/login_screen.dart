import 'package:flutter/material.dart';
import 'package:prueba_flutter/login_fields.dart';

// Pantalla de inicio de sesión de la clínica
class LoginScreen extends StatelessWidget {
  const LoginScreen({
    super.key,
  }); // Constructor con clave opcional para optimizar el widget

  @override
  Widget build(BuildContext context) {
    // Scaffold crea la estructura visual de la pantalla
    return Scaffold(
      appBar: AppBar(
        // Barra superior de la app
        title: const Text(
          "Cruz del sur clinica", // Texto que aparece en el AppBar
          style: TextStyle(
            color: Color.fromARGB(
              255,
              245,
              245,
              245,
            ), // Color del texto del AppBar (blanco claro)
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

      // Body = contenido principal de la pantalla
      body: SafeArea(
        // SafeArea evita que el contenido quede tapado por la barra de estado o el notch
        child: Center(
          // Centra el contenido horizontal y verticalmente
          child: SingleChildScrollView(
            // Permite hacer scroll si el contenido es más grande que la pantalla
            padding: const EdgeInsets.all(16), // Margen alrededor del contenido
            child: ConstrainedBox(
              // Restringe el ancho máximo del contenido (para pantallas grandes como tablets)
              constraints: const BoxConstraints(maxWidth: 420),

              // Caja que envuelve al contenido del login
              child: Container(
                padding: const EdgeInsets.all(20), // Espaciado interno
                decoration: BoxDecoration(
                  color: const Color.fromARGB(
                    255,
                    255,
                    255,
                    255,
                  ), // Color de fondo de la caja (blanco)
                  borderRadius: BorderRadius.circular(20), // Bordes redondeados
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(
                        0.1,
                      ), // Color de la sombra
                      blurRadius: 8, // Difuminado de la sombra
                      offset: const Offset(0, 4), // Posición de la sombra
                    ),
                  ],
                ),

                // Contenido de la caja
                child: const Column(
                  mainAxisSize:
                      MainAxisSize.min, // Ocupa solo el espacio necesario
                  children: [
                    Text(
                      "Bienvenido", // Texto de bienvenida
                      style: TextStyle(
                        fontSize: 24, // Tamaño de la fuente
                        fontWeight: FontWeight.bold, // Texto en negrita
                        color: Color.fromARGB(
                          255,
                          7,
                          7,
                          112,
                        ), // Color azul oscuro
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ), // Espacio entre el texto y el formulario
                    LoginFields(), // Aquí se insertan los campos de login definidos en otro archivo
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
