import 'package:clean_architecture_flutter/app/infrastucture/contracts/base_controller.dart';
import 'package:clean_architecture_flutter/app/ui/pages/home/presenter.dart';
import 'package:clean_architecture_flutter/domains/entities/user.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class HomeController extends BaseController {
  List<User> _user = List<User>();
  HomePresenter _presenter;

  List<User> get user => _user;
  bool isLoading = true;

  HomeController(this._presenter):
    super(){
      _load();
    }

  void _load(){
    _presenter.onGetUser();
  }
  @override
  void initListeners() {
      super.initListeners();
      
     _presenter.getUserOnNext = (List<User> user) {
      print("ini $user");
      
      _user = user;
      // super.onFinishLoading();
      refreshUI(); // Refreshes the UI manually
    };
    _presenter.getUserOnComplete = () {
      print('User retrieved');
      dismissLoading();
    };

    _presenter.getUserOnError = (e) {
      print(e);
    };

  }

  void dismissLoading(){
    isLoading=false;
    refreshUI();
  }

  @override
  void dispose() {
    _presenter.dispose();
    super.dispose();
  }

  @override
  void onResumed(){
    print("on Resume");
    super.onResumed();
  }

  @override
  void onInternetConnected() {
    super.onInternetConnected();
  }

  @override
  void onInternetDisconnected() {
    super.onInternetDisconnected();
  }
}
