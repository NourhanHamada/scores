import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:scores/core/theming/assets_manager.dart';
import 'package:scores/core/theming/colors_manager.dart';
import 'package:scores/features/layout/logic/layout_cubit.dart';

class Layout extends StatefulWidget {
  const Layout({super.key});

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  @override
  Widget build(BuildContext context) {
    List<String> icons = [
      AssetsManager.home,
      AssetsManager.tennis,
      AssetsManager.badge,
      AssetsManager.user,
    ];
    return Scaffold(
      backgroundColor: ColorsManager.backgroundColor,
      body: context
          .read<LayoutCubit>()
          .screens[context.read<LayoutCubit>().currentIndex],
      bottomNavigationBar: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            width: double.infinity,
            height: 60,
            margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
            decoration: BoxDecoration(
              color: ColorsManager.whiteColor,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: ColorsManager.mainColor.withOpacity(.15),
                  offset: const Offset(3, 3),
                  blurRadius: 10,
                  spreadRadius: 2,
                ),
                BoxShadow(
                  color: ColorsManager.mainColor.withOpacity(.15),
                  offset: const Offset(-2, -2),
                  blurRadius: 10,
                  spreadRadius: 2,
                ),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 25,
            child: BlocBuilder<LayoutCubit, LayoutState>(
              builder: (context, state) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ...List.generate(
                      4,
                      (index) {
                        bool isSelected =
                            context.read<LayoutCubit>().currentIndex == index;
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              context
                                  .read<LayoutCubit>().currentIndex = index;
                            });
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            padding: const EdgeInsets.all(12),
                            margin:
                                EdgeInsets.only(bottom: isSelected ? 30 : 0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: isSelected
                                  ? ColorsManager.mainColor
                                  : ColorsManager.transparentColor,
                            ),
                            child: SvgPicture.asset(
                              icons[index],
                              width: isSelected ? 18 : 16,
                              colorFilter: ColorFilter.mode(
                                isSelected
                                    ? ColorsManager.whiteColor
                                    : ColorsManager.greyColor.withOpacity(.7),
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
