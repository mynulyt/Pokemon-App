import 'package:flutter/material.dart';

class PowerBadge extends StatelessWidget {
  final String text;
  const PowerBadge({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.3),
        borderRadius: BorderRadius.circular(25.0),
      ),
      padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 4.0),
      margin: EdgeInsets.symmetric(vertical: 4.0),
      child: Text(
        text,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
