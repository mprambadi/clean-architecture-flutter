import 'package:clean_architecture_flutter/app/infrastucture/app_component.dart';
import 'package:clean_architecture_flutter/app/infrastucture/events/dio_error.dart';
import 'package:clean_architecture_flutter/app/infrastucture/events/reset_ui.dart';
import 'package:clean_architecture_flutter/app/infrastucture/router.dart';
import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';

void main() {
  AppComponent.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final Router _router = Router();
  final EventBus _eventBus = EventBus();
  static bool isConnectedToInternet = true;
  final _navigatorKey = GlobalKey<NavigatorState>();



    MyApp() {
    _initEventListeners();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
            navigatorKey: _navigatorKey,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/",
      onGenerateRoute: _router.getRoute,
      navigatorObservers: [_router.routeObserver],
    );
  }


   void _initEventListeners() {
    _eventBus.on<DioErrorEvent>().listen((event) {
      if (!isConnectedToInternet) {
        _eventBus.fire(ResetUIEvent());
        return;
      }

      // Widget iconX = const RotationTransition(
      //   turns: AlwaysStoppedAnimation(45 / 360),
      //   child: Icon(
      //     Icons.add_circle,
      //     color: AppConstants.COLOR_WHITE,
      //     size: 24,
      //   ),
      // );
      // if (event.code == 401) {
      //   iconX = Icon(
      //     Icons.warning,
      //     color: AppConstants.COLOR_WHITE,
      //     size: 24,
      //   );
      // }

    //   showDialog(
    //       barrierDismissible: false,
    //       context: _navigatorKey.currentState.overlay.context,
    //       builder: (context) => CustomDialog.errorDialog(
    //             icon: iconX,
    //             context: context,
    //             title: event.code == 401
    //                 ? S.of(context).token_expired_title
    //                 : S.of(context).label_failed,
    //             content: event.code == 401
    //                 ? S.of(context).token_expired_content
    //                 : StringUtils.getAlertContent(
    //                     context, event.origin, event.message),
    //             onConfirmText:
    //                 StringUtils.getAlertButtonTxt(context, event.origin),
    //             onConfirm: () {
    //               Navigator.pop(context);
    //               if (event.code == 401) {
    //                 this._handleLogout(context, "default");
    //               } else {
    //                 _eventBus.fire(new ResetUIEvent());
    //               }
    //             },
    //           ));
    // });

    // _eventBus.on<LogoutEvent>().listen((event) {
    //   this._handleLogout(_navigatorKey.currentState.overlay.context, "default");
    // });

    // _eventBus.on<ErrorEvent>().listen((event) {});

    // _eventBus.on<AfterLoginEvent>().listen((event) {
    //   _initFCM();
    // });

    // _eventBus.on<ExitEvent>().listen((event) {
    //   showDialog(
    //       barrierDismissible: false,
    //       context: _navigatorKey.currentState.overlay.context,
    //       builder: (context) => CustomDialog.confirmDialog(
    //           context: context,
    //           title: S.of(context).alert_dialog_cancel_title,
    //           content: S.of(context).alert_dialog_cancel_content,
    //           onConfirmText: S.of(context).label_yes,
    //           onCancelText: S.of(context).label_no,
    //           onConfirm: () {
    //             if (event.needLogout) {
    //               this._handleLogout(context, event.reason, needExit: true);
    //             } else {
    //               exit(0);
    //             }
    //           }));
    // });

    // _eventBus.on<SuccessEvent>().listen((event) {
    //   showDialog(
    //       context: _navigatorKey.currentState.overlay.context,
    //       builder: (context) => CustomDialog.successDialog(
    //           context: context,
    //           title: event.title,
    //           content: event.content,
    //           onConfirm: event.onConfirm,
    //           onConfirmText: event.confirmText));
    });
  }
}
