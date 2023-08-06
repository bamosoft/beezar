import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormFields extends StatefulWidget {
  TextEditingController textFieldController = TextEditingController();
  dynamic prefix;
  dynamic suffix;
  String myInput ;
  bool IsObsecure;
  var onchange;

  FormFields(this.myInput, this.prefix, this.suffix, this.IsObsecure,
      this.textFieldController,this.onchange);

  @override
  State<FormFields> createState() => _FormFieldsState();
}

class _FormFieldsState extends State<FormFields> {
  dynamic function;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        validator: (String? text) {
          if (widget.textFieldController.text == '') {
            return 'هذا الحقل مطلوب !!';
          }
          return null;
        },
        onChanged: widget.onchange,
        obscureText: widget.IsObsecure,
        cursorColor: Colors.grey,
        controller: widget.textFieldController,
        decoration: InputDecoration(
          prefixIcon: widget.prefix,
          suffixIcon: widget.suffix,
          filled: true,
          fillColor: Colors.white,
          floatingLabelStyle:
          const TextStyle(color: Color.fromRGBO(13, 6, 88, 0.8),fontFamily: "ca1"),
          labelStyle: TextStyle(color: Colors.black,fontFamily: 'ca1'),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 2,
              color: Color.fromRGBO(13, 6, 88, 0.8),
            ),
          ),
          labelText: widget.myInput,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
        ));
  }
}