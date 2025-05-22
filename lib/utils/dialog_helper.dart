import 'package:flutter/material.dart';
import 'package:identity/bloc/login_auth_bloc.dart';
import 'package:identity/l10n/app_localizations.dart';
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