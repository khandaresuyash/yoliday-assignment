import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yoliday/presentation/colors.dart';

class ProjectTile extends StatelessWidget {
  final String image;
  final String name;
  const ProjectTile({
    super.key,
    required this.image,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.h),
      height: 110.h,
      width: 343.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(
              color: AppColors.grey,
              strokeAlign: BorderSide.strokeAlignInside)),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.r),
                bottomLeft: Radius.circular(10.r)),
            child: Image(
              image: CachedNetworkImageProvider(image),
              height: 110.h,
              width: 110.w,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  name,
                  style:
                      TextStyle(fontWeight: FontWeight.w500, fontSize: 14.sp),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "BAHASA SUNDA",
                          style: TextStyle(fontSize: 10.sp),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(
                          "Oleh Al-Baiqi Samaan",
                          style:
                              TextStyle(color: AppColors.grey, fontSize: 10.sp),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Container(
                      alignment: Alignment.center,
                      height: 26.h,
                      width: 50.w,
                      decoration: BoxDecoration(
                          gradient: const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [Color(0xFFF39519), Color(0xFFFFCD67)]),
                          borderRadius: BorderRadius.circular(5.r)),
                      child: const Text(
                        "A",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    )
                  ],
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}
