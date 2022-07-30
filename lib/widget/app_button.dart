import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final Function()? onPressed;
  final String? text;
  final String? image;
  final double? height;
  final double? buttonCircular;
  final double? imageHeight;
  final double? width;
  final double? imageWidth;
  final Color? color;
  final Color? textColor;
  final Color? iconColor;
  final bool? border;
  final TextStyle? style;
  final int? state;

  const AppButton({
    Key? key,
    this.onPressed,
    this.text,
    this.height,
    this.imageHeight,
    this.width,
    this.imageWidth,
    this.color,
    this.image,
    this.border = false,
    this.textColor,
    this.iconColor,
    this.style,
    this.buttonCircular,
    this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: Colors.transparent,
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(buttonCircular ?? 10),
          color: Colors.teal,
        ),
        child: SizedBox(
          height: height,
          width: width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              image != null
                  ? Image.asset(
                      image!,
                      height: imageHeight,
                      color: iconColor ?? Colors.white,
                    )
                  : Container(),
              image != null ? const SizedBox(width: 10) : SizedBox(),
              Text(
                text!,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
