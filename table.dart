import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(centerTitle: true,
    title: Text("Exam1",style: TextStyle(color: Colors.white),),backgroundColor: Colors.blue,),
    body: Center(child: Image.asset("assets/one.png"),),
    floatingActionButton: FloatingActionButton(onPressed: (){
      int no= 8;
    for(int i =1; i<=10;i++){
      print("${no}*${i}=${no*i}");
    }
    },
    child: Icon(Icons.whatshot),
    ),
    );
  }
}


