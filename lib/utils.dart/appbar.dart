import 'package:flutter/material.dart';
import 'package:learning_words/utils.dart/clip_shadow_path.dart';
import 'package:learning_words/utils.dart/colors.dart';
import 'package:learning_words/utils.dart/custom_shape.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final String title;
  final bool showReturnButton;
  final Widget? action;

  const CustomAppBar({
    super.key,
    this.height = 80.0,
    this.showReturnButton = false,
    required this.title,
    this.action,
  });

  @override
  //Appbar prefferedSize + 30
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: 250,
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      flexibleSpace: ClipShadowPath(
        clipper: Customshape(),
        shadow: AppColors.appBarShadow,
        child: Container(
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(color: AppColors.black),
          height: 250,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (showReturnButton)
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(
                      Icons.arrow_back,
                      color: AppColors.white,
                      size: 32.0,
                    ),
                  ),
                Text(
                  title,
                  style: const TextStyle(fontSize: 24, color: Colors.white),
                ),
                if (action != null) ...[
                  action!,
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
