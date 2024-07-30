import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nijyu/component/textformfield.dart';
import 'package:nijyu/firebase_options.dart';
import 'package:nijyu/start.dart';


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
            //新規登録の際のTextFormFiledの処理
            inputDecorationTheme: const InputDecorationTheme(
            contentPadding: EdgeInsets.all(16),
            focusedBorder: TextFormBorders.textFormFocusedBorder,
            enabledBorder: TextFormBorders.textFormEnabledBorder,
            focusedErrorBorder: TextFormBorders.textFormErrorBorder,
            errorBorder: TextFormBorders.textFormErrorBorder,
            ),
          ) ,
          home: Start(),
          title: 'LoginPage',
        );
      },
    );
  }
}

