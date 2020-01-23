import 'package:clean_architecture_flutter/domains/entities/user.dart';
import 'package:clean_architecture_flutter/use_cases/user/get_user.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class HomePresenter extends Presenter {
  Function getUserOnNext;
  Function getUserOnComplete;
  Function getUserOnError;

  final GetUserUseCase _getUserUseCase;

  HomePresenter(this._getUserUseCase);

  void onGetUser({Map<String, String> params = const {}}) {
    _getUserUseCase.execute(_GetUserObserver(this));
  }

  void dispose() {
    _getUserUseCase.dispose();
  }
}

class _GetUserObserver extends Observer<List<User>> {
  HomePresenter _presenter;

  _GetUserObserver(this._presenter);
  
  @override
  void onNext(users) {
    assert(_presenter.getUserOnNext != null);
    _presenter.getUserOnNext(users);
  }

  @override
  void onComplete() {
    assert(_presenter.getUserOnComplete != null);
    _presenter.getUserOnComplete();
  }

  @override
  void onError(e) {
    assert(_presenter.getUserOnError != null);
    _presenter.getUserOnError(e);
  }
}