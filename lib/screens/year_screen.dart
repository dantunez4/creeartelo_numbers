import 'package:flutter/material.dart';
import 'package:numbers/services/numbers_service.dart';
import 'package:numbers/widgets/form_type.dart';
import 'package:provider/provider.dart';

class YearScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  YearScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final NumbersService numbersService = Provider.of<NumbersService>(context);

    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    return SafeArea(
      child: SafeArea(
        child: Form(
          key: _formKey,
          child: FormType(
            numbersService: numbersService,
            image: 'assets/year.png',
            formKey: _formKey,
            typeService: numbersService.getInformationTrivia,
            labelText: 'Insert a Year',
          ),
        ),
      ),
    );
  }
}
