import 'package:applycamp/domain/repository/agent_auth_repository.dart';
import 'package:applycamp/domain/repository/student_auth_repository.dart';
import 'package:applycamp/domain/repository/student_repository.dart';
import 'package:applycamp/ui/root.dart';
import 'package:applycamp/ui/theme.dart';
import 'package:flutter/material.dart';
import 'di/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  instance<AgentAuthRepository>().loadAllAuthInfos();
  instance<StudentAuthRepository>().loadAllAuthInfos();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ApplyCamp',
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
