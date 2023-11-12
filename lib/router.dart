import 'package:go_router/go_router.dart';
import 'package:reakt_admin/routes/authentication_route.dart';
import 'package:reakt_admin/routes/home_route.dart';
import 'package:reakt_admin/routes/login_route.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => const AuthRouter(),
      redirect: AuthRouter.redirect,
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginRoute(),
      routes: <RouteBase>[
        // GoRoute(
        //   path: 'verification',
        //   builder: (context, state) => const Verification(),
        //   redirect: Verification.redirect,
        // )
      ],
    ),
    GoRoute(
      path: '/dashboard',
      builder: (context, state) => const HomeRoute(),
    )
  ],
);
