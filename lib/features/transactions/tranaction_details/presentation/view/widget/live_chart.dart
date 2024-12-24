import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:horsely_app/core/utils/app_colors.dart';

class LiveChart extends StatelessWidget {
  const LiveChart({super.key});

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        gridData: const FlGridData(show: true, drawHorizontalLine: false),
        titlesData: FlTitlesData(
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) {
                return Text('${value.toInt()}k',
                    style: const TextStyle(fontSize: 12));
              },
            ),
          ),
          topTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 40,
              getTitlesWidget: (value, meta) {
                switch (value.toInt()) {
                  case 0:
                    return const Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('AM', style: TextStyle(fontSize: 12)),
                        Text('0',
                            style: TextStyle(fontSize: 10, color: Colors.grey)),
                      ],
                    );
                  case 1:
                    return const Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(' AM', style: TextStyle(fontSize: 12)),
                        Text('1',
                            style: TextStyle(fontSize: 10, color: Colors.grey)),
                      ],
                    );
                  case 2:
                    return const Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('AM', style: TextStyle(fontSize: 12)),
                        Text('2',
                            style: TextStyle(fontSize: 10, color: Colors.grey)),
                      ],
                    );
                  case 3:
                    return const Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(' AM', style: TextStyle(fontSize: 12)),
                        Text('3',
                            style: TextStyle(fontSize: 10, color: Colors.grey)),
                      ],
                    );
                  case 4:
                    return const Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(' AM', style: TextStyle(fontSize: 12)),
                        Text('4',
                            style: TextStyle(fontSize: 10, color: Colors.grey)),
                      ],
                    );
                  case 5:
                    return const Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(' AM', style: TextStyle(fontSize: 12)),
                        Text('5',
                            style: TextStyle(fontSize: 10, color: Colors.grey)),
                      ],
                    );
                  case 6:
                    return const Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(' AM', style: TextStyle(fontSize: 12)),
                        Text('6',
                            style: TextStyle(fontSize: 10, color: Colors.grey)),
                      ],
                    );
                }
                return const Text('');
              },
            ),
          ),
          bottomTitles: const AxisTitles(
            sideTitles: SideTitles(
              showTitles: false,
            ),
          ),
          rightTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
        ),
        borderData: FlBorderData(show: false),
        minX: 0,
        maxX: 6, // عدد الساعات
        minY: 0,
        maxY: 10,
        lineBarsData: [
          LineChartBarData(
            color: AppColors.primaryColor,
            spots: [
              const FlSpot(0, 2.5),
              const FlSpot(1, 4),
              const FlSpot(2, 3.5),
              const FlSpot(3, 6),
              const FlSpot(4, 5),
              const FlSpot(5, 7.5),
              const FlSpot(6, 9),
            ],
            isCurved: true, // اجعل الخط مموجًا
            curveSmoothness: 0.5, // مستوى انسيابية الخط (0.0 - 1.0)
            barWidth: 4, // زيادة سمك الخط إذا لزم الأمر
            isStrokeCapRound: true,
            belowBarData: BarAreaData(
              show: true,
              gradient: LinearGradient(
                colors: [
                  const Color(0xff17875C),
                  const Color(0xffD9D9D9).withOpacity(0),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
