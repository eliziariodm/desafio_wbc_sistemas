import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../data/models/user_model.dart';

class RegisterController extends ChangeNotifier {
  int clickSingleRegister = 0;
  UserModel userModel = UserModel(name: '', email: '');

  late Box boxSingleRegister;
  late Box boxUser;

  get openBoxRegister => _openBoxRegister;

  createUser({required String? fullName, required String? email}) async {
    var name = fullName!.split(' ');

    var firstName = name[0];

    userModel = UserModel(
      name: firstName,
      email: email!,
    );

    await boxUser.put('singleUser', userModel);
  }

  removeUser() {
    boxSingleRegister.delete('single');
    boxUser.delete('singleUser');
  }

  singleRegister() async {
    await boxSingleRegister.put('single', 1);
  }

  _readySingleRegister() async {
    clickSingleRegister = await boxSingleRegister.get('single') ?? 0;
  }

  _readyUser() async {
    userModel =
        await boxUser.get('singleUser') ?? UserModel(name: '', email: '');
  }

  _openBoxRegister() async {
    boxSingleRegister = await Hive.openBox<int>('single');
    boxUser = await Hive.openBox<UserModel>('user');

    await _readySingleRegister();
    await _readyUser();
  }
}
