part of 'indexModels.dart';

class User {
  String id;
  String firstName;
  String lastName;
  String userName;
  String email;
  String password;
  bool isVerified;
  String website;
  String aboutYou;
  String gender;
  String country;
  double postCount;
  double lastPost;
  double lastAd;
  String language;
  double followingCount;
  double followerCount;
  String wallet;
  String ipAddress;
  String lastActive;
  String memberSince;
  String profilePrivacy;
  User({
    this.firstName,
    this.lastName,
    this.userName,
    this.email,
    this.password,
  });

  User.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.firstName = json['firstName'];
    this.lastName = json['lastName'];
    this.userName = json['userName'];
    this.email = json['email'];
    this.isVerified = json['isVerified'];
    this.website = json['website'];
    this.aboutYou = json['aboutYou'];
    this.gender = json['gender'];
    this.country = json['country'];
    this.postCount = json['postCount'].toDouble();
    this.lastPost = json['postCount'].toDouble();
    this.lastAd = json['postCount'].toDouble();
    this.language = json['language'];
    this.followingCount = json['followingCount'].toDouble();
    this.followerCount = json['followingCount'].toDouble();
    this.wallet = json['wallet'];
    this.ipAddress = json['ipAddress'];
    this.lastActive = json['lastActive'];
    this.memberSince = json['memberSince'];
    this.profilePrivacy = json['profilePrivacy'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['device_type'] = Platform.isAndroid ? 'android' : 'ios';
    if (this.firstName != null) {
      data['first_name'] = this.firstName;
    }
    if (this.lastName != null) {
      data['last_name'] = this.lastName;
    }
    if (this.email != null) {
      data['email'] = this.email;
    }
    if (this.userName != null) {
      data['username'] = this.userName;
    }
    data['password'] = this.password;
    return data;
  }
}
