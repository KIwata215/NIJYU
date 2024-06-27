import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bordered_text/bordered_text.dart';
import 'package:nijyu/components/textformfield.dart';
class Email_Login extends StatefulWidget{
  @override
  State<Email_Login> createState() => Email_Login_Page();

}
class Email_Login_Page extends State<Email_Login>{
  final TextEditingController email_controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: <Color>[
            Color(0xff8C2388),
            Color(0xff9A30BF),
            Color(0xff2D3AAF),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child:  Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(120.h), 
          child: Padding(
            padding: EdgeInsets.only(top: 80.h),
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              title: BorderedText(
                strokeWidth: 3.0.sp,
                strokeColor: Colors.black,
                child: Text(
                  "メールアドレスでログイン",
                  style: TextStyle(
                    fontSize: 18.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            children: [
              SizedBox(height: 25.h,),
              Email_TextFormField(
                labelText: "メールアドレス", 
                height: 45, 
                width: 200, 
                controller: email_controller, 
                obscuretext: false,
              ),

            ],
          ),
        ),
      ),
    );
  }

}