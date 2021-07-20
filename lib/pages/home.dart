import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List <double> rating = [1,1,1,1,1,1];
  List <String> questions = [
    'How was the quality of the food?',
    'How was the menu variety?',
    'How was the service?',
    'How was the atmosphere?',
    'How was the cleanliness?',
    'How likely are you to visit us again?',
  ];
  String but = 'Next';
  int index = 0;
  double finalrating = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text('Feedback'),
            centerTitle: true,
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                  Center(child: Text(questions[index])),
                  Container(
                    margin: EdgeInsets.all(40.0),
                    child: SfSlider(
                      value: rating[index],
                      min: 1.0,
                      max: 5.0,
                      showLabels: true,
                      interval: 1.0,
                      stepSize: 1.0,
                      activeColor: Colors.blue,
                      inactiveColor: Colors.blue[200],
                      onChanged: (newrating){
                        setState(() {
                          rating[index] = newrating;
                        });
                      },
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if(index<=(questions.length-2))
                        {
                          setState(() {
                            finalrating += rating[index];
                            index +=1;
                          });
                          but = 'Next';
                        }
                        else
                          {
                            finalrating += rating[index];
                            Navigator.pushReplacementNamed(context, '/comment', arguments: {
                              'rating' : finalrating
                            });
                            but = 'Submit';
                          }
                      },
                      child: Text(but),
                  ),
                ],
              )
    ));
  }
}
