import 'package:flutter/material.dart';
import 'package:numbers/screens/home_screen.dart';
import 'package:numbers/services/numbers_service.dart';
import 'package:numbers/widgets/page_view_screens.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

void main() => runApp(const AppState());

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'page_view_screens',
          builder: (BuildContext context, GoRouterState state) {
            return const PageViewScreen();
          },
        ),
      ],
    ),
  ],
);

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => NumbersService(),
        )
      ],
      child: const MyAppNumbers(),
    );
  }
}

class MyAppNumbers extends StatelessWidget {
  const MyAppNumbers({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
    );
  }
}
