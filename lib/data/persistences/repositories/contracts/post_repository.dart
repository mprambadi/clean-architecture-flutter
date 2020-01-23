

import 'package:clean_architecture_flutter/domains/entities/posts.dart';

abstract class PostRepository {
  Future<List<Post>> show();
}
