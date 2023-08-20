import 'package:applycamp/di/app.dart';
import 'package:applycamp/ui/home/home_page.dart';
import 'package:applycamp/ui/root.dart';
import 'package:applycamp/ui/theme.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initModule();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.light(
          primary: ColorPalette.primaryColor,
          secondary: ColorPalette.secondaryColor,
          onPrimary: ColorPalette.onPrimaryColor,
          surface: ColorPalette.surface,
        ),
        textTheme: textTheme,
        appBarTheme: AppBarTheme(
            backgroundColor: Colors.white,
            centerTitle: true,
            foregroundColor: Colors.black),
      ),
      home: RootScreen(),
    );
  }
}
