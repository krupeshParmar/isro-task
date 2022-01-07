import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:isro/screens/isro/CustomerSatelliteScreen.dart';
import 'package:isro/screens/isro/LauncherScreen.dart';
import 'package:isro/screens/isro/SpacecraftScreen.dart';

import 'CentreScreen.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  Widget moduleView(String name) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 8.0),
        elevation: 4.0,
        child: ListTile(
          contentPadding: EdgeInsets.all(8),
          shape: Border.all(),
          trailing: CircleAvatar(
              child: Icon(Icons.arrow_forward_outlined, size: 24.0)),
          title: Text(name,
              textAlign: TextAlign.center, style: TextStyle(fontSize: 24)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ISRO Knowledge"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SpacecraftScreen();
                }));
              },
              child: moduleView('Spacecrafts'),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return LauncherScreen();
                }));
              },
              child: moduleView('Launchers'),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return CustomerSatelliteScreen();
                }));
              },
              child: moduleView('Customer Satellites'),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return CentreScreen();
                }));
              },
              child: moduleView('Centres'),
            ),
          ],
        ),
      ),
    );
  }
}
