import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ExitWidget extends StatelessWidget {
  const ExitWidget({super.key});

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
          'Deseja realmente sair do aplicativo?',
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
            onPressed: () {
              SystemNavigator.pop();
            },
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
