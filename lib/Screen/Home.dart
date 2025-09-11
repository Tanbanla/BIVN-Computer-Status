import 'package:flutter/material.dart';

class ComputerStatusScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'HỆ THỐNG QUẢN LÝ TÌNH TRẠNG MÁY TÍNH BIVN',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              'BIVN Computer Status Management System',
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text('Welcome: dangle'),
                SizedBox(width: 16),
                Text('Language:'),
                Icon(Icons.language),
                // Add more language icons if needed
              ],
            ),
          ),
        ],
        backgroundColor: Colors.green[100],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(child: Text('Danh mục chung')),
            ListTile(title: Text('Trang chủ')),
            ExpansionTile(
              title: Text('Quản lý hệ thống máy tính'),
              children: [
                ListTile(title: Text('Cài đặt thông tin quản lý')),
                ListTile(title: Text('Phần mềm cài đặt ứng dụng')),
                ListTile(title: Text('MAP PC')),
                ListTile(title: Text('Thời gian sử dụng PC')),
                ListTile(title: Text('Hướng dẫn sử dụng HT')),
              ],
            ),
            ExpansionTile(
              title: Text('Kiểm kê-Bảo dưỡng'),
              children: [
                ListTile(title: Text('Kiểm bảo dưỡng PC')),
                ListTile(title: Text('Kỹ kiểm kê PC')),
                ListTile(title: Text('Kỹ lịch')),
              ],
            ),
            ExpansionTile(
              title: Text('Bật, tắt máy tính'),
              children: [
                ListTile(title: Text('RE-DE cài đặt')),
                ListTile(title: Text('PROD cài đặt')),
                ListTile(title: Text('Dữ liệu')),
              ],
            ),
            ExpansionTile(
              title: Text('Cảnh báo'),
              children: [
                ListTile(title: Text('Danh sách cảnh báo')),
                ListTile(title: Text('Top thiết bị cảnh báo')),
              ],
            ),
            ExpansionTile(
              title: Text('Dashboard'),
              children: [
                ListTile(title: Text('Tổng thể')),
                ListTile(title: Text('Chi tiết')),
              ],
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'Tên máy tính',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'Nhà máy',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'Địa chỉ IP',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    IconButton(icon: Icon(Icons.search), onPressed: () {}),
                    IconButton(icon: Icon(Icons.refresh), onPressed: () {}),
                  ],
                ),
              ),
            ),
            SizedBox(height: 8),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    columns: [
                      DataColumn(label: Text('STT')),
                      DataColumn(label: Text('Tên máy')),
                      DataColumn(label: Text('Loại máy')),
                      DataColumn(label: Text('Thời gian sử dụng')),
                      DataColumn(label: Text('Nhà máy')),
                      DataColumn(label: Text('F')),
                      DataColumn(label: Text('Số')),
                      DataColumn(label: Text('Địa chỉ IP')),
                      DataColumn(label: Text('CPU')),
                      DataColumn(label: Text('RAM')),
                      DataColumn(label: Text('HDD')),
                      DataColumn(label: Text('POWER')),
                      DataColumn(label: Text('Tố host')),
                    ],
                    rows: List.generate(
                      10,
                      (index) => DataRow(
                        cells: [
                          DataCell(Text('${index + 1}')),
                          DataCell(Text('BIVNLINEF20386')),
                          DataCell(Text('PC')),
                          DataCell(Text('10 tháng')),
                          DataCell(Text('BIVN')),
                          DataCell(Text('F2')),
                          DataCell(Text('S2')),
                          DataCell(Text('172.26.147.109')),
                          DataCell(Text('80%')),
                          DataCell(Text('80%')),
                          DataCell(Text('80%')),
                          DataCell(Text('80%')),
                          DataCell(Text('12')),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
