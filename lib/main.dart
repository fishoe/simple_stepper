import 'package:flutter/material.dart';
import 'package:simple_stepper/simple_stepper/step.dart';
import 'package:simple_stepper/simple_stepper/step_component.dart';
import 'package:simple_stepper/simple_stepper/stepper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: '이장님',
      home : StepperForm(),
    );
  }
}

class StepperForm extends StatelessWidget {
  const StepperForm({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(image: NetworkImage("https://picsum.photos/250?image=9"), width: 120, height: 120),
            SizedBox(height: 10),
            StepperImplTest(),
            SizedBox(height: 10,),
          ],
        ),
      ),
    );
  }
}

class StepperImplTest extends StatelessWidget {
  const StepperImplTest({super.key});

  @override
  Widget build(BuildContext context) {
    return SimpleStepper(steps: [
      _step1(),
      _step2(),
    ], onSubmit: (stepValue) async {
      print(stepValue);
    },);
  }

  SimpleStep _step1(){
    return SimpleStep(inputs: [
      SimpleTextForm(name: "name", label: "이름"),
      SimpleTextForm(name: "number", label: "번호"),
    ]);
  }

  SimpleStep _step2(){
    return SimpleStep(inputs: [
      SimpleTextForm(name: "text", label: "텍스트"),
    ]);
  }
}
