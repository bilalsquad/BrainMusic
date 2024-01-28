import 'package:flutter/material.dart';

import '../screens/line_chart.dart';

class DataInfoWidget extends StatelessWidget {
  final String sessionText;
  final String dateText;

  const DataInfoWidget({
    Key? key,
    required this.sessionText,
    required this.dateText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Mes données',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      dateText,
                      style: TextStyle(
                        color: Color(0xFF49454F),
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      sessionText,
                      style: TextStyle(
                        color: Color(0xFFE6E0E9),
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 15),
              InkWell(
                onTap: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LineChartSample10(),
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  child: const Icon(
                    Icons.download,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Container(
            height: 1,
            color: Colors.grey,
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
