import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:world_time/pages/home.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

class Com extends StatefulWidget {
  const Com({Key? key}) : super(key: key);

  @override
  _ComState createState() => _ComState();
}

class _ComState extends State<Com> {
  int out = 0;
  List <String> display = [
    'We are sorry for your inconvenience',
    'Hope we serve you better next time',
    'We hope you come back next time!',
  ];
  Color text_color = Colors.red;
  Map rating = {};
  @override
  Widget build(BuildContext context) {
    rating = ModalRoute.of(context)!.settings.arguments as Map;
    print(rating['rating']);
    if(rating['rating']<10)
      {
        out=0;
        text_color=Colors.red;
      }
    else if(rating['rating']<20){
      out=1;
      text_color=Colors.yellow;
    }
    else{
      out=2;
      text_color=Colors.green;
    }
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text('Feedback'),
              centerTitle: true,
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(child: Text(
                    display[out],
                    style: TextStyle(
                      fontSize: 20,
                      color: text_color,
                    ),)),
                SizedBox(height: 40.0),
                ElevatedButton(
                    onPressed: () {
                      Phoenix.rebirth(context);
                    },
                    child: Text('Restart')),
              ],
            ),
        ));
  }
}
