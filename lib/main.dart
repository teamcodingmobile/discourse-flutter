import 'package:discourse/src/pages/create_account_page.dart';
import 'package:discourse/src/pages/create_topic_page.dart';
import 'package:discourse/src/pages/detail_topic_page.dart';
import 'package:discourse/src/pages/forgot_page.dart';
import 'package:discourse/src/pages/home_page.dart';
import 'package:discourse/src/pages/login_page.dart';
import 'package:discourse/src/pages/tabs_page.dart';
import 'package:discourse/src/services/topics_service.dart';
import 'package:discourse/src/services/users_service.dart';

import 'package:flutter/material.dart';
import 'package:discourse/src/theme/base_theme.dart';
import 'package:provider/provider.dart';

import 'src/pages/tab1_page.dart';

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
        routes: {
          'home': (_) => HomePage(),
          'login': (_) => LoginPage(),
          'forgot': (_) => ForgotPage(),
          'createAccount': (_) => CreateAccountPage(),
          //'tabspage': (_) => TabsPage(),
          'tab1page': (_) => Tab1Page(),
          'createTopicPage': (_) => CreateTopicPage(),
          'detailTopicPage': (_) => DetailTopicPage()
        },
        title: 'Discourse',
        debugShowCheckedModeBanner: false,
        theme: myTheme,
        home: Scaffold(
          body: TabsPage(),
        ),
      ),
    );
  }
}
