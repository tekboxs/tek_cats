import 'package:flutter/material.dart';

import '../pages/home/home_page.dart';

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
