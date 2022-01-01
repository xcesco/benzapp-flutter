import 'package:benzapp_flutter/app_debug.dart';
import 'package:benzapp_flutter/ui/login/login_screen.dart';
import 'package:benzapp_flutter/ui/stations/stations_map_fragment.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../home/home_fragment.dart';
import '../stations/stations_list_fragment.dart';

class MainScreen extends StatefulWidget {
  static String routeName = '/';

  const MainScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MainScreenState();
  }
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) =>
      _buildDefaultTabController(context, AppLocalizations.of(context)!);

  DefaultTabController _buildDefaultTabController(
      BuildContext context, AppLocalizations localization) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          drawer: _buildDrawer(context),
          appBar: AppBar(
            elevation: 0,
            title: Text(localization.title),
            actions: <Widget>[
              PopupMenuButton(
                onSelected: (String selectedValue) {
                  switch (selectedValue) {
                    case "logout":
                      Navigator.pushReplacementNamed(
                          context, LoginScreen.routeName);
                      break;
                  }
                  setState(() {
                    AppDebug.log(selectedValue);
                  });
                },
                icon: const Icon(
                  Icons.more_vert,
                ),
                itemBuilder: (_) => [
                  PopupMenuItem(
                    child: Text(localization.mainMenuLogout),
                    value: 'logout',
                  ),
                  const PopupMenuItem(
                    child: Text('Show All'),
                    value: 'b',
                  ),
                ],
              ),
            ],
          ),
          bottomNavigationBar: _buildMenu(context),
          body: Material(elevation: 5, child: _buildBody(context)),
        ));
  }

  @override
  void initState() {
    FirebaseMessaging.onMessage.listen((RemoteMessage event) {
      print("message received");
      print(event.notification!.body);
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Notification"),
              content: Text(event.notification!.body!),
              actions: [
                TextButton(
                  child: Text("Ok"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          });
    });
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      AppDebug.log('Message clicked!');
    });
  } //https://stackoverflow.com/questions/53299232/elevation-not-working-on-flutter-material

  Widget _buildBody(BuildContext context) {
    return const Material(
        color: Colors.blue,
        child: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            HomeFragment(),
            StationsMapFragment(),
            StationsListFragment()
          ],
        ));
  }

  Widget _buildMenu(BuildContext context) {
    final AppLocalizations localization = AppLocalizations.of(context)!;
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

  Widget _buildDrawer(BuildContext context) {
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
