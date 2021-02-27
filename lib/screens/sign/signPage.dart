import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:social/config/configColor.dart';
import 'package:social/config/configUrl.dart';
import 'package:social/models/indexModels.dart';
import 'package:social/repositories/indexRepositories.dart';
import 'package:social/screens/home/homePage.dart';
import 'package:theme_provider/theme_provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../functions.dart';

part 'login.dart';
part 'signUp.dart';
part 'socialMediaRow.dart';

class SignPage extends StatefulWidget {
  @override
  _SignPageState createState() => _SignPageState();
}

class _SignPageState extends State<SignPage> {
  bool _isSignUp = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          _buildLogo(),
          SizedBox(height: 60),
          _isSignUp ? SignUp() : Login(),
          SizedBox(
            height: 9,
          ),
          Center(child: Text('Or, continue with', textScaleFactor: 1.1)),
          SizedBox(
            height: 8,
          ),
          buildSocialMediaRow(),
          SizedBox(
            height: 23,
          ),
          _buildPolicy(),
          _isSignUp
              ? Center()
              : Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: InkWell(
                      onTap: () {},
                      child:
                          Text('Forgot your password?', textScaleFactor: 1.1)),
                ),
          SizedBox(
            height: 10,
          ),
          Divider(
            endIndent: 75,
            indent: 75,
            thickness: 2,
          ),
          SizedBox(
            height: 10,
          ),
          _buildChangeSignRow(),
          SizedBox(
            height: 20,
          )
        ],
      )),
    );
  }

  Column _buildLogo() {
    return Column(
      children: [
        SizedBox(height: 45),
        Center(
          child: Image.asset(
            'assets/images/olivso.png',
            height: 120,
            width: 120,
            fit: BoxFit.cover,
            color: ThemeProvider.themeOf(context).id == 'dark'
                ? Colors.white
                : ConfigColor.darkColor,
          ),
        ),
        SizedBox(height: 13),
        Text('Welcome to Olivsocial',
            textScaleFactor: 1.1,
            style: TextStyle(
                color: ThemeProvider.themeOf(context).id == 'dark'
                    ? Colors.white
                    : ConfigColor.darkColor,
                fontSize: 22,
                letterSpacing: 1.5,
                fontWeight: FontWeight.bold)),
      ],
    );
  }

  Padding _buildPolicy() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        children: [
          Text('By continuing, you agree to Olivsoical',
              textScaleFactor: 1.1, style: TextStyle(fontSize: 13)),
          SizedBox(height: 3),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  launchURL('${ConfigUrl.serverDomain}/terms_of_use');
                },
                child: Text('Terms of Use',
                    textScaleFactor: 1.1,
                    style: TextStyle(fontSize: 13, color: Color(0xFF1ca1f3))),
              ),
              SizedBox(width: 3),
              InkWell(
                onTap: () {
                  launchURL('${ConfigUrl.serverDomain}/privacy_policy');
                },
                child: Text('Privacy policy',
                    textScaleFactor: 1.1,
                    style: TextStyle(fontSize: 13, color: Color(0xFF1ca1f3))),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildChangeSignRow() {
    return Builder(builder: (context) {
      if (_isSignUp) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Already have Account ? ',
                textScaleFactor: 1.1,
                style: TextStyle(fontWeight: FontWeight.normal)),
            InkWell(
              onTap: () {
                setState(() {
                  _isSignUp = false;
                });
              },
              child: Text('Login',
                  textScaleFactor: 1.1,
                  style: TextStyle(
                      color: Color(0xFF1ca1f3),
                      fontWeight: FontWeight.normal,
                      decoration: TextDecoration.underline)),
            ),
          ],
        );
      } else {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Don\'t have an Account ? ',
                textScaleFactor: 1.1,
                style: TextStyle(fontWeight: FontWeight.normal)),
            InkWell(
              onTap: () {
                setState(() {
                  _isSignUp = true;
                });
              },
              child: Text('Sign Up',
                  textScaleFactor: 1.1,
                  style: TextStyle(
                      color: Color(0xFF1ca1f3),
                      fontWeight: FontWeight.normal,
                      decoration: TextDecoration.underline)),
            ),
          ],
        );
      }
    });
  }
}
