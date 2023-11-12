import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:polytec/services/service.dart';
import 'package:provider/provider.dart';

class AuthRouter extends StatelessWidget {
  const AuthRouter({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }

  static String redirect(BuildContext context, GoRouterState state) {
    final services = context.read<Services>();

    if (services.userService.isLoggedIn()) {
      return "/dashboard";
    }
    return "/login";
  }
}