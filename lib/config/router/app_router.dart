import 'package:forms_app/presentation/screens.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/cubits',
      builder: (context, state) => const CubitCounterScreen(),
    ),
    GoRoute(
      path: '/counter-block',
      builder: (context, state) => const BlocCounterScreen(),
    ),
    GoRoute(
      path: '/new-user',
      builder: (context, state) => const RegisterScreen(),
    ),
  ],
);
