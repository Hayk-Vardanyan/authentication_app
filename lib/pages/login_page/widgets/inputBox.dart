import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class InputBox extends StatelessWidget {
  final TextEditingController controller;
  final String? errorText;
  final void Function(String)? onChange;
  final FocusNode? focusNode;
  final VoidCallback? onTap;
  final VoidCallback? onDone;

  const InputBox({
    Key? key,
    required this.controller,
    this.errorText,
    this.onChange,
    this.focusNode,
    this.onTap,
    this.onDone,
  }) : super(key: key);

  // final validNumbers = <String>['091', '093', '095', '099', '033', '096'];

  @override
  Widget build(BuildContext context) {
    return TextField(
      onTap: onTap,
      focusNode: focusNode,
      controller: controller,
      onSubmitted: (_) {
        if(onDone != null){
          onDone!();
        }
      },
      decoration: InputDecoration(
        // icon: const Icon(Icons.phone),
        errorText: errorText,
        hintText: 'Enter your phone number',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: const BorderSide(
            color: Colors.blue,
            width: 1.5,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: const BorderSide(
            color: Colors.blue,
            width: 1.5,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: const BorderSide(
            color: Colors.blue,
            width: 1.5,
          ),
        ),
      ),
      keyboardType: TextInputType.phone,
      onChanged: onChange,
    );
  }

//   bool isValidInput(String input) {
//     if (input.length != 9) {
//       return false;
//     }
//     if (!validNumbers.contains(input.substring(0, 3))) {
//       return false;
//     }
//     return true;
//   }
}
