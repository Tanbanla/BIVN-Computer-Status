import 'package:bivn_computer_status/Widget/SectionCard.dart';
import 'package:bivn_computer_status/Widget/TableInfor.dart';
import 'package:bivn_computer_status/Widget/TableInforError.dart';
import 'package:flutter/material.dart';
import 'package:bivn_computer_status/Common/CommonColor.dart';

class Inforsystem extends StatefulWidget {
  const Inforsystem({super.key});

  @override
  State<Inforsystem> createState() => _InforsystemState();
}

class _InforsystemState extends State<Inforsystem> {
  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 1000;
    final crossAxisCount = isWide ? 3 : 1;
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _pageHeader(),
              const SizedBox(height: 20),
              GridView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: isWide ? 1.4 : 1.8,
                ),
                children: [
                  _infoCard(),
                  _usageCard(),
                  _warningCard(),
                  _maintenanceCard(),
                  _unusedCard(),
                  _summaryCard(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _pageHeader() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: Common.blue.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(Icons.account_tree, color: Common.blue, size: 30),
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Thông tin quản lý hệ thống',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4),
            Text(
              'Tổng quan trạng thái & sử dụng',
              style: TextStyle(fontSize: 13, color: Colors.black54),
            ),
          ],
        ),
      ],
    );
  }

  // CARD: Info summary
  Widget _infoCard() {
    final data = const [
      ['Tổng số lượng', '1850'],
      ['ON Line', '236'],
      ['OFF Line', '250'],
      ['Dự phòng', '250'],
      ['Sửa chữa', '25'],
      ['Hủy', '0'],
    ];
    return SectionCard(
      title: 'Thông tin quản lý máy tính',
      icon: Icons.storage_rounded,
      accentColor: Common.blue,
      child: Column(
        children: [
          for (final row in data) ...[
            Table(
              columnWidths: const {
                0: FlexColumnWidth(1.4),
                1: FlexColumnWidth(),
              },
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              children: [
                TableRow(children: [_tableKey(row[0]), _tableValue(row[1])]),
              ],
            ),
            const Divider(height: 1, thickness: 1, color: Color(0xFFE0E0E0)),
          ],
        ],
      ),
    );
  }

  Widget _usageCard() {
    final usageData = const [
      ['<3 năm', '1850'],
      ['3~5 năm', '1355'],
      ['5~7 năm', '250'],
      ['7~10 năm', '100'],
      ['> 10 năm', '50'],
    ];
    return SectionCard(
      title: 'Thời gian sử dụng PC',
      icon: Icons.timer_outlined,
      accentColor: Colors.deepPurple,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (final row in usageData)
            Column(
              children: [
                InfoLine(label: row[0], value: row[1]),
                const Divider(
                  height: 1,
                  thickness: 1,
                  color: Color(0xFFE0E0E0),
                ),
              ],
            ),
        ],
      ),
    );
  }

  Widget _warningCard() {
    final usageData = const [
      ['Tổng số cảnh báo', '10', 'Xác nhận', '10'],
      ['CPU', '10', 'View', '10'],
      ['RAM', '10', 'View', '10'],
      ['HDD', '0', 'View', '0'],
      ['POWER', '0', 'View', '0'],
      ['EVENLOG', '1', 'View', '1'],
      ['POWER', '2', 'View', '2'],
    ];
    return SectionCard(
      title: 'Cảnh báo bất thường',
      icon: Icons.warning_amber_rounded,
      accentColor: Colors.deepOrange,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (final row in usageData)
            Column(
              children: [
                InfoLineError(
                  label: row[0],
                  value: row[1],
                  action: row[2],
                  actionValue: row[3],
                ),
                const Divider(
                  height: 1,
                  thickness: 1,
                  color: Color(0xFFE0E0E0),
                ),
              ],
            ),
        ],
      ),
    );
  }

  Widget _unusedCard() {
    return SectionCard(
      title: 'Bật, tắt máy tính',
      icon: Icons.event_busy,
      accentColor: Colors.indigo,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          InfoLine(label: 'Sử dụng hệ thống', value: '520'),
          Divider(height: 1, thickness: 1, color: Color(0xFFE0E0E0)),
          InfoLine(label: 'Bật, tắt thủ công', value: '182'),
          Divider(height: 1, thickness: 1, color: Color(0xFFE0E0E0)),
          InfoLine(label: 'Tb >12h chưa Reset', value: '5'),
          Divider(height: 1, thickness: 1, color: Color(0xFFE0E0E0)),
          InfoLine(label: 'Tb >24h chưa Reset', value: '5'),
          Divider(height: 1, thickness: 1, color: Color(0xFFE0E0E0)),
        ],
      ),
    );
  }

  Widget _maintenanceCard() {
    return SectionCard(
      title: 'Chưa sử dụng',
      icon: Icons.memory,
      accentColor: Colors.teal,
      child: Column(
        children: [
          _linearMetric('CPU', 0.55, Common.blue),
          _linearMetric('RAM', 0.42, Colors.green.shade600),
          _linearMetric('Disk', 0.72, Colors.orange.shade700),
        ],
      ),
    );
  }

  Widget _summaryCard() {
    final usageData = const [
      ['Kế hoạch bảo dưỡng: T6', '120', 'View', ''],
      ['Đã hoàn thành bảo dưỡng: T6', '86', 'View', ''],
      ['Chưa hoàn thành bảo dưỡng: T6', '34', 'View', ''],
      ['Kế hoạch kiểm kê tháng: T6', '120', 'View', ''],
      ['Đã hoàn thành kiểm kê: T6', '86', 'View', ''],
      ['Chưa hoàn thành kiểm kê: T6', '34', 'View', ''],
    ];
    return SectionCard(
      title: 'Lịch bảo dưỡng, kiểm kê',
      icon: Icons.calendar_month,
      accentColor: Colors.pinkAccent,
      child: Wrap(
        spacing: 12,
        runSpacing: 12,
        children: [
        for (final row in usageData)
            Column(
              children: [
                InfoLineError(
                  label: row[0],
                  value: row[1],
                  action: row[2],
                  actionValue: row[3],
                ),
                const Divider(
                  height: 1,
                  thickness: 1,
                  color: Color(0xFFE0E0E0),
                ),
              ],
            ),
        ],
      ),
    );
  }
  Widget _linearMetric(String label, double value, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(
                width: 60,
                child: Text(
                  label,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: LinearProgressIndicator(
                    minHeight: 8,
                    value: value,
                    backgroundColor: Colors.grey.shade200,
                    valueColor: AlwaysStoppedAnimation(color),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                '${(value * 100).round()}%',
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _tableKey(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 4),
      child: Text(text, style: const TextStyle(fontWeight: FontWeight.w500)),
    );
  }

  Widget _tableValue(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 4),
      child: Column(
        children: [
          Text(
            text,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
