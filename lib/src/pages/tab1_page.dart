import 'package:discourse/src/services/topics_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Tab1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final topicsService = Provider.of<TopicsService>(context);

    return Scaffold(
      body: Center(
        child: Text('Listado de Topics'),
      ),
    );
  }
}
