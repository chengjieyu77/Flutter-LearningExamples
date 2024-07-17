import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ulearningm_app/config/routes/app_routes.dart';
import 'package:ulearningm_app/config/routes/route_location.dart';

final routesProvider = Provider<GoRouter>((ref) {
  return GoRouter(
      initialLocation: RouteLocation.welcome,
      navigatorKey: navigationKey,
      routes: appRoutes);
});
