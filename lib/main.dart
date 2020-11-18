import 'package:discourse/src/pages/home_page.dart';

import 'package:discourse/src/routes/routes.dart';
import 'package:discourse/src/services/topics_service.dart';
import 'package:discourse/src/services/users_service.dart';

import 'package:flutter/material.dart';
import 'package:discourse/src/theme/base_theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => new TopicsService()),
        ChangeNotifierProvider(create: (context) => new UsersService()),
      ],
      child: MaterialApp(
        initialRoute: '/',
        routes: appRoutes,
        title: 'Discourse',
        debugShowCheckedModeBanner: false,
        theme: myTheme,
        home: Scaffold(
          body: HomePage(), //HomePage(), //TabsPage(),
        ),
      ),
    );
  }
}
