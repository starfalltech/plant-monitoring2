import 'package:auto_route/auto_route.dart';
import 'package:plant_client/presentation/pages/pages.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          initial: true,
          page: SplashRoute.page,
        ),
        CustomRoute(
          path: '/home-page',
          transitionsBuilder: TransitionsBuilders.slideLeft,
          durationInMilliseconds: 400,
          page: HomeRoute.page,
        ),
      ];
}
