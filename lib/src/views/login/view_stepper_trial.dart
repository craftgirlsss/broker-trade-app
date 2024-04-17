import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mockup_one/src/components/main_variable.dart';
import 'package:mockup_one/src/components/textstyle.dart';
import 'package:mockup_one/src/helpers/focus_manager.dart';
import 'package:mockup_one/src/views/login/content_3.dart';
import 'package:mockup_one/src/views/login/stepper_components_trial.dart';
import 'package:mockup_one/src/views/mainpage.dart';
import 'content_1.dart';
import 'content_2.dart';

class StepperTrialPage extends StatefulWidget {
  const StepperTrialPage({super.key});

  @override
  State<StepperTrialPage> createState() => _StepperTrialPageState();
}

class _StepperTrialPageState extends State<StepperTrialPage> {
  int currentStep = 1;
  int stepLength = 3;
  bool? complete;

  next() {
    if (currentStep <= stepLength) {
      goTo(currentStep + 1);
    }
  }

  back() {
    if (currentStep > 1) {
      goTo(currentStep - 1);
    }
  }

  goTo(int step) {
    setState(() => currentStep = step);
    if (currentStep > stepLength) {
      setState(() => complete = true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => focusManager(),
      child: Scaffold(
        backgroundColor: GlobalVariablesType.backgroundColor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                NumberStepper(
                  totalSteps: stepLength,
                  width: MediaQuery.of(context).size.width,
                  curStep: currentStep,
                  stepCompleteColor: GlobalVariablesType.mainColor,
                  currentStepColor: const Color(0xffdbecff),
                  inactiveColor: const Color(0xffbababa),
                  lineWidth: 3.5,
                  nameStep: const ["Personal", "Payment", "Addtional"],
                ),
                const SizedBox(
                  height: 30,
                ),
                if(currentStep <= stepLength)
                  if(currentStep == 1)
                    const Content1()
                  else if(currentStep == 2)
                    const Content2()
                  else if(currentStep == 3)
                    const Content3()
                  else
                    const Text("error")
                else
                  const Text("data")
              ],
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: currentStep == 1 ? Colors.grey : GlobalVariablesType.mainColor
                  ),
                  onPressed: currentStep == 1
                      ? (){}
                      : () {
                          back();
                        },
                  child: Text('Back', style: kDefaultTextStyleCustom(color: Colors.black, fontSize: 13),),
                ),
              ),
              const SizedBox(width: 5),
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: GlobalVariablesType.mainColor
                  ),
                  onPressed: () {
                    if(currentStep == 3){
                      Get.to(() => const MainPage());
                    }else{
                      next();
                    }
                  },
                  child: Text(
                    currentStep == stepLength ? 'Finish' : 'Next', style: kDefaultTextStyleCustom(color: Colors.black, fontSize: 13),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}