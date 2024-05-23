import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>{

  @override
  Widget build(BuildContext context){
    final imageSize = MediaQuery.of(context).size.width / 4;

    return Scaffold(
      appBar: AppBar(title: const Text('Profile'),),
      body: Column(
        children: [
          Container(
            constraints: BoxConstraints(
              minHeights: MediaQuery.of(context).size.width,
              minWidth: MediaQuery.of(context).size.width,
            ),
            child: Center(
              child: Icon(
                Icons.account_circle,
                size: imageSize,
              ),
            ),
          ).
        ],
      ),
    );
  }
}