import 'package:flutter/material.dart';
import 'package:movieapp/colors.dart';

class BacBtn extends StatelessWidget {
  const BacBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 70,
      margin: const EdgeInsets.only(
        top: 10,
        left: 7,
      ),
      decoration: BoxDecoration(
        color: Colours.scaffoldBgColor,
        borderRadius: BorderRadius.circular(6),
      ),
      child: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.arrow_back_ios_new,
        ),
      ),
    );
  }
}
