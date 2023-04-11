import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controllers/grills_controller.dart';
import '../widgets/texformfield_widget.dart';

class RentPage extends StatelessWidget {
  const RentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: const TextFormFieldWidget(),
      ),
      body: Consumer<GrillsController>(
        builder: (_, grills, __) {
          return ListView.builder(
            itemCount: grills.grillsList.length,
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 5,
                ),
                child: Column(
                  children: [
                    Text(
                      grills.grillsList[index].product,
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
