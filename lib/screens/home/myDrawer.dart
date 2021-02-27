part of 'homePage.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Builder(builder: (context) {
        // return Column(
        //   children: [
        //     Container(
        //       child: ListTile(
        //         onTap: () async {
        //           final prefs = await SharedPreferences.getInstance();
        //           String message = await AuthRepositoryApi()
        //               .logout(prefs.getString('auth_token'), context);
        //           Scaffold.of(context).showSnackBar(SnackBar(
        //             content: Text(message),
        //           ));
        //         },
        //         title: Text('Logout'),
        //       ),
        //     )
        //   ],
        // );
        return Drawer(
            child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(height: 30),
                    CircleAvatar(
                        radius: 25,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.asset(
                            'assets/images/avatar.png',
                            fit: BoxFit.cover,
                          ),
                        )),
                    SizedBox(height: 15),
                    Text(
                      'ibrahim kullab',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 3),
                    Text(
                      '@ibrahimkullab',
                      style: TextStyle(color: Theme.of(context).accentColor),
                    ),
                    SizedBox(height: 23),
                    Padding(
                      padding: EdgeInsets.only(right: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _buildRow(context, 'Posts', 0),
                          _buildRow(context, 'Following', 2),
                          _buildRow(context, 'Followers', 20),
                        ],
                      ),
                    ),
                    SizedBox(height: 28),
                    Divider(height: 0),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _buildListTile(Icon(Icons.home_filled), 'Home', () {
                    ThemeProvider.controllerOf(context).nextTheme();
                  }),
                  _buildListTile(Icon(Icons.ac_unit), 'Actual', () {}),
                  _buildListTile(Icon(Icons.search), 'Search', () {}),
                  _buildListTile(
                      Icon(Icons.notifications), 'Notifications', () {}),
                  _buildListTile(Icon(Icons.message), 'Messages', () {}),
                  _buildListTile(
                      Icon(Icons.bookmark_border), 'Bookmarks', () {}),
                  _buildListTile(
                    Icon(Icons.account_circle_outlined),
                    'Profile',
                    () async {
                      final prefs = await SharedPreferences.getInstance();
                      String message = await AuthRepositoryApi()
                          .logout(prefs.getString('auth_token'), context);
                      Scaffold.of(context).showSnackBar(SnackBar(
                        content: Text(message),
                      ));
                    },
                  ),
                  _buildListTile(Icon(Icons.more_horiz), 'More', () {}),
                ],
              ),
              Divider(endIndent: 20, indent: 20, height: 0),
              SizedBox(height: 20),
              _buildWebSiteDetails(),
              SizedBox(height: 20),
            ])));
      }),
    );
  }

  Padding _buildWebSiteDetails() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Wrap(
        spacing: 15,
        runSpacing: 8,
        children: [
          InkWell(
              onTap: () {
                launchURL('${ConfigUrl.serverDomain}//search');
              },
              child: Text('Explore',
                  textScaleFactor: 1.1, style: TextStyle(fontSize: 11.3))),
          InkWell(
              onTap: () {
                launchURL('${ConfigUrl.serverDomain}//ads');
              },
              child: Text('Advertising',
                  textScaleFactor: 1.1, style: TextStyle(fontSize: 11.3))),
          InkWell(
              onTap: () {
                launchURL('${ConfigUrl.serverDomain}//terms_of_use');
              },
              child: Text('Terms of Use',
                  textScaleFactor: 1.1, style: TextStyle(fontSize: 11.3))),
          InkWell(
              onTap: () {
                launchURL('${ConfigUrl.serverDomain}//privacy_policy');
              },
              child: Text('Privacy policy',
                  textScaleFactor: 1.1, style: TextStyle(fontSize: 11.3))),
          InkWell(
              onTap: () {
                launchURL('${ConfigUrl.serverDomain}//cookies_policy');
              },
              child: Text('Cookies',
                  textScaleFactor: 1.1, style: TextStyle(fontSize: 11.3))),
          InkWell(
              onTap: () {
                launchURL('${ConfigUrl.serverDomain}//about_us');
              },
              child: Text('About us',
                  textScaleFactor: 1.1, style: TextStyle(fontSize: 11.3))),
          InkWell(
              onTap: () {
                launchURL('${ConfigUrl.serverDomain}//api_docs');
              },
              child: Text('API',
                  textScaleFactor: 1.1, style: TextStyle(fontSize: 11.3))),
          InkWell(
              onTap: () {
                launchURL('${ConfigUrl.serverDomain}//faqs');
              },
              child: Text('F.A.Q',
                  textScaleFactor: 1.1, style: TextStyle(fontSize: 11.3))),
          InkWell(
              onTap: () {
                launchURL('${ConfigUrl.serverDomain}//#');
              },
              child: Text('© Olivsoical, Inc., 2021.',
                  textScaleFactor: 1.1, style: TextStyle(fontSize: 11.3))),
        ],
      ),
    );
  }

  Widget _buildListTile(Widget icon, String title, Function function) {
    return Container(
      height: 55,
      child: ListTile(
        onTap: function,
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
        leading: icon,
        title: Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(bottom: 6),
            child: Text(
              title,
              textScaleFactor: 1.1,
              style: TextStyle(fontSize: 15.5, fontWeight: FontWeight.normal),
            ),
          ),
        ),
      ),
    );
  }

  Container _buildRow(BuildContext context, String title, int count) {
    return Container(
        child: Row(
      children: [
        Text(count.toString(),
            textScaleFactor: 1.1,
            style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(width: 5),
        Transform.translate(
          offset: Offset(0, 10),
          child: Text(
            title,
            textScaleFactor: 1.1,
            style:
                TextStyle(fontSize: 13, color: Theme.of(context).accentColor),
          ),
        )
      ],
    ));
  }
}
