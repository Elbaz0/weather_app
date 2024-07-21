import 'package:flutter/material.dart';

class Start_wither extends StatelessWidget {
  const Start_wither({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(143, 255, 183, 0),
              Color.fromARGB(44, 236, 236, 236)
            ]),
      ),
      child: const Center(
        child: Padding(
          padding: EdgeInsets.only(top: 250),
          child: Column(
            children: [
              Text(
                'there is no weather 😔 start',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),
              Text(
                'searching now 🔍',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
