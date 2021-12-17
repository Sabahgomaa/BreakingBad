import 'package:breaking_bad/app_router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(BreakingBadApp(
    appRouter: AppRouter(),
  ));
}

class BreakingBadApp extends StatelessWidget {
  final AppRouter appRouter;

  BreakingBadApp(
      {required this.appRouter}); // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: appRouter.generateRoute);
  }
}
