import 'package:flutter/material.dart';
class NewPage extends StatefulWidget {
  const NewPage({super.key,required this.pageName
  });
  final String pageName;

  @override
  State<NewPage> createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.pageName),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 65, 159, 210),
      ),
      body: Center(
        child: Text('这是${widget.pageName}的内容'),
      ),
    );
  }
}