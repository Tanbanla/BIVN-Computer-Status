import 'package:flutter/material.dart';

class SetupManager extends StatefulWidget {
  const SetupManager({super.key});

  @override
  State<SetupManager> createState() => _SetupManagerState();
}

class _SetupManagerState extends State<SetupManager> {
  @override
  Widget build(BuildContext context) {
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
              Row(children: [Expanded(child: _buildDataTable())]),
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
            color: Colors.grey.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(Icons.settings, color: Colors.grey, size: 30),
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Cài đặt thông tin quản lý',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4),
            Text(
              'Trang quản lý thông tin hệ thống',
              style: TextStyle(fontSize: 13, color: Colors.black54),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDataTable() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Search and Import/Export Row
        Row(
          children: [
            // Search box
            Expanded(
              flex: 3,
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 6,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search, color: Colors.grey[600]),
                    hintText: 'Tìm kiếm thiết bị...',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 0,
                      horizontal: 16,
                    ),
                    hintStyle: TextStyle(color: Colors.grey[600]),
                  ),
                  onChanged: (value) {
                    // Xử lý tìm kiếm
                  },
                ),
              ),
            ),
            SizedBox(width: 16),
            // Import button
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 6,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.blue[700],
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                icon: Icon(Icons.file_upload_outlined, size: 20),
                label: Text(
                  'Nhập từ file',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                onPressed: () {},
              ),
            ),
            SizedBox(width: 12),
            // Export button
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.withOpacity(0.3),
                    spreadRadius: 1,
                    blurRadius: 6,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[700],
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                icon: Icon(Icons.file_download_outlined, size: 20),
                label: Text(
                  'Xuất file',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                onPressed: () {
                  // Xử lý xuất dữ liệu ra file
                },
              ),
            ),
          ],
        ),
        SizedBox(height: 12),
        // Data Table
        LayoutBuilder(
          builder: (context, constraints) {
            // Calculate total width minus padding (20 left + 20 right)
            double tableWidth = constraints.maxWidth;
            return Column(
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 12,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: ConstrainedBox(
                      constraints: BoxConstraints(minWidth: tableWidth),
                      child: DataTable(
                        headingRowColor: MaterialStateProperty.all(
                          Colors.blue[50],
                        ),
                        columnSpacing: 16,
                        dataRowHeight: 64,
                        headingTextStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey[900],
                          fontSize: 14,
                        ),
                        dataTextStyle: TextStyle(
                          color: Colors.grey[800],
                          fontSize: 14,
                        ),
                        dividerThickness: 0.5,
                        columns: [
                          DataColumn(
                            label: SizedBox(
                              width: 40,
                              child: Center(
                                child: Text(
                                  'STT',
                                  style: TextStyle(fontSize: 14),
                                ),
                              ),
                            ),
                          ),
                          DataColumn(
                            label: SizedBox(
                              width: 100,
                              child: Center(
                                child: Text(
                                  'Thao tác',
                                  style: TextStyle(fontSize: 14),
                                ),
                              ),
                            ),
                          ),
                          DataColumn(
                            label: SizedBox(
                              width: 120,
                              child: Text(
                                'Tên máy',
                                style: TextStyle(fontSize: 14),
                              ),
                            ),
                          ),
                          DataColumn(
                            label: SizedBox(
                              width: 120,
                              child: Text(
                                'Số serial',
                                style: TextStyle(fontSize: 14),
                              ),
                            ),
                          ),
                          DataColumn(
                            label: SizedBox(
                              width: 150,
                              child: Text(
                                'Tên người dùng',
                                style: TextStyle(fontSize: 14),
                              ),
                            ),
                          ),
                          DataColumn(
                            label: SizedBox(
                              width: 80,
                              child: Text(
                                'Ram',
                                style: TextStyle(fontSize: 14),
                              ),
                            ),
                          ),
                          DataColumn(
                            label: SizedBox(
                              width: 80,
                              child: Text(
                                'HDD',
                                style: TextStyle(fontSize: 14),
                              ),
                            ),
                          ),
                          DataColumn(
                            label: SizedBox(
                              width: 80,
                              child: Text(
                                'SDD',
                                style: TextStyle(fontSize: 14),
                              ),
                            ),
                          ),
                          DataColumn(
                            label: SizedBox(
                              width: 80,
                              child: Text('TS', style: TextStyle(fontSize: 14)),
                            ),
                          ),
                          DataColumn(
                            label: SizedBox(
                              width: 120,
                              child: Text(
                                'Ngày giao hàng',
                                style: TextStyle(fontSize: 14),
                              ),
                            ),
                          ),
                          DataColumn(
                            label: SizedBox(
                              width: 120,
                              child: Text(
                                'Thời gian sử dụng',
                                style: TextStyle(fontSize: 14),
                              ),
                            ),
                          ),
                          DataColumn(
                            label: SizedBox(
                              width: 100,
                              child: Text(
                                'Loại mạng',
                                style: TextStyle(fontSize: 14),
                              ),
                            ),
                          ),
                          DataColumn(
                            label: SizedBox(
                              width: 100,
                              child: Text(
                                'Tình trạng',
                                style: TextStyle(fontSize: 14),
                              ),
                            ),
                          ),
                          DataColumn(
                            label: SizedBox(
                              width: 120,
                              child: Text(
                                'Người sử dụng',
                                style: TextStyle(fontSize: 14),
                              ),
                            ),
                          ),
                          DataColumn(
                            label: SizedBox(
                              width: 100,
                              child: Text(
                                'Địa điểm',
                                style: TextStyle(fontSize: 14),
                              ),
                            ),
                          ),
                          DataColumn(
                            label: SizedBox(
                              width: 100,
                              child: Text(
                                'Nhà máy',
                                style: TextStyle(fontSize: 14),
                              ),
                            ),
                          ),
                          DataColumn(
                            label: SizedBox(
                              width: 100,
                              child: Text(
                                'Nơi sử dụng',
                                style: TextStyle(fontSize: 14),
                              ),
                            ),
                          ),
                          DataColumn(
                            label: SizedBox(
                              width: 120,
                              child: Text(
                                'Chuyền sản xuất',
                                style: TextStyle(fontSize: 14),
                              ),
                            ),
                          ),
                          DataColumn(
                            label: SizedBox(
                              width: 100,
                              child: Text(
                                'Công đoạn',
                                style: TextStyle(fontSize: 14),
                              ),
                            ),
                          ),
                          DataColumn(
                            label: SizedBox(
                              width: 100,
                              child: Text(
                                'Địa chỉ IP',
                                style: TextStyle(fontSize: 14),
                              ),
                            ),
                          ),
                          DataColumn(
                            label: SizedBox(
                              width: 80,
                              child: Text(
                                'CPU',
                                style: TextStyle(fontSize: 14),
                              ),
                            ),
                          ),
                          DataColumn(
                            label: SizedBox(
                              width: 80,
                              child: Text(
                                'RAM',
                                style: TextStyle(fontSize: 14),
                              ),
                            ),
                          ),
                          DataColumn(
                            label: SizedBox(
                              width: 80,
                              child: Text(
                                'HDD',
                                style: TextStyle(fontSize: 14),
                              ),
                            ),
                          ),
                          DataColumn(
                            label: SizedBox(
                              width: 80,
                              child: Text(
                                'POWER',
                                style: TextStyle(fontSize: 14),
                              ),
                            ),
                          ),
                          DataColumn(
                            label: SizedBox(
                              width: 100,
                              child: Text(
                                'TG hoạt động',
                                style: TextStyle(fontSize: 14),
                              ),
                            ),
                          ),
                        ],
                        rows: List<DataRow>.generate(
                          20,
                          (index) => DataRow(
                            cells: [
                              DataCell(
                                Center(child: Text((index + 1).toString())),
                              ),
                              DataCell(
                                Row(
                                  children: [
                                    // Edit button
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.blue[50],
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: IconButton(
                                        icon: Icon(
                                          Icons.edit,
                                          color: Colors.blue[700],
                                          size: 20,
                                        ),
                                        tooltip: 'Chỉnh sửa',
                                        onPressed: () {},
                                      ),
                                    ),
                                    SizedBox(width: 8),
                                    // Delete button
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.red[50],
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: IconButton(
                                        icon: Icon(
                                          Icons.delete,
                                          color: Colors.red[700],
                                          size: 20,
                                        ),
                                        tooltip: 'Xóa',
                                        onPressed: () {},
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              DataCell(Text('Máy tính ${index + 1}')),
                              DataCell(
                                Text(
                                  'SN${(index + 1).toString().padLeft(4, '0')}',
                                ),
                              ),
                              DataCell(Text('Người dùng ${index + 1}')),
                              DataCell(Text('${8 + index}GB')),
                              DataCell(Text('${500 + index * 100}GB')),
                              DataCell(Text('${256 + index * 128}GB')),
                              DataCell(Text('TS${index + 1}')),
                              DataCell(
                                Text(
                                  '${DateTime.now().subtract(Duration(days: index * 30)).toString().substring(0, 10)}',
                                ),
                              ),
                              DataCell(Text('${index + 1} tháng')),
                              DataCell(
                                Text(['LAN', 'WiFi', 'Cả hai'][index % 3]),
                              ),
                              DataCell(
                                Text(['Tốt', 'Bảo trì', 'Hỏng'][index % 3]),
                              ),
                              DataCell(Text('Người ${index + 1}')),
                              DataCell(
                                Text(['Hà Nội', 'HCM', 'Đà Nẵng'][index % 3]),
                              ),
                              DataCell(Text('Nhà máy ${index % 5 + 1}')),
                              DataCell(
                                Text(['Văn phòng', 'Xưởng', 'Kho'][index % 3]),
                              ),
                              DataCell(Text('Chuyền ${index % 10 + 1}')),
                              DataCell(Text('Công đoạn ${index % 8 + 1}')),
                              DataCell(Text('192.168.1.${index + 1}')),
                              DataCell(Text('i${5 + index % 3}')),
                              DataCell(Text('${8 + index % 4}GB')),
                              DataCell(Text('${500 + index % 3 * 500}GB')),
                              DataCell(Text('${450 + index % 2 * 50}W')),
                              DataCell(Text('${8 + index % 4}h')),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                // Pagination
                Container(
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 8,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Hiển thị 1-20 của 100 kết quả',
                        style: TextStyle(color: Colors.grey[600], fontSize: 14),
                      ),
                      Row(
                        children: [
                          // Items per page dropdown
                          Row(
                            children: [
                              Text(
                                'Số hàng mỗi trang:',
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(width: 8),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey[300]!),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                padding: EdgeInsets.symmetric(horizontal: 8),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<int>(
                                    value: 20,
                                    items: [10, 20, 50, 100]
                                        .map(
                                          (value) => DropdownMenuItem<int>(
                                            value: value,
                                            child: Text(value.toString()),
                                          ),
                                        )
                                        .toList(),
                                    onChanged: (value) {
                                      // Handle items per page change
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 16),
                          // Pagination buttons
                          Row(
                            children: [
                              IconButton(
                                icon: Icon(Icons.arrow_back_ios, size: 16),
                                onPressed: () {},
                                color: Colors.blue[700],
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 6,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.blue[700],
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Text(
                                  '1',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              SizedBox(width: 4),
                              TextButton(onPressed: () {}, child: Text('2')),
                              SizedBox(width: 4),
                              TextButton(onPressed: () {}, child: Text('3')),
                              SizedBox(width: 4),
                              Text('...'),
                              SizedBox(width: 4),
                              TextButton(onPressed: () {}, child: Text('5')),
                              IconButton(
                                icon: Icon(Icons.arrow_forward_ios, size: 16),
                                onPressed: () {},
                                color: Colors.blue[700],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
