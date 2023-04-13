import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controllers/grills_controller.dart';
import '../../../controllers/reserved_controller.dart';
import '../../../core/utils/debouncer.dart';
import '../widgets/texformfield_widget.dart';

class RentPage extends StatefulWidget {
  const RentPage({Key? key}) : super(key: key);

  @override
  State<RentPage> createState() => _RentPageState();
}

class _RentPageState extends State<RentPage> {
  final debouncer = Debouncer(milliseconds: 500);

  @override
  void initState() {
    super.initState();
    context.read<GrillsController>().getGrills('');
  }

  @override
  Widget build(BuildContext context) {
    final reservedController = Provider.of<ReservedController>(context);

    return Consumer<GrillsController>(
      builder: (_, grills, __) {
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: 100,
            title: TextFormFieldWidget(
              onChanged: ((value) {
                debouncer(() => grills.getGrills(value));
              }),
            ),
          ),
          body: LayoutBuilder(builder: (context, constraints) {
            return ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(height: 20),
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 20,
              ),
              itemCount: grills.grillsList.length,
              itemBuilder: (context, index) {
                final grill = grills.grillsList[index];

                return Container(
                  height: constraints.maxWidth < 400
                      ? constraints.maxHeight * 0.6
                      : constraints.maxHeight * 0.35,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 20,
                  ),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    border: Border.all(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Flexible(
                        flex: 2,
                        child: CachedNetworkImage(
                          fit: BoxFit.cover,
                          imageUrl: grill.image,
                          placeholder: (context, url) =>
                              CircularProgressIndicator(
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                          errorWidget: (context, url, error) => Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.error,
                                size: 40,
                                color: Theme.of(context).colorScheme.error,
                              ),
                              const SizedBox(height: 20),
                              Text(
                                'Não foi possível carregar a imagem!',
                                style: Theme.of(context).textTheme.displaySmall,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 5),
                      Flexible(
                        flex: 2,
                        child: Wrap(
                          runSpacing: constraints.maxWidth < 350 ? 10 : 20,
                          alignment: WrapAlignment.center,
                          children: [
                            Text(
                              grill.product,
                              style: Theme.of(context).textTheme.displayMedium,
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              'R\$ ${grill.price}',
                              style: Theme.of(context).textTheme.bodyMedium,
                              textAlign: TextAlign.center,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                reservedController.addReserved(grill);
                              },
                              style: ButtonStyle(
                                padding: MaterialStateProperty.all<EdgeInsets>(
                                  const EdgeInsets.all(13),
                                ),
                                backgroundColor: reservedController.reservedList
                                        .any((items) => items.id == grill.id)
                                    ? MaterialStateProperty.all<Color>(
                                        Theme.of(context).colorScheme.tertiary)
                                    : MaterialStateProperty.all<Color>(
                                        Theme.of(context)
                                            .colorScheme
                                            .secondary),
                              ),
                              child: Text(
                                reservedController.reservedList
                                        .any((items) => items.id == grill.id)
                                    ? 'Reservei'
                                    : 'Reserve agora',
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          }),
        );
      },
    );
  }
}
