// Nama: Achmad Dhanil Ahkam
// NIM: 2415051049


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/course.dart';
import '../providers/course_provider.dart';

class AddCoursePage extends StatefulWidget {
  const AddCoursePage({super.key});

  @override
  State<AddCoursePage> createState() => _AddCoursePageState();
}

class _AddCoursePageState extends State<AddCoursePage> {
  final _formKey = GlobalKey<FormState>();
  final _codeController = TextEditingController();
  final _titleController = TextEditingController();
  final _creditsController = TextEditingController();
  String _selectedStatus = 'planned';

  @override
  void dispose() {
    _codeController.dispose();
    _titleController.dispose();
    _creditsController.dispose();
    super.dispose();
  }

// Nama: Achmad Dhanil Ahkam
// NIM: 2415051049

  Future<void> _submitForm() async {
    if (!_formKey.currentState!.validate()) return;

    final provider = context.read<CourseProvider>();

    final newCourse = Course(
      id: DateTime.now().millisecondsSinceEpoch,
      userId: 1,
      title: _titleController.text,
      body:
          'Kode: ${_codeController.text} | SKS: ${_creditsController.text} | Status: $_selectedStatus',
    );

    final success = await provider.addCourse(newCourse) == true;

    // Cek mounted sebelum akses context
    if (!mounted) return;

    if (success == true) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content:
              Text('Course berhasil ditambahkan oleh Achmad Dhanil Ahkam!'),
          backgroundColor: Colors.green,
        ),
      );
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(provider.errorMessage ?? 'Gagal menambahkan course'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool isSaving = context.watch<CourseProvider>().isSaving == true;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Course • 2415051049'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _codeController,
                decoration: const InputDecoration(
                  labelText: 'Kode Course',
                  hintText: 'Misal: PTI101',
                ),
                validator: (val) =>
                    (val == null || val.isEmpty) ? 'Kode wajib diisi' : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(
                  labelText: 'Judul Course',
                ),
                validator: (val) =>
                    (val == null || val.isEmpty) ? 'Judul wajib diisi' : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _creditsController,
                decoration: const InputDecoration(
                  labelText: 'Credits (SKS)',
                ),
                keyboardType: TextInputType.number,
                validator: (val) {
                  if (val == null || val.isEmpty) return 'SKS wajib diisi';
                  if (int.tryParse(val) == null)
                    return 'SKS harus berupa angka';
                  return null;
                },
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField<String>(
                value: _selectedStatus,
                decoration: const InputDecoration(labelText: 'Status'),
                items: const [
                  DropdownMenuItem(value: 'planned', child: Text('Planned')),
                  DropdownMenuItem(value: 'active', child: Text('Active')),
                  DropdownMenuItem(value: 'done', child: Text('Done')),
                ],
                onChanged: (val) {
                  if (val != null) {
                    setState(() => _selectedStatus = val);
                  }
                },
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: (isSaving == true) ? null : _submitForm,
                child: (isSaving == true)
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                    : const Text('Simpan'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}