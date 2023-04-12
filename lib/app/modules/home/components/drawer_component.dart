import 'package:flutter/material.dart';

import '../widgets/exit_widget.dart';

class DrawerComponent extends StatelessWidget {
  const DrawerComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Drawer(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 25, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Daniel',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  Text(
                    'eliziariodm@gmail.com',
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  const SizedBox(height: 20),
                  const Divider(),
                  ListTile(
                    contentPadding: const EdgeInsets.only(left: 0),
                    visualDensity: const VisualDensity(horizontal: -4),
                    leading: Icon(
                      Icons.info_outline,
                      size: 32,
                      color: Theme.of(context).colorScheme.tertiary,
                    ),
                    title: Text(
                      'Sobre',
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                    onTap: () {},
                  ),
                  const Spacer(),
                  const Divider(),
                  ListTile(
                    contentPadding: const EdgeInsets.only(left: 0),
                    visualDensity: const VisualDensity(horizontal: -4),
                    leading: Icon(
                      Icons.logout,
                      size: 32,
                      color: Theme.of(context).colorScheme.tertiary,
                    ),
                    title: Text(
                      'Sair',
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => const ExitWidget(),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
