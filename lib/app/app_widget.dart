import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'controllers/grills_controller.dart';
import 'controllers/register_controller.dart';
import 'controllers/reserved_controller.dart';
import 'data/datasources/get_grills_datasource.dart';
import 'data/datasources/local/get_grills_local_datasource_impl.dart';
import 'data/repositories/get_grills_repository.dart';
import 'data/repositories/get_grills_repository_impl.dart';
import 'modules/home/pages/home_page.dart';
import 'modules/register/pages/register_page.dart';
import 'modules/rent/pages/rent_page.dart';
import 'modules/reserved/pages/reserved_page.dart';
import 'modules/splash/pages/splash_page.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<GetGrillsDatasource>(
          create: (context) => GetGrillsLocalDatasourceImpl(),
        ),
        ChangeNotifierProvider<RegisterController>(
          create: (context) => RegisterController(),
        ),
        Provider<GetGrillsRepository>(
          create: (context) => GetGrillsRepositoryImpl(context.read()),
        ),
        ChangeNotifierProvider<GrillsController>(
          create: (context) => GrillsController(context.read()),
        ),
        ChangeNotifierProvider<ReservedController>(
          create: (context) => ReservedController(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (_) => const SplashPage(),
          '/register': (_) => const RegisterPage(),
          '/home': (_) => const HomePage(),
          '/rent': (_) => const RentPage(),
          '/reserved': (_) => const ReservedPage(),
        },
        theme: ThemeData(
          colorScheme: const ColorScheme.light(
            primary: Color(0xFFE9EAEB),
            secondary: Color(0xFF32C043),
            tertiary: Color(0xFF000000),
            surface: Color(0xFFFFFFFF),
            error: Color(0xFFF03D3E),
          ),
          textTheme: const TextTheme(
            titleLarge: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w700,
              color: Color(0xFFFFFFFF),
            ),
            titleSmall: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w400,
              color: Color(0xFFFFFFFF),
            ),
            bodyMedium: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w400,
              color: Color(0xFF000000),
            ),
            bodySmall: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w300,
              color: Color(0xFF000000),
            ),
            displayMedium: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Color(0xFF000000),
            ),
            displaySmall: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w300,
              color: Color(0xFF000000),
            ),
            labelSmall: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w400,
              color: Color(0xFF000000),
            ),
            headlineSmall: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: Color(0xFFFFFFFF),
            ),
          ),
          scaffoldBackgroundColor: Colors.white,
          iconTheme: const IconThemeData(
            size: 60,
            color: Color(0xFF000000),
          ),
          appBarTheme: const AppBarTheme(
            systemOverlayStyle: SystemUiOverlayStyle.light,
            elevation: 0,
            centerTitle: true,
            backgroundColor: Color(0xFF32C043),
            iconTheme: IconThemeData(
              size: 35,
              color: Color(0xFFFFFFFF),
            ),
          ),
        ),
      ),
    );
  }
}
