import 'package:currency_converter/utils/src/custom_colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key key, @required this.onTap, @required this.text})
      : assert(onTap != null),
        assert(text != null),
        super(key: key);

  final Function onTap;
  final String text;

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          height: MediaQuery.of(context).size.height * 0.08,
          color: CustomColors.primaryColor,
          child: Text(
            text,
            style: TextStyle(color: Colors.white, fontSize: 25),
            textAlign: TextAlign.center,
          ),
        ),
      );
}
