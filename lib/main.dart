import 'package:do_daily/config/config.dart';
import 'package:do_daily/config/text_strings.dart';
import 'package:do_daily/firebase_options.dart';
import 'package:do_daily/models/user_model.dart';
import 'package:do_daily/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

void main() async {
  // Wait until the app is ready to launch
  WidgetsFlutterBinding.ensureInitialized();

  // Define the theme for the application
  var brightness =
      SchedulerBinding.instance.platformDispatcher.platformBrightness;
  AppConfig.theme =
      brightness == Brightness.dark ? AppTheme.dark : AppTheme.light;

  // Initialize the firebase configuration
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // run the app
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserModel()),
      ],
      child: MaterialApp(
        title: TextStrigns().appName,
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
      ),
    );
  }
}
