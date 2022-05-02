import 'package:flutter/material.dart';
import 'package:number_pad/number_pad.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  String code = "";

  @override
  void initState() {
    super.initState();
    NumberPad.shuffle();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Number Pad app'),
        ),
        body: Column(
          children: [
            GestureDetector(
              onTap: (){
                print(33);
                NumberPad.shuffle();
              },
              child: Center(
                child: Text("code = ${code}"),
              ),
            ),
            const Spacer(),
            NumberPad(
              onChange: (value){
                setState(() {
                  print(value);
                  code = value;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
