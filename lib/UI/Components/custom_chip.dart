import 'package:flutter/material.dart';
import 'package:weather_app_flutter/core/Snackbar/snackbar_manager.dart';

class CustomChip extends StatelessWidget {
  const CustomChip({
    super.key,
    required this.iconColor,
    required this.borderColor,
    required this.title,
    required this.description,
    this.icon,
  });
  final Color iconColor;
  final Color borderColor;
  final String title;
  final IconData? icon;
  final String description;
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
        onPressed: () {
          SnackbarManager.infoSnackbar(description, title);
        },
        pressElevation: 0,
      ),
    );
  }
}
