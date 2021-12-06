import 'package:flutter/cupertino.dart';

import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

void showErrorToast(BuildContext? context, String message) {
  var myContext = context;
  if (myContext != null) {
    showTopSnackBar(
      myContext,
      CustomSnackBar.error(
        message: message,
      ),
    );
  }
}
