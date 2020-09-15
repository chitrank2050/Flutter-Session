import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  const Page1({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 1'),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Hero(
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
          SizedBox(height: 10),
          Text('PAGE 1'),
        ],
      ),
    );
  }
}
