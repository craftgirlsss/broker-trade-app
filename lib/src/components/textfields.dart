import 'package:flutter/material.dart';
import 'package:mockup_one/src/components/main_variable.dart';
import 'package:mockup_one/src/components/textstyle.dart';
import 'package:mockup_one/src/helpers/email_validator.dart';

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
       style: kDefaultTextStyleCustom(fontSize: 13),
       keyboardAppearance: Brightness.dark,
       decoration: InputDecoration(
        hintText: widget.hintText,
        labelText: widget.labelText,
        labelStyle: TextStyle(color: GlobalVariablesType.mainColor),
        hintStyle: TextStyle(color: GlobalVariablesType.mainTextColor.withOpacity(0.7), fontSize: GlobalVariablesType.defaultFontSize),
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
          if(validateEmailBool(value) == true){
            setState(() {
              isEmail = true;
            });
          }else{
            setState(() {
              isEmail = false;
            });
          }
       },
    );
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
       keyboardAppearance: Brightness.dark,
       style: kDefaultTextStyleCustom(fontSize: 13),
       decoration: InputDecoration(
        hintText: widget.hintText,
        labelText: widget.labelText,
        labelStyle: TextStyle(color: GlobalVariablesType.mainColor),
        hintStyle: TextStyle(color: GlobalVariablesType.mainTextColor.withOpacity(0.7), fontSize: GlobalVariablesType.defaultFontSize),
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
       keyboardAppearance: Brightness.dark,
       style: kDefaultTextStyleCustom(fontSize: 13),
       decoration: InputDecoration(
        hintText: widget.hintText,
        labelText: widget.labelText,
        labelStyle: TextStyle(color: GlobalVariablesType.mainColor),
        hintStyle: TextStyle(color: GlobalVariablesType.mainTextColor.withOpacity(0.7), fontSize: GlobalVariablesType.defaultFontSize),
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
       keyboardAppearance: Brightness.dark,
       style: kDefaultTextStyleCustom(fontSize: 13),
       decoration: InputDecoration(
        hintText: widget.hintText,
        labelText: widget.labelText,
        labelStyle: TextStyle(color: GlobalVariablesType.mainColor),
        hintStyle: TextStyle(color: GlobalVariablesType.mainTextColor.withOpacity(0.7), fontSize: GlobalVariablesType.defaultFontSize),
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
    if(value.length > 2){
      setState(() {
        isName = true;
      });
    }else{
      setState(() {
        isName = false;
      });
    }
    // if(RegExp(r"\s").hasMatch(value)){
    //   setState(() {
    //     isName = true;
    //   });
    // }else{
    //   setState(() {
    //     isName = false;
    //   });
    // }
    return isName;
  }
}


class TextEditingOptionSelect extends StatefulWidget {
  final String? hintText;
  final String? labelText;
  final Function()? onTap;
  final TextEditingController? controller;
  const TextEditingOptionSelect({super.key, this.hintText, this.labelText, this.controller, this.onTap});

  @override
  State<TextEditingOptionSelect> createState() => _TextEditingOptionSelectState();
}

class _TextEditingOptionSelectState extends State<TextEditingOptionSelect> {
  bool? isName = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
       readOnly: true,
       controller: widget.controller,
       keyboardAppearance: Brightness.dark,
       style: kDefaultTextStyleCustom(fontSize: 13),
       keyboardType: TextInputType.name,
       onTap: widget.onTap,
       decoration: InputDecoration(
        hintText: widget.hintText,
        labelText: widget.labelText,
        labelStyle: TextStyle(color: GlobalVariablesType.mainColor),
        hintStyle: TextStyle(color: GlobalVariablesType.mainTextColor.withOpacity(0.7), fontSize: GlobalVariablesType.defaultFontSize),
        filled: false,
        // suffix: AnimatedContainer(
        //   duration: const Duration(milliseconds: 500), 
        //   padding: const EdgeInsets.all(2),
        //   decoration:  BoxDecoration(
        //     color: isName == false ? Colors.red : GlobalVariablesType.mainColor,
        //     shape: BoxShape.circle),
        //   child: isName == false ? const Icon(Icons.close, color: Colors.white, size: 16) : const Icon(Icons.done, color: Colors.white, size: 16),    
        // ),
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
    if(value.isNotEmpty){
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


class AnyTextField extends StatefulWidget {
  final String? hintText;
  final String? labelText;
  final bool? withLength;
  final int? maxLength;
  final TextInputType? textInputType;
  final TextEditingController? controller;
  const AnyTextField({super.key, this.hintText, this.labelText, this.controller, this.textInputType, this.withLength, this.maxLength});

  @override
  State<AnyTextField> createState() => _AnyTextFieldState();
}

class _AnyTextFieldState extends State<AnyTextField> {
  bool? isName = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: widget.withLength == true ? widget.maxLength : null,
       controller: widget.controller,
       keyboardType: widget.textInputType,
       keyboardAppearance: Brightness.dark,
       style: kDefaultTextStyleCustom(fontSize: 13),
       decoration: InputDecoration(
        hintText: widget.hintText,
        labelText: widget.labelText,
        labelStyle: TextStyle(color: GlobalVariablesType.mainColor),
        hintStyle: TextStyle(color: GlobalVariablesType.mainTextColor.withOpacity(0.7), fontSize: GlobalVariablesType.defaultFontSize),
        filled: false,
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
    );
  }
}
