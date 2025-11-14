import 'package:flutter/material.dart';
import 'package:world/app/router/app_router.dart';
import 'package:world/app/service/service_locator.dart';

void main() {
  setupLocator();   
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
    );
  }
}
