import 'package:clean_architecture_flutter/app/infrastucture/app_component.dart';
import 'package:clean_architecture_flutter/app/ui/pages/post/controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class PostPage extends View {
  PostPage({Key key}) : super(key: key);
  
  @override
  _PostPageState createState() => _PostPageState(
      AppComponent.getInjector().getDependency<PostController>());
}

class _PostPageState extends ViewState<PostPage, PostController> {
  _PostPageState(PostController postController) : super(postController);

  @override
  Widget buildPage() {
    List<Widget> postsList =
        controller.post.map((item) => Text(item.title)).toList();
    return Scaffold(
      appBar: AppBar(title: Text("Posts"),),
      body: Column(
      key: globalKey,
      children: <Widget>[
        RaisedButton(
          onPressed: () {},
          child: Text("hello"),
        ),
        controller.isLoading
            ? CircularProgressIndicator(backgroundColor: Colors.red)
            : Expanded(
                child: ListView(
                children: postsList,
              ))
      ],
    ));
  }
}
