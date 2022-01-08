import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:isro/models/CustomerSatellites.dart';

class CustomerSatelliteScreen extends StatefulWidget {
  const CustomerSatelliteScreen({Key? key}) : super(key: key);

  @override
  _CustomerSatelliteScreenState createState() =>
      _CustomerSatelliteScreenState();
}

class _CustomerSatelliteScreenState extends State<CustomerSatelliteScreen> {
  final customSatelliteUrl = 'https://isro.vercel.app/api/customer_satellites';
  var customerSatellites = <CustomerSatellite>[];

  @override
  void initState() {
    super.initState();
    _getData();
  }

  _getData() {
    http.get(Uri.parse(customSatelliteUrl)).then((response) {
      setState(() {
        List list = json.decode(response.body)['customer_satellites'];
        list.forEach((element) {
          setState(() {
            customerSatellites.add(CustomerSatellite.fromJson(element));
          });
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Customer Satellites'),
        ),
        body: customerSatellites.isEmpty
            ? Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Table(
                  border: TableBorder.all(width: 1.0, color: Colors.black),
                  children: [
                    TableRow(children: [
                      TableCell(
                        child: Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Text('id',
                              style: TextStyle(fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Text('Country',
                              style: TextStyle(fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Text('Mass',
                              style: TextStyle(fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Text('Launch Date',
                              style: TextStyle(fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Text('Launcher',
                              style: TextStyle(fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center),
                        ),
                      ),
                    ]),
                    for (var data in customerSatellites)
                      TableRow(children: [
                        TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Text(data.id, textAlign: TextAlign.center),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(4.0),
                            child:
                                Text(data.country, textAlign: TextAlign.center),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Text(data.mass, textAlign: TextAlign.center),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Text(data.launch_date,
                                textAlign: TextAlign.center),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Text(data.launcher,
                                textAlign: TextAlign.center),
                          ),
                        ),
                      ])
                  ],
                ),
              ));
  }
}
