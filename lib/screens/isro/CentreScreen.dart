import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:isro/models/Centres.dart';

class CentreScreen extends StatefulWidget {
  const CentreScreen({Key? key}) : super(key: key);

  @override
  _CentreScreenState createState() => _CentreScreenState();
}

class _CentreScreenState extends State<CentreScreen> {
  final centreUrl = 'https://isro.vercel.app/api/centres';
  var centreList = <Centre>[];

  @override
  void initState() {
    super.initState();
    _getData();
  }

  _getData() {
    http.get(Uri.parse(centreUrl)).then((response) {
      setState(() {
        List list = json.decode(response.body)['centres'];
        list.forEach((element) {
          setState(() {
            centreList.add(Centre.fromJson(element));
          });
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Centres'),
        ),
        body: centreList.isEmpty
            ? Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Table(
                  border: TableBorder.all(width: 1.0, color: Colors.black),
                  children: [
                    TableRow(children: [
                      TableCell(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('id',
                              style: TextStyle(fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('Name',
                              style: TextStyle(fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('Place',
                              style: TextStyle(fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('State',
                              style: TextStyle(fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center),
                        ),
                      ),
                    ]),
                    for (var data in centreList)
                      TableRow(children: [
                        TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child:
                                Text('${data.id}', textAlign: TextAlign.center),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(data.name, textAlign: TextAlign.center),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child:
                                Text(data.place, textAlign: TextAlign.center),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child:
                                Text(data.state, textAlign: TextAlign.center),
                          ),
                        ),
                      ])
                  ],
                ),
              ));
  }
}
