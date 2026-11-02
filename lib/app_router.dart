import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'features/welcome/welcome_screen.dart';
import 'features/auth/sign_in_screen.dart';
import 'features/home/home_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/welcome',
  routes: [
    GoRoute(path: '/welcome', builder: (context, state) => const WelcomeScreen()),
    GoRoute(path: '/sign-in', builder: (context, state) => const SignInScreen()),
    GoRoute(path: '/home', builder: (context, state) => const HomeScreen()),
  ],
  errorBuilder: (context, state) => Scaffold(
    body: Center(child: Text('Page not found: ${state.uri}')),
  ),
);
