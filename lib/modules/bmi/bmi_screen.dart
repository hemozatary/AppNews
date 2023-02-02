   import 'dart:math';

import 'package:firas/modules/bmi_result/bmi_resoult_screen.dart';
import 'package:flutter/material.dart';

class BmiScreen extends StatefulWidget {

   
     @override
     State<BmiScreen> createState() => _BmiScreenState();
   }
   
   class _BmiScreenState extends State<BmiScreen> {
  bool isMale = true;
  double height = 120.0;
  int weight = 40;
  int Age = 60;

     @override
     Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            'BMI calcolator',
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: ()
                        {
                          setState(() {
                          isMale = true;
                          });
                        },
                        child: Container(

                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0)  ,
                            color: isMale?Colors.blue :Colors.grey[400],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(
                                  image:AssetImage('assets/images/mail.jpg'),
                                height: 90.0,
                                  width: 90.0,



                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Text(
                                'MAIL',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: ()
                        {
                          setState(() {
                              isMale = false;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0)  ,
                            color:isMale? Colors.grey[400]: Colors.pink ,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(
                                image:AssetImage('assets/images/famile.jpg'),
                                height: 90.0,
                                width: 90.0,

                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Text(
                                'FEMAIL',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),



            ),
            Expanded(
              child:Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.grey[400],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'HEIGHT',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline:TextBaseline.alphabetic,
                        children: [
                          Text(
                            '${height.round()}',
                            style: TextStyle(
                              fontSize: 40.0,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          Text(
                            'CM',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Slider(
                          value:height,
                          max: 220.0,
                          min: 80.0,
                          onChanged: (value)
                          {
                           setState(() {
                             height = value;
                           });

                          } ,
                      ) ,

                    ],
                  ),
                ),
              ),



            ),
            Expanded(
              child:  Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(


                        child: Column(

                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Weight',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),

                            ),
                            Text(
                              '${weight}',
                              style: TextStyle(
                                fontSize: 40.0,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                  FloatingActionButton(
                                      onPressed: ()
                                      {
                                       setState(() {
                                         weight --;
                                       });
                                      },
                                    heroTag: weight --,
                                      mini: true,
                                    child: Icon(
                                      Icons.remove,

                                    ),

                                  ),
                                FloatingActionButton(
                                    onPressed: (){
                                      setState(() {
                                        weight ++;
                                      });
                                    },
                                  heroTag: weight++,
                                  mini: true,
                                  child: Icon(
                                    Icons.add,
                                  ),


                                ) ,
                              ],
                            ),

                          ],

                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.grey[400],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Expanded(
                      child: Container(


                        child: Column(

                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'AGE',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),

                            ),
                            Text(
                              '${Age}',
                              style: TextStyle(
                                fontSize: 40.0,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,


                              children: [
                                FloatingActionButton(
                                  onPressed: ()
                                  {
                                  setState(() {
                                    Age --;
                                  });
                                  },
                                  heroTag:Age--,
                                  mini: true,
                                  child: Icon(
                                    Icons.remove,

                                  ),

                                ),
                                FloatingActionButton(
                                  onPressed: (){
                                    setState(() {
                                      Age ++;
                                    });
                                  },
                                  heroTag:Age++,
                                  mini: true,
                                  child: Icon(
                                    Icons.add,
                                  ),


                                ) ,
                              ],
                            ),

                          ],

                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.grey[400],
                        ),
                      ),
                    ),
                  ],
                ),
              ),



            ),
            Container(
              width: double.infinity,
              color: Colors.blue,
              child: MaterialButton(
                  onPressed: ()
                  {
                 var Result = weight / pow(height/100, 2);
                 print(Result.round());

                 Navigator.push(
                 context   ,
                     MaterialPageRoute(
                         builder: (context) => BMIResultScreen(
                           Age: Age,
                           isMale: isMale,
                           Result:Result.round(),
                         ),

                     ),
                 );
                  }  ,
                child: Text(
                  'Calcolate',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    
                    color: Colors. white,
                  ),
                ),


              ),
            ),
          ],
        ),         
                          

      );
     }
   }
   
  