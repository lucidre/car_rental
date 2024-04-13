import 'package:car_rental/common_libs.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Screen,Route',
)
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: OnboardingRoute.page,
          initial: true,
        ),
        CustomRoute(
          page: HomeRoute.page,
          transitionsBuilder: buildPageTransitions,
        ),
        CustomRoute(
          page: DetailsRoute.page,
          transitionsBuilder: buildPageTransitions2,
        ),
        CustomRoute(
          page: ProfileRoute.page,
          transitionsBuilder: buildPageTransitions3,
        ),
      ];
}

Widget buildPageTransitions(
  BuildContext context,
  Animation<double> animation,
  Animation<double> secondaryAnimation,
  Widget child,
) {
  return SlideTransition(
    position: Tween<Offset>(
      begin: const Offset(1.0, 0.0),
      end: Offset.zero,
    ).animate(animation),
    child: child,
  );
}

Widget buildPageTransitions2(
  BuildContext context,
  Animation<double> animation,
  Animation<double> secondaryAnimation,
  Widget child,
) {
  return SlideTransition(
    position: Tween<Offset>(
      begin: const Offset(0.0, -1.0),
      end: Offset.zero,
    ).animate(animation),
    child: child,
  );
}

Widget buildPageTransitions3(
  BuildContext context,
  Animation<double> animation,
  Animation<double> secondaryAnimation,
  Widget child,
) {
  return FadeTransition(
    opacity: Tween<double>(
      begin: 0,
      end: 1,
    ).animate(animation),
    child: SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(0.0, 0.5),
        end: Offset.zero,
      ).animate(animation),
      child: child,
    ),
  );
}
