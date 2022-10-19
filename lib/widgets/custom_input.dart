import 'package:chat_app/helpers/validate.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/helpers/enums.dart';

class CustomInput extends StatefulWidget {
  final String texto;
  final String placeholder;
  final TextEditingController textController;
  final TextInputType keyboardType;
  final ValidateText? validateText;
  final bool isPassword;
  final bool isRequired;

  CustomInput({
    Key? key,
    required this.texto,
    required this.textController,
    required this.placeholder,
    this.keyboardType = TextInputType.text,
    this.validateText,
    this.isPassword = false,
    this.isRequired = true,
  }) : super(key: key);

  @override
  State<CustomInput> createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  late bool hiddenValue;

  @override
  void initState() {
    hiddenValue = widget.isPassword ? true : false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${widget.texto}:",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 8),
          TextFormField(
            textInputAction: TextInputAction.next,
            controller: widget.textController,
            // maxLength: validateMaxLength(),
            validator: (String? value) {
              return validateStructure(value);
            },
            autocorrect: false,
            keyboardType: widget.keyboardType,
            obscureText: hiddenValue,
            decoration: InputDecoration(
              hintText: widget.placeholder,
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
              suffixIcon: !widget.isPassword
                  ? SizedBox(width: 0, height: 0)
                  : hiddenValue
                      ? IconButton(
                          onPressed: () {
                            hiddenValue = !hiddenValue;
                            setState(() {});
                          },
                          icon: Icon(Icons.visibility),
                        )
                      : IconButton(
                          onPressed: () {
                            hiddenValue = !hiddenValue;
                            setState(() {});
                          },
                          icon: Icon(Icons.visibility_off),
                        ),
            ),
          ),
        ],
      ),
    );
  }

  int? validateMaxLength() {
    switch (widget.validateText) {
      case ValidateText.email:
        return 80;
      case ValidateText.password:
        return 30;
      default:
        return null;
    }
  }

  String message(String type) {
    return "La estructura del campo $type es incorrecta";
  }

  String? validateStructure(String? value) {
    if (widget.isRequired && value!.isEmpty) {
      return "El campo ${widget.texto.toLowerCase()} es requerido";
    } else {
      switch (widget.validateText) {
        case ValidateText.email:
          return validateEmail(value!) ? null : message("email");
        case ValidateText.password:
          return validatePassword(value!) ? null : message("contraseña");
        default:
          return null;
      }
    }
  }
}
