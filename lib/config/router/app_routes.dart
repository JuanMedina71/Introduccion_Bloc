
import 'package:forms_app/presentation/screens/screens.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  routes: [

      //path home que permite que si una ruta no existe lleguemos a la ruta por defecto. 
    GoRoute(
      path: '/',
      builder:(context, state) => const HomeScreen(), 
    ),

//TODO: Aun falta definir esta ruta.
    GoRoute(
      path: '/cubits',
      builder:(context, state) => const CubitCounterScreen(), 
    ),
    GoRoute(
      path: '/counter-bloc',
      builder:(context, state) => const BlocCounterScreen(), 
    ),
  ] 
);