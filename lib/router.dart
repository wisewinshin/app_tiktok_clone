import 'package:go_router/go_router.dart';
import 'package:tiktok_clone/features/authentication/birthday_screen.dart';
import 'package:tiktok_clone/features/authentication/email_screen.dart';
import 'package:tiktok_clone/features/authentication/login_screen.dart';
import 'package:tiktok_clone/features/authentication/sign_up_screen.dart';
import 'package:tiktok_clone/features/authentication/username_screen.dart';

final router = GoRouter(routes: [
  GoRoute(
    path: SignUpScreen.routeURL,
    builder: (context, state) => const SignUpScreen(),
    routes: [
      GoRoute(
        path: UsernameScreen.routeURL,
        name: UsernameScreen.routeName,
        builder: (context, state) => const UsernameScreen(),
        routes: [
          GoRoute(
            path: EmailScreen.routeURL,
            name: EmailScreen.routeName,
            builder: (context, state) => const EmailScreen(),
          ),
        ],
      ),
    ],
  ),
  GoRoute(
    path: LoginScreen.routeURL,
    builder: (context, state) => const LoginScreen(),
  ),
  GoRoute(
    path: EmailScreen.routeURL,
    builder: (context, state) => const EmailScreen(),
  ),
  GoRoute(
    path: UsernameScreen.routeURL,
    builder: (context, state) => const UsernameScreen(),
  ),
  GoRoute(
    path: BirthdayScreen.routeURL,
    builder: (context, state) => const BirthdayScreen(),
  ),
]);
