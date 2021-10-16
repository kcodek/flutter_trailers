class APIResponse<T> {
  bool? error;
  String? errorMessage;
  T? data; //T - type of the response returned from the API

  APIResponse({this.error, this.errorMessage, this.data});
}
