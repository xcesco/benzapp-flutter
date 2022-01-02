import 'package:benzapp_flutter/repositories/model/refueling.dart';
import 'package:benzapp_flutter/ui/home/home_view_model.dart';
import 'package:benzapp_flutter/ui/refuelings/refueling_detail_screen.dart';
import 'package:benzapp_flutter/ui/refuelings/refueling_item_widget.dart';
import 'package:benzapp_flutter/ui/refuelings/refueling_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../main.dart';

class RefuelingListScreen extends StatefulWidget {
  const RefuelingListScreen({Key? key}) : super(key: key);

  static const String routeName = '/refuelings';

  @override
  State<StatefulWidget> createState() {
    return RefuelingListScreenState();
  }
}

class RefuelingListScreenState extends State<RefuelingListScreen> {
  @override
  Widget build(BuildContext context) {
    final ScreenArguments args =
        ModalRoute.of(context)!.settings.arguments as ScreenArguments;
    final AppLocalizations localization = AppLocalizations.of(context)!;

    return Scaffold(
        appBar: AppBar(
          title: Text(localization.refuelingList),
        ),
        body: Container(
            color: Colors.white,
            child: Consumer<RefuelingViewModel>(
                builder: (BuildContext context, RefuelingViewModel viewModel,
                        Widget? child) =>
                    FutureBuilder<List<Refueling>>(
                      future: (args.title!=null) ? viewModel.loadDataByTarga(args.title!) : viewModel.loadData(),
                      initialData: const <Refueling>[],
                      builder: (BuildContext buildContext,
                              AsyncSnapshot<List<Refueling>> snapshot) =>
                          ListView.separated(
                        separatorBuilder: (BuildContext context, int index) =>
                            const Divider(
                          color: Colors.grey,
                        ),
                        itemBuilder: (BuildContext context, int position) =>
                            RefuelingItem(snapshot.data![position],(Refueling item) {
                              Navigator.pushNamed(
                                  context, RefuelingDetailScreen.routeName,
                                  arguments: ScreenArguments(
                                      id: item.id, title: item.targa));
                            }),
                        itemCount: snapshot.data!.length,
                      ),
                    ))));
  }
}
