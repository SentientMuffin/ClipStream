import 'dart:core';
import 'dart:convert';

class _StaticConst {
  static const String CRUD_KEY = 'CRUD';
  static const String REQUEST_KEY = 'Request';
}

class JsonRequest {
  String crudValue;
  String entryID;
  String clipContent;
  // RequestBody requestValue;

  // JsonRequest(String crudValue, RequestBody requestBody) {
  //   this.crudValue = crudValue;
  //   this.requestValue = requestBody;
  // }

  JsonRequest({ this.crudValue, this.entryID, this.clipContent });

  String toJson() => json.encode({
    _StaticConst.CRUD_KEY: this.crudValue,
    _StaticConst.REQUEST_KEY: {
      this.entryID: this.clipContent,
    },
  });

  String toUri(String url) {
    return url + "/post";
  }
}

class GetRequest {
  String crudValue;
  String clipId;

  GetRequest({ this.crudValue, this.clipId });

  String toUri(String url) {
    return url + "?ClipID=\"" + clipId + "\"";
  }
}

// class RequestBody {
//   String entryID;
//   String clipContent;
//
//   RequestBody({ this.entryID, this.clipContent });
//
//   String toJson() => json.encode({
//     this.entryID: this.clipContent
//   });
//
//   // RequestBody(String entryID, String clipContent) {
//   //   this._entryID = entryID;
//   //   this._clipContent = clipContent;
//   // }
//   //
//   // String getEntryID() {
//   //   return this._entryID;
//   // }
//   //
//   // String getClipContent() {
//   //   return this._clipContent;
//   // }
// }