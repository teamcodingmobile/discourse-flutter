import 'package:discourse/src/pages/create_account_page.dart';
import 'package:discourse/src/pages/create_topic_page.dart';
import 'package:discourse/src/pages/detail_topic_page.dart';
import 'package:discourse/src/pages/forgot_page.dart';
import 'package:discourse/src/pages/home_page.dart';
import 'package:discourse/src/pages/login_page.dart';
import 'package:discourse/src/pages/tab1_page.dart';
import 'package:discourse/src/pages/tabs_page.dart';
import 'package:flutter/material.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  'home': (_) => HomePage(),
  'login': (_) => LoginPage(),
  'forgot': (_) => ForgotPage(),
  'createAccount': (_) => CreateAccountPage(),
  'tabspage': (_) => TabsPage(),
  'tab1page': (_) => Tab1Page(),
  'createTopicPage': (_) => CreateTopicPage(),
  'detailTopicPage': (_) => DetailTopicPage()
};
