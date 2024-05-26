import 'package:auto_route/auto_route.dart';

import '../../presentation/screens/profile/profile_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes {
    return [
      AutoRoute(
        page: ProfileRoute.page,
      ),
    ];
  }
}
