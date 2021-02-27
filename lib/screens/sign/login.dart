part of 'signPage.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _emailController;
  TextEditingController _passwordController;
  bool _emailValidate = false;
  bool _passwordValidate = false;

  Future<dynamic> _login() async {
    _emailValidate = _emailController.text.isNotEmpty;
    _passwordValidate = _passwordController.text.length > 6;

    bool validated = _emailValidate && _passwordValidate;

    if (_emailValidate) {
      setState(() {
        _emailValidate = false;
      });
    } else {
      setState(() {
        _emailValidate = true;
      });
    }
    if (_passwordValidate) {
      setState(() {
        _passwordValidate = false;
      });
    } else {
      setState(() {
        _passwordValidate = true;
      });
    }
    if (validated) {
      // final result = await AuthRepositoryApi().login(User(
      //     email: _emailController.text, password: _passwordController.text));
      // if (result is bool) {
        _emailController.clear();
        _passwordController.clear();
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          return HomePage();
        }));
      // } else {
      //   Scaffold.of(context).showSnackBar(SnackBar(
      //       backgroundColor: Theme.of(context).errorColor.withOpacity(.9),
      //       content: Text(
      //         result.toString(),
      //         style: TextStyle(color: Colors.white),
      //       )));
      // }
    }
  }

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          buildTextField(
              title: 'Email',
              icon: Icons.email,
              controller: _emailController,
              validate: _emailValidate),
          SizedBox(
            height: 20,
          ),
          buildTextField(
              title: 'Password',
              icon: Icons.lock,
              controller: _passwordController,
              validate: _passwordValidate),
          SizedBox(
            height: 25,
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: Container(
                width: double.maxFinite,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                    color: ThemeProvider.themeOf(context).id == 'dark'
                        ? Color(0xFF0c6985)
                        : ConfigColor.darkColor),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                  child: FlatButton(
                    padding: EdgeInsets.all(15),
                    child: Text(
                      "LOGIN",
                      textScaleFactor: 1.1,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 17),
                    ),
                    onPressed: () {
                      _login();
                    },
                  ),
                ),
              )),
        ],
      ),
    );
  }

  Widget buildTextField(
      {@required String title,
      @required IconData icon,
      @required TextEditingController controller,
      @required bool validate}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        children: [
          Theme(
            data: ThemeData(primaryColor: ConfigColor.darkColor),
            child: Material(
              elevation: 2.0,
              borderRadius: BorderRadius.all(Radius.circular(30)),
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                textInputAction: title != 'Password'
                    ? TextInputAction.next
                    : TextInputAction.go,
                onEditingComplete: () {
                  if (title == 'Password') {
                    _login();
                  } else {
                    FocusScope.of(context).nextFocus();
                  }
                },
                controller: controller,
                obscureText: title == 'Password' ? true : false,
                cursorColor: ConfigColor.darkColor,
                decoration: InputDecoration(
                    hintText: title,
                    prefixIcon: Material(
                      elevation: 0,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      child: Icon(
                        icon,
                      ),
                    ),
                    border: InputBorder.none,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 25, vertical: 13)),
              ),
            ),
          ),
          Visibility(
            child: Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 15, top: 5),
              child: Text(
                'Enter your valid ${title.toLowerCase()}',
                textScaleFactor: 1.1,
                style: TextStyle(
                    fontSize: 13.5, color: Theme.of(context).errorColor),
              ),
            ),
            visible: validate,
          ),
        ],
      ),
    );
  }
}
