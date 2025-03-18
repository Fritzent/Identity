import 'package:flutter/material.dart';
import 'package:identity/resources/font_config.dart';

class CustomButton extends StatefulWidget {
  final String textButton;
  const CustomButton({super.key, required this.textButton});

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: FontList.font11),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(FontList.font16),
          color: Theme.of(context).primaryColor),
      child: Text(
        widget.textButton,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
      ),
    );
  }
}
