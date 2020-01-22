import 'package:clean_architecture_flutter/app/infrastucture/events/connection.dart';
import 'package:clean_architecture_flutter/app/infrastucture/events/error.dart';
import 'package:clean_architecture_flutter/app/infrastucture/events/reset_ui.dart';
import 'package:clean_architecture_flutter/app/misc/route_arguments.dart';
import 'package:clean_architecture_flutter/app/misc/view_utils.dart';
import 'package:connectivity/connectivity.dart';
import 'package:event_bus/event_bus.dart';
import 'package:flutter/services.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class BaseController extends Controller {
  EventBus _eventBus = EventBus();
  bool _internetAvailable = true;
  RouteArguments args;

  bool get internetAvailable => _internetAvailable;


  BaseController() : super() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }
  
  @override
  void initListeners() {
    checkInternetConnection();
    _eventBus.on<ResetUIEvent>().listen((event) {
      ViewUtils.dismissProgressDialog();
      refreshUI();
    });

    // Check if data/wifi is active every OS setting change
    _eventBus.on<ConnectionEvent>().listen((event) {
      if (event.isConnected) {
        internetAvailabilityCycle(true);
        refreshUI();
      } else {
        internetAvailabilityCycle(false);
        refreshUI();
      }
    });
  }

  void internetAvailabilityCycle(bool status) {
    if (status) {
      _internetAvailable = status;
      onInternetDisconnected();
    } else {
      _internetAvailable = status;
      onInternetConnected();
    }
  }

  void onError({String title = "Error", String message = "Please try again!"}) {
    _eventBus.fire(ErrorEvent(message));
  }

  void checkInternetConnection() {
    // Check if data/wifi is active every init controller
    Connectivity().checkConnectivity().then((connection) {
      if (connection == ConnectivityResult.none) {
        internetAvailabilityCycle(false);
        refreshUI();
      } else {
        internetAvailabilityCycle(true);
        refreshUI();
      }
    });
  }

  void onInternetConnected() {}

  void onInternetDisconnected() {}

  void onProgressLoading() {
    ViewUtils.showProgressDialog(getContext());
  }

  void onFinishLoading() {
    ViewUtils.dismissProgressDialog();
  }

  void delayedRefresh({int duration = 1}) {
    Future.delayed(new Duration(seconds: duration), refreshUI);
  }
}
