import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:identity/resources/colors.dart';
import 'package:identity/resources/font_config.dart';

class CustomBorderButton extends StatefulWidget {
  final String textButton;
  final bool? hasLogo;
  final String? logoPath;
  const CustomBorderButton(
      {super.key,
      required this.textButton,
      this.hasLogo,
      this.logoPath});

  @override
  State<CustomBorderButton> createState() => _CustomBorderButtonState();
}

class _CustomBorderButtonState extends State<CustomBorderButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: FontList.font11),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          border: Border.all(color: ColorList.generalWhite100AppFonts),
          borderRadius: BorderRadius.circular(FontList.font16),
          color: Colors.transparent),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: FontList.font8,
        children: [
          if (widget.hasLogo!)
            SvgPicture.asset(
              "assets/image/ic_google_logo.svg",
              width: FontList.font18,
              height: FontList.font18,
              alignment: Alignment.center,
            ),
          Text(
            widget.textButton,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontSize: FontList.font16,
                ),
          ),
        ],
      ),
    );
  }
}
