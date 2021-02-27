part of 'indexRepositories.dart';

abstract class AuthRepository {
  Future<dynamic> signUp(User user);
  Future<dynamic> login(User user);
  Future<String> logout(String token, BuildContext context);
}

class AuthRepositoryApi extends AuthRepository {
  @override
  Future<dynamic> signUp(User user) async {
    final res = await Dio().post(
      '${ConfigUrl.serverDomain}/mobile_api/signup',
      data: FormData.fromMap(user.toJson()),
    );
    if (res.data['code'] == 200) {
      print(res.data['auth']);
      final authToken = res.data['auth']['auth_token'];
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('auth_token', authToken);
      return true;
    } else {
      return res.data['message'];
    }
  }

  @override
  Future<dynamic> login(User user) async {
    final res = await Dio().post(
      '${ConfigUrl.serverDomain}/mobile_api/login',
      data: FormData.fromMap(user.toJson()),
    );
    if (res.data['code'] == 200) {
      print(res.data['auth']);
      final authToken = res.data['auth']['auth_token'];
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('auth_token', authToken);
      return true;
    } else {
      return res.data['message'];
    }
  }

  @override
  Future<String> logout(String token, BuildContext context) async {
    final res = await Dio().post(
      '${ConfigUrl.serverDomain}/mobile_api/logout',
      data: FormData.fromMap({"session_id": token}),
    );
    if (res.data['code'] == 200) {
      final prefs = await SharedPreferences.getInstance();
      prefs.remove('auth_token');
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) {
        return SignPage();
      }), (route) => false);
      return res.data['message'];
    } else {
      return res.data['message'];
    }
  }
}
