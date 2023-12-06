import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:newsapp/sharedpreferences/blocobserver.dart';
import 'package:newsapp/sharedpreferences/localnetwork.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp/views/onboarding/onboarding.dart';

import 'services/authntication/authcubit/cubit/authcubit_dart_cubit.dart';

String? userToken;
String? currentPassword;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await CacheNetwork.cacheInitialization();
  userToken = await CacheNetwork.getCacheData(key: 'token');
  currentPassword = await CacheNetwork.getCacheData(key: 'password');
  debugPrint("User token is : $userToken");
  debugPrint("Current Password is : $currentPassword");
  runApp(const newsApp());
}

class newsApp extends StatefulWidget {
  const newsApp({super.key});

  @override
  State<newsApp> createState() => _newsAppState();
}

class _newsAppState extends State<newsApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthcubitDartCubit()),
      ],
      child: ScreenUtilInit(
          designSize: const Size(460, 700),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (_, context) {
            return GetMaterialApp(
              debugShowCheckedModeBanner: false,
              themeMode: ThemeMode.system,
              home: Scaffold(
                backgroundColor: const Color.fromRGBO(219, 219, 219, 1),
                body: Center(
                  child: AnimatedSplashScreen(
                    duration: 3000,
                    splashIconSize: 200,
                    splash: Image.asset(
                      "assets/logo.jpg",
                      fit: BoxFit.cover,
                      height: 400.h,
                    ),
                    nextScreen: const OnboardingScreens(),
                    splashTransition: SplashTransition.fadeTransition,
                  ),
                ),
              ),
            );
          }),
    );
  }
}
