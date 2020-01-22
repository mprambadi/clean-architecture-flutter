import 'package:clean_architecture_flutter/app/misc/user_data.dart';
import 'package:clean_architecture_flutter/app/ui/pages/home/view.dart';
import 'package:clean_architecture_flutter/app/ui/pages/main/controller.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:flutter/material.dart';

class MainPage extends View {
  MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => new _MainPageState();
}

class _MainPageState extends ViewState<MainPage, MainController> {

  _MainPageState() : super(MainController());


  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget buildPage() {
    return new Scaffold(
      key: globalKey,
      appBar: AppBar(title: Text("Hello World"),),
      body: HomePage(),
    );
  }
}
