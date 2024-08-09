import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:learning_words/repository/repository.dart';
import 'package:learning_words/utils.dart/colors.dart';

class PopUpMenu extends StatelessWidget {
  const PopUpMenu({super.key});

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
        const PopupMenuItem(
            value: 1,
            // row with 2 children
            child: Text('Clear DB')),
        // const PopupMenuItem(
        //   value: 2,
        //   // row with two children
        //   child: Row(
        //     children: [
        //       Icon(Icons.chrome_reader_mode),
        //       SizedBox(
        //         width: 10,
        //       ),
        //       Text("About")
        //     ],
        //   ),
        // ),
      ],
      offset: const Offset(32.0, 40.0),
      color: AppColors.grey,
      onSelected: (value) {
        switch (value) {
          case 1:
            GetIt.I.get<Repository>().deleteAllWords();
            break;
          default:
        }
      },
    );
  }
}
