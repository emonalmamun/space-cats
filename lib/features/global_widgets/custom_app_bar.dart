import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  final String title;
  final Color? backgroundColor;
  final List<Widget>? action;
  const CustomAppBar({Key? key, required this.title, this.backgroundColor, this.action}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      centerTitle: true,
      elevation: 0,
      iconTheme: backgroundColor == Colors.white ? const IconThemeData(color: AppColors.primaryColor) : const IconThemeData(color: AppColors.primaryWhite),
      title: Text(
        title,
        style: TextStyle(color: backgroundColor == Colors.white ? AppColors.primaryColor : AppColors.primaryWhite),
      ),
      actions: action == null ? [] : [...action!],
    );
  }
}