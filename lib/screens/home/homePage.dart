import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social/config/configColor.dart';
import 'package:social/config/configUrl.dart';
import 'package:social/functions.dart';
import '../../repositories/indexRepositories.dart';
import 'package:theme_provider/theme_provider.dart';

part 'myDrawer.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int tabBarIndex = 0;
  bool isPosting = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        height: 55,
        child: Column(
          children: [
            Divider(height: 0),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        tabBarIndex = 0;
                      });
                    },
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    icon: Icon(
                      Icons.home_outlined,
                      size: 33,
                      color: tabBarIndex == 0
                          ? ConfigColor.primaryColor
                          : ThemeProvider.themeOf(context).id == 'light'
                              ? Colors.grey
                              : null,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        tabBarIndex = 1;
                      });
                    },
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    icon: Icon(
                      Icons.notifications_none,
                      size: 33,
                      color: tabBarIndex == 1
                          ? ConfigColor.primaryColor
                          : ThemeProvider.themeOf(context).id == 'light'
                              ? Colors.grey
                              : null,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        tabBarIndex = 2;
                      });
                    },
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    icon: Icon(
                      Icons.search,
                      size: 33,
                      color: tabBarIndex == 2
                          ? ConfigColor.primaryColor
                          : ThemeProvider.themeOf(context).id == 'light'
                              ? Colors.grey
                              : null,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        tabBarIndex = 3;
                      });
                    },
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    icon: Transform.translate(
                      offset: Offset(0, 2),
                      child: Icon(
                        Icons.messenger_outline_rounded,
                        size: 30.5,
                        color: tabBarIndex == 3
                            ? ConfigColor.primaryColor
                            : ThemeProvider.themeOf(context).id == 'light'
                                ? Colors.grey
                                : null,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      drawer: MyDrawer(),
      body: Builder(builder: (context) {
        return CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              floating: true,
              pinned: false,
              centerTitle: true,
              leading: IconButton(
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  padding: EdgeInsets.zero,
                  icon: Icon(Icons.view_headline_outlined,
                      size: 30, color: ConfigColor.primaryColor)),
              title: Container(
                  height: 43,
                  child: Image.asset(
                    'assets/images/olivso.png',
                    color: ConfigColor.primaryColor,
                  )),
              actions: [
                tabBarIndex != 0
                    ? Center()
                    : this.isPosting
                        ? IconButton(
                            onPressed: () {
                              setState(() {
                                this.isPosting = false;
                              });
                            },
                            padding: EdgeInsets.zero,
                            icon: Icon(FlutterIcons.file_hidden_mco,
                                size: 30, color: ConfigColor.primaryColor))
                        : IconButton(
                            onPressed: () {
                              setState(() {
                                this.isPosting = true;
                              });
                            },
                            padding: EdgeInsets.zero,
                            icon: Icon(Icons.add_circle_outline,
                                size: 30, color: ConfigColor.primaryColor))
              ],
            ),
            SliverToBoxAdapter(
                child: Column(
              children: [
                Divider(height: 1),
                tabBarIndex == 0 ? buildHome(context, this.isPosting) : Center()
              ],
            ))
          ],
        );
      }),
    );
  }
}

Widget buildHome(BuildContext context, bool isPosting) {
  return Column(
    children: [
      isPosting ? buildCreatePost(context) : Center(),
      Divider(thickness: .6, height: 0),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 22, top: 12),
            child: Stack(
              children: [
                Container(
                  height: 55,
                  width: 55,
                  padding: EdgeInsets.all(2.7),
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(
                          color: ConfigColor.secondaryColor, width: 1.6)),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.asset('assets/images/avatar.png',
                          fit: BoxFit.cover)),
                ),
                Positioned(
                    bottom: 2,
                    right: 0,
                    child: Transform.translate(
                      offset: Offset(2, 0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: ConfigColor.primaryColor.withOpacity(.9),
                            borderRadius: BorderRadius.circular(100)),
                        child: Icon(Icons.add, color: Colors.white),
                      ),
                    ))
              ],
            ),
          ),
          SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Container(
              width: 72,
              child: Text(
                'Create new story',
                overflow: TextOverflow.ellipsis,
                textScaleFactor: 1.15,
                style: TextStyle(
                    color: Theme.of(context).unselectedWidgetColor,
                    fontSize: 11),
              ),
            ),
          )
        ],
      ),
      Divider(thickness: 1.5),
      buildPost(context),
      buildPost(context),
      buildPost(context),
    ],
  );
}

Widget buildCreatePost(BuildContext context) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 9),
          child: CircleAvatar(
              radius: 20,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.asset(
                  'assets/images/avatar.png',
                  fit: BoxFit.cover,
                ),
              )),
        ),
        SizedBox(width: 25),
        Expanded(
          child: Column(
            children: [
              TextField(
                cursorColor: Theme.of(context).accentColor,
                maxLines: 2,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                    hintMaxLines: 2,
                    hintStyle: TextStyle(fontSize: 13),
                    hintText: 'What is happening? #Hashtag.. @Mention.. Poll.',
                    border: InputBorder.none),
              ),
              SizedBox(height: 3),
              Row(children: [
                Icon(Icons.image_outlined,
                    size: 29, color: ConfigColor.primaryColor),
                SizedBox(width: 17),
                Icon(Icons.camera_alt_outlined,
                    size: 29, color: ConfigColor.primaryColor),
                SizedBox(width: 17),
                Icon(Icons.face, size: 29, color: ConfigColor.primaryColor),
                SizedBox(width: 17),
                Icon(Icons.image_outlined,
                    size: 29, color: ConfigColor.primaryColor),
                SizedBox(width: 17),
                Icon(Icons.search, size: 29, color: ConfigColor.primaryColor),
                // Icon();
              ]),
              SizedBox(height: 17),
              Divider(height: 0, thickness: .8),
              SizedBox(height: 15),
              Padding(
                padding: EdgeInsets.only(right: 25),
                child: Row(
                  children: [
                    Icon(Icons.public_rounded,
                        size: 29, color: ConfigColor.primaryColor),
                    Spacer(),
                    FlatButton(
                        color: ConfigColor.primaryColor.withOpacity(.5),
                        onPressed: () {},
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 18),
                        // height: 35,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Text(
                          'PUBLISH',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ))
                  ],
                ),
              )
            ],
          ),
        )
      ],
    ),
  );
}

Widget buildPost(BuildContext context) {
  return SingleChildScrollView(
    child: Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20, top: 15, bottom: 15, right: 15),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20, right: 12),
                child: CircleAvatar(
                    radius: 20,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.asset(
                        'assets/images/avatar.png',
                        fit: BoxFit.cover,
                      ),
                    )),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.repeat_rounded,
                          size: 17,
                          color: ConfigColor.secondaryColor,
                        ),
                        SizedBox(width: 2),
                        Text(
                          'YOU REPOSTED',
                          style: TextStyle(
                              fontSize: 11, color: ConfigColor.secondaryColor),
                        )
                      ],
                    ),
                    SizedBox(height: 3),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Ahmed Bostan',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Spacer(),
                            Icon(
                              Icons.date_range,
                              size: 18,
                              color: ConfigColor.secondaryColor,
                            ),
                            SizedBox(width: 5),
                            Text(
                              '22 hours ago',
                              style: TextStyle(
                                  color: ConfigColor.secondaryColor,
                                  fontSize: 12),
                            )
                          ],
                        ),
                        SizedBox(height: 1.5),
                        Text(
                          '@ahmed85',
                          style: TextStyle(
                              fontSize: 12, color: ConfigColor.secondaryColor),
                        ),
                        SizedBox(height: 20),
                        Text(
                          '#olivx',
                          style: TextStyle(
                              fontSize: 13, color: ConfigColor.primaryColor),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Olivx Every day is OWN',
                        ),
                        SizedBox(height: 13),
                        Container(
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              border: Border.all(
                                  width: .8, color: Colors.grey.shade400)),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(25),
                            child: Image.asset('assets/images/olivx_logo.png',
                                fit: BoxFit.cover),
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.messenger_outline_rounded,
                                    size: 20,
                                    color: Theme.of(context)
                                        .unselectedWidgetColor),
                                SizedBox(width: 4),
                                Text('0',
                                    style: TextStyle(
                                        fontSize: 13,
                                        color: Theme.of(context)
                                            .unselectedWidgetColor))
                              ],
                            ),
                            Row(
                              children: [
                                Icon(Icons.favorite,
                                    size: 20, color: Color(0xFFf6546a)),
                                SizedBox(width: 4),
                                Text('4',
                                    style: TextStyle(
                                        fontSize: 13, color: Color(0xFFf6546a)))
                              ],
                            ),
                            Row(
                              children: [
                                Icon(Icons.repeat_rounded,
                                    size: 20, color: ConfigColor.primaryColor),
                                SizedBox(width: 4),
                                Text('2',
                                    style: TextStyle(
                                        fontSize: 13,
                                        color: ConfigColor.primaryColor))
                              ],
                            ),
                            Icon(Icons.file_upload,
                                size: 20,
                                color: Theme.of(context).unselectedWidgetColor),
                            Icon(Icons.keyboard_arrow_down_rounded,
                                size: 27,
                                color: Theme.of(context).unselectedWidgetColor),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Divider(height: 0)
      ],
    ),
  );
}
