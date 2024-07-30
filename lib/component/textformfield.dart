import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nijyu/validator/validator.dart';

class TextFormField_Component_Validator extends StatefulWidget {
  final String labelText;
  final double height;
  final double width;
  final TextEditingController controller;
  final bool obscuretext;
  final List<Validator> validators;
  final Function onChage;
  final Function setIsValid;
  final  TextInputType keyboardtype;


  const TextFormField_Component_Validator({
    required this.labelText,
    required this.height,
    required this.width,
    required this.controller,
    required this.obscuretext, 
    required this.validators, 
    required this.onChage, 
    required this.setIsValid,
    Key? key,
    this.keyboardtype = TextInputType.text,
    
  }): super(key: key);
  State<TextFormField_Component_Validator> createState() => _TextFormField_Component_Validator();

  
}
class _TextFormField_Component_Validator extends State<TextFormField_Component_Validator>{

  //エラーテキスト
  String? _errorText;

  /// バリデーションを実施する
  void _validate(String value) {
    widget.onChage(value);
    final result = widget.validators
        .where((validator) => validator.validate(value) == false)
        .toList();
    if (result.isNotEmpty) {
      _errorText = result.first.getMessage();
      widget.setIsValid(false);
    } else {
      _errorText = null;
      widget.setIsValid(true);
    }
  }

  /// エラーによって色をだし分ける
  Color _bindColor() {
    if (_errorText == null) {
      return Colors.white;
    } else {
      return Colors.red;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.labelText,
          style: TextStyle(
            fontSize: 6.sp,
            color: Colors.white,
          ),
        ),
        SizedBox(
          height: 2.h,
        ),
        Container(
          height: widget.height.h, // 高さの変更
          width: widget.width.w, // 横幅の変更
          child: TextFormField(
            keyboardType: widget.keyboardtype,
            onChanged: (String value) {
              _validate(value);
            },
            controller: widget.controller,
            obscureText: widget.obscuretext,
            decoration: InputDecoration(
              filled: true,
              fillColor: _bindColor(),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r), // 外側の丸み
              ), 
            ),
          ),
        ),
        _errorText != null
            ? Text(
              _errorText!,
              style: const TextStyle(color: Colors.red),
            )
          : const SizedBox(),
      ],
    );
  }
}

class TextFormField_Component extends StatelessWidget{
  final double height;
  final double width;
  final String labelText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool obscuretext;
  const TextFormField_Component({required this.height, required this.width, required this.labelText, required this.controller, required this.keyboardType, required this.obscuretext });
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BorderedText(
          strokeWidth: 2.0.sp,
          strokeColor: Colors.black,
          child: Text(
            labelText,
            style: TextStyle(
              fontSize: 6.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white
            ),
          )
        ),
        SizedBox(height: 2.h,),
        SizedBox(
          height: height,
          width: width,
          child: TextFormField(
            keyboardType: keyboardType,
            controller: controller,
            obscureText: obscuretext,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r), // 外側の丸み
              ), 
            ),
          ),
        )
      ],
    );
  }

}


class TextFormBorders {
  // キーボード表示時のフォームの枠線。
  static const textFormFocusedBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8)),
    borderSide: BorderSide(
      color: Colors.deepPurple,
      width: 2,
    ),
  );

  // 平常時のフォームの枠線。
  static const textFormEnabledBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8)),
    borderSide: BorderSide(
      color: Colors.grey,
    ),
  );

  // 入力中のエラー時の枠線。
  static const textFormErrorBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8)),
    borderSide: BorderSide(
      color: Colors.red,
      width: 2,
    ),
  );
}
