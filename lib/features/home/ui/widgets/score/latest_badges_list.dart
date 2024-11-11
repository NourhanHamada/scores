import 'package:flutter/material.dart';
import '../../../../../core/theming/assets_manager.dart';
import '../../../../../core/theming/colors_manager.dart';
import '../../../data/latest_badge_model.dart';

class LatestBadgesList extends StatelessWidget {
  const LatestBadgesList({super.key});

  @override
  Widget build(BuildContext context) {
    List<LatestBadgeModel> latestBadges = [
      LatestBadgeModel('GENIUS', AssetsManager.boy, ColorsManager.purpleColor),
      LatestBadgeModel('ON TIME', AssetsManager.boy, ColorsManager.blueColor),
      LatestBadgeModel('SPORTAGE', AssetsManager.boy, ColorsManager.mainColor),
      LatestBadgeModel('MATHY', AssetsManager.boy, ColorsManager.orangeColor),
    ];
    List latestBadges2 = [
      AssetsManager.cap,
      AssetsManager.watch,
      AssetsManager.basket,
      AssetsManager.math,
    ];
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ...List.generate(
            latestBadges.length,
            (index) {
              return Padding(
                padding: EdgeInsets.only(right: 8, left: index == 0 ? 24 : 0),
                child: badgeCard(latestBadges2[index]),
              );
              /* IMAGES ARE NOT ABLE TO DOWNLOAD THE TOP IMAGES ALONE ..
              ADN TAKE THE BACKGROUND COLOR ON THIS XD FILE
              SO I BUILD THE WIDGET AND PUT THE IMAGES
              */

              //   Stack(
              //   children: [
              //     Container(
              //       margin: const EdgeInsets.only(
              //         top: 7,
              //       ),
              //       child: Container(
              //         margin:  EdgeInsets.only(right: 24, left: index == 0 ? 24 : 0),
              //         padding: const EdgeInsets.only(bottom: 10),
              //         width: 90,
              //         height: 130,
              //         decoration: BoxDecoration(
              //           borderRadius: BorderRadius.circular(16),
              //           color: latestBadges[index].color,
              //           // gradient: LinearGradient(
              //           //   stops: const [
              //           //     .1,
              //           //     .4,
              //           //   ],
              //           //   begin: Alignment.topLeft,
              //           //   end: Alignment.bottomRight,
              //           //   colors: [
              //           //     latestBadges[index].color.withOpacity(.5),
              //           //     latestBadges[index].color
              //           //   ],
              //           // ),
              //         ),
              //         child: Align(
              //           alignment: Alignment.bottomCenter,
              //           child: TextCustom(
              //             text: latestBadges[index].title,
              //             color: ColorsManager.whiteColor,
              //             fontWeight: FontWeight.w600,
              //           ),
              //         ),
              //       ),
              //     ),
              //     Positioned(
              //       right: 8,
              //       child: Image.asset(
              //         latestBadges[index].image,
              //         width: 70,
              //         height: 100,
              //       ),
              //     ),
              //   ],
              // );
            },
          ),
        ],
      ),
    );
  }
}

Widget badgeCard(image) {
  return Image.asset(
    image,
    width: 100,
  );
}
