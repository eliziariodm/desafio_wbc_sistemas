import 'dart:io';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

import 'grills_hive_adapter.dart';

class HiveConfig {
  static Future start() async {
    Hive.registerAdapter(MessagesHiveAdapter());
    Directory dir = await getApplicationSupportDirectory();

    await Hive.initFlutter(dir.path);
  }
}
