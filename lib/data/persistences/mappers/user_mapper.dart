// Used for mapping data received from rest api convert into recognisable for app

import 'package:clean_architecture_flutter/domains/entities/user.dart';

class UserMapper {
  List<User> getUserApiConverter(dynamic response) {
      return (response as List).map((e) => User(id: e["id"])).toList();
  }
}
