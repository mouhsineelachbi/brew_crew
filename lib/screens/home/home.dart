import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[50],
      appBar: AppBar(
        backgroundColor: Colors.brown[500],
        title: Text("Brew Crew"),
        elevation: 0.0,
        actions: [
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text("Logout"),
            onPressed: (){},
          )
        ],
      ),
    );
  }
}
