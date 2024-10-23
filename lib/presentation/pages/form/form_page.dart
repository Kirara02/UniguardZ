import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uniguard_z/domain/entities/branch.dart';

class FormPage extends ConsumerStatefulWidget {
  final Branch branch;
  const FormPage({super.key, required this.branch});

  @override
  ConsumerState createState() => _FormPageState();
}

class _FormPageState extends ConsumerState<FormPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.branch.name),
      ),
    );
  }
}
