import 'package:flutter/material.dart';

class RemoveUserWidget extends StatelessWidget {
  final void Function()? onPressedRemoveUser;

  const RemoveUserWidget({
    super.key,
    required this.onPressedRemoveUser,
  });

  @override
  Widget build(BuildContext context) {
    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (OverscrollIndicatorNotification overscroll) {
        overscroll.disallowIndicator();
        return true;
      },
      child: AlertDialog(
        scrollable: true,
        title: Text(
          'Deseja realmente remover seu usuário?',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.displayMedium,
        ),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                Theme.of(context).colorScheme.secondary,
              ),
            ),
            child: Text(
              'Não',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          TextButton(
            onPressed: onPressedRemoveUser,
            child: Text(
              'Sim',
              style: Theme.of(context).textTheme.headlineSmall?.merge(
                    TextStyle(
                      color: Theme.of(context).colorScheme.tertiary,
                    ),
                  ),
            ),
          )
        ],
      ),
    );
  }
}
