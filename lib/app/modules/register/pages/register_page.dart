import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../../controllers/register_controller.dart';
import '../../../core/ui/ui_texformfield.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameTextController = TextEditingController();
  TextEditingController emailTextController = TextEditingController();

  @override
  void dispose() {
    nameTextController.dispose();
    emailTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Form(
            key: _formKey,
            child: Center(
              child: ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(horizontal: 30),
                children: [
                  Center(
                    child: Text(
                      'Cadastramento',
                      style: Theme.of(context).textTheme.titleLarge,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 50),
                  Text(
                    'Seja bem-vindo(a)',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 30),
                  UiTextFormField(
                    controller: nameTextController,
                    isSearch: false,
                    label: 'Nome Completo',
                    textCapitalization: TextCapitalization.words,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Digite seu Nome Completo!";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(height: 30),
                  UiTextFormField(
                    isSearch: false,
                    label: 'CPF',
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      CpfInputFormatter()
                    ],
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Digite seu CPF!";
                      } else if (value.length <= 11) {
                        return "O CPF tem um total de 11 dígitos!";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(height: 30),
                  UiTextFormField(
                    isSearch: false,
                    label: 'Email',
                    controller: emailTextController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Digite seu Email!";
                      } else if (!value.contains('@')) {
                        return "Digite um email válido!";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(height: 50),
                  Consumer<RegisterController>(builder: (_, register, __) {
                    return ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.pushReplacementNamed(context, '/home');
                          register.createUser(
                            fullName: nameTextController.text,
                            email: emailTextController.text,
                          );
                          register.singleRegister();
                        }
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          Theme.of(context).colorScheme.primary,
                        ),
                        padding: MaterialStateProperty.all<EdgeInsets>(
                          const EdgeInsets.all(13),
                        ),
                      ),
                      child: Text(
                        'Entrar',
                        style: Theme.of(context).textTheme.bodyMedium?.merge(
                              TextStyle(
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                            ),
                      ),
                    );
                  }),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
