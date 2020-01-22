import 'package:clean_architecture_flutter/app/infrastucture/endpoint.dart';
import 'package:clean_architecture_flutter/app/infrastucture/persistences/api_services.dart';
import 'package:clean_architecture_flutter/app/repository/api/user_api_repository.dart';
import 'package:clean_architecture_flutter/app/ui/pages/home/controller.dart';
import 'package:clean_architecture_flutter/data/persistences/mappers/user_mapper.dart';
import 'package:dio/dio.dart';
import 'package:event_bus/event_bus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class HomePage extends View {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ViewState<HomePage, HomeController> {
  _HomePageState()
      : super(HomeController(UserApiRepository(
            new ApiService(Dio(), EventBus()),
            Endpoints("https://jsonplaceholder.typicode.com"),
            UserMapper())));

  @override
  Widget buildPage() {
    List<Widget> usersList =
        controller.user.map((item) => Text(item.id.toString())).toList();
    return Column(
      children: <Widget>[
        RaisedButton(
          onPressed: (){},
          child: Text("hello"),
        ),
        Expanded(child: ListView(children: usersList))
      ],
    );
  }
}
