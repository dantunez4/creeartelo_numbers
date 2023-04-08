import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:numbers/services/numbers_service.dart';
import 'package:numbers/widgets/type_image.dart';
import 'package:provider/provider.dart';

class DateScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  DateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final NumbersService numbersService = Provider.of<NumbersService>(context);

    return SafeArea(
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const TypeImage('assets/date.jpg'),
              const SizedBox(
                height: 15.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 10.0),
                child: TextFormField(
                  enabled: !numbersService.random,
                  onChanged: (value) => numbersService.day = value,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                  ],
                  decoration: const InputDecoration(
                    labelText: 'Insert a Day',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 10.0),
                child: TextFormField(
                  enabled: !numbersService.random,
                  onChanged: (value) => numbersService.month = value,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                  ],
                  onTap: () => print('hola'),
                  decoration: const InputDecoration(
                    labelText: 'Insert a Month',
                  ),
                ),
              ),
              SwitchListTile.adaptive(
                value: numbersService.random,
                title: const Text('Random'),
                activeColor: Colors.indigo,
                onChanged: numbersService.isRandom,
              ),
              const SizedBox(
                height: 25.0,
              ),
              MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                disabledColor: Colors.grey,
                elevation: 0.0,
                color: Colors.black,
                onPressed: () async {
                  await numbersService
                      .getInformationDate()
                      .then((_) => _formKey.currentState?.reset())
                      .then(
                        (value) => showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                            content: Text(numbersService.message),
                          ),
                        ),
                      );
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                  child: const Text(
                    'Start',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
