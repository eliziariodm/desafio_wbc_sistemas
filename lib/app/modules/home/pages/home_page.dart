import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controllers/reserved_controller.dart';
import '../components/body_component.dart';
import '../components/drawer_component.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<ReservedController>().openBoxReserved();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 150,
        actions: [
          Container(
            padding: const EdgeInsets.fromLTRB(0, 50, 20, 0),
            child: Text(
              'Clube.on',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
        ],
      ),
      drawer: const DrawerComponent(),
      body: const BodyComponent(),
    );
  }
}
