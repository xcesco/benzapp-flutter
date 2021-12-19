import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeFragment extends StatefulWidget {
  const HomeFragment({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HomeFragmentState();
  }
}

class _HomeFragmentState extends State<HomeFragment> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            flex: 2, // 20%
            child: Padding(
              padding: EdgeInsets.fromLTRB(8, 8, 8, 24),
              child: Container(
                constraints: const BoxConstraints.expand(),
                child: Card(
                  elevation: 8,
                  child: OutlinedButton.icon(
                      onPressed: () => {},
                      icon:
                          const Icon(Icons.directions_car, color: Colors.blue),
                      label: const Text('')),
                ),
              ),
            )),
        Expanded(
            flex: 2, // 20%
            child: Padding(
              padding: EdgeInsets.fromLTRB(8, 8, 8, 24),
              child: Container(
                constraints: const BoxConstraints.expand(),
                child: Card(
                  elevation: 8,
                  child: OutlinedButton.icon(
                      onPressed: () => {},
                      icon:
                      const Icon(Icons.local_gas_station, color: Colors.blue),
                      label: const Text('')),
                ),
              ),
            )),
      ],
    );
  }
}
