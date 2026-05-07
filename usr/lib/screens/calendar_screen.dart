import 'package:flutter/material.dart';
import '../data/calendar_data.dart';
import '../models/post_day.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kids Story Posting Calendar'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          int crossAxisCount = 2;
          if (constraints.maxWidth > 900) {
            crossAxisCount = 4;
          } else if (constraints.maxWidth > 600) {
            crossAxisCount = 3;
          }

          return GridView.builder(
            padding: const EdgeInsets.all(16),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 0.85,
            ),
            itemCount: calendarData.length,
            itemBuilder: (context, index) {
              final day = calendarData[index];
              return _DayCard(day: day);
            },
          );
        },
      ),
    );
  }
}

class _DayCard extends StatelessWidget {
  final PostDay day;

  const _DayCard({required this.day});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(
            context,
            '/day_detail',
            arguments: day,
          );
        },
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.indigo.shade100,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      'Day ${day.day}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo.shade900,
                      ),
                    ),
                  ),
                  _buildFormatBadge(day.format),
                ],
              ),
              const SizedBox(height: 12),
              Expanded(
                child: Text(
                  day.concept,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const Divider(),
              Row(
                children: [
                  const Icon(Icons.access_time, size: 16, color: Colors.grey),
                  const SizedBox(width: 4),
                  Text(
                    day.optimalTime,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFormatBadge(String format) {
    Color bgColor;
    Color textColor;

    switch (format.toLowerCase()) {
      case 'reel':
        bgColor = Colors.pink.shade100;
        textColor = Colors.pink.shade900;
        break;
      case 'carousel':
        bgColor = Colors.blue.shade100;
        textColor = Colors.blue.shade900;
        break;
      case 'story':
        bgColor = Colors.orange.shade100;
        textColor = Colors.orange.shade900;
        break;
      default:
        bgColor = Colors.grey.shade200;
        textColor = Colors.grey.shade800;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        format,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: textColor,
        ),
      ),
    );
  }
}
