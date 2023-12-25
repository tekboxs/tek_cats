import 'package:flutter/material.dart';

import 'constants.dart';

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
