import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:email_validator/email_validator.dart';
class Email_TextFormField extends StatefulWidget{
  final String labelText;
  final double height;
  final double width;
  final TextEditingController controller;
  final bool obscuretext;

  Email_TextFormField({required this.labelText, required this.height, required this.width ,required this.controller , required this.obscuretext});
  @override
  _Email_TextFormField createState() => _Email_TextFormField();

}
class _Email_TextFormField extends State<Email_TextFormField>{

  String? email;
  
  void setEmail (String email) {
    this.email = email;
  }
  
  @override
  Widget build(BuildContext context) {
    return  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                height: 36.h,
                width: 36.w,
                child: Image.asset(
                  'assets/images/beer.png',
                  fit:BoxFit.contain,
                ),
              ),
              Text(
                widget.labelText,
                style: TextStyle(
                  fontSize: 9.sp,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          SizedBox(height: 2.h,),
          Container(
            height: widget.height.h,
            width: widget.width.w,
            child: TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: ValidateText.email,
              controller: widget.controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
              onChanged: (text){
                setEmail(text);
              },
            ),
          ),
        ],

    );
  }
}
class Password_TextFormField extends StatefulWidget{
  final String labelText;
  final double height;
  final double width;
  final TextEditingController controller;
  final bool obscuretext;
  @override
  _Password_TextFormField createState () => _Password_TextFormField();
  Password_TextFormField({required this.labelText, required this.height, required this.width ,required this.controller , required this.obscuretext});

}
class _Password_TextFormField extends State<Password_TextFormField>{

  String? password;

  void setPassword (String password) {
    this.password = password;
  }
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            Container(
              height: 4.h,
              width: 4.w,
              child: Image.asset(
                'assets/images/beer.png',
                fit:BoxFit.contain,
              ),
            ),
            Text(
              widget.labelText,
              style: TextStyle(
                fontSize: 4.sp,
                color: Colors.white,
              ),
            ),
          ],
        ),
        SizedBox(height: 2.h,),
        Container(
          
          height: widget.height.h,
          width: widget.width.w,
          child: TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: ValidateText.password,
            controller: widget.controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
            onChanged: (text){
              setPassword(text);
            },
          ),
        )
      ],
    );
  }

}
class ValidateText {
  static String? password(String? value){
    if(value != null){
      String pattern = r'^[a-zA-Z0-9]{6,}$';
      RegExp regExp = RegExp(pattern);
      if(!regExp.hasMatch(value)){
        return '6文字以上の英数字を入力してください';
      }
    }
  }

  static String? email(String? value){
    if(value != null){
      String pattern = r'^[0-9a-z_./?-]+@([0-9a-z-]+\.)+[0-9a-z-]+$';
      RegExp regExp = RegExp(pattern);
      if(!regExp.hasMatch(value)){
        return '正しいメールアドレスを入力してください';
      }
    }
  }
}
