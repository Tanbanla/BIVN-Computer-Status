import 'package:bivn_computer_status/Common/CommonColor.dart';
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
    //_currentBody = //FillTwoScreen();
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
      body: _currentBody,
      drawer: ComplexDrawer(changeBody: _changeBody, context: context),
      drawerScrimColor: Colors.transparent,
      backgroundColor: Colors.white,
    );
  }

  AppBar appBar() {
    return AppBar(
      iconTheme: IconTheme.of(context).copyWith(color: Colors.white),
      title: Text(
        'HỆ THỐNG QUẢN LÝ TÌNH TRẠNG MÁY TÍNH BIVN',
        //"LABOR CONTRACT EVALUATION",
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Common.blue, //.withOpacity(0.6),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 20),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Button tiếng Anh
              IconButton(
                icon: Image.asset(
                  'assets/img/jp.png',
                  height: 24, // Giảm kích thước cho phù hợp AppBar
                  width: 40,
                  fit: BoxFit.cover,
                ),
                onPressed: () {
                },
              ),
              // Button tiếng Việt
              IconButton(
                icon: Image.asset(
                  'assets/img/vn.jpg',
                  height: 24, // Giảm kích thước cho phù hợp AppBar
                  width: 40,
                  fit: BoxFit.cover,
                ),
                onPressed: () {
                
                },
              ),
            ],
          ),
        ),
      ],
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
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}