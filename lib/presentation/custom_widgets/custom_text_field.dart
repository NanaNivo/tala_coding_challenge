import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CustomTextField extends StatefulWidget {
  final String hintText;
  final IconData? icon;
  final bool obscureText;
  final double raduceBorder;
  final Color colorBorder;
  final double widthBorder;
  final int maxLines;
   final  String? Function(String)? onvalidator;
 final  TextEditingController? controller;

  const CustomTextField({
    Key? key,
    required this.hintText,
     this.icon,
    this.obscureText = false,
    this.colorBorder=Colors.transparent,
    this.widthBorder=1,
    this.raduceBorder=0,
      this.onvalidator,
    this.maxLines=1,
    this.controller
  }) : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = false;
  String? _errorText;

  final _focusNode = FocusNode();
  @override
  void initState() {

    super.initState();

    _obscureText = widget.obscureText;

  }
  @override
  void dispose() {

    _focusNode.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    return TextFormField(
      maxLines: widget.maxLines,
      obscureText: _obscureText,
         controller: widget.controller,
      decoration: InputDecoration(

       contentPadding: EdgeInsetsDirectional.symmetric(horizontal: 10.w),
        hintText: widget.hintText,
          errorMaxLines: 3,
        prefixIcon:widget.icon!=null? Icon(widget.icon):null,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.raduceBorder),
          borderSide: BorderSide(
            color: widget.colorBorder, // Change the color of the border here
            width: widget.widthBorder, // Change the width of the border here
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.raduceBorder),
          borderSide: BorderSide(
            color: widget.colorBorder, // Change the border color here
            width: widget.widthBorder, // Change the border width here
          ),
        ),
        errorBorder:OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.raduceBorder),
          borderSide: BorderSide(
            color: Colors.red, // Change the border color here
            width: widget.widthBorder, // Change the border width here
          ),
        ) ,
        // border: OutlineInputBorder(
        //
        //   borderRadius: BorderRadius.circular(12.0),
        //
        //   borderSide: BorderSide(
        //     width: 20,
        //     color: Colors.blue, // Change the border color here
        //   ),
        //
        //
        // ),

        suffixIcon: widget.obscureText
            ? IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },


        )
            : null,
        errorText: _errorText,

        errorStyle: TextStyle(color: Colors.red,overflow:TextOverflow.fade )
      ),
       onChanged: (value){


       },
      validator: (value){
       // setState(() {
       //   _errorText =

        if(widget.onvalidator!=null) {
          print("slkdl${widget.onvalidator!(value!)}");
          return widget.onvalidator!(value!);
        }
        else
          {
            return null;
          }

         //   });
      },
    //   onSaved: (value){
    //     setState(() {
    //       _errorText = widget.validator!(value);
    //     });
    //   },
    //   onEditingComplete: () {
    //     print("sdlksjdkl");
    //     _focusNode.unfocus();
    // setState(() {
    //     _errorText = widget.validator!(controller.text);
    // });
    //   },sdcs

      // onSubmitted: (value) {
      //   setState(() {
      //     print("nnn${widget.validator!(value)}${value}");
      //     _errorText = widget.validator!(value); // Add this line
      //   });
      // },
    );
  }
}