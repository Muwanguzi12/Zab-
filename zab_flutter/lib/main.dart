import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme/app_theme.dart';
import 'services/auth_service.dart';
import 'screens/main_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthService()),
      ],
      child: const ZabApp(),
    ),
  );
}

class ZabApp extends StatelessWidget {
  const ZabApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zab Wellness',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: const MainScreen(),
    );
  }
}
