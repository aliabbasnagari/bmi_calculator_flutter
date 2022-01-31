import 'dart:math';

import 'package:bmi_calc/measure_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'icon_content.dart';
import 'button_card.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // 0 means male, 1 means female
  int selectedGender = 0;
  int weight = 50;
  int height = 100;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
        backgroundColor: Colors.blue[900],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ButtonCard(
                cardChild: IconContent(
                  gender: 'Male',
                  icon: Icons.male,
                  active: (selectedGender == 0),
                ),
                onPress: () {
                  setState(() {
                    selectedGender = 0;
                  });
                },
              ),
              ButtonCard(
                cardChild: IconContent(
                  gender: 'Female',
                  icon: Icons.female,
                  active: (selectedGender == 1),
                ),
                onPress: () {
                  setState(() {
                    selectedGender = 1;
                  });
                },
              ),
            ],
          ),
          Row(
            children: [
              ButtonCard(
                cardChild: MeasureCard(
                  title: 'Weight',
                  unit: 'Kg',
                  decrement: () {
                    setState(() {
                      if (weight > 1) {
                        weight--;
                      }
                    });
                  },
                  increment: () {
                    setState(() {
                      weight++;
                    });
                  },
                  measure: weight,
                ),
                onPress: () {},
              ),
              ButtonCard(
                cardChild: MeasureCard(
                  title: 'Height',
                  unit: 'cm',
                  decrement: () {
                    setState(() {
                      if (height > 1) {
                        height--;
                      }
                    });
                  },
                  increment: () {
                    setState(() {
                      height++;
                    });
                  },
                  measure: height,
                ),
                onPress: () {},
              )
            ],
          ),
          GestureDetector(
            onTap: () {
              double bmi = weight / pow(height / 100, 2);
              String bmitext = bmi.toStringAsFixed(2);
              String status = '';
              if (bmi < 18.5) {
                status = 'Under Weight';
              } else if (bmi > 18.4 && bmi < 25) {
                status = 'Healthy Weight';
              } else if (bmi > 24.9 && bmi < 30) {
                status = 'Overweight';
              } else if (bmi >= 30) {
                status = 'Obese';
              }
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Your BMI is:'),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '$bmitext   kg/m^2',
                            style: const TextStyle(fontSize: 30),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                            child: Text('Status: $status'),
                          )
                        ],
                      ),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('close')),
                      ],
                    );
                  });
            },
            child: Container(
              width: double.infinity,
              height: 70,
              color: Colors.pink,
              child: const Center(
                child: Text(
                  'Calculate',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
