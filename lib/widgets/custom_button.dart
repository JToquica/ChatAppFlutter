import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String texto;
  final void Function()? onPressed;
  const CustomButton({super.key, required this.texto, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 2,
          shape: const StadiumBorder(),
        ),
        onPressed: onPressed,
        child: Text(
          texto,
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
