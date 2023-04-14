import 'package:hive/hive.dart';

import '../../data/models/user_model.dart';

class UserHiveAdapter extends TypeAdapter<UserModel> {
  @override
  final typeId = 1;

  @override
  UserModel read(BinaryReader reader) {
    return UserModel(
      name: reader.readString(),
      email: reader.readString(),
    );
  }

  @override
  void write(BinaryWriter writer, UserModel obj) {
    writer.writeString(obj.name);
    writer.writeString(obj.email);
  }
}
