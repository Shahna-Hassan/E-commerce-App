import 'package:flutter/material.dart';
import 'package:lumi_ecommerce/provider/provider_classs.dart';

import 'package:lumi_ecommerce/view/intro_screen.dart';
import 'package:provider/provider.dart';
void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create:(context) =>myProvider() ,
      child: MaterialApp(
        home: IntroScreen(),
      ),
    );
  }
}