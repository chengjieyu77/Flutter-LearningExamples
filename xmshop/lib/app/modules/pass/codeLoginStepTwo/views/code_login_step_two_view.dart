import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';

import '../controllers/code_login_step_two_controller.dart';

import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../../widgets/passButton.dart';

class CodeLoginStepTwoView extends GetView<CodeLoginStepTwoController> {
  const CodeLoginStepTwoView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CodeLoginStepTwoView'),
        centerTitle: true,
      ),
      body: ListView(
          children: [Container(
        child: PinCodeTextField(
          autoFocus: true,
          keyboardType: TextInputType.number,
          appContext: context,
          length: 6,
          obscureText: false,
          animationType: AnimationType.fade,
          pinTheme: PinTheme(
            shape: PinCodeFieldShape.box,
            borderRadius: BorderRadius.circular(5),
            fieldHeight: 50,
            fieldWidth: 40,
            
            activeFillColor: Colors.white,
          ),
          animationDuration: Duration(milliseconds: 300),
          backgroundColor: Colors.blue.shade50,
          enableActiveFill: true,
          errorAnimationController: controller.errorAnimationController,
          controller: controller.editingController,
          onCompleted: (v) {
            print("Completed");
          },
          onChanged: (value) {
            print(value);
            // setState(() {
            //   currentText = value;
            // });
          },
          beforeTextPaste: (text) {
            print("Allowing to paste $text");
            //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
            //but you can show anything you want here, like your pop up saying wrong paste format or etc
            return true;
          },
        ),
      ),
      Passbutton(onPressed: (){}, text: "verify code")]),
    );
  }
}
