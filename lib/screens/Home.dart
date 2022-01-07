import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:isro/constants.dart';
import 'package:isro/screens/LoginScreen.dart';
import 'package:isro/screens/isro/dash.dart';
import 'package:isro/screens/mcqs/SubjectScreen.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  FirebaseAuth auth = FirebaseAuth.instance;

  Widget subjectView(String name) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 8.0),
        elevation: 4.0,
        child: ListTile(
          contentPadding: EdgeInsets.all(8),
          shape: Border.all(),
          trailing: CircleAvatar(child: Icon(Icons.navigate_next, size: 24.0)),
          title: Text(name,
              textAlign: TextAlign.center, style: TextStyle(fontSize: 28)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
              onPressed: () => logout(context), icon: Icon(Icons.exit_to_app))
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(8.0),
        child: ListView(
          children: [
            SizedBox(
              height: 16.0,
            ),
            Container(
              child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Dashboard();
                  }));
                },
                child: ListTile(
                  contentPadding: EdgeInsets.all(16.0),
                  shape: Border.all(width: 0.5, color: Colors.blue),
                  leading: Icon(Icons.info_outline,
                      color: Colors.lightBlueAccent, size: 48.0),
                  title: Text(
                    'ISRO Knowledge',
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 32.0, fontWeight: FontWeight.w300),
                  ),
                  subtitle: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Click to know more',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 16.0,
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Divider(thickness: 2, color: Colors.black54),
            ),
            SizedBox(
              height: 16.0,
            ),
            Container(
              // Subject Panel
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(8.0),
              ),
              width: double.infinity,
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.school_outlined, size: 48),
                    title: Text('Subjects',
                        style: Theme.of(context).textTheme.headline3),
                    subtitle: Text('MCQs test'),
                  ),
                  SizedBox(height: 8.0),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        InkWell(
                          child: subjectView('Astrophysics'),
                          onTap: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return SubjectScreen(subject: Astrophysics);
                            }));
                          },
                        ),
                        InkWell(
                          child: subjectView('Aeronautics'),
                          onTap: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return SubjectScreen(subject: Aeronautics);
                            }));
                          },
                        ),
                        InkWell(
                          child: subjectView('Geology'),
                          onTap: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return SubjectScreen(subject: Geology);
                            }));
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 32,
            ),
            Text(
                'The app is made as a task for a job application and is not supposed to be used for any personal/commercial purpose.'),
            Text('https://github.com/krupeshParmar'),
          ],
        ),
      ),
    );
  }

  void logout(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Are you sure you wish to logout?'),
            content: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                        side: BorderSide(color: Colors.pinkAccent)),
                  )),
                  child: Text(
                    'Yes',
                    style: TextStyle(fontSize: 18.0, color: Colors.blueAccent),
                  ),
                  onPressed: () {
                    auth.signOut();
                    Navigator.pop(context);
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                ),
                SizedBox(
                  width: 8.0,
                ),
                TextButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                        side: BorderSide(color: Colors.greenAccent)),
                  )),
                  child: Text(
                    'No',
                    style: TextStyle(fontSize: 18.0, color: Colors.blueAccent),
                  ),
                  onPressed: () => Navigator.pop(context),
                )
              ],
            ),
          );
        });
  }
}
