import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommonDialog {
  static Future<T?> show<T extends Object>(
    BuildContext context,
    String text, {
    VoidCallback? onOkPressed,
  }) {
    return Platform.isIOS
        ? _showCupertinoDialog<T>(context, text, onOkPressed: onOkPressed)
        : _showMaterialDialog<T>(context, text, onOkPressed: onOkPressed);
  }

  static Future<T?> _showCupertinoDialog<T extends Object>(
    BuildContext context,
    String text, {
    VoidCallback? onOkPressed,
  }) {
    return showCupertinoDialog<T>(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          content: _buildContent(text),
          actions: _buildCupertinoActions(context, onOkPressed),
        );
      },
    );
  }

  static Future<T?> _showMaterialDialog<T extends Object>(
    BuildContext context,
    String text, {
    VoidCallback? onOkPressed,
  }) {
    return showDialog<T>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: _buildContent(text),
          actions: _buildMaterialActions(context, onOkPressed),
        );
      },
    );
  }

  static Widget _buildContent(String text) {
    return SingleChildScrollView(
      child: Center(
        child: Text(
          text,
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }

  static List<Widget> _buildMaterialActions(
      BuildContext context, VoidCallback? onOkPressed) {
    return <Widget>[
      TextButton(
        onPressed: () => Navigator.pop(context, 'Cancel'),
        child: const Text('キャンセル'),
      ),
      TextButton(
        onPressed: () {
          if (onOkPressed != null) {
            onOkPressed();
          }
          Navigator.of(context).pop();
        },
        child: const Text('OK'),
      ),
    ];
  }

  static List<Widget> _buildCupertinoActions(
      BuildContext context, VoidCallback? onOkPressed) {
    return <Widget>[
      CupertinoDialogAction(
        onPressed: () => Navigator.pop(context, 'Cancel'),
        child: const Text('キャンセル'),
      ),
      CupertinoDialogAction(
        onPressed: () {
          if (onOkPressed != null) {
            onOkPressed();
          }
          Navigator.of(context).pop();
        },
        child: const Text('OK'),
      ),
    ];
  }
}
