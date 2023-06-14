import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({
    Key? key,
    required this.leading,
    required this.text,
    required this.color,
  }) : super(key: key);

  final Widget leading;
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ElevatedButton(
        onPressed: () {},
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(color),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            leading,
            Text(
              text,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox()
          ],
        ),
      ),
    );
  }
}

// ListTile
// (
// leading: leading,
// title: Text(
// text,
// style: const TextStyle(
// fontSize: 20,
// fontWeight: FontWeight.w700,
// ),
// ),
// tileColor: color,
// textColor: Colors.white,
// shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
// ,
// )
// ,
