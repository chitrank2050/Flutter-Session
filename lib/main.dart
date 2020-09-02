import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int status = 1;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF4AB4E6),
          title: Text('App bar'),
          elevation: 0,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Child(status.toString()),
            FlatButton(
              child: Text('Click ME'),
              onPressed: () {
                setState(() => status++);
                print(status);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class Child extends StatelessWidget {
  final String status;

  const Child(this.status);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(status),
    );
  }
}
