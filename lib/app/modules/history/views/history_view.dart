import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

class HistoryView extends StatefulWidget {
  const HistoryView({super.key});

  @override
  State<HistoryView> createState() => _HistoryViewState();
}

class _HistoryViewState extends State<HistoryView> {
  final box = GetStorage();
  List<dynamic> history = [];

  @override
  void initState() {
    super.initState();
    history = box.read<List>('history') ?? [];
  }

  void deleteHistory(int index) {
    setState(() {
      history.removeAt(index);
      box.write('history', history);
    });

    Get.snackbar('Deleted', 'History berhasil dihapus',
        snackPosition: SnackPosition.BOTTOM);
  }

  void _showDeleteDialog(int index) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Konfirmasi'),
        content: const Text('Yakin ingin menghapus history ini?'),
        actions: [
          TextButton(
            child: const Text('Batal'),
            onPressed: () => Navigator.of(context).pop(),
          ),
          TextButton(
            child: const Text('Hapus', style: TextStyle(color: Colors.red)),
            onPressed: () {
              Navigator.of(context).pop();
              deleteHistory(index);
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login History")),
      body: history.isEmpty
          ? const Center(child: Text("Belum ada history login."))
          : ListView.builder(
              itemCount: history.length,
              itemBuilder: (context, index) {
                final item = history[index];
                final email = item['email'] ?? 'Unknown';
                final timestamp = item['timestamp'] ?? '';
                final dateTime = DateTime.tryParse(timestamp);
                final formattedDate = dateTime != null
                    ? DateFormat('dd-MM-yyyy HH:mm').format(dateTime)
                    : 'Invalid date';

                return ListTile(
                  leading: const Icon(Icons.email),
                  title: Text(email),
                  subtitle: Text('Login at $formattedDate'),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () => _showDeleteDialog(index),
                  ),
                );
              },
            ),
    );
  }
}
