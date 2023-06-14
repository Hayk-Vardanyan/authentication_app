import 'package:flutter/material.dart';

class HeadLine extends StatelessWidget {
  const HeadLine({Key? key, required this.fullName, required this.email})
      : super(key: key);

  final String? fullName;
  final String? email;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          const CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage('assets/images/avatar.jpeg'),
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                fullName!,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w900,
                  fontSize: 18,
                ),
              ),
              Text(
                email!,
                style: const TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
