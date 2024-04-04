import 'package:codeland/AppTheme/app_color.dart';
import 'package:flutter/material.dart';

class ReusableTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final String fieldName;
  final bool isObsecure;
  final TextInputType keyboardtype;
  final errormsg;

  const ReusableTextFormField(
      {super.key,
      required this.controller,
      required this.fieldName,
      this.isObsecure = false,
      required this.keyboardtype,
      required this.errormsg});

  @override
  State<ReusableTextFormField> createState() => _ReusableTextFormFieldState();
}

class _ReusableTextFormFieldState extends State<ReusableTextFormField> {
  @override
  bool obsvalue = true;
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.keyboardtype,
      controller: widget.controller,
      obscureText: widget.isObsecure ? obsvalue : widget.isObsecure,
      style: TextStyle(color: AppColor().black, fontFamily: 'Poppins'),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return widget.errormsg;
        }
        return null;
      },
      decoration: InputDecoration(
          hintText: widget.fieldName,
          hintStyle:
              TextStyle(color: AppColor().darkgrey, fontFamily: 'Poppins'),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: AppColor().darkgrey)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColor().darkgrey)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColor().darkgrey)),
          errorBorder:
              OutlineInputBorder(borderSide: BorderSide(color: AppColor().red)),
          suffixIcon: widget.isObsecure
              ? IconButton(
                  onPressed: () {
                    setState(() {});
                    obsvalue = !obsvalue;
                    print(obsvalue);
                  },
                  icon: Icon(
                    Icons.remove_red_eye_outlined,
                    color: AppColor().darkgrey,
                  ))
              : null),
    );
  }
}
