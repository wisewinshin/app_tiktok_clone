import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tiktok_clone/generated/l10n.dart';
import 'package:tiktok_clone/router.dart';
import 'package:tiktok_clone/utils/dark_theme.dart';
import 'package:tiktok_clone/utils/light_theme_data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await S.load(const Locale("ko"));
  runApp(const TikTokApp());
}

class TikTokApp extends StatelessWidget {
  const TikTokApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      title: 'TikTok Clone',
      localizationsDelegates: const [
        S.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale("en"),
        Locale("ko"),
      ],
      themeMode: ThemeMode.system,
      darkTheme: darkThemeData(),
      theme: lightThemeData(),
    );
  }
}
