import 'package:flutter/material.dart';
import 'package:web_metric/const.dart';

class CustomTextInput extends StatelessWidget {
  final String? mask;
  final String title;
  final String? hint;
  final Widget? prefix;
  final Widget? suffix;
  // final Function onPressIcon;
  final Color? fillColor;
  final TextInputType? keyboardType;
  final Function(String? value)? validator;
  final Function(String? value)? onChange;
  final bool? obscureText;
  final int? minLine;
  final int? maxLine;

  final TextEditingController? textEditingController;

  const CustomTextInput(
      {super.key,
      this.mask,
      this.title = 'title',
      this.minLine = 1,
      this.maxLine = 50,
      this.hint,
      this.suffix,
      // required this.onPressIcon,
      this.fillColor,
      this.prefix,
      this.textEditingController,
      this.keyboardType,
      this.validator,
      this.onChange,
      this.obscureText});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Consts.cardTextStyle),
        const SizedBox(height: 5),
        TextFormField(
          minLines: minLine,
          maxLines: maxLine,
          // expands: true,
          obscureText: obscureText ?? false,
          onChanged: (value) {
            onChange != null ? onChange!(value) : () {};
          },
          validator: (v) {
            return validator!(v);
          },
          cursorColor: Consts.mainPurple,
          keyboardType: keyboardType,
          // inputFormatters: [
          //   MaskTextInputFormatter(mask: mask),
          // ],
          controller:
              textEditingController, //editing controller of this TextField
          decoration: InputDecoration(
              filled: fillColor != null,
              fillColor: fillColor,
              hintText: hint,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(
                  color: Consts.mainPurple,
                  width: 2.0,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(
                  color: Colors.green,
                  width: 1.0,
                ),
              ),
              suffixIcon: suffix,
              prefixIcon: prefix
              // labelText: "Enter Date" //label text of field
              ),
          // readOnly:
          //     true, //set it true, so that user will not able to edit text
        ),
      ],
    );
  }
}
