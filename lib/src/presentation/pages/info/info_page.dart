import 'package:flutter/material.dart';
import '../../widgets/theme_changer_button.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Info'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              child: ListTile(
                title: const Text('Theme'),
                trailing: const ThemeChangerButton(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
