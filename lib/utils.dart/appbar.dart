import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:learning_words/utils.dart/clip_shadow_path.dart';
import 'package:learning_words/utils.dart/colors.dart';
import 'package:learning_words/utils.dart/custom_shape.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final String title;
  final bool showReturnButton;

  const CustomAppBar({
    super.key,
    this.height = 130.0,
    this.showReturnButton = false,
    required this.title,
  });

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: height,
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      flexibleSpace: ClipShadowPath(
        clipper: Customshape(),
        shadow: AppColors.appBarShadow,
        child: Container(
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(color: AppColors.black),
          height: height,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (showReturnButton)
                  const Icon(
                    Icons.arrow_back,
                    color: AppColors.white,
                    size: 32.0,
                  ),
                Text(
                  title,
                  style: const TextStyle(fontSize: 24, color: Colors.white),
                ),
                GestureDetector(
                  onTap: () {}, //onMenuTap,
                  child: SvgPicture.asset(
                    'assets/icons/menu.svg',
                    width: 32.0,
                    height: 32.0,
                    colorFilter: const ColorFilter.mode(
                        AppColors.white, BlendMode.srcIn),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
