import 'dart:async';

import 'package:benzapp_flutter/app_debug.dart';
import 'package:benzapp_flutter/repositories/model/notification.dart'
    as AppNotification;
import 'package:benzapp_flutter/ui/home/home_view_model.dart';
import 'package:benzapp_flutter/ui/login/login_screen.dart';
import 'package:benzapp_flutter/ui/stations/stations_map_fragment.dart';
import 'package:benzapp_flutter/ui/widgets/app_commons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../home/home_fragment.dart';
import '../stations/stations_list_fragment.dart';

class MainScreen extends StatefulWidget {
  static String routeName = '/main';

  const MainScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MainScreenState();
  }
}

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    AppDebug.log("Cccccc---------------");
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));

    final HomeViewModel viewModel =
        Provider.of<HomeViewModel>(context, listen: false);

    _subscription = viewModel
        .getNotifiche()
        .listen((List<AppNotification.Notification> event) {
      if (event.isEmpty) {
        AppDebug.log('Main screen riceve #${event.length} messaggi');
      } else {
        final int messageId = event.last.id!;

        AppDebug.log(
            'Main screen riceve #${event.length} (id: $messageId) NON DUPLICATI $messageId msg: ${event.last.messaggio} ');

        showInSnackBar(context, event[event.length - 1].messaggio);
        viewModel.updateData(show: true);
      }
    });

    super.initState();
  }

  StreamSubscription<List<AppNotification.Notification>>? _subscription;

  @override
  Widget build(BuildContext context) => Consumer<HomeViewModel>(
      builder: (BuildContext context, HomeViewModel viewModel, Widget? child) =>
          _buildDefaultTabController(
              context, viewModel, AppLocalizations.of(context)!));

  DefaultTabController _buildDefaultTabController(BuildContext context,
      HomeViewModel viewModel, AppLocalizations localization) {
    if (viewModel.isLoading) {
      _animationController.repeat();
    } else {
      _animationController.reset();
    }

    return DefaultTabController(
        length: 3,
        child: Scaffold(
          drawer: _buildDrawer(context),
          appBar: AppBar(
            elevation: 0,
            title: Text(localization.title),
            actions: <Widget>[
              AnimatedBuilder(
                animation: _animationController,
                child: IconButton(
                    icon: const Icon(Icons.refresh),
                    tooltip: localization.refresh,
                    onPressed: () {
                      showInSnackBar(context, 'Aggiornamento in corso');
                      viewModel.updateData(show: true);
                    }),
                builder: (BuildContext context, Widget? _widget) {
                  return Transform.rotate(
                    angle: _animationController.value * 20,
                    child: _widget,
                  );
                },
              ),
              PopupMenuButton(
                onSelected: (String selectedValue) {
                  switch (selectedValue) {
                    case "logout":
                      viewModel.logout().then((_) {
                        Navigator.pushReplacementNamed(
                            context, LoginScreen.routeName);
                      });

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
  void dispose() {
    _subscription?.cancel();
    _animationController.dispose();
    super.dispose();
  }

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
