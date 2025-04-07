import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:identity/bloc/custome_button_choose_bloc.dart';
import 'package:identity/resources/colors.dart';
import 'package:identity/resources/font_config.dart';

class CustomButtonChoosen extends StatefulWidget {
  final String textButton;
  final String iconPath;
  final bool isSelected;
  const CustomButtonChoosen(
      {super.key,
      required this.textButton,
      required this.iconPath,
      required this.isSelected});

  @override
  State<CustomButtonChoosen> createState() => _CustomButtonChoosenState();
}

class _CustomButtonChoosenState extends State<CustomButtonChoosen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CustomeButtonChooseBloc(),
      child: BlocBuilder<CustomeButtonChooseBloc, CustomeButtonChooseState>(
        builder: (context, state) {
          //var bloc = context.read<CustomeButtonChooseBloc>();
          return Container(
            padding: EdgeInsets.symmetric(
                horizontal: FontList.font8, vertical: FontList.font8),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                border: Border.all(color: ColorList.generalWhite100AppFonts),
                borderRadius: BorderRadius.circular(FontList.font16),
                color: widget.isSelected
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).primaryColorDark),
            child: Column(
              spacing: FontList.font6,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  widget.iconPath,
                  width: FontList.font18,
                  height: FontList.font18,
                  alignment: Alignment.center,
                  colorFilter: ColorFilter.mode(
                      !widget.isSelected
                          ? Theme.of(context).primaryColor
                          : Theme.of(context).primaryColorDark,
                      BlendMode.srcIn),
                ),
                Text(
                  widget.textButton,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: !widget.isSelected
                            ? Theme.of(context).primaryColor
                            : Theme.of(context).primaryColorDark,
                      ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
