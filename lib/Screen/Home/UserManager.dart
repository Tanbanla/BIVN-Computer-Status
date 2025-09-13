import 'package:bivn_computer_status/Common/CommonColor.dart';
import 'package:flutter/material.dart';

class Usermanager extends StatefulWidget {
  const Usermanager({super.key});

  @override
  State<Usermanager> createState() => _UsermanagerState();
}

class _UsermanagerState extends State<Usermanager> {
  final TextEditingController _editName = TextEditingController();
  final TextEditingController _editEmail = TextEditingController();
  final TextEditingController _editPhone = TextEditingController();
  final TextEditingController _newName = TextEditingController();
  final TextEditingController _newEmail = TextEditingController();
  final TextEditingController _newPhone = TextEditingController();

  @override
  void dispose() {
    _editName.dispose();
    _editEmail.dispose();
    _editPhone.dispose();
    _newName.dispose();
    _newEmail.dispose();
    _newPhone.dispose();
    super.dispose();
  }

  Future<void> _showEditDialog(int index) async {
    _editName.text = 'Người dùng ' + (index + 1).toString();
    _editEmail.text = 'user' + (index + 1).toString() + '@example.com';
    _editPhone.text = '0123456789';
    await showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 420),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.edit, color: Colors.blue[700]),
                      const SizedBox(width: 8),
                      const Text(
                        'Chỉnh sửa người dùng',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _LabeledField(label: 'Tên người dùng', controller: _editName),
                  _LabeledField(
                    label: 'Email',
                    controller: _editEmail,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  _LabeledField(
                    label: 'Số điện thoại',
                    controller: _editPhone,
                    keyboardType: TextInputType.phone,
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Hủy'),
                      ),
                      const SizedBox(width: 8),
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue[700],
                          foregroundColor: Colors.white,
                        ),
                        onPressed: () {
                          // TODO: save edit action
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.save, size: 18),
                        label: const Text('Lưu'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> _showAddDialog() async {
    _newName.clear();
    _newEmail.clear();
    _newPhone.clear();
    await showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 420),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.person_add_alt_1, color: Colors.green[700]),
                      const SizedBox(width: 8),
                      const Text(
                        'Thêm người dùng',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _LabeledField(label: 'Tên người dùng', controller: _newName),
                  _LabeledField(
                    label: 'Email',
                    controller: _newEmail,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  _LabeledField(
                    label: 'Số điện thoại',
                    controller: _newPhone,
                    keyboardType: TextInputType.phone,
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Đóng'),
                      ),
                      const SizedBox(width: 8),
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green[700],
                          foregroundColor: Colors.white,
                        ),
                        onPressed: () {
                          // TODO: add new user action
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.check, size: 18),
                        label: const Text('Thêm'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> _showDeleteDialog(int index) async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: Row(
            children: const [
              Icon(Icons.delete_outline, color: Colors.red),
              SizedBox(width: 8),
              Text('Xác nhận xóa'),
            ],
          ),
          content: Text(
            'Bạn có chắc muốn xóa người dùng #' + (index + 1).toString() + ' ?',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Hủy'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                // TODO: delete action
                Navigator.pop(context);
              },
              child: const Text('Xóa'),
            ),
          ],
        );
      },
    );
  }

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
            color: Common.greenColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            Icons.account_circle_rounded,
            color: Common.greenColor,
            size: 30,
          ),
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Quản lý người sử dụng',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4),
            Text(
              'Trang quản lý người sử dụng hệ thống',
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
                    hintText: 'Tìm kiếm người dùng...',
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
                onPressed: () {
                  _showAddDialog();
                },
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
                        headingRowColor: MaterialStateProperty.all(Colors.blue[50]),
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
                                child: Text('STT', style: TextStyle(fontSize: 14)),
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
                            label: Expanded(
                              child: Text(
                                'Phòng ban',
                                style: TextStyle(fontSize: 14),
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Expanded(
                              child: Text(
                                'Mã người dùng',
                                style: TextStyle(fontSize: 14),
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Expanded(
                              child: Text(
                                'Tên người dùng',
                                style: TextStyle(fontSize: 14),
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Expanded(
                              child: Text('ADID', style: TextStyle(fontSize: 14)),
                            ),
                          ),
                          DataColumn(
                            label: Expanded(
                              child: Text('Email', style: TextStyle(fontSize: 14)),
                            ),
                          ),
                          DataColumn(
                            label: Expanded(
                              child: Text('Nhóm', style: TextStyle(fontSize: 14)),
                            ),
                          ),
                          DataColumn(
                            label: Expanded(
                              child: Text('Model', style: TextStyle(fontSize: 14)),
                            ),
                          ),
                          DataColumn(
                            label: Expanded(
                              child: Text(
                                'Nhà máy',
                                style: TextStyle(fontSize: 14),
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Expanded(
                              child: Text(
                                'Phân loại',
                                style: TextStyle(fontSize: 14),
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Expanded(
                              child: Text(
                                'Số điện thoại',
                                style: TextStyle(fontSize: 14),
                              ),
                            ),
                          ),
                        ],
                        rows: List<DataRow>.generate(
                          20,
                          (index) => DataRow(
                            cells: [
                              DataCell(Center(child: Text((index + 1).toString()))),
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
                                        onPressed: () {
                                          _showEditDialog(index);
                                        },
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
                                        onPressed: () {
                                          _showDeleteDialog(index);
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              DataCell(Text('Phòng RD')),
                              DataCell(Text('Mã${index + 1}')),
                              DataCell(Text('Người dùng ${index + 1}')),
                              DataCell(Text('Trần văn ${index + 1}')),
                              DataCell(Text('user${index + 1}@example.com')),
                              DataCell(Text('Nhóm ${index % 3 + 1}')),
                              DataCell(Text('Model ${index % 5 + 1}')),
                              DataCell(Text('F123')),
                              DataCell(Text('Phân loại ${index % 4 + 1}')),
                              DataCell(Text('0123456789')),
                            ],
                          ),
                        ),
                      ),
                      
                    ),
                  ),
                ),
                SizedBox(height: 8),
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
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 14,
                          ),
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
                                    border: Border.all(
                                      color: Colors.grey[300]!,
                                    ),
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

class _LabeledField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  const _LabeledField({
    required this.label,
    required this.controller,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Colors.black54,
            ),
          ),
          const SizedBox(height: 4),
          TextField(
            controller: controller,
            keyboardType: keyboardType,
            decoration: InputDecoration(
              isDense: true,
              filled: true,
              fillColor: Colors.grey[100],
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 10,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.blue, width: 1.2),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
