import 'package:clean_architecture_flutter/app/infrastucture/app_component.dart';
import 'package:clean_architecture_flutter/app/ui/pages/home/controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class HomePage extends View {
  @override
  _HomePageState createState() => _HomePageState(
      AppComponent.getInjector().getDependency<HomeController>());
}

class _HomePageState extends ViewState<HomePage, HomeController> {
  _HomePageState(HomeController homeController) : super(homeController);

  @override
  Widget buildPage() {
    List<Widget> usersList =
        controller.user.map((item) => Text(item.id.toString())).toList();
    return Column(
      children: <Widget>[
        RaisedButton(
          onPressed: () {},
          child: Text("hello"),
        ),
        controller.isLoading
            ? CircularProgressIndicator(backgroundColor: Colors.red)
            : Expanded(
                child: ListView(
                children: usersList,
              ))
      ],
    );
  }
}
