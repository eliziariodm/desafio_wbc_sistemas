import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app/app_widget.dart';
import 'app/core/hive/hive_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  );
  await Future.wait(
    [
      HiveConfig.start(),
    ],
  );
  runApp(const AppWidget());
}
