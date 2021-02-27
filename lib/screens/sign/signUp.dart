part of 'signPage.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController _firstNameController;
  TextEditingController _lastNameController;
  TextEditingController _emailController;
  TextEditingController _userNameController;
  TextEditingController _passwordController;
  bool _firstNameValidate = false;
  bool _lastNameValidate = false;
  bool _emailValidate = false;
  bool _userNameValidate = false;
  bool _passwordValidate = false;

  _signUp() async {
    _firstNameValidate = _firstNameController.text.length > 2;
    _lastNameValidate = _lastNameController.text.length > 2;
    _emailValidate = _emailController.text.contains('@') &&
        _emailController.text.endsWith('com');
    _userNameValidate = _userNameController.text.isNotEmpty;
    _passwordValidate = _passwordController.text.length > 6;

    bool validated = _firstNameValidate &&
        _lastNameValidate &&
        _emailValidate &&
        _userNameValidate &&
        _passwordValidate;

    if (_firstNameValidate) {
      setState(() {
        _firstNameValidate = false;
      });
    } else {
      setState(() {
        _firstNameValidate = true;
      });
    }
    if (_lastNameValidate) {
      setState(() {
        _lastNameValidate = false;
      });
    } else {
      setState(() {
        _lastNameValidate = true;
      });
    }
    if (_emailValidate) {
      setState(() {
        _emailValidate = false;
      });
    } else {
      setState(() {
        _emailValidate = true;
      });
    }
    if (_userNameValidate) {
      setState(() {
        _userNameValidate = false;
      });
    } else {
      setState(() {
        _userNameValidate = true;
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
      // final result = await AuthRepositoryApi().signUp(User(
      //     firstName: _firstNameController.text,
      //     lastName: _lastNameController.text,
      //     email: _emailController.text,
      //     userName: _userNameController.text,
      //     password: _passwordController.text));
      // if (result is bool) {
        _firstNameController.clear();
        _lastNameController.clear();
        _emailController.clear();
        _userNameController.clear();
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
    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
    _emailController = TextEditingController();
    _userNameController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _userNameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          _buildTextField(
              title: 'First Name',
              icon: Padding(
                padding: EdgeInsets.only(bottom: 2),
                child: Icon(FlutterIcons.user_faw5s, size: 20),
              ),
              controller: _firstNameController,
              validate: _firstNameValidate),
          SizedBox(
            height: 17,
          ),
          _buildTextField(
              title: 'Last Name',
              icon: Padding(
                padding: EdgeInsets.only(bottom: 2),
                child: Icon(FlutterIcons.user_faw5s, size: 20),
              ),
              controller: _lastNameController,
              validate: _lastNameValidate),
          SizedBox(
            height: 17,
          ),
          _buildTextField(
              title: 'Email',
              icon: Icon(Icons.email),
              controller: _emailController,
              validate: _emailValidate),
          SizedBox(
            height: 17,
          ),
          _buildTextField(
              title: 'User Name',
              icon: Padding(
                padding: EdgeInsets.only(bottom: 2),
                child: Icon(FlutterIcons.user_faw5s, size: 20),
              ),
              controller: _userNameController,
              validate: _userNameValidate),
          SizedBox(
            height: 17,
          ),
          _buildTextField(
              title: 'Password',
              icon: Icon(Icons.lock),
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
                      "SIGN UP",
                      textScaleFactor: 1.1,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 17),
                    ),
                    onPressed: () {
                      _signUp();
                    },
                  ),
                ),
              )),
        ],
      ),
    );
  }

  Widget _buildTextField({
    @required String title,
    @required Widget icon,
    @required TextEditingController controller,
    @required bool validate,
  }) {
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
                    _signUp();
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
                      child: icon,
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
