import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nijyu/register2.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => Loginpage();
}
class Loginpage extends State<MyHomePage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 48.h),
              child: Container(
              child: Text(
                'ログイン',
                style: TextStyle(
                  fontSize: 18.sp,
                ),
                
                ),
              ),
            ),
            FloatingActionButton(
              onPressed: (){
                Navigator.push(context,
                MaterialPageRoute(builder: (context)=> Register2Page()),
                );
              },
              child: Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }

}
// class _MyHomePageState extends State<MyHomePage> {
  

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: ScreenUtilInit(
//         //デザイン原案におけるサイズ
//         designSize: Size(393,852),
//         child: Center(
//           child: Column(

//           ),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         // onPressed: _incrementCounter,
//         onPressed: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => Register2Page()),
//           );
//         },
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), 
//     );
//   }
// }