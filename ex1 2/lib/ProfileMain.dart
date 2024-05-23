'''
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
'''

 // main.dart
import 'package:flutter/material.dart';
import 'package:netflix_clone_lecture_note/screen/home_screen.dart';
import 'package:netflix_clone_lecture_note/screen/more_screen.dart';
import 'package:netflix_clone_lecture_note/widget/bottom_bar.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {  //변경가능
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TabController controller;
  @override
  Widget build(BuildContext context) { //UI
    return MaterialApp(  //flutter 어플의 전반적인 설정을 담당하는 위젯
      title: 'Bbongflix',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.black,
        accentColor: Colors.white,
      ),
      home: DefaultTabController(  //어플이 시작될 때 표시할 위젯, 탭 간 전환 용이한 위젯 씀
        length: 4,  //탭 4개
        child: Scaffold(  //기본적인 화면 구조를 제공하는 위젯. body, bottomNavigationBar 쓰임.
          body: TabBarView(   // 전환할 수 있는 각 탭의 해당하는 콘텐츠 표시하는 위젯
            physics: NeverScrollableScrollPhysics(), 
            children: <Widget>[
              HomeScreen(),
              Container(
                child: Center(
                  child: Text('search'),
                ),
              ),
              Container(
                child: Center(
                  child: Text('save'),
                ),
              ),
              MoreScreen(),
            ],
          ),
          bottomNavigationBar: Bottom(),
        ),
      ),
    );
  }
}