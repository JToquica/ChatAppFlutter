import 'dart:ui';

import 'package:chat_app/helpers/enums.dart';
import 'package:chat_app/widgets/custom_button.dart';
import 'package:chat_app/widgets/custom_input.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xffF2F2F2),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Container(
              height: size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _Logo(),
                  _Form(),
                  Labels(),
                  TermsAndConditions(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Logo extends StatelessWidget {
  const _Logo({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.only(bottom: 30),
      width: size.width * 0.4,
      child: Column(
        children: const [
          Image(
            image: AssetImage("assets/tag-logo.png"),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "Messenger",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class _Form extends StatefulWidget {
  const _Form({super.key});

  @override
  State<_Form> createState() => _FormState();
}

class _FormState extends State<_Form> {
  final ctrEmail = TextEditingController();
  final ctrPassword = TextEditingController();
  GlobalKey<FormState> keyForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: Form(
        key: keyForm,
        child: Column(
          children: [
            CustomInput(
              texto: "Email",
              textController: ctrEmail,
              validateText: ValidateText.email,
              keyboardType: TextInputType.emailAddress,
              placeholder: "Ingrese su correo",
            ),
            CustomInput(
              texto: "Contraseña",
              textController: ctrPassword,
              validateText: ValidateText.password,
              isPassword: true,
              placeholder: "Ingrese su contraseña",
            ),
            CustomButton(
              texto: "Ingrese",
              onPressed: () {
                ScaffoldMessenger.of(context)
                    .showSnackBar(
                      SnackBar(
                        content: Text("Hello World"),
                        backgroundColor: Colors.green,
                        duration: Duration(seconds: 3),
                      ),
                    )
                    .closed
                    .then(
                      (_) =>
                          Navigator.pushReplacementNamed(context, "usuarios"),
                    );
              },
            )
          ],
        ),
      ),
    );
  }

  void save() {
    if (keyForm.currentState!.validate()) {
      print(ctrEmail.text);
      print(ctrPassword.text);
    }
  }
}

class Labels extends StatelessWidget {
  const Labels({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            "¿No tienes cuenta?",
            style: TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              "Crea una ahora!",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(
        onPressed: () {},
        child: Text(
          "Terminos y condiciones de uso",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
