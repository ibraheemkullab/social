import 'package:flutter/material.dart';
import 'package:social/config/configColor.dart';
import 'package:social/screens/splashPage.dart';
import 'package:theme_provider/theme_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      loadThemeOnInit: true,
      saveThemesOnChange: true,
      themes: [
        AppTheme(
          id: 'dark',
          description: 'dark theme',
          data: ThemeData(
              canvasColor: ConfigColor.darkColor,
              primaryColorBrightness: Brightness.dark,
              scaffoldBackgroundColor: ConfigColor.darkColor,
              primaryColor: Colors.white,
              accentColor: ConfigColor.secondaryColor,
              brightness: Brightness.dark),
        ),
        AppTheme(
          id: 'light',
          description: 'light theme',
          data: ThemeData(
            primaryColor: ConfigColor.darkColor,
            accentColor: Colors.grey.shade700,
            scaffoldBackgroundColor: Colors.white,
          ),
        ),
      ],
      child: Builder(builder: (context) {
        return MaterialApp(
          theme: ThemeProvider.themeOf(context).data,
          title: 'Olivsocial',
          home: SplashPage(),
        );
      }),
    );
  }
}
