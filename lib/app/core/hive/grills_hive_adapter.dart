import 'package:hive/hive.dart';

import '../../data/models/grills_model.dart';

class GrillsHiveAdapter extends TypeAdapter<GrillsModel> {
  @override
  final typeId = 0;

  @override
  GrillsModel read(BinaryReader reader) {
    return GrillsModel(
      id: reader.readInt(),
      product: reader.readString(),
      price: reader.readString(),
      image: reader.readString(),
    );
  }

  @override
  void write(BinaryWriter writer, GrillsModel obj) {
    writer.writeInt(obj.id);
    writer.writeString(obj.product);
    writer.writeString(obj.price);
    writer.writeString(obj.image);
  }
}
