import 'package:discourse/src/theme/color_appbar.dart';
import 'package:discourse/src/widgets/bar_desing.dart';
import 'package:flutter/material.dart';

class Tab2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppBar(
          flexibleSpace: ColorAppBar(),
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
