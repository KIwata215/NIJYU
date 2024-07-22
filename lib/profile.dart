import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
class Profile extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _Profile();
}
class _Profile extends State<Profile>{
    @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/sugoroku_background_images/homeBackground.png'),
            fit: BoxFit.cover,
          ),
        ),
        // child: Column(
        //   children: [
            
        //   ],
        // ),
      ),
    );
  }

}