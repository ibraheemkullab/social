import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social/config/configColor.dart';
import 'package:social/screens/home/homePage.dart';
import 'package:social/screens/sign/signPage.dart';
import 'package:theme_provider/theme_provider.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SharedPreferences>(
        future: Future.delayed(Duration(seconds: 3), () {
          return SharedPreferences.getInstance();
        }),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return buildSplash(context);
          } else {
            final token = snapshot.data.getString('auth_token');
            if (token == null) {
              return SignPage();
            } else {
              return HomePage();
            }
          }
        });
  }

  Scaffold buildSplash(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Transform.translate(
        offset: Offset(0, -30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/olivso.png',
                height: 120,
                width: 120,
                fit: BoxFit.cover,
                color: ThemeProvider.themeOf(context).id == 'dark'
                    ? Colors.white
                    : ConfigColor.darkColor),
            SizedBox(height: 12),
            Text('Olivsocial',
                textScaleFactor: 1.1,
                style: TextStyle(
                    color: ThemeProvider.themeOf(context).id == 'dark'
                        ? Colors.white
                        : ConfigColor.darkColor,
                    fontSize: 24,
                    letterSpacing: 4,
                    fontWeight: FontWeight.bold)),
            SizedBox(height: 15),
            Container(
                width: 165,
                height: 2.5,
                child: LinearProgressIndicator(
                  backgroundColor: Colors.transparent,
                  valueColor: AlwaysStoppedAnimation(
                      ThemeProvider.themeOf(context).id == 'dark'
                          ? Colors.white
                          : ConfigColor.darkColor),
                ))
          ],
        ),
      )),
    );
  }
}
