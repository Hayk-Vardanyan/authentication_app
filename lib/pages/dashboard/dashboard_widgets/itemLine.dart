import 'package:flutter/material.dart';

class ItemLine extends StatelessWidget {
  const ItemLine({
    Key? key,
    required this.icon,
    required this.text,
    this.topWidth = 0.5,
    this.bottomWidth = 0.5,
  }) : super(key: key);

  final Icon icon;
  final String text;
  final double topWidth;
  final double bottomWidth;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      splashColor: Colors.grey,
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Colors.grey,
              width: topWidth,
            ),
            bottom: BorderSide(
              color: Colors.grey,
              width: bottomWidth,
            ),
          ),
        ),
        height: 50,
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            icon,
            const SizedBox(
              width: 10,
            ),
            Text(
              text,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
            ),
            const Expanded(child: Text('')),
            const Icon(Icons.navigate_next),
          ],
        ),
      ),
    );
  }
}
