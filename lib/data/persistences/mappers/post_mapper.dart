// Used for mapping data received from rest api convert into recognisable for app

import 'package:clean_architecture_flutter/domains/entities/posts.dart';

class PostMapper {
  List<Post> getUserApiConverter(dynamic response) {
    return (response as List)
        .map((e) => Post(
              userId: e["userId"],
              body: e["body"],
              id: e["id"],
              title: e["title"]
            ))
        .toList();
  }
}
