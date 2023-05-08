import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Form"),
        ),
        body: const MyForm(),
      ),
    );
  }
}

// 名前を入力するFormを作る
// 名前が6文字未満のときバリデーションエラーを表示する

class MyForm extends StatefulWidget {
  const MyForm({super.key});

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>();

  void submit() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("完了"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            validator: (value) {
              if (value != null && value.length >= 6) {
                return null;
              } else {
                return "6文字以上入力してください";
              }
            },
          ),
          ElevatedButton(
            onPressed: submit,
            child: Text('Submit'),
          )
        ],
      ),
    );
  }
}
