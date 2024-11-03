import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yoliday/data.dart';
import 'package:yoliday/presentation/colors.dart';
import 'package:yoliday/presentation/constants.dart';
import 'package:yoliday/presentation/widgets/tile.dart';

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
        SearchBar(dataList: dataList, search: search),
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

class SearchBar extends StatelessWidget {
  const SearchBar({
    super.key,
    required this.dataList,
    required this.search,
  });

  final ValueNotifier<List<String>> dataList;
  final TextEditingController search;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15.h),
      height: 44.h,
      width: 343.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(color: AppColors.grey)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 10.w,
          ),
          Expanded(
              child: TextField(
            selectionHeightStyle: BoxHeightStyle.max,
            onChanged: (value) {
              if (value.isEmpty) {
                dataList.value = projectNames;
                return;
              }
              dataList.value = projectNames.where((e) {
                return e.startsWith(search.text);
              }).toList();
            },
            controller: search,
            decoration: const InputDecoration(
                hintText: "Search a project", border: InputBorder.none),
          )),
          GestureDetector(
            onTap: () {
              if (search.text.isEmpty) {
                dataList.value = projectNames;
                return;
              }
              dataList.value = projectNames.where((e) {
                return e.startsWith(search.text);
              }).toList();
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10.w),
              height: 28.h,
              width: 28.w,
              decoration: BoxDecoration(
                color: AppColors.orange,
                borderRadius: BorderRadius.circular(10.4),
              ),
              child: Icon(
                Icons.search,
                color: Colors.white,
                size: 16.h,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
