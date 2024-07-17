import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learning_words/utils.dart/colors.dart';

class GameWidget extends StatelessWidget {
  final String name;
  final VoidCallback onTap;
  const GameWidget({required this.name, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 69.0,
        clipBehavior: Clip.antiAlias,
        margin: const EdgeInsets.only(bottom: 18.0),
        decoration: BoxDecoration(
          color: AppColors.white,
          border: Border.all(color: AppColors.black, width: 1.0),
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(16.0),
            bottomLeft: Radius.circular(16.0),
          ),
          boxShadow: [AppColors.containerShadow],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(left: 20.0, top: 14.0, bottom: 14.0),
              child: Text(
                name,
                style: const TextStyle(
                    color: AppColors.black, fontSize: 32.0, height: 0.0),
              ),
            ),
            Container(
              width: 67.0,
              height: double.infinity,
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(
                color: AppColors.black,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: SvgPicture.asset(
                  'assets/icons/triangle.svg',
                  colorFilter:
                      const ColorFilter.mode(AppColors.white, BlendMode.srcIn),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
