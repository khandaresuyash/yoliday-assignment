import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yoliday/data.dart';
import 'package:yoliday/presentation/colors.dart';
import 'package:yoliday/presentation/constants.dart';
import 'package:yoliday/presentation/widgets/tile.dart';
import 'package:yoliday/presentation/widgets/search.dart' as s;

class PortfolioScreen extends HookWidget {
  const PortfolioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tabBarController = useTabController(initialLength: 4);
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        title: const Text(
          "Portfolio",
          style: TextStyle(color: Colors.black),
        ),
        bottom: TabBar(
            unselectedLabelStyle: const TextStyle(),
            indicatorColor: AppColors.orange,
            unselectedLabelColor: Colors.black,
            labelColor: AppColors.orange,
            controller: tabBarController,
            tabs: const [
              Tab(
                text: "Project",
              ),
              Tab(
                text: "Saved",
              ),
              Tab(
                text: "Shared",
              ),
              Tab(
                text: "Achievment",
              ),
            ]),
        actions: [
          IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                AssetConstants.bagIcon,
                height: 24.h,
              )),
          IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                AssetConstants.notificationIcon,
                height: 24.h,
              )),
        ],
      ),
      backgroundColor: Colors.white,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: const FilterButton(),
      body: TabBarView(controller: tabBarController, children: [
        const ProjectPage(),
        Container(),
        Container(),
        Container(),
      ]),
    );
  }
}

class FilterButton extends StatelessWidget {
  const FilterButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 34.h,
      width: 104.w,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(blurRadius: 15, color: AppColors.orange.withAlpha(80))
      ], color: AppColors.orange, borderRadius: BorderRadius.circular(50.r)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            AssetConstants.filterIcon,
            height: 24.h,
            width: 24.w,
          ),
          SizedBox(
            width: 5.w,
          ),
          Text(
            "Filter",
            style: TextStyle(color: Colors.white, fontSize: 14.sp),
          )
        ],
      ),
    );
  }
}

class ProjectPage extends HookWidget {
  const ProjectPage({super.key});

  @override
  Widget build(BuildContext context) {
    final dataList = useState(projectNames);
    final search = useTextEditingController();
    return Column(
      children: [
        s.SearchBar(dataList: dataList, search: search),
        Expanded(
            child: ListView.builder(
          itemBuilder: (context, index) {
            return Center(
              child: ProjectTile(
                name: dataList.value[index],
                //NOTE: Due to randomness of the free image api images are changed for each screen render.
                image: "https://picsum.photos/${Random().nextInt(200) + 120}",
              ),
            );
          },
          itemCount: dataList.value.length,
        ))
      ],
    );
  }
}
