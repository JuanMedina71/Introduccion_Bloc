import 'package:flutter/material.dart';
import 'package:forms_app/presentation/widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nuevo Usuario'),
      ),
      body: const _RegisterView(),
    );
  }
}

class _RegisterView extends StatelessWidget {
  const _RegisterView();

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child:  Padding(
        padding:  EdgeInsets.symmetric(horizontal: 10),
        child:  SingleChildScrollView(
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children:  [
              FlutterLogo(size: 100),
              _RegisterForm(),
              SizedBox(height: 40),
              SizedBox(height: 20)
            ],
          ),
        ),
      ),
    );
  }
}

class _RegisterForm extends StatefulWidget {
  const _RegisterForm();

  @override
  State<_RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<_RegisterForm> {
  
  // Me permite enlazar el key con el form lo cual me permite tener el control de todo el form con ese key.

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? username = '';
  String? email = '';
  String? password = '';



  @override
  Widget build(BuildContext context) {
    return Form(
     key: _formKey,
        child: Column(
      children: [
        
        const SizedBox(height: 20),

        CustomTextField(
          label: 'Nombre de usuario',
          onChanged: (value) => username = value,
          validator: (value) {
            if(value == null || value.isEmpty) return 'Campo requerido';
            if(value.trim().isEmpty) return 'Campo requerido';
            if(value.length < 6 ) return 'El usuario debe tener más de 6 letras';
            return null;
          },
        ), 
        const SizedBox(height: 20),
        CustomTextField(
          label: 'Correo electronico',
          onChanged: (value) => email = value,
          validator: (value) {
            if(value == null || value.isEmpty) return 'Campo requerido';
            if(value.trim().isEmpty) return 'Campo requerido';
           final emailRegExp = RegExp(
              r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
            );
            if(!emailRegExp.hasMatch(value)) return 'Formato de correo inválido.';
            return null;
          },
        ),

        const SizedBox(height: 20),
        CustomTextField(
          label: 'Contraseñas',
          obscureText: true,
          onChanged: (value) => password = value,
          validator: (value) {
            if(value == null || value.isEmpty) return 'Campo requerido';
            if(value.trim().isEmpty) return 'Campo requerido';
            if(value.length < 6 ) return 'El usuario debe tener más de 6 letras';
            return null;
          },
        ),

        const SizedBox(height: 20),
        FilledButton.tonalIcon(
          onPressed: () {
            final isValid = _formKey.currentState!.validate();
            if( !isValid ) return;

          },
          icon: const Icon(Icons.save),
          label: const Text('Crear Usuario'),
        ),
      ],
    ));
  }
}
