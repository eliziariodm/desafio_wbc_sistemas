import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controllers/register_controller.dart';
import '../widgets/button_widget.dart';

class BodyComponent extends StatelessWidget {
  const BodyComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(32),
              topLeft: Radius.circular(32),
            ),
            border: Border.all(
              color: Theme.of(context).colorScheme.surface,
            ),
          ),
          child: ListView(
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            children: [
              Consumer<RegisterController>(builder: (_, register, __) {
                return Text(
                  'Olá, ${register.userModel.name}',
                  style: Theme.of(context).textTheme.bodyMedium,
                );
              }),
              const SizedBox(height: 6),
              Text(
                'Estamos felizes em ter você aqui!',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: 30),
              SizedBox(
                height: constraints.maxHeight * 0.5,
                width: constraints.maxWidth,
                child: NotificationListener<OverscrollIndicatorNotification>(
                  onNotification: (OverscrollIndicatorNotification overscroll) {
                    overscroll.disallowIndicator();
                    return true;
                  },
                  child: GridView(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 30,
                      mainAxisSpacing: 20,
                      childAspectRatio: 1.2,
                    ),
                    children: [
                      ButtonWidget(
                        iconData: Icons.confirmation_num_outlined,
                        text: 'Meus Convites',
                        onTap: () {},
                        overflow: constraints.maxWidth < 380
                            ? TextOverflow.ellipsis
                            : TextOverflow.clip,
                      ),
                      ButtonWidget(
                        iconData: Icons.receipt_long_outlined,
                        text: 'Cortesias',
                        onTap: () {},
                      ),
                      ButtonWidget(
                        iconData: Icons.outdoor_grill,
                        text: 'Reservar Churrasqueira',
                        onTap: () {
                          Navigator.pushNamed(context, '/rent');
                        },
                        overflow: constraints.maxWidth < 380
                            ? TextOverflow.ellipsis
                            : TextOverflow.clip,
                      ),
                      ButtonWidget(
                        iconData: Icons.add_shopping_cart_sharp,
                        text: 'Itens Reservados',
                        onTap: () {
                          Navigator.pushNamed(context, '/reserved');
                        },
                        overflow: constraints.maxWidth < 380
                            ? TextOverflow.ellipsis
                            : TextOverflow.clip,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
