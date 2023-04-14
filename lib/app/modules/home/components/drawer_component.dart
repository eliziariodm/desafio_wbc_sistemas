import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controllers/register_controller.dart';
import '../widgets/exit_widget.dart';
import '../widgets/remove_user_widget.dart';

class DrawerComponent extends StatelessWidget {
  const DrawerComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 25, 0, 0),
          child: Consumer<RegisterController>(builder: (_, register, __) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  register.userModel.name,
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                Text(
                  register.userModel.email,
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                const SizedBox(height: 20),
                const Divider(),
                ListTile(
                  contentPadding: const EdgeInsets.only(left: 0),
                  visualDensity: const VisualDensity(horizontal: -4),
                  leading: Icon(
                    Icons.delete_forever_rounded,
                    size: 32,
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
                  title: Text(
                    'Remover usuário',
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => RemoveUserWidget(
                        onPressedRemoveUser: () {
                          register.removeUser();
                          Navigator.pushReplacementNamed(context, '/register');
                        },
                      ),
                    );
                  },
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
            );
          }),
        ),
      ),
    );
  }
}
