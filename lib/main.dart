import 'package:flutter/material.dart';

import '_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _viewPortFraction = 1;
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _controller = PageController(
      initialPage: 0,
      viewportFraction: _viewPortFraction,
    );
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(
            () => _viewPortFraction = _viewPortFraction == 1 ? 0.8 : 1),
        child: Icon(Icons.ac_unit),
      ),
      body: PageView(
        controller: _controller,
        children: [
          _heroNavigation(),
          _navigation(),
          _form(),
        ],
      ),
    );
  }

  Widget _heroNavigation() {
    return Container(
      color: Colors.red,
      child: InkWell(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext _) => Page1(),
          ),
        ),
        child: Hero(
          tag: 'HomePageImage',
          child: Container(
            width: double.infinity,
            child: Image(
              image: NetworkImage(
                'https://images.unsplash.com/photo-1599703678443-4fdafa9e1d0a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1011&q=80',
              ),
              height: 300,
            ),
          ),
        ),
      ),
    );
  }

  Widget _navigation() {
    return Container(
      color: Colors.green.withOpacity(0.3),
      child: FlatButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext _) => Page1(),
          ),
        ),
        child: Text('open Page 1'),
      ),
    );
  }

  Widget _form() {
    return Container(
      color: Colors.grey.shade300,
      child: Padding(
        padding: EdgeInsets.only(
          top: kToolbarHeight,
          left: 20,
          right: 20,
        ),
        child: Column(
          children: [
            Text(
              'Form',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: _nameController,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.all(14.0),
                hintText: 'Enter name',
                hintStyle: TextStyle(
                  fontSize: 10,
                ),
              ),
              autocorrect: false,
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.all(14.0),
                hintText: 'Enter Email',
                hintStyle: TextStyle(
                  fontSize: 10,
                ),
              ),
              autocorrect: false,
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: _passwordController,
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.all(14.0),
                hintText: 'Password',
                hintStyle: TextStyle(
                  fontSize: 10,
                ),
              ),
              autocorrect: false,
            ),
            SizedBox(height: 20),
            FlatButton(
              onPressed: () {
                print('========');
                print('Name: ${_nameController.text}');
                print('Email: ${_emailController.text}');
                print('Password: ${_passwordController.text}');
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
