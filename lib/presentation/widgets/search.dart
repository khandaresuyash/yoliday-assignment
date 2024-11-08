import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yoliday/data.dart';
import 'package:yoliday/presentation/colors.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    super.key,
    required this.dataList,
    required this.search,
  });

  final ValueNotifier<List<String>> dataList;
  final TextEditingController search;

  List<String> getSearchedProjects(String query) {
    if (query.trim().isEmpty) {
      return projectNames;
    }
    return projectNames.where((e) {
      return e.trim().toLowerCase().contains(query.toLowerCase());
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15.h),
      height: 45.h,
      width: 343.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(color: AppColors.grey)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 10.w,
          ),
          Expanded(
              child: Padding(
            padding: EdgeInsets.only(bottom: 2.5.h),
            child: TextField(
              onChanged: (value) {
                dataList.value = getSearchedProjects(value);
              },
              controller: search,
              decoration: const InputDecoration(
                  hintText: "Search a project", border: InputBorder.none),
            ),
          )),
          GestureDetector(
            onTap: () {
              dataList.value = getSearchedProjects(search.text);
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
