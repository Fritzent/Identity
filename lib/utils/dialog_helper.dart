import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:identity/pages/authentication/login/login_auth_bloc.dart';
import 'package:identity/l10n/app_localizations.dart';
import 'package:identity/resources/font_config.dart';
import 'package:panara_dialogs/panara_dialogs.dart';

void showModernDialog(
    BuildContext context,
    String title,
    String message,
    String buttonText,
    Function() onTapDismiss,
    PanaraDialogType type,
    LoginAuthBloc? bloc) {
  PanaraInfoDialog.show(
    context,
    title: title,
    message: message,
    buttonText: AppLocalizations.of(context)!.understoodText,
    color: Theme.of(context).primaryColor,
    textColor: Theme.of(context).primaryColor,
    buttonTextColor: Theme.of(context).primaryColorDark,
    onTapDismiss: () {
      Navigator.of(context).pop();
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (bloc != null) {
          bloc.add(OnPopUpShow());
        }
      });
    },
    panaraDialogType: PanaraDialogType.custom,
    barrierDismissible: false,
  );
}

void showErrorDialog(BuildContext context, String title, String message,
    String buttonText, Function() onTapDismiss, PanaraDialogType type) {
  PanaraCustomDialog.showAnimatedGrow(
    context,
    children: [
      CircleAvatar(
        backgroundColor: Theme.of(context).primaryColorDark,
        radius: 25,
        child: Icon(Icons.close),
      ),
      Gap(FontList.font16),
      Text(
        title,
        style:
            TextStyle(fontSize: FontList.font24, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
      Gap(FontList.font16),
      Text(
        message,
        style: TextStyle(fontSize: FontList.font18),
        textAlign: TextAlign.center,
      ),
    ],
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    backgroundColor: Theme.of(context).primaryColor,
    barrierDismissible: true,
  );
}
