import 'package:clean_architecture_flutter/app/infrastucture/contracts/base_controller.dart';
import 'package:clean_architecture_flutter/app/ui/pages/post/presenter.dart';
import 'package:clean_architecture_flutter/domains/entities/posts.dart';

class PostController extends BaseController {
  List<Post> _post = List<Post>();
  PostPresenter _presenter;

  List<Post> get post => _post;
  bool isLoading = true;

  PostController(this._presenter):
    super(){
      _load();
    }

  void _load(){
    _presenter.onGetPost();
  }
  @override
  void initListeners() {
      super.initListeners();
      
     _presenter.getPostOnNext = (List<Post> post) {
      _post = post;
      // super.onFinishLoading();
      refreshUI(); // Refreshes the UI manually
    };
    _presenter.getPostOnComplete = () {
      print('User retrieved');
      dismissLoading();
    };

    _presenter.getPostOnError = (e) {
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
