import 'package:benzapp_flutter/viewmodels/station_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../home_fragment.dart';
import '../stations_list_fragment.dart';
import '../stations_map_fragment.dart';

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
    final localization = AppLocalizations.of(context)!;
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          drawer: _buildDrawer(context),
          appBar: AppBar(
            elevation: 0,
            title: Text(localization.title),
          ),
          bottomNavigationBar: _buildMenu(context),
          body: Material(elevation: 5, child: _buildBody(context)),
        ));
  }

  //https://stackoverflow.com/questions/53299232/elevation-not-working-on-flutter-material
  Widget _buildBody(BuildContext context) {
    return ChangeNotifierProvider<StationsViewModel>(
        create: _create,
        child: const Material(
            color: Colors.blue,
            child: TabBarView(
              physics: NeverScrollableScrollPhysics(),
              children: <Widget>[
                HomeFragment(),
                StationsMapFragment(),
                StationsListFragment()
              ],
            )));
  }

  Widget _buildMenu(BuildContext context) {
    var localization = AppLocalizations.of(context)!;
    return Container(
        color: Colors.white,
        child: TabBar(
          indicatorColor: Colors.white,
          labelColor: Colors.blue,
          unselectedLabelColor: Colors.grey,
          tabs: <Widget>[
            Tab(
              icon: const Icon(
                Icons.home,
              ),
              text: localization.main_menu_home,
            ),
            Tab(
              icon: const Icon(
                Icons.map,
              ),
              text: localization.main_menu_map,
            ),
            Tab(
              icon: const Icon(
                Icons.list,
              ),
              text: localization.main_menu_stations,
            ),
          ],
        ));
  }

  StationsViewModel _create(context) {
    var model = StationsViewModel();
    model.loadData();
    return model;
  }

  _buildDrawer(BuildContext context) {
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('Drawer Header'),
          ),
          ListTile(
            title: const Text('Item 1'),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            title: const Text('Item 2'),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
        ],
      ),
    );
  }
}
