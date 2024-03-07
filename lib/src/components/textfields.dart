import 'package:flutter/material.dart';
import 'package:mockup_one/src/components/main_variable.dart';

class UsernameTextFields extends StatefulWidget {
  final String? hintText;
  final String? labelText;
  final TextEditingController? controller;
  const UsernameTextFields({super.key, this.hintText, this.labelText, this.controller});

  @override
  State<UsernameTextFields> createState() => _UsernameTextFieldsState();
}

class _UsernameTextFieldsState extends State<UsernameTextFields> {
  bool? isEmail;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
       controller: widget.controller,
       decoration: InputDecoration(
        hintText: widget.hintText,
        labelText: widget.labelText,
        labelStyle: TextStyle(color: GlobalVariablesType.buttonTextColor![3]),
        hintStyle: const TextStyle(color: Colors.black38),
        filled: false,
        suffix: AnimatedContainer(
          duration: const Duration(milliseconds: 500), 
          padding: const EdgeInsets.all(2),
          decoration:  BoxDecoration(
            color: isEmail == false ? Colors.red : GlobalVariablesType.buttonSquereColor![0],
            shape: BoxShape.circle),
          child: isEmail == false ? const Icon(Icons.close, color: Colors.white, size: 16) : const Icon(Icons.done, color: Colors.white, size: 16),    
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: GlobalVariablesType.borderLineTextFieldColor![0]
          )
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: GlobalVariablesType.borderLineTextFieldColor![0]
          )
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(
            color: GlobalVariablesType.borderLineTextFieldColor![0]
          )
        )
       ),
       onChanged: (value) {
          validateEmailBool(value: value);
       },
    );
  }

  bool? validateEmailBool({String? value}) {
    const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
        r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
        r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
        r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
        r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
        r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
        r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
    final regex = RegExp(pattern);
    if(!regex.hasMatch(value!)){
      setState(() {
        isEmail = false;
      });
    }else{
      setState(() {
        isEmail = true;
      });
    }
    return isEmail;
  }
}

class PasswordTextField extends StatefulWidget {
  final String? hintText;
  final String? labelText;
  final TextEditingController? controller;
  const PasswordTextField({super.key, this.hintText, this.labelText, this.controller});

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool? isEightCharacter;
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
       controller: widget.controller,
       obscureText: obscureText,
       decoration: InputDecoration(
        hintText: widget.hintText,
        labelText: widget.labelText,
        labelStyle: TextStyle(color: GlobalVariablesType.buttonTextColor![3]),
        hintStyle: const TextStyle(color: Colors.black38),
        filled: false,
        suffix: GestureDetector(
          onTap: (){
            setState(() {
              obscureText = !obscureText;
            });
          },
          child: obscureText == true ?  Icon(Icons.visibility, color: GlobalVariablesType.buttonSquereColor![0]) :  Icon(Icons.visibility_off, color: GlobalVariablesType.buttonSquereColor![0]),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: isEightCharacter == false ? Colors.red : GlobalVariablesType.borderLineTextFieldColor![0]
          )
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: isEightCharacter == false ? Colors.red : GlobalVariablesType.borderLineTextFieldColor![0]
          )
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(
            color: isEightCharacter == false ? Colors.red : GlobalVariablesType.borderLineTextFieldColor![0]
          )
        )
       ),
       onChanged: (value) {
          if(value.length < 8){
            setState(() {
              isEightCharacter = false;
            });
          }else{
            setState(() {
              isEightCharacter = true;
            });
          }
       },
    );
  }
}