import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yoliday/presentation/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yoliday/presentation/constants.dart';
import 'package:yoliday/presentation/screens/portfolio.dart';

class HomeScreen extends HookWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedPageIndex = useState(0);
    return Scaffold(
      body: IndexedStack(
        index: selectedPageIndex.value,
        children: const [
          PortfolioScreen(),
          Scaffold(),
          Scaffold(),
          Scaffold(),
        ],
      ),
      bottomNavigationBar: BottomNavBar(
        selectedPageIndex: selectedPageIndex.value,
        onTabSelected: (p0) {
          selectedPageIndex.value = p0;
        },
      ),
    );
  }
}

class BottomNavBar extends StatelessWidget {
  final int selectedPageIndex;
  final Function(int) onTabSelected;
  const BottomNavBar({
    super.key,
    required this.selectedPageIndex,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      width: 375.w,
      decoration: BoxDecoration(
          boxShadow: const [
            // ignore: use_full_hex_values_for_flutter_colors
            BoxShadow(blurRadius: 6, color: Color(0xff3030301a))
          ],
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.r), topRight: Radius.circular(20.r))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          BottomNavItem(
            icon: AssetConstants.homeIcon,
            text: "Home",
            onTap: () {
              onTabSelected(0);
            },
            selected: selectedPageIndex == 0,
          ),
          BottomNavItem(
            icon: AssetConstants.potfolioIcon,
            text: "Protfolio",
            selected: selectedPageIndex == 1,
            onTap: () {
              onTabSelected(1);
            },
          ),
          BottomNavItem(
            icon: AssetConstants.inputIcon,
            text: "Input",
            onTap: () {
              onTabSelected(2);
            },
            selected: selectedPageIndex == 2,
          ),
          BottomNavItem(
            icon: AssetConstants.profileIcon,
            text: "Profile",
            onTap: () {
              onTabSelected(3);
            },
            selected: selectedPageIndex == 3,
          ),
        ],
      ),
    );
  }
}

class BottomNavItem extends StatelessWidget {
  final bool selected;
  final String icon;
  final String text;
  final Function() onTap;
  const BottomNavItem(
      {super.key,
      required this.icon,
      required this.text,
      this.selected = false,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 2.h,
            width: 24.w,
            color: selected ? AppColors.orange : Colors.transparent,
          ),
          SvgPicture.asset(
            icon,
            height: 20.h,
            width: 20.w,
            colorFilter: ColorFilter.mode(
                selected ? AppColors.orange : AppColors.grey, BlendMode.srcIn),
          ),
          Text(
            text,
            style: TextStyle(
                color: selected ? AppColors.orange : AppColors.grey,
                fontSize: 12.sp),
          )
        ],
      ),
    );
  }
}
