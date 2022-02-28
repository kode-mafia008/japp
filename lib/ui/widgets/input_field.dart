import 'package:flutter/material.dart';

import '../../constants/ui_constants.dart';

class InputField extends StatefulWidget {
  const InputField({
    Key? key,
    required this.validator,
    required this.hintText,
    required this.controller,
    required this.onSaved,
    this.isPasswordField = false,
    this.isDescField = false,
    this.isEdit = false,
  }) : super(key: key);

  final String? Function(String?)? validator;
  final String hintText;
  final TextEditingController controller;
  final Function(String?)? onSaved;
  final bool isPasswordField;
  final bool isDescField;
  final bool isEdit;

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  bool obSecureText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      child: TextFormField(
        maxLines: widget.isDescField ? null : 8,
        maxLength: widget.isDescField ? null : 1000,
        // maxLines: 8,
        // maxLength: 1000,
        keyboardType: TextInputType.multiline,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: widget.controller,
        obscureText: widget.isPasswordField ? obSecureText : false,
        decoration: InputDecoration(
          counterText: "",
          fillColor: UIConstant.inputBackground,
          filled: true,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          iconColor: UIConstant.inputIconColor,
          suffixIcon: widget.isPasswordField
              ? InkWell(
                  onTap: () {
                    setState(() {
                      obSecureText = !obSecureText;
                    });
                  },
                  child: obSecureText
                      ? const Icon(Icons.visibility_off,
                          color: UIConstant.inputIconColor)
                      : const Icon(Icons.visibility,
                          color: UIConstant.inputIconColor),
                )
              : null,
          hintText: widget.hintText,
          hintStyle: TextStyle(
              fontSize: 14,
              color: widget.isEdit ? UIConstant.kFont : UIConstant.kGFont),
          contentPadding: const EdgeInsets.only(
            left: 15,
            bottom: 11,
            top: 11,
            right: 15,
          ),
        ),
        validator: (value) => widget.validator!(value),
        onSaved: (value) => widget.onSaved!(value),
      ),
    );
  }
}
