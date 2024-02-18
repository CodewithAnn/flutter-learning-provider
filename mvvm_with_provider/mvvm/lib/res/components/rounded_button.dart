import 'package:flutter/material.dart';
import 'package:mvvm/res/color.dart';

class RoundedButton extends StatelessWidget {
  final String title;
  final VoidCallback onPress;
  bool loading;
  RoundedButton(
      {super.key,
      required this.title,
      required this.onPress,
      this.loading = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: AppColor.loginButtonColor),
        height: 50,
        width: 120,
        child: loading
            ? const CircularProgressIndicator()
            : Center(
                child: Text(
                  title,
                  style: TextStyle(color: AppColor.whiteColor),
                ),
              ),
      ),
    );
  }
}
