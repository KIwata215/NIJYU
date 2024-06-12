import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nijyu/Login.dart';

void main() {
  //画面横向き固定
  WidgetsFlutterBinding.ensureInitialized();
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

