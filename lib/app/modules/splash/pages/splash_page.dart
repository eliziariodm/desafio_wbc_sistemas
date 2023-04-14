import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controllers/register_controller.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    context.read<RegisterController>().openBoxRegister();

    Future.delayed(const Duration(seconds: 1)).then((value) {
      if (context.read<RegisterController>().clickSingleRegister == 0) {
        Navigator.pushReplacementNamed(context, '/register');
      } else {
        Navigator.pushReplacementNamed(context, '/home');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 30),
          Center(
            child: Text(
              'Clube.on',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          const SizedBox(height: 30),
          CircularProgressIndicator(
            color: Theme.of(context).colorScheme.surface,
          ),
        ],
      ),
    );
  }
}
