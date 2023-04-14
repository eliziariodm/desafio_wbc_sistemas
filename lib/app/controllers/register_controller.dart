import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../data/models/user_model.dart';

class RegisterController extends ChangeNotifier {
  int clickSingleRegister = 0;
  List<UserModel> userList = <UserModel>[];

  late Box boxSingleRegister;
  late Box boxUser;

  get openBoxRegister => _openBoxRegister;

  _openBoxRegister() async {
    boxSingleRegister = await Hive.openBox<int>('single');
    boxUser = await Hive.openBox<UserModel>('user');

    await _singleRegister();
    await _readyUser();
  }

  createUser({required String? fullName, required String? email}) async {
    var name = fullName!.split(' ');

    var firstName = name[0];

    userList.add(
      UserModel(
        name: firstName,
        email: email!,
      ),
    );

    boxUser.put(
      'singleUser',
      UserModel(
        name: userList[0].name,
        email: userList[0].email,
      ),
    );

    notifyListeners();
  }

  _singleRegister() async {
    clickSingleRegister = boxSingleRegister.get('single') ?? 0;
    await boxSingleRegister.put('single', 1);
  }

  _readyUser() async {
    for (var user in boxUser.keys) {
      UserModel userModel = await boxUser.get(user);
      userList.add(userModel);

      notifyListeners();
    }
  }
}
