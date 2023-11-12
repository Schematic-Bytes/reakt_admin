import 'package:go_router/go_router.dart';
import 'package:polytec/routes/authetication.dart';
import 'package:polytec/routes/home_route.dart';
import 'package:polytec/routes/login_route.dart';
import 'package:polytec/routes/verification_route.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => const AuthRouter(),
      redirect: AuthRouter.redirect,
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginPage(),
      routes: <RouteBase>[
        GoRoute(
          path: 'verification',
          builder: (context, state) => const Verification(),
          redirect: Verification.redirect,
        )
      ],
    ),
    GoRoute(
      path: '/dashboard',
      builder: (context, state) => const HomePage(),
    )
  ],
);
