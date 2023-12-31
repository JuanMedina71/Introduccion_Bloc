import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/register/register_cubit.dart';
import 'package:forms_app/presentation/widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(    
      appBar: AppBar(
        title: const Text('Nuevo Usuario'),
      ),
      body: BlocProvider(
        create: (context) => RegisterCubit(),
        child: const _RegisterView(),
      ) 
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




  @override
  Widget build(BuildContext context) {
  
  final registerCubit = context.watch<RegisterCubit>();
  final username = registerCubit.state.username;
  final email = registerCubit.state.email;
  final password = registerCubit.state.password;

    return Form(
        child: Column(
      children: [
        
        const SizedBox(height: 20),

        CustomTextField(
          label: 'Nombre de usuario',
          onChanged: registerCubit.usernameChanged,
          errorMessage: username.errorMessage,
          ), 
        const SizedBox(height: 20),

        CustomTextField(
          label: 'Correo electronico',
          onChanged: registerCubit.emailChanged,
          errorMessage:  email.errorMessage,
        ),

        const SizedBox(height: 20),
        CustomTextField(
          label: 'Contraseña',
          obscureText: true,
          onChanged: registerCubit.passwordChanged,
          errorMessage: password.errorMessage,    
        ),

        const SizedBox(height: 20),
        FilledButton.tonalIcon(
          onPressed: () {
            registerCubit.onSumbit();
          },
          icon: const Icon(Icons.save),
          label: const Text('Crear Usuario'),
        ),
      ],
    ));
  }
}
