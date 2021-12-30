import 'package:flutter/material.dart';

class KeyPad extends StatelessWidget {
  final int pinSize;
  final double buttonSize;
  final TextEditingController pinController;
  final Function onChange;
  final Function onSubmit;
  final bool isPinLogin;

  const KeyPad(
      {Key? key,
      required this.onChange,
      required this.onSubmit,
      required this.pinController,
      required this.isPinLogin,
      this.buttonSize = 60.0,
      this.pinSize = 6})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: Column(
        children: [
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buttonWidget('1'),
              buttonWidget('2'),
              buttonWidget('3'),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buttonWidget('4'),
              buttonWidget('5'),
              buttonWidget('6'),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buttonWidget('7'),
              buttonWidget('8'),
              buttonWidget('9'),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              iconButtonWidget(Icons.backspace, () {
                if (pinController.text.isNotEmpty) {
                  pinController.text = pinController.text
                      .substring(0, pinController.text.length - 1);
                }
                if (pinController.text.length > pinSize) {
                  pinController.text =
                      pinController.text.substring(0, pinSize - 1);
                }
                onChange(pinController.text);
              }),
              buttonWidget('0'),
              !isPinLogin
                  ? iconButtonWidget(Icons.check, () {
                      if (pinController.text.length > pinSize) {
                        pinController.text =
                            pinController.text.substring(0, pinSize - 1);
                      }
                      onSubmit(pinController.text);
                    })
                  : Container(
                      width: buttonSize,
                    ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buttonWidget(String buttonText) {
    return SizedBox(
      height: buttonSize,
      width: buttonSize,
      child: TextButton(
        style: ElevatedButton.styleFrom(shape: const CircleBorder()),
        onPressed: () {
          if (pinController.text.length <= pinSize - 1) {
            pinController.text = pinController.text + buttonText;
            onChange(pinController.text);
          }
        },
        child: Center(
          child: Text(
            buttonText,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black54,
                fontSize: 25),
          ),
        ),
      ),
    );
  }

  Widget iconButtonWidget(IconData icon, Function function) {
    return SizedBox(
      height: buttonSize,
      width: buttonSize,
      child: TextButton(
        style: ElevatedButton.styleFrom(shape: const CircleBorder()),
        onPressed: () => function(),
        child: Center(
          child: Icon(
            icon,
            size: 30,
            color: Colors.black54,
          ),
        ),
      ),
    );
  }
}
