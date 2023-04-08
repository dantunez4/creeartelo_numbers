import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:numbers/services/numbers_service.dart';
import 'package:numbers/widgets/type_image.dart';

class FormType extends StatelessWidget {
  final NumbersService numbersService;
  final String image;
  final GlobalKey<FormState> formKey;
  final Future<String> Function() typeService;
  final String labelText;

  const FormType({
    super.key,
    required this.numbersService,
    required this.image,
    required this.formKey,
    required this.typeService,
    required this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TypeImage(image),
        const SizedBox(
          height: 15.0,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: TextFormField(
            enabled: !numbersService.random,
            onChanged: (value) => numbersService.number = value,
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
            ],
            decoration: InputDecoration(
              labelText: labelText,
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
            await typeService().then((_) => formKey.currentState?.reset()).then(
                  (value) => showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      elevation: 5.0,
                      title: const Text('Titulo'),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(numbersService.message),
                          const SizedBox(
                            height: 10.0,
                          ),
                        ],
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('Ok'),
                        ),
                      ],
                    ),
                  ),
                );
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
            child: const Text(
              'Start',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
