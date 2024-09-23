import 'package:flutter/material.dart';
import 'package:funfacts/providers/theme_provider.dart';
import 'package:funfacts/widget/theme_switcher.dart';
import 'package:provider/provider.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {

    var themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Settings'),
      ),
      body: const Column(
        children: [
          ThemeSwitcher()
        ],
      ),
    );
  }
}
