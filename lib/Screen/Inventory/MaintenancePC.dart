import 'package:bivn_computer_status/Widget/SectionCard.dart';
import 'package:bivn_computer_status/Widget/TableInforError.dart';
import 'package:flutter/material.dart';

class MaintenancePC extends StatefulWidget {
  const MaintenancePC({super.key});

  @override
  State<MaintenancePC> createState() => _MaintenancePCState();
}

class _MaintenancePCState extends State<MaintenancePC> {
  // Filter state
  String? _selectedFactory = 'F1';
  String? _selectedLine = 'Line 1';
  int _selectedMonth = DateTime.now().month;
  int _selectedYear = DateTime.now().year;

  final List<String> _factories = ['F1', 'F2', 'F3'];
  final List<String> _lines = ['Line 1', 'Line 2', 'Line 3', 'Line 4'];

  Future<void> _pickMonthYear() async {
    // Simple placeholder dialog for month/year selection
    int tempMonth = _selectedMonth;
    int tempYear = _selectedYear;
    await showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Chọn Tháng / Năm',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: DropdownButtonFormField<int>(
                        value: tempMonth,
                        decoration: _fieldDecoration('Tháng'),
                        items: [
                          for (int m = 1; m <= 12; m++)
                            DropdownMenuItem(
                              value: m,
                              child: Text('Tháng ' + m.toString()),
                            ),
                        ],
                        onChanged: (v) => tempMonth = v ?? tempMonth,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: DropdownButtonFormField<int>(
                        value: tempYear,
                        decoration: _fieldDecoration('Năm'),
                        items: [
                          for (
                            int y = _selectedYear - 5;
                            y <= _selectedYear + 2;
                            y++
                          )
                            DropdownMenuItem(
                              value: y,
                              child: Text(y.toString()),
                            ),
                        ],
                        onChanged: (v) => tempYear = v ?? tempYear,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Hủy'),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _selectedMonth = tempMonth;
                          _selectedYear = tempYear;
                        });
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue[700],
                        foregroundColor: Colors.white,
                      ),
                      child: const Text('Chọn'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _onSearch() {
    // TODO: implement search logic
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Đang lọc dữ liệu...')));
  }

  void _onPlanInventory() {
    // TODO: implement plan creation logic
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Lập kế hoạch kiểm kê...')));
  }

  void _onDownloadFile() {
    // TODO: implement download logic
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Đang tải file...')));
  }

  void _onUploadFile() {
    // TODO: implement upload logic
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Upload file...')));
  }

  InputDecoration _fieldDecoration(String label) {
    return InputDecoration(
      labelText: label,
      isDense: true,
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.blue, width: 1.2),
      ),
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
              _searchPanel(),
              const SizedBox(height: 20),
              _usageCard(),
              const SizedBox(height: 20),
              _buildDataTable(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _searchPanel() {
    final isWide = MediaQuery.of(context).size.width > 900;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black12.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Icon(Icons.search, color: Colors.blue, size: 22),
              SizedBox(width: 8),
              Text(
                'Bộ lọc tìm kiếm',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            children: [
              SizedBox(
                width: isWide ? 220 : double.infinity,
                child: DropdownButtonFormField<String>(
                  value: _selectedFactory,
                  decoration: _fieldDecoration('Nhà máy'),
                  items: _factories
                      .map((f) => DropdownMenuItem(value: f, child: Text(f)))
                      .toList(),
                  onChanged: (v) => setState(() => _selectedFactory = v),
                ),
              ),
              SizedBox(
                width: isWide ? 220 : double.infinity,
                child: DropdownButtonFormField<String>(
                  value: _selectedLine,
                  decoration: _fieldDecoration('Chuyền sản xuất'),
                  items: _lines
                      .map((l) => DropdownMenuItem(value: l, child: Text(l)))
                      .toList(),
                  onChanged: (v) => setState(() => _selectedLine = v),
                ),
              ),
              SizedBox(
                width: isWide ? 220 : double.infinity,
                child: InkWell(
                  onTap: _pickMonthYear,
                  borderRadius: BorderRadius.circular(10),
                  child: InputDecorator(
                    decoration: _fieldDecoration(
                      'Tháng/Năm',
                    ).copyWith(labelText: 'Tháng / Năm'),
                    child: Text(
                      _selectedMonth.toString().padLeft(2, '0') +
                          '/' +
                          _selectedYear.toString(),
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: isWide ? 160 : double.infinity,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[700],
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      vertical: 14,
                      horizontal: 16,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: _onSearch,
                  icon: const Icon(Icons.filter_alt),
                  label: const Text('Lọc dữ liệu'),
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange[700],
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 18,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: _onPlanInventory,
                icon: const Icon(Icons.playlist_add_check_circle_outlined),
                label: const Text('Lập KH kiểm kê'),
              ),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[600],
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 18,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: _onDownloadFile,
                icon: const Icon(Icons.file_download_outlined),
                label: const Text('Tải file'),
              ),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple[600],
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 18,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: _onUploadFile,
                icon: const Icon(Icons.file_upload_outlined),
                label: const Text('Upload file'),
              ),
            ],
          ),
        ],
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
            color: Colors.deepOrange.withOpacity(0.2),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(Icons.adobe_sharp, color: Colors.deepOrange, size: 30),
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'KH bảo dưỡng PC',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4),
            Text(
              'Trang kích hoạt bảo dưỡng PC',
              style: TextStyle(fontSize: 13, color: Colors.black54),
            ),
          ],
        ),
      ],
    );
  }

  // CARD: Info summary
  Widget _usageCard() {
    final usageData = const [
      ['Nhà máy', 'F2'],
      ['Tổng số PC', '1000'],
      ['Số lượng đã bảo dưỡng', '250'],
      ['Số lượng chưa bảo dưỡng', '750'],
    ];
    return SectionCard(
      title: 'Tổng hợp bảo dưỡng PC',
      icon: Icons.adobe_sharp,
      accentColor: Colors.deepPurple,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (final row in usageData)
            Column(
              children: [
                InfoLineError(label: row[0], value: row[1], action: '', actionValue: ''),
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

  Widget _buildDataTable() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
                    dataRowHeight: 56,
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
                      label: Center(
                        child: Text(
                        'Nhà máy',
                        style: TextStyle(fontSize: 14),
                        ),
                      ),
                      ),
                      DataColumn(
                      label: Center(
                        child: Text(
                        'Chuyền sản xuất',
                        style: TextStyle(fontSize: 14),
                        ),
                      ),
                      ),
                      DataColumn(
                      label: Center(
                        child: Text(
                        'Vị trí sử dụng',
                        style: TextStyle(fontSize: 14),
                        ),
                      ),
                      ),
                      DataColumn(
                      label: Center(
                        child: Text(
                        'Thời gian bảo dưỡng gần nhất',
                        style: TextStyle(fontSize: 14),
                        ),
                      ),
                      ),
                      DataColumn(
                      label: Center(
                        child: Text(
                        'PC cần bảo dưỡng (O: bảo dưỡng; X: không cần)',
                        style: TextStyle(fontSize: 14),
                        ),
                      ),
                      ),
                    ],
                    rows: List<DataRow>.generate(
                      10,
                      (index) => DataRow(
                      cells: [
                        DataCell(Text(index % 2 == 0 ? 'F1' : 'F2')),
                        DataCell(Text('Line ${index % 4 + 1}')),
                        DataCell(Text('Phòng ${['RD', 'QA', 'QC', 'Sản xuất'][index % 4]}')),
                        DataCell(Text('2024-${(index % 12 + 1).toString().padLeft(2, '0')}-15')),
                        DataCell(
                        Center(
                          child: Text(
                          index % 3 == 0 ? 'O' : 'X',
                          style: TextStyle(
                            color: index % 3 == 0 ? Colors.red : Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                          ),
                        ),
                        ),
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