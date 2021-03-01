import 'dart:ffi';
// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'jsonResponse.dart';
import 'jsonRequest.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.purple,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _clipBoardValue = '', _cloudPushStatus = '', _cloudPullStatus = '';

  // Temporary hardcoding
  String _url = 'https://pwot5ufm9b.execute-api.us-east-2.amazonaws.com/POC/clips';

  void clearOnScreenStatus() {
    setState(() {
      _clipBoardValue = '';
      _cloudPushStatus = '';
      _cloudPullStatus = '';
    });
  }

  void _pullCloudClip() async {
    var jsonRequest = new GetRequest(crudValue: 'GET', clipID: "WIP_MobilePhone");
    final response = await post(_url, body: jsonRequest.toJson());

    // JsonResponse jsonResponse = JsonResponse.fromJson(json.decode(response.body));
    Map<String, dynamic> responseMap = json.decode(response.body);
    _setClipboard(responseMap["Item"]["Content"]["S"]);

    setState(() {
      _cloudPullStatus = "\nContent pulled from cloud.";
    });
  }

  void _postCloudClip() async {
    String localClipBoardContent = _clipBoardValue.isEmpty ?
      (await Clipboard.getData(Clipboard.kTextPlain)).text : _clipBoardValue;

    var jsonRequest = new JsonRequest(crudValue: 'POST', clipID: "WIP_MobilePhone", clipContent: _clipBoardValue);
    final response = await post(_url, body: jsonRequest.toJson());

    // Update UI with response message for debugging purposes
    setState(() {
      _cloudPushStatus = response.body;
    });
  }

  void _setClipboard(String value) async {
    ClipboardData data = ClipboardData(text: value);
    await Clipboard.setData(data);
  }

  void _getClipboard() async {
    ClipboardData data = await Clipboard.getData(Clipboard.kTextPlain);
    setState(() {
      _clipBoardValue = data.text;
    });
  }

  BoxDecoration borderLines() {
    return BoxDecoration(
      border: Border.all(),
    );
  }

  EdgeInsets mainFunctionButton() {
    return EdgeInsets.all(10);
  }

  Expanded mainButton(onPress, text) {
    return  Expanded(
      child: SizedBox (
        width: double.infinity,
        child: Padding(
          padding: mainFunctionButton(),
          child: ElevatedButton(
            onPressed: onPress,
            child: Text(
              text,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            mainButton(_getClipboard, 'Current Clipboard: (Click To Update)\n$_clipBoardValue'),
            mainButton(_pullCloudClip, 'Pull from cloud$_cloudPullStatus'),
            mainButton(_postCloudClip, 'Push to cloud$_cloudPushStatus'),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(label: "Option A", icon: Icon(Icons.arrow_downward_sharp)),
          BottomNavigationBarItem(label: "Option B", icon: Icon(Icons.arrow_downward_sharp)),
          BottomNavigationBarItem(label: "Option C", icon: Icon(Icons.arrow_downward_sharp)),
        ],
      ),
    );
  }
}