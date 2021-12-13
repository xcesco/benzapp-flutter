import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MainScreenState();
  }
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Main page'),
          ),
          bottomNavigationBar: _buildMenu(),
          body: const TabBarView(
            children: <Widget>[Text('text1'), Text('text2'), Text('text3')],
          ),
        ));
  }

  Widget _buildMenu() {
    return Container(
      color: Colors.blue,
      child: const TabBar(
        tabs: <Widget>[
          Tab(
            icon: Icon(
              Icons.category,
            ),
            text: 'Categories',
          ),
          Tab(
            icon: Icon(
              Icons.category,
            ),
            text: '111',
          ),
          Tab(
            icon: Icon(
              Icons.star,
            ),
            text: 'Favorites',
          ),
        ],
      ),
    );
  }
}
