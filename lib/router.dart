import 'package:go_router/go_router.dart';
import 'package:tiktok_clone/common/widgets/main_navigation_screen.dart';
import 'package:tiktok_clone/features/authentication/login_screen.dart';
import 'package:tiktok_clone/features/authentication/sign_up_screen.dart';
import 'package:tiktok_clone/features/onboarding/interest_screen.dart';

final router = GoRouter(routes: [
  GoRoute(
    name: SignUpScreen.routeName,
    path: SignUpScreen.routeURL,
    builder: (context, state) => const SignUpScreen(),
  ),
  GoRoute(
    name: LoginScreen.routeName,
    path: LoginScreen.routeURL,
    builder: (context, state) => const LoginScreen(),
  ),
  GoRoute(
    name: InterestingScreen.routeName,
    path: InterestingScreen.routeURL,
    builder: (context, state) => const InterestingScreen(),
  ),
  GoRoute(
    path: "/:tab(home|discover|inbox|profile)",
    name: MainNavigationScreen.routeName,
    builder: (context, state) {
      final tab = state.params["tab"]!;
      return MainNavigationScreen(tab: tab);
    },
  )
]);
