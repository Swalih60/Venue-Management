import 'package:flutter/material.dart';
import 'package:venue/components/pages/main_page.dart';
import 'package:venue/components/pages/search_page.dart';
import 'package:venue/components/pages/updation_page.dart';

// ignore: use_key_in_widget_constructors
class VlsiAndEmbebbedSystemLabA509 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ReusableMainScreen(
          databaseName: 'Vlsi And Embebbed System Lab A509',
          updationScreen: VlsiAndEmbebbedSystemLabA509UpdationScreen(),
        ),
      ),
    );
  }
}

// ignore: use_key_in_widget_constructors
class VlsiAndEmbebbedSystemLabA509SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: ReusableSearchScreen(
              databaseName: 'Vlsi And Embebbed System Lab A509')),
    );
  }
}

// ignore: use_key_in_widget_constructors
class VlsiAndEmbebbedSystemLabA509UpdationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ReusableUpdationScreen(
        databaseName: 'Vlsi And Embebbed System Lab A509',
        searchScreen: VlsiAndEmbebbedSystemLabA509SearchScreen(),
      )),
    );
  }
}
