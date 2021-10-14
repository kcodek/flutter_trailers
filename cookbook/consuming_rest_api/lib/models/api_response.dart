class APIResponse<T> {
  T data; //T - type of the response returned from the API
  bool error;
  String errorMessage;

  APIResponse({
    required this.data,
    this.error = false,
    this.errorMessage = 'All is well',
  });
}
