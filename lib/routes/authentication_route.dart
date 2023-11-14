import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:reakt_admin/services/authentication.dart';

class AuthRouter extends StatelessWidget {
  const AuthRouter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }

  static String redirect(BuildContext context, GoRouterState state) {
    final auth = context.read<AuthenticationService>();

    if (auth.currentUser != null) {
      return "/dashboard";
    } else {
      return "/intro";
    }
  }
}
