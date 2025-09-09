import 'package:flutter/material.dart';
import 'package:prueba_flutter/task_screen.dart';

// Widget con estado que maneja el formulario de inicio de sesión
class LoginFields extends StatefulWidget {
  const LoginFields({super.key}); // Constructor con clave opcional

  @override
  State<LoginFields> createState() => _LoginFieldsState(); // Crea el estado
}

class _LoginFieldsState extends State<LoginFields> {
  // --- Controladores y llaves ---
  final _formKey =
      GlobalKey<FormState>(); // Llave global para validar el formulario
  final _emailCtrl =
      TextEditingController(); // Controlador para el campo de email
  final _passCtrl =
      TextEditingController(); // Controlador para el campo de contraseña

  // --- Variables de estado ---
  bool _obscure = true; // Para ocultar o mostrar la contraseña
  bool _loading = false; // Indica si está cargando
  String? _error; // Guarda un mensaje de error si algo falla

  @override
  void dispose() {
    // Libera los recursos de los controladores cuando el widget se destruye
    _emailCtrl.dispose();
    _passCtrl.dispose();
    super.dispose();
  }

  // Método que se ejecuta al presionar "Ingresar"
  Future<void> _submit() async {
    FocusScope.of(context).unfocus(); // Oculta el teclado
    final ok = _formKey.currentState?.validate() ?? false; // Valida los campos
    if (!ok) return; // Si la validación falla, no continúa

    // Activa modo cargando
    setState(() {
      _loading = true;
      _error = null;
    });

    try {
      // Simula una llamada de autenticación (ejemplo: API o base de datos)
      await Future.delayed(const Duration(milliseconds: 800));

      if (!mounted)
        return; // Seguridad: evita usar context si el widget ya no existe

      // Navega a la pantalla principal, pasando el correo como parámetro
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => TaskScreen(email: _emailCtrl.text)),
      );
    } catch (e) {
      // Si ocurre un error (red, credenciales, etc.)
      if (!mounted) return;
      setState(() => _error = 'Credenciales inválidas o error de red');

      // Muestra un mensaje emergente (SnackBar)
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No pudimos iniciar sesión')),
      );
    } finally {
      // Siempre se ejecuta al final, apaga el modo "cargando"
      if (mounted) {
        setState(() => _loading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // Construye la parte visual del formulario
    return AutofillGroup(
      // Agrupa campos que permiten autocompletar (email, password)
      child: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode
            .onUserInteraction, // Valida automáticamente mientras escribe
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.stretch, // Estira al ancho total
          mainAxisSize: MainAxisSize.min, // Ocupa el espacio mínimo
          children: [
            // Logo de la clínica
            Center(
              child: Image.network(
                "https://i.ibb.co/FbgGfFFr/logo-clinica.png",
                height: 100,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 16),

            // --- Campo de correo ---
            TextFormField(
              enabled: !_loading, // Deshabilita si está cargando
              controller: _emailCtrl,
              keyboardType: TextInputType.emailAddress, // Teclado de correo
              textCapitalization: TextCapitalization.none,
              autocorrect: false,
              enableSuggestions: true,
              autofillHints: const [AutofillHints.email],
              decoration: const InputDecoration(
                labelText: "Ingresa tu correo",
                hintText: "usuario@correo.com",
                prefixIcon: Icon(Icons.email_outlined),
                border: OutlineInputBorder(),
              ),
              validator: (v) {
                final value = v?.trim() ?? '';
                if (value.isEmpty) return "Ingresa tu email";
                final emailOk = RegExp(r'^\S+@\S+\.\S+$').hasMatch(value);
                return emailOk ? null : "Email inválido";
              },
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
            ),
            const SizedBox(height: 12),

            // --- Campo de contraseña ---
            TextFormField(
              enabled: !_loading,
              controller: _passCtrl,
              obscureText: _obscure, // Oculta el texto
              enableSuggestions: false,
              autocorrect: false,
              autofillHints: const [AutofillHints.password],
              decoration: InputDecoration(
                labelText: "Ingresa tu contraseña",
                border: const OutlineInputBorder(),
                prefixIcon: const Icon(Icons.lock_outline),
                suffixIcon: IconButton(
                  // Botón para mostrar/ocultar contraseña
                  onPressed: () => setState(() => _obscure = !_obscure),
                  icon: Icon(
                    _obscure ? Icons.visibility : Icons.visibility_off,
                  ),
                  tooltip: _obscure ? "Mostrar" : "Ocultar",
                ),
              ),
              validator: (v) {
                if (v == null || v.isEmpty) return "Ingrese la contraseña";
                if (v.length < 6) return "Mínimo 6 caracteres";
                return null;
              },
              textInputAction: TextInputAction.done,
              onFieldSubmitted: (_) => _submit(),
            ),
            const SizedBox(height: 8),

            // --- Mensaje de error (si ocurre) ---
            if (_error != null)
              Text(
                _error!,
                style: const TextStyle(color: Color.fromARGB(255, 7, 7, 112)),
                textAlign: TextAlign.center,
              ),
            const SizedBox(height: 16),

            // --- Botón Ingresar ---
            SizedBox(
              height: 48,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 7, 7, 112),
                  foregroundColor: Colors.white,
                ),
                onPressed: _loading ? null : _submit,
                child: _loading
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Colors.white,
                          ),
                        ),
                      )
                    : const Text("Ingresar"),
              ),
            ),
            const SizedBox(height: 8),

            // --- Botón "¿Olvidaste tu contraseña?" ---
            TextButton(
              onPressed: _loading
                  ? null
                  : () {
                      // Aquí podrías abrir otra pantalla para recuperar contraseña
                    },
              child: const Text("¿Olvidaste tu contraseña?"),
            ),
          ],
        ),
      ),
    );
  }
}
