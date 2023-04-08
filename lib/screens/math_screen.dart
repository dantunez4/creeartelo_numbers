import 'package:flutter/material.dart';
import 'package:numbers/services/numbers_service.dart';
import 'package:numbers/widgets/form_type.dart';
import 'package:provider/provider.dart';

class MathScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  MathScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final NumbersService numbersService = Provider.of<NumbersService>(context);

    return SafeArea(
      child: Form(
        key: _formKey,
        child: FormType(
          numbersService: numbersService,
          image: 'assets/math.jpg',
          formKey: _formKey,
          typeService: numbersService.getInformationMath,
          labelText: 'Insert a Number',
        ),
      ),
    );
  }
}
