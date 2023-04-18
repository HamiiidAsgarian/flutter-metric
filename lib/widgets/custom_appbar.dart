import 'package:flutter/material.dart';

import '../const.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({super.key, this.height = 50, this.title = "Title"});

  final double height;
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
        elevation: 0,
        backgroundColor: Consts.mainPurple,
        centerTitle: true,
        title: Text(title, style: Consts.titleTextStyle));
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
