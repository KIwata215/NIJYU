import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nijyu/Login.dart';
import 'package:nijyu/firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
  DeviceOrientation.landscapeRight
  ]).then( (_){
    runApp(MyApp());
  });
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    const designSize =  Size(393, 852);
    return ScreenUtilInit(
      //元となる画面サイズ（iphone15)
      designSize:designSize,
      minTextAdapt: true,
      splitScreenMode: true,
      
      builder: (_ ,child){
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme:ThemeData(
            useMaterial3: true,
          ) ,
          home: const MyHomePage(),
          title: 'LoginPage',
        );
      },
    );
  }
}

