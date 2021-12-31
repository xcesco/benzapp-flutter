import 'package:benzapp_flutter/repositories/model/refueling.dart';
import 'package:benzapp_flutter/ui/home/home_view_model.dart';
import 'package:benzapp_flutter/ui/refuelings/refueling_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RefuelingScreen extends StatefulWidget {
  const RefuelingScreen({Key? key}) : super(key: key);

  static const String routeName = '/refuelings';

  @override
  State<StatefulWidget> createState() {
    return RefuelingScreenState();
  }
}

class RefuelingScreenState extends State<RefuelingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Elenco rifornimenti'),
        ),
        body: Container(
            color: Colors.white,
            child: Consumer<HomeViewModel>(
                builder: (BuildContext context, HomeViewModel viewModel, Widget? child) =>
                    FutureBuilder<List<Refueling>>(
                      future: viewModel.getRifornimenti(),
                      initialData: const <Refueling>[],
                      builder: (BuildContext buildContext, AsyncSnapshot<List<Refueling>> snapshot) =>
                          ListView.separated(
                        separatorBuilder: (BuildContext context, int index) => const Divider(
                          color: Colors.grey,
                        ),
                        itemBuilder: (BuildContext context, int position) => RefuelingItem(snapshot.data![position]),
                        itemCount: snapshot.data!.length,
                      ),
                    ))));
  }
}
