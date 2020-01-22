// Declaring Entities and its property
class User {
  dynamic id;
  bool isRegistered;
  Token token;
  Profile profile;

  User({this.id, this.isRegistered});
}

class Token {
  String accessToken;
  int expiresAt;

  Token({this.accessToken, this.expiresAt});
}

class Profile {
  String name;

  Profile({this.name});
}
