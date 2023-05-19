import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'util/data/db.dart';
import 'package:get_storage/get_storage.dart';
import 'view/mobile/startup.dart';
import 'view/mobile/tasksui.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DBHelper.initDb();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetCupertinoApp(
      localizationsDelegates: const [
        DefaultMaterialLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate,
        DefaultWidgetsLocalizations.delegate,
      ],
      title: 'Flutter Demo',
      theme: const CupertinoThemeData(
        barBackgroundColor: Colors.deepPurple,
      ),
      home: Startup(),
    );
  }
}
