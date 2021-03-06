import 'package:emed/config/init/navigation/navigator.dart';
import 'package:emed/config/routes/page_routes.dart';
import 'package:emed/config/themes/main_theme.dart';
import 'package:emed/services/get_storage_service.dart';
import 'package:emed/services/hive_service.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Storageservice.instance.storage.write('day', 10);
  await Storageservice.instance.storage.write('houre', 2);
  await Storageservice.instance.storage.write('month', 10);
  await Hive.initFlutter();
  await BoxService.instance.openBox();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-med',
      theme: MainTheme.apptheme,
      navigatorKey: NavigationService.instance.navigatorKey,
      initialRoute: '/mainauthview',
      onGenerateRoute: MyRoute.instance.onGenerateRoute,
    );
  }
}
