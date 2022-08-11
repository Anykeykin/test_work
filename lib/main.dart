import 'dart:math';

import 'package:flutter/material.dart';
import 'package:untitled/view_tiles.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _controllerX = TextEditingController();
  final _controllerY = TextEditingController();

  void finder(latstr,longstr) {
    const z = 19;
    const E = 0.0818191908426;
    double lat = double.parse(latstr);
    double long = double.parse(longstr);

    double p = pow(2,z+8)/2;
    print(p);
    double beta = (pi * lat)/180;
    print(beta);
    double ef = (1 - E*sin(beta))/(1 + E*sin(beta));
    print(ef);
    double fi = tan(pi/4 + beta/2)*pow(ef,E/2);
    print(fi);

    double xp = p*(1+long/180);
    double yp = p*(1-log(fi)/pi);
    print('${(xp/256).floor()} - ${(yp/256).floor()}');
    print('${(xp/256)} - ${(yp/256)}');
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => ViewTiles((xp/256).floor(),(yp/256).floor()),
      ),
          (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text('Поиск'),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Широта:',
              style: Theme.of(context).textTheme.headline4,
            ),
            TextField(
              controller: _controllerX,
            ),
            Text(
              'Долгота:',
              style: Theme.of(context).textTheme.headline4,
            ),
            TextField(
              controller: _controllerY,
            ),
            ElevatedButton(
                onPressed: (){
                  finder(_controllerX.text,_controllerY.text);
                },
                child: const Text('Найти')
            )
          ],
        ),
      ),
    );
  }
}
