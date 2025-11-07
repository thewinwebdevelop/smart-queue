import 'package:flutter/material.dart';
import '../models/checkin_result.dart';
import 'package:intl/intl.dart';

class SuccessPage extends StatelessWidget {
  final CheckinResult result;

  const SuccessPage({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    final date = DateFormat("dd/MM/yyyy HH:mm").format(result.checkinTime);

    return Scaffold(
      appBar: AppBar(title: const Text("Check-in สำเร็จ")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Card(
            elevation: 4,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.check_circle, color: Colors.green, size: 80),
                  const SizedBox(height: 16),
                  Text("คุณ ${result.name}",
                      style: Theme.of(context).textTheme.headlineSmall),
                  const SizedBox(height: 8),
                  Text("ได้รับคิวที่ ${result.queueNumber}",
                      style: const TextStyle(fontSize: 24)),
                  const SizedBox(height: 8),
                  Text("เวลา: $date",
                      style: TextStyle(color: Colors.grey[600])),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
