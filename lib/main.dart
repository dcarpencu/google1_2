import 'package:flutter/material.dart';

void main() {
  runApp(const CurrencyConverterApp());
}

class CurrencyConverterApp extends StatelessWidget {
  const CurrencyConverterApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _controller = TextEditingController();
  String _result = '';

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Currency Convertor'),
        ),
        body: Column(
          children: <Widget>[
            Image.network(
                'https://media.cancan.ro/unsafe/1260x709/smart/filters:contrast(5):format(webp):quality(80)/http://cancan.ro/wp-content/uploads/2022/03/bani.jpg'),
            Container(
              padding: const EdgeInsets.all(16),
              child: TextFormField(
                autofocus: true,
                controller: _controller,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                decoration: const InputDecoration(
                  hintText: 'enter the amount in EUR',
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter a non empty value';
                  }

                  final double? result = double.tryParse(value);
                  if (result == null) {
                    return 'please enter a number';
                  }

                  return null;
                },
              ),
            ),
            Builder(builder: (BuildContext context) {
              return ElevatedButton(
                onPressed: () {
                  final bool valid = Form.of(context)!.validate();

                  if (valid) {
                    final double value = double.parse(_controller.text);
                    final double resultValue = value * 5;

                    setState(() {
                      _result = '${resultValue.toStringAsFixed(2)} RON';
                    });
                  }
                },
                child: const Text('CONVERT!'),
              );
            }),
            Text(_result)
          ],
        ),
      ),
    );
  }
}
