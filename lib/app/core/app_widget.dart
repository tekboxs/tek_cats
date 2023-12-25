import 'package:flutter/material.dart';
import 'package:tek_cats/app/pages/home/home_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Kpages.home.route,
      routes: routes,
      theme: ThemeData(useMaterial3: true, primaryColor: Colors.indigo),
    );
  }
}

Map<String, WidgetBuilder> routes = {
  Kpages.home.route: (_) => const HomePage(),
};

abstract class EnumRouteAdapter {
  String get route;
}

enum Kpages implements EnumRouteAdapter {
  home;

  const Kpages();
  @override
  String get route => '/$name';
}
