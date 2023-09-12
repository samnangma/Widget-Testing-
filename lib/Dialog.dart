import 'package:flutter/material.dart';

class CustomDialog extends StatefulWidget {
  const CustomDialog({Key? key});

  @override
  State<CustomDialog> createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MaterialButton(
          onPressed: () {
            _displayBottomSheet(context);
          },
          height: 50,
          minWidth: 200,
          color: Colors.black,
          child: Text(
            'OPEN',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

  Future _displayBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      barrierColor: Colors.black87.withOpacity(0.5),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
      builder: (context) => SizedBox(
        height: 200,
        child: Center(
          child: Text(
            'FLUTTER GUYS',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
        ),
      ),
    );
  }
}