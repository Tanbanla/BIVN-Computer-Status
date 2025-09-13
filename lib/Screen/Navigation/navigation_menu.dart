import 'package:bivn_computer_status/Common/CommonColor.dart';
import 'package:bivn_computer_status/Screen/Home/InforSystem.dart';
import 'package:bivn_computer_status/Screen/Home/UserManager.dart';
import 'package:bivn_computer_status/Screen/InforComputer/SetupManager.dart';
import 'package:bivn_computer_status/Screen/Inventory/InventoryPC.dart';
import 'package:bivn_computer_status/Screen/Inventory/MaintenancePC.dart';
import 'package:bivn_computer_status/Screen/login/loginView.dart';
import 'package:bivn_computer_status/ScreenRong.dart';
import 'package:bivn_computer_status/class/menuItem.dart';
import 'package:flutter/material.dart';

class NavigationMenu extends StatefulWidget {
  const NavigationMenu({super.key});

  @override
  State<NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  late Widget _currentBody;
  @override
  void initState() {
    super.initState();
    // Màn hình mặc định ban đầu
  _currentBody = Inforsystem();
  }

  void _changeLanguage(String code) {
    // TODO: Integrate with localization logic.
    setState(() {});
  }

  void _changeBody(Widget newBody) {
    if (!mounted) return; // Kiểm tra mounted trước khi setState

    setState(() {
      _currentBody = newBody;
      Navigator.of(context).pop(); // Đóng drawer nếu đang mở
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      // Hiển thị màn hình hiện tại do drawer lựa chọn
      body: _currentBody,
      drawer: ComplexDrawer(changeBody: _changeBody, context: context),
      drawerScrimColor: Colors.transparent,
      backgroundColor: Colors.white,
    );
  }

  AppBar appBar() {
    return AppBar(
      iconTheme: IconTheme.of(context).copyWith(color: Colors.white),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'HỆ THỐNG QUẢN LÝ TÌNH TRẠNG MÁY TÍNH BIVN',
            style: TextStyle(color: Colors.white),
          ),
          Text(
            'BIVN Computer Status Management System',
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
        ],
      ),
      backgroundColor: Common.blue,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.account_circle, size: 32, color: Colors.white),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Welcome, Nguyễn Văn A',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'Language:',
                        style: TextStyle(color: Colors.white, fontSize: 11),
                      ),
                      const SizedBox(width: 4),
                      _LangButton(
                        assetPath: 'assets/img/jp.png',
                        tooltip: '日本語',
                        onTap: () => _changeLanguage('ja'),
                      ),
                      const SizedBox(width: 4),
                      _LangButton(
                        assetPath: 'assets/img/vn.jpg',
                        tooltip: 'Tiếng Việt',
                        onTap: () => _changeLanguage('vi'),
                      ),
                      const SizedBox(width: 4),
                      _LangButton(
                        assetPath: 'assets/img/en.png',
                        tooltip: 'English',
                        onTap: () => _changeLanguage('vi'),
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
  }
}

// Button language custom
class _LangButton extends StatelessWidget {
  final String assetPath;
  final VoidCallback onTap;
  final String? tooltip;
  const _LangButton({
    required this.assetPath,
    required this.onTap,
    this.tooltip,
  });
  @override
  Widget build(BuildContext context) {
    final image = ClipRRect(
      borderRadius: BorderRadius.circular(3),
      child: Image.asset(assetPath, height: 20, width: 28, fit: BoxFit.cover),
    );
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(4),
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: tooltip != null
              ? Tooltip(message: tooltip!, child: image)
              : image,
        ),
      ),
    );
  }
}

class ComplexDrawer extends StatefulWidget {
  final Function(Widget) changeBody; // Callback để thay đổi giao diện
  final BuildContext context;

  const ComplexDrawer({
    Key? key,
    required this.changeBody,
    required this.context,
  }) : super(key: key);
  @override
  State<ComplexDrawer> createState() => _ComplexDrawerState();
}

class _ComplexDrawerState extends State<ComplexDrawer> {
  int selectedIndex = -1; //dont set it to 0
  bool isExpanded = false;
  List<Menuitem> get allCdms {
    return [
      Menuitem(Icons.home, 'Trang chủ', [
        Item(Icons.account_tree, 'Thông tin quản lý hệ thống', Inforsystem()),
        Item(Icons.account_circle_rounded, 'Quản lý người sử dụng', Usermanager()),
      ]),
      Menuitem(Icons.home, 'Quản lý thông tin máy tính', [
        Item(Icons.settings, 'Cài đặt thông tin quản lý', SetupManager()),
        Item(Icons.apps, 'Phần mềm & ứng dụng',MyWidget()),
        Item(Icons.map, 'MAP PC', MyWidget()),
        Item(Icons.access_time, 'Thời gian sử dụng máy tính', MyWidget()),
        Item(Icons.help_outline, 'Hướng dẫn sử dụng hệ thống', MyWidget()),
      ]),
      Menuitem(Icons.home, 'Kiểm kê & bảo dưỡng', [
        Item(Icons.adobe_sharp, 'KH bảo dưỡng PC', MaintenancePC()),
        Item(Icons.checklist_rtl_sharp, 'KH kiểm kê PC', InventoryPC()),
        Item(Icons.history_edu_outlined, 'Lý lịch', MyWidget()),
      ]),
      Menuitem(Icons.home, 'Bật, tắt máy tính', [
        Item(Icons.settings_applications, 'RD-EE cài đặt', MyWidget()),
        Item(Icons.settings_applications, 'PROD cài đặt', MyWidget()),
        Item(Icons.history_edu_outlined, 'Dữ liệu', MyWidget()),
      ]),
      Menuitem(Icons.home, 'Cảnh báo', [
        Item(Icons.error_outline_rounded, 'Danh sách cảnh báo', MyWidget()),
        Item(
          Icons.stop_screen_share_outlined,
          'Top thiết bị cảnh báo',
          LoginScreen(),
        ),
      ]),
      Menuitem(Icons.home, 'Dashboar', [
        Item(Icons.add_chart_outlined, 'Tổng thể', MyWidget()),
        Item(Icons.pie_chart_sharp, 'Chi tiết', MyWidget()),
      ]),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(child: row());
  }

  Widget row() {
    return Row(children: [blackIconTiles()]);
  }

  Widget blackIconTiles() {
    return Container(
      width: 300,
      color: Colors.white,
      child: Column(
        children: [
          controlTile(),
          Expanded(
            child: ListView.builder(
              itemCount: allCdms.length,
              itemBuilder: (BuildContext context, int index) {
                Menuitem cdm = allCdms[index];
                bool selected = selectedIndex == index;
                return ExpansionTile(
                  onExpansionChanged: (z) {
                    setState(() {
                      selectedIndex = z ? index : -1;
                    });
                  },
                  //leading: Icon(cdm.icon, color: Colors.black),
                  title: Text(cdm.title, style: TextStyle(color: Colors.black)),
                  trailing: cdm.submenus.isEmpty
                      ? null
                      : Icon(
                          selected
                              ? Icons.keyboard_arrow_up
                              : Icons.keyboard_arrow_down,
                          color: Colors.black,
                        ),
                  children: cdm.submenus.map((subMenu) {
                    return sMenuButton(subMenu, false, cdm.title);
                  }).toList(),
                );
              },
            ),
          ),
          accountTile(),
        ],
      ),
    );
  }

  Widget controlTile() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(topRight: Radius.circular(8)),
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 20, bottom: 30),
        child: ListTile(
          leading: Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Common.blue1.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.computer, size: 40, color: Common.blue1),
          ),
          title: Text(
            'Danh mục chung',
            style: TextStyle(
              color: Common.blue,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          onTap: expandOrShrinkDrawer,
        ),
      ),
    );
  }

  Widget sMenuButton(Item subMenu, bool isTitle, String title) {
    return _SubMenuButton(
      subMenu: subMenu,
      isTitle: isTitle,
      onTap: () => widget.changeBody(subMenu.screen),
    );
  }

  Widget accountTile() {
    return Container(
      color: Common.blue1,
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.logout, color: Colors.white),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
            child: Text('Đăng xuất', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  void expandOrShrinkDrawer() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }
}

// danh sách lựa chọn
class _SubMenuButton extends StatefulWidget {
  final Item subMenu;
  final bool isTitle;
  final VoidCallback onTap;
  const _SubMenuButton({
    required this.subMenu,
    required this.isTitle,
    required this.onTap,
  });

  @override
  State<_SubMenuButton> createState() => _SubMenuButtonState();
}

class _SubMenuButtonState extends State<_SubMenuButton> {
  bool _hovered = false;
  bool _pressed = false;

  Color get _baseColor => widget.isTitle ? Colors.black87 : Colors.black54;
  Color get _iconColor => widget.isTitle ? Colors.black87 : Colors.black45;
  Color get _textColor {
    if (_pressed) return Common.blue;
    if (_hovered) return Common.blue1;
    return _baseColor;
  }

  Color? get _bgColor {
    if (_pressed) return Common.blue1.withOpacity(0.15);
    if (_hovered) return Common.blue1.withOpacity(0.08);
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() {
        _hovered = false;
        _pressed = false;
      }),
      child: GestureDetector(
        onTapDown: (_) => setState(() => _pressed = true),
        onTapCancel: () => setState(() => _pressed = false),
        onTapUp: (_) => setState(() => _pressed = false),
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 140),
          curve: Curves.easeOut,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            color: _bgColor,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Row(
            children: [
              Icon(
                widget.subMenu.icon,
                size: widget.isTitle ? 20 : 18,
                color: _iconColor,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  widget.subMenu.title,
                  style: TextStyle(
                    fontSize: widget.isTitle ? 16 : 14,
                    color: _textColor,
                    fontWeight: widget.isTitle
                        ? FontWeight.w600
                        : FontWeight.w500,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
