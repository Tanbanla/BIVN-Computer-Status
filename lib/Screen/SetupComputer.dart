import 'package:flutter/material.dart';

class ComputerDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('HỆ THỐNG QUẢN LÝ TÌNH TRẠNG MÁY TÍNH BIVN', style: TextStyle(fontWeight: FontWeight.bold)),
            Text('BIVN Computer Status Management System', style: TextStyle(fontSize: 12)),
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
            // ...other menu items...
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              children: [
                ElevatedButton.icon(
                  icon: Icon(Icons.upload_file),
                  label: Text('Upload master'),
                  onPressed: () {},
                ),
                SizedBox(width: 8),
                IconButton(icon: Icon(Icons.arrow_upward), onPressed: () {}),
              ],
            ),
            SizedBox(height: 8),
            Card(
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.redAccent, width: 1),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(child: TextField(decoration: InputDecoration(labelText: 'Tên máy tính'))),
                    SizedBox(width: 8),
                    Expanded(child: TextField(decoration: InputDecoration(labelText: 'Nhà máy'))),
                    SizedBox(width: 8),
                    Expanded(child: TextField(decoration: InputDecoration(labelText: 'F2'))),
                    SizedBox(width: 8),
                    Expanded(child: TextField(decoration: InputDecoration(labelText: 'Địa chỉ IP'))),
                    IconButton(icon: Icon(Icons.search), onPressed: () {}),
                    SizedBox(width: 8),
                    Text('Download log', style: TextStyle(color: Colors.blue)),
                  ],
                ),
              ),
            ),
            SizedBox(height: 8),
            Expanded(
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Table(
                            columnWidths: {0: FixedColumnWidth(150)},
                            children: [
                              TableRow(children: [
                                Text('Tên máy tính'), Text('BIVNLINEF20386'),
                              ]),
                              TableRow(children: [
                                Text('Nhà máy'), Text('F2'),
                              ]),
                              TableRow(children: [
                                Text('Chuyền'), Text('W716'),
                              ]),
                              TableRow(children: [
                                Text('Công đoàn'), Text('KTOA'),
                              ]),
                              TableRow(children: [
                                Text('Địa chỉ IP'), Text('\\172.26.10.154'),
                              ]),
                              TableRow(children: [
                                Text('Thời gian bắt đầu sử dụng'), Text('30/06/2025'),
                              ]),
                            ],
                          ),
                        ),
                      ),
                      VerticalDivider(),
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Table(
                            columnWidths: {0: FixedColumnWidth(150)},
                            children: [
                              TableRow(children: [
                                Text('Trạng thái sử dụng'), Text(''),
                              ]),
                              TableRow(children: [
                                Text('Tỉ lệ hoạt động CPU'), Text('85%'),
                              ]),
                              TableRow(children: [
                                Text('RAM'), Text('80%'),
                              ]),
                              TableRow(children: [
                                Text('HDD'), Text('83%'),
                              ]),
                              TableRow(children: [
                                Text('POWER'), Text('90%'),
                              ]),
                              TableRow(children: [
                                Text('INTERNET'), Text('<100ms'),
                              ]),
                            ],
                          ),
                        ),
                      ),
                      VerticalDivider(),
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Table(
                            columnWidths: {0: FixedColumnWidth(150)},
                            children: [
                              TableRow(children: [
                                Text('Người quản lý'), Text('Nguyễn Hải Mạnh'),
                              ]),
                              TableRow(children: [
                                Text('Mã nhân viên'), Text('M0045001'),
                              ]),
                              TableRow(children: [
                                Text('Email'), Text('nguyenhai.manh@brother- RD-EE'),
                              ]),
                              TableRow(children: [
                                Text('Phân xưởng'), Text('G2'),
                              ]),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(onPressed: () {}, child: Text('Hủy bỏ')),
                SizedBox(width: 16),
                ElevatedButton(onPressed: () {}, child: Text('Xác nhận')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}