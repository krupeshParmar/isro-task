import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:isro/models/Spacecrafts.dart';
import 'package:http/http.dart' as http;

class SpacecraftScreen extends StatefulWidget {
  const SpacecraftScreen({Key? key}) : super(key: key);

  @override
  _SpacecraftScreenState createState() => _SpacecraftScreenState();
}

class _SpacecraftScreenState extends State<SpacecraftScreen> {
  final spacecraftApiUrl = 'https://isro.vercel.app/api/spacecrafts';
  var spacecrafts = <Spacecraft>[];

  @override
  void initState() {
    super.initState();
    _getData();
  }

  _getData() {
    http.get(Uri.parse(spacecraftApiUrl)).then((response) {
      setState(() {
        List list = json.decode(response.body)['spacecrafts'];
        list.forEach((element) {
          setState(() {
            spacecrafts.add(Spacecraft.fromJson(element));
          });
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Spacecrafts'),
        ),
        body: spacecrafts.isEmpty
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: spacecrafts.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
                    child: ListTile(
                      shape: Border.all(width: 0.3),
                      title: Text(spacecrafts[index].name),
                      leading: Text('${spacecrafts[index].id}'),
                    ),
                  );
                },
              ));
  }
}
