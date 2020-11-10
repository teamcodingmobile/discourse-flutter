import 'package:discourse/src/pages/create_topic_page.dart';
import 'package:discourse/src/services/topics_service.dart';

import 'package:flutter/material.dart';
import 'package:discourse/src/theme/base_theme.dart';
import 'package:discourse/src/pages/tabs_page.dart';
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
      ],
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          'tab1page': (_) => Tab1Page(),
          'createTopicPage': (_) => CreateTopicPage(),
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
