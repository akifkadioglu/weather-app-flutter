import 'package:flutter/material.dart';

class CustomChip extends StatelessWidget {
  const CustomChip({
    super.key,
    required this.iconColor,
    required this.borderColor,
    required this.title,
    required this.func,
    this.icon,
  });
  final Color iconColor;
  final Color borderColor;
  final String title;
  final IconData? icon;
  final VoidCallback func;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ActionChip(
        backgroundColor: Colors.transparent,
        avatar: icon != null
            ? Icon(
                icon,
                color: iconColor,
              )
            : null,
        shape: StadiumBorder(side: BorderSide(color: borderColor)),
        label: Text(
          title,
          style: TextStyle(color: iconColor),
        ),
        onPressed: () => func(),
        pressElevation: 0,
      ),
    );
  }
}
