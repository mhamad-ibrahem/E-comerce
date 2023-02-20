
import 'package:flutter/material.dart';

Widget RedDot() {
  return Positioned(
    left: 35,
    top: 5,
    child: Container(
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(7),
      ),
      constraints: const BoxConstraints(
        minWidth: 15,
        minHeight: 14,
      ),
      child: const SizedBox(
        width: 3,
        height: 3,
        child: Text(
          '3',
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w900),
          textAlign: TextAlign.center,
        ),
      ),
    ),
  );
}
