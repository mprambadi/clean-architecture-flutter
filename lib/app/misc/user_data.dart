import 'package:clean_architecture_flutter/app/misc/constants.dart';
import 'package:clean_architecture_flutter/domains/entities/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserData {
  // basic profile
  int id;
  String name;
  // token
  String token;
  int expiresAt;

  // misc
  bool forgotPassword;
  bool isRegistered;
  bool isNotFirstTime;
  String logoutReason;
  int lastUser;

  UserData() {
    this.loadData();
  }

  void fromUser(User user) {
    this.id = user.id;
    this.name = user.profile.name;

    if (user.token != null) {
      this.token = user.token.accessToken;
      this.expiresAt = user.token.expiresAt;
    }

    this.isRegistered = user.isRegistered;
  }

  void fromToken(Token token) {
    this.token = token.accessToken;
    this.expiresAt = token.expiresAt;
  }

  void loadData() {
    this._getSharedPreferences().then((sp) {
      this.id = sp.getInt(AppConstants.USER_DATA_ID) ?? 0;
    });
  }

  void clear() {
    this._getSharedPreferences().then((sp) {
      this.clearProperties();
      sp.clear();
    });
  }

  void clearWithCallback(Function callback) {
    this._getSharedPreferences().then((sp) {
      sp.clear().then((onValue) {
        this.clearProperties();
        callback();
      });
    });
  }

  void clearProperties() {
    this.id = null;
  }

  Future<void> save() {
    return this._getSharedPreferences().then((sp) {
      sp.setInt(AppConstants.USER_DATA_ID, this.id);
    });
  }

  bool forcedLogout() {
    return this.logoutReason == "privacy" && this.lastUser == this.id;
  }

  Future<SharedPreferences> _getSharedPreferences() async {
    return SharedPreferences.getInstance();
  }
}
