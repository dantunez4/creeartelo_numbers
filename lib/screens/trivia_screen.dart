import 'package:flutter/material.dart';
import 'package:numbers/services/numbers_service.dart';
import 'package:numbers/widgets/form_type.dart';
import 'package:provider/provider.dart';

class TriviaScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TriviaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final NumbersService numbersService = Provider.of<NumbersService>(context);

    return SafeArea(
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: FormType(
            numbersService: numbersService,
            image: 'assets/trivia.jpg',
            formKey: _formKey,
            typeService: numbersService.getInformationTrivia,
            labelText: 'Insert a Number',
          ),
        ),
      ),
    );
  }
}
