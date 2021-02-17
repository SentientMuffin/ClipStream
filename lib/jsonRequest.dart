import 'dart:core';
import 'dart:convert';

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

  String toJson() => json.encode({
    CRUD_KEY: this.crudValue,
    REQUEST_KEY: requestValue.toJson(),
  });
}

class RequestBody {
  String entryID;
  String clipContent;

  RequestBody({ this.entryID, this.clipContent });

  String toJson() => json.encode({
    this.entryID: this.clipContent
  });

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