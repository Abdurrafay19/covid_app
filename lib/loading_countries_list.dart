import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';




class LoadingCountriesList extends StatefulWidget {
  const LoadingCountriesList({super.key});

  @override
  State<LoadingCountriesList> createState() => _LoadingCountriesListState();
}

class _LoadingCountriesListState extends State<LoadingCountriesList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white12.withOpacity(0),
        body: Center(
        child: LoadingAnimationWidget.newtonCradle(
        color: Colors.white,
        size: 200,
    ),
    ));
  }
}
