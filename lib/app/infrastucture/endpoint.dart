class Endpoints {
  String baseUrl;

  Endpoints(String baseUrl) {
    this.baseUrl = baseUrl;
  }

  String user() {
    return '/users';
  }

  String post() {
    return '/posts';
  }

}
