import 'package:discourse/src/pages/home_page.dart';
import 'package:discourse/src/pages/tab1_page.dart';
import 'package:discourse/src/pages/tab2_page.dart';
import 'package:discourse/src/pages/tab3_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TabsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new _NavigationModel(),
      child: Scaffold(
        body: _Pages(),
        bottomNavigationBar: _Navigation(),
      ),
    );
  }
}

class _Navigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navigationModel = Provider.of<_NavigationModel>(context);

    return BottomNavigationBar(
      currentIndex: navigationModel.actualPage,
      onTap: (i) => navigationModel.actualPage = i,
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.filter_list), title: Text('Topics')),
        BottomNavigationBarItem(
            icon: Icon(Icons.search), title: Text('Search')),
        BottomNavigationBarItem(
            icon: Icon(Icons.person_outline), title: Text('Profile')),
      ],
    );
  }
}

class _Pages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navigationModel = Provider.of<_NavigationModel>(context);

    return PageView(
      controller: navigationModel.pageController,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        HomePage(),
        Tab1Page(),
        Tab2Page(),
        Tab3Page(),
      ],
    );
  }
}

class _NavigationModel with ChangeNotifier {
  int _actualPage = 0;
  PageController _pageController = new PageController();

  int get actualPage => this._actualPage;
  set actualPage(int value) {
    this._actualPage = value;
    _pageController.animateToPage(value,
        duration: Duration(milliseconds: 250), curve: Curves.easeInCirc);
    notifyListeners();
  }

  PageController get pageController => this._pageController;
}
