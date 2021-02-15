// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

JsonResponse welcomeFromJson(String str) => JsonResponse.fromJson(json.decode(str));

String welcomeToJson(JsonResponse data) => json.encode(data.toJson());

class JsonResponse {
  JsonResponse({
    this.responseMetadata,
  });

  ResponseMetadata responseMetadata;

  factory JsonResponse.fromJson(Map<String, dynamic> json) => JsonResponse(
    responseMetadata: ResponseMetadata.fromJson(json["ResponseMetadata"]),
  );

  Map<String, dynamic> toJson() => {
    "ResponseMetadata": responseMetadata.toJson(),
  };
}

class ResponseMetadata {
  ResponseMetadata({
    this.requestId,
    this.httpStatusCode,
    this.httpHeaders,
    this.retryAttempts,
  });

  String requestId;
  int httpStatusCode;
  HttpHeaders httpHeaders;
  int retryAttempts;

  factory ResponseMetadata.fromJson(Map<String, dynamic> json) => ResponseMetadata(
    requestId: json["RequestId"],
    httpStatusCode: json["HTTPStatusCode"],
    httpHeaders: HttpHeaders.fromJson(json["HTTPHeaders"]),
    retryAttempts: json["RetryAttempts"],
  );

  Map<String, dynamic> toJson() => {
    "RequestId": requestId,
    "HTTPStatusCode": httpStatusCode,
    "HTTPHeaders": httpHeaders.toJson(),
    "RetryAttempts": retryAttempts,
  };
}

class HttpHeaders {
  HttpHeaders({
    this.server,
    this.date,
    this.contentType,
    this.contentLength,
    this.connection,
    this.xAmznRequestid,
    this.xAmzCrc32,
  });

  String server;
  String date;
  String contentType;
  String contentLength;
  String connection;
  String xAmznRequestid;
  String xAmzCrc32;

  factory HttpHeaders.fromJson(Map<String, dynamic> json) => HttpHeaders(
    server: json["server"],
    date: json["date"],
    contentType: json["content-type"],
    contentLength: json["content-length"],
    connection: json["connection"],
    xAmznRequestid: json["x-amzn-requestid"],
    xAmzCrc32: json["x-amz-crc32"],
  );

  Map<String, dynamic> toJson() => {
    "server": server,
    "date": date,
    "content-type": contentType,
    "content-length": contentLength,
    "connection": connection,
    "x-amzn-requestid": xAmznRequestid,
    "x-amz-crc32": xAmzCrc32,
  };
}
