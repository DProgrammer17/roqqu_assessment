import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roqqu_assessment/domain/constants/app_constants.dart';
import 'package:roqqu_assessment/domain/constants/app_strings.dart';
import 'package:roqqu_assessment/domain/theme/theme.dart';
import 'package:roqqu_assessment/presentation/home/home_page.dart';

class RoqquApp extends StatefulWidget {
  const RoqquApp({super.key});

  @override
  State<RoqquApp> createState() => _RoqquAppState();
}

class _RoqquAppState extends State<RoqquApp> with ChangeNotifier{
  @override
  void initState() {
    super.initState();
    currentTheme.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
   return ScreenUtilInit(
     designSize: Size(AppConstants.designWidth, AppConstants.designHeight),
     splitScreenMode: false,
     builder: (_, child){
       return AnnotatedRegion<SystemUiOverlayStyle>(
         value: const SystemUiOverlayStyle(
           statusBarColor: Colors.transparent,
           systemStatusBarContrastEnforced: true,
         ),
         child: MaterialApp(
           title: AppStrings.appTitle,
           theme: RoqquTheme.lightTheme,
           darkTheme: RoqquTheme.darkTheme,
           themeMode: currentTheme.currentTheme,
           debugShowCheckedModeBanner: false,
           home: const HomePage(),
         ),
       );
     },
   );
  }
}