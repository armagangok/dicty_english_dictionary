import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final Icon? icon;
  final Widget? viewName;
  final Function? onPressed;

  const CustomIconButton({
    Key? key,
    this.icon,
    this.viewName,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => onPressed!(),
      icon: icon!,
    );
  }
}

class CustomElevatedButton extends StatelessWidget {
  
  final String? text;
  final double? buttonH;
  final double? buttonW;
  final Function? onPressed;

  const CustomElevatedButton({
    Key? key,
    
    this.text,
    this.buttonH,
    this.buttonW,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: buttonH,
      width: buttonW,
      child: ElevatedButton(
        onPressed: () => onPressed!(),
        child: Text(
          "$text",
          style:const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}

class LanguageDropDown extends StatelessWidget {
  final Function(String? lang) onChanged;
   String dropdownValue;
  LanguageDropDown({
    Key? key,
    required this.onChanged,
    required this.dropdownValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DropdownButton<String>(
        value: dropdownValue,
        onChanged: onChanged,
        borderRadius:const BorderRadius.all(Radius.circular(20)),
        items: <String>[
          'English-GB',
          'English-IE',
          'English-US',
          'English-AU',
          'English-IN',
          "English-ZA",
        ]
            .map<DropdownMenuItem<String>>(
              (String value) => DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              ),
            )
            .toList(),
      ),
    );
  }
}
