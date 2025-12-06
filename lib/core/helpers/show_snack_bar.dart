  import 'package:flutter/material.dart';

void showSnackBarMessage(BuildContext context, final String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }