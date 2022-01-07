import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:isro/models/Launchers.dart';

class LauncherScreen extends StatefulWidget {
  const LauncherScreen({Key? key}) : super(key: key);

  @override
  _LauncherScreenState createState() => _LauncherScreenState();
}

class _LauncherScreenState extends State<LauncherScreen> {
  final launchersApiUrl = 'https://isro.vercel.app/api/launchers';
  var launchers = <Launcher>[];

  @override
  void initState() {
    super.initState();
    _getData();
  }

  _getData() {
    http.get(Uri.parse(launchersApiUrl)).then((response) {
      setState(() {
        List list = json.decode(response.body)['launchers'];
        list.forEach((element) {
          setState(() {
            launchers.add(Launcher.fromJson(element));
          });
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Launchers'),
        ),
        body: launchers.isEmpty
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: launchers.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.all(8.0),
                    child: ListTile(
                      shape: Border.fromBorderSide(BorderSide(width: 0.5)),
                      title: Text(
                        launchers[index].id,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                },
              ));
  }
}
