import 'package:clean_architecture_flutter/domains/entities/posts.dart';
import 'package:clean_architecture_flutter/use_cases/post/get_post.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class PostPresenter extends Presenter {
  Function getPostOnNext;
  Function getPostOnComplete;
  Function getPostOnError;

  final GetPostUseCase _getPostUseCase;

  PostPresenter(this._getPostUseCase);

  void onGetPost({Map<String, String> params = const {}}) {
    _getPostUseCase.execute(_GetPostObserver(this));
  }

  void dispose() {
    _getPostUseCase.dispose();
  }
}

class _GetPostObserver extends Observer<List<Post>> {
  PostPresenter _presenter;

  _GetPostObserver(this._presenter);
  
  @override
  void onNext(posts) {
    assert(_presenter.getPostOnNext != null);
    _presenter.getPostOnNext(posts);
  }

  @override
  void onComplete() {
    assert(_presenter.getPostOnComplete != null);
    _presenter.getPostOnComplete();
  }

  @override
  void onError(e) {
    assert(_presenter.getPostOnError != null);
    _presenter.getPostOnError(e);
  }
}