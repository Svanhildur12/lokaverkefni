import 'package:flutter/cupertino.dart';

class HangmanScreen extends StatefulWidget{
  const HangmanScreen({super.key});
  @override
  State<HangmanScreen> createState() {
return _HangmanScreenState();
  }
}

class _HangmanScreenState extends State<HangmanScreen> {
  @override
  Widget build(context) {
    return const Text('HangmanScreen');
  }
}