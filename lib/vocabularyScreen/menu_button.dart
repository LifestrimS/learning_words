import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:learning_words/utils.dart/colors.dart';

class PopUpMenu extends StatelessWidget {
  final Function() onUpdate;
  final Function() onDelete;
  const PopUpMenu({super.key, required this.onUpdate, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      icon: SvgPicture.asset(
        'assets/icons/menu.svg',
        width: 32.0,
        height: 32.0,
        colorFilter: const ColorFilter.mode(AppColors.white, BlendMode.srcIn),
      ),
      itemBuilder: (context) => [
        const PopupMenuItem(value: 1, child: Text('Update lsit')),
        const PopupMenuItem(
            value: 2,
            child: Text(
              'Delete all words',
              style: TextStyle(color: AppColors.red),
            )),
      ],
      offset: const Offset(32.0, 40.0),
      color: AppColors.grey,
      onSelected: (value) {
        switch (value) {
          case 1:
            onUpdate();
            break;
          case 2:
            onDelete();
            break;
          default:
        }
      },
    );
  }
}
