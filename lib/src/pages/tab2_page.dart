import 'package:discourse/src/widgets/bar_desing.dart';
import 'package:flutter/material.dart';

class Tab2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppBar(
          flexibleSpace: _ColorAppBar(),
          title: Column(
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 80.0),
                  child: ListTile(
                    title: Text('Search', style: TextStyle(fontSize: 20)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          BarDesing(),
        ],
      ),
    );
  }
}

class _ColorAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[
            Color.fromRGBO(255, 192, 203, 1),
            Color.fromRGBO(242, 232, 143, 1),
          ])),
    );
  }
}
