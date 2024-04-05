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
  bool? isEmail = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
       controller: widget.controller,
       decoration: InputDecoration(
        hintText: widget.hintText,
        labelText: widget.labelText,
        labelStyle: TextStyle(color: GlobalVariablesType.mainColor),
        hintStyle: const TextStyle(color: Colors.black38),
        filled: false,
        suffix: AnimatedContainer(
          duration: const Duration(milliseconds: 500), 
          padding: const EdgeInsets.all(2),
          decoration:  BoxDecoration(
            color: isEmail == false ? Colors.red : GlobalVariablesType.mainColor,
            shape: BoxShape.circle),
          child: isEmail == false ? const Icon(Icons.close, color: Colors.white, size: 16) : const Icon(Icons.done, color: Colors.white, size: 16),    
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: GlobalVariablesType.mainColor
          )
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: GlobalVariablesType.mainColor
          )
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(
            color: GlobalVariablesType.mainColor
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
        labelStyle: TextStyle(color: GlobalVariablesType.mainColor),
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
            color: isEightCharacter == false ? Colors.red : GlobalVariablesType.mainColor
          )
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: isEightCharacter == false ? Colors.red : GlobalVariablesType.mainColor
          )
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(
            color: isEightCharacter == false ? Colors.red : GlobalVariablesType.mainColor
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


class PhoneTextField extends StatefulWidget {
  final String? hintText;
  final String? labelText;
  final TextEditingController? controller;
  const PhoneTextField({super.key, this.hintText, this.labelText, this.controller});

  @override
  State<PhoneTextField> createState() => _PhoneTextFieldState();
}

class _PhoneTextFieldState extends State<PhoneTextField> {
  bool? isPhone = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
       controller: widget.controller,
       keyboardType: TextInputType.phone,
       decoration: InputDecoration(
        hintText: widget.hintText,
        labelText: widget.labelText,
        labelStyle: TextStyle(color: GlobalVariablesType.mainColor),
        hintStyle: const TextStyle(color: Colors.black38),
        filled: false,
        suffix: AnimatedContainer(
          duration: const Duration(milliseconds: 500), 
          padding: const EdgeInsets.all(2),
          decoration:  BoxDecoration(
            color: isPhone == false ? Colors.red : GlobalVariablesType.mainColor,
            shape: BoxShape.circle),
          child: isPhone == false ? const Icon(Icons.close, color: Colors.white, size: 16) : const Icon(Icons.done, color: Colors.white, size: 16),    
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: GlobalVariablesType.mainColor
          )
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: GlobalVariablesType.mainColor
          )
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(
            color: GlobalVariablesType.mainColor
          )
        )
       ),
       onChanged: (value) {
          validatePhone(value.length);
       },
    );
  }

  bool? validatePhone(int length) {
    if(length > 10){
      setState(() {
        isPhone = true;
      });
    }else{
      setState(() {
        isPhone = false;
      });
    }
    return isPhone;
  }
}


class NameTextField extends StatefulWidget {
  final String? hintText;
  final String? labelText;
  final TextEditingController? controller;
  const NameTextField({super.key, this.hintText, this.labelText, this.controller});

  @override
  State<NameTextField> createState() => _NameTextFieldState();
}

class _NameTextFieldState extends State<NameTextField> {
  bool? isName = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
       controller: widget.controller,
       keyboardType: TextInputType.name,
       decoration: InputDecoration(
        hintText: widget.hintText,
        labelText: widget.labelText,
        labelStyle: TextStyle(color: GlobalVariablesType.mainColor),
        hintStyle: const TextStyle(color: Colors.black38),
        filled: false,
        suffix: AnimatedContainer(
          duration: const Duration(milliseconds: 500), 
          padding: const EdgeInsets.all(2),
          decoration:  BoxDecoration(
            color: isName == false ? Colors.red : GlobalVariablesType.mainColor,
            shape: BoxShape.circle),
          child: isName == false ? const Icon(Icons.close, color: Colors.white, size: 16) : const Icon(Icons.done, color: Colors.white, size: 16),    
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: GlobalVariablesType.mainColor
          )
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: GlobalVariablesType.mainColor
          )
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(
            color: GlobalVariablesType.mainColor
          )
        )
       ),
       onChanged: (value) {
          validateName(value);
       },
    );
  }

  bool? validateName(String value) {
    if(RegExp(r"\s").hasMatch(value)){
      setState(() {
        isName = true;
      });
    }else{
      setState(() {
        isName = false;
      });
    }
    return isName;
  }
}