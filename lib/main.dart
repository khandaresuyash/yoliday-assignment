import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yoliday/presentation/screens/home.dart';

main() {
  runApp(const Yoliday());
}

class Yoliday extends StatelessWidget {
  const Yoliday({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      designSize: const Size(375, 812),
      builder: (context, child) {
        return MaterialApp(
          theme: ThemeData(
            useMaterial3: false,
            fontFamily: 'Roboto',
            textTheme: TextTheme(
              bodyLarge: TextStyle(
                fontSize: 14.sp,
              ),
              bodyMedium: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          routes: {"/": (context) => const HomeScreen()},
        );
      },
    );
  }
}
