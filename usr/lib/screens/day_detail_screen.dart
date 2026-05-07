import 'package:flutter/material.dart';
import '../models/post_day.dart';

class DayDetailScreen extends StatelessWidget {
  const DayDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final day = ModalRoute.of(context)!.settings.arguments as PostDay;

    return Scaffold(
      appBar: AppBar(
        title: Text('Day ${day.day} Details'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildHeaderCard(day),
                const SizedBox(height: 24),
                _buildSectionTitle('Content Concept'),
                _buildContentBox(day.concept, Icons.lightbulb_outline),
                const SizedBox(height: 24),
                _buildSectionTitle('Hook'),
                _buildContentBox(day.hook, Icons.campaign),
                const SizedBox(height: 24),
                _buildSectionTitle('Call to Action (CTA)'),
                _buildContentBox(day.cta, Icons.touch_app),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderCard(PostDay day) {
    return Card(
      elevation: 0,
      color: Colors.indigo.shade50,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: Colors.indigo.shade100),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildStatItem('Format', day.format, Icons.photo_library),
            _buildStatItem('Optimal Time', day.optimalTime, Icons.access_time),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(String label, String value, IconData icon) {
    return Column(
      children: [
        Icon(icon, color: Colors.indigo, size: 32),
        const SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            color: Colors.indigo.shade300,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.indigo,
          ),
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
    );
  }

  Widget _buildContentBox(String content, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: BorderSide(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.05),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.indigo.shade300, size: 28),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              content,
              style: const TextStyle(
                fontSize: 16,
                height: 1.5,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
