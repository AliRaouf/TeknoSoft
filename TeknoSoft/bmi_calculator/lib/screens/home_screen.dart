import 'package:bmi_calculator/widgets/gender_button.dart';
import 'package:bmi_calculator/widgets/slider.dart';
import 'package:bmi_calculator/widgets/weight_scroll.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  bool isMale = false;
  bool isFemale = false;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int? currentIndexWeight;
  int age = 20;
  double? currentIndexHeight;

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        onPressed: ()async{
          print(currentIndexWeight);
          print(currentIndexHeight);
          double bmi = currentIndexWeight!/((currentIndexHeight!/100)*(currentIndexHeight!/100));
          String? bmiCategory;
          if(bmi <18.5){
            bmiCategory='Underweight';
          }else if (bmi < 24.9) {
            bmiCategory = 'Normal Weight';
          } else if (bmi < 29.9) {
            bmiCategory = 'Overweight';
          } else if (bmi < 34.9) {
            bmiCategory = 'Obese Class I';
          } else if (bmi < 39.9) {
            bmiCategory = 'Obese Class II';
          } else {
            bmiCategory = 'Obese Class III';
          }
          showModalBottomSheet<void>(
            context: context,
            builder: (BuildContext context) {
              return Container(decoration: BoxDecoration(gradient: LinearGradient(
                stops: [0.4, 1],
                colors: [Color(0xFFfa9372), Color(0xFFef709b)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
                height: 200,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(bmiCategory!,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24,color: Color(0xff232425)),),
                      ),
                      Text("Your BMI is ${bmi.toStringAsFixed(1)}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24,color: Color(0xff232425)),)
                    ],
                  ),
                ),
              );
          },);
        },
        child: Container(
            width: w,
            height: h,
            child: Center(
                child: Text(
              "BMI",
              style: TextStyle(color: Color(0xff232425)),
            )),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(999),
              gradient: LinearGradient(
                stops: [0.4, 1],
                colors: [Color(0xFFfa9372), Color(0xFFef709b)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            )),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      backgroundColor: Color(0xfff1f1f1),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xfffa9372),
        title: Text(
          "Body Mass Index",
          style: TextStyle(
              color: Color(0xff232425),
              fontWeight: FontWeight.w600,
              fontSize: 24),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 18),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Gender",
                  style: TextStyle(
                      color: Color(0xff232425),
                      fontWeight: FontWeight.w400,
                      fontSize: 18),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GenderButton(
                    h: h,
                    w: w,
                    gender: widget.isMale,
                    icon: Icons.male,
                    text: "Male",
                    selectedColor: Color(0xff2735fd),
                    onPressed: () {
                      widget.isMale = true;
                      widget.isFemale = false;
                      setState(() {});
                    },
                  ),
                  GenderButton(
                    h: h,
                    w: w,
                    gender: widget.isFemale,
                    icon: Icons.female,
                    text: "Female",
                    selectedColor: Color(0xffFF69B4),
                    onPressed: () {
                      widget.isFemale = true;
                      widget.isMale = false;
                      setState(() {});
                    },
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Row(
                children: [
                  Text(
                    "Height (in cm)",
                    style: TextStyle(
                        color: Color(0xff232425),
                        fontWeight: FontWeight.w400,
                        fontSize: 18),
                  ),
                ],
              ),
            ),
            Container(
                height: h * 0.15,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(15)),
                child: HeightSlider(onChanged: (value) {
                  currentIndexHeight=value.toDouble();
                  print(currentIndexHeight);
                  setState(() {

                  });
                },
                  min: 50,
                  max: 200,
                  currentValue: currentIndexHeight??125,
                )),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Weight (in kg)",
                        style: TextStyle(
                            color: Color(0xff232425),
                            fontWeight: FontWeight.w400,
                            fontSize: 18),
                      ),
                      WeightScroll(onChanged: (val){
                        currentIndexWeight=val;
                        print(currentIndexWeight);
                        setState(() {
                        });
                      },
                          w: w, h: h, currentIndex: currentIndexWeight??60),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Age",
                        style: TextStyle(
                            color: Color(0xff232425),
                            fontWeight: FontWeight.w400,
                            fontSize: 18),
                      ),
                      Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(15)),
                          height: h * 0.15,
                          width: w * 0.425,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              IconButton(
                                onPressed: () {
                                  if (age != 0) {
                                    age--;
                                  }
                                  setState(() {});
                                },
                                icon: Icon(
                                  Icons.remove,
                                  color: Colors.grey,
                                ),
                                style: ButtonStyle(
                                    shape: MaterialStatePropertyAll(
                                        RoundedRectangleBorder(
                                            side: BorderSide(
                                                color: Colors.grey)))),
                              ),
                              Text(
                                "$age",
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff232425)),
                              ),
                              IconButton(
                                onPressed: () {
                                  if (age != 100) {
                                    age++;
                                  }
                                  setState(() {});
                                },
                                icon: Icon(
                                  Icons.add,
                                  color: Colors.grey,
                                ),
                                style: ButtonStyle(
                                    shape: MaterialStatePropertyAll(
                                        RoundedRectangleBorder(
                                            side: BorderSide(
                                                color: Colors.grey)))),
                              )
                            ],
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
