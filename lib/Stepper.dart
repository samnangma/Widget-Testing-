import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentStep = 0;

  List<Step> stepList() => [
        Step(
          title: Text("Account"),
          isActive: _currentStep >= 0,
          state: _currentStep <= 0 ? StepState.editing : StepState.complete,
          content: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              TextField(
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              )
            ],
          ),
        ),
        Step(
          title: Text("Address"),
          isActive: _currentStep >= 1,
          state: _currentStep <= 1 ? StepState.editing : StepState.complete,
          content: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Address',
                ),
              ),
              const SizedBox(
                height: 8,
              ),
            ],
          ),
        ),
        Step(
          title: Text("Confirm"),
          isActive: _currentStep >= 2,
          state: StepState.complete,
          content: Center(
            child: Text("Confirm"),
          ),
        ),
      ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Stepper'),
        centerTitle: true,
      ),
      body: Stepper(
        steps: stepList(),
        type: StepperType.horizontal,
        elevation: 0,
        currentStep: _currentStep,
        onStepContinue: () {
          if (_currentStep < (stepList().length - 1)) {
            setState(() {
              _currentStep += 1;
            });
          }
          ;
        },
        onStepCancel: () {
          if (_currentStep > 0) {
            setState(() {
              _currentStep -= 1; 
            });
          }
        },
      ),
    );
  }
}
