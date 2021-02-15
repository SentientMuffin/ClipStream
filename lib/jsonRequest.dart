import 'dart:core';

class JsonRequest {
  static const String CRUD_KEY = 'CRUD';
  static const String REQUEST_KEY = 'Request';

  String crudValue;
  RequestBody requestValue;

  // JsonRequest(String crudValue, RequestBody requestBody) {
  //   this.crudValue = crudValue;
  //   this.requestValue = requestBody;
  // }

  JsonRequest({ this.crudValue, this.requestValue });

  void getJSON() {

  }
}

class RequestBody {
  String entryID;
  String clipContent;

  RequestBody({ this.entryID, this.clipContent });

  // RequestBody(String entryID, String clipContent) {
  //   this._entryID = entryID;
  //   this._clipContent = clipContent;
  // }
  //
  // String getEntryID() {
  //   return this._entryID;
  // }
  //
  // String getClipContent() {
  //   return this._clipContent;
  // }
}