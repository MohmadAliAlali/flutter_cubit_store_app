import 'package:flutter/material.dart';

class NavbarItem {
  final String label;
  final IconData icon;
  final Widget screen;

  NavbarItem({
    required this.label,
    required this.icon,
    required this.screen,
  });
}
