import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MouseRegion2',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('MouseRegion2'),
          elevation: 0,
          foregroundColor: Colors.cyanAccent,
          backgroundColor: Colors.black,
          centerTitle: true,
        ),
        backgroundColor: Colors.greenAccent[100],
        body: const AAA(),
      ),
    );
  }
}

class AAA extends StatefulWidget {
  const AAA({Key? key}) : super(key: key);

  @override
  State<AAA> createState() => _AAAState();
}

class _AAAState extends State<AAA> {
  late Color _ttColor;
  late Color _bgColor;
  late Color _bdColor;
  final Color _activeColor = const Color.fromARGB(255, 243, 245, 247);
  final Color _inactiveColor = const Color.fromARGB(255, 255, 255, 255);
  final Color _borderColor = const Color.fromARGB(255, 220, 226, 228);
  final Color _tapPhraseColor = Color.fromARGB(255, 0, 71, 255);
  int _id = 0;
  bool _leftTap = true;
  bool _centerTap = false;
  bool _rightTap = false;

  void _onTapped(int index) {
    print('tapped');
    setState(() {
      if (index == 0) {
        print('i');
        _leftTap = true;
        _centerTap = false;
        _rightTap = false;
        _id = 0;
        _menuTapTxColor = _menuTap['normal']!['txColor']!;
        _menuTapBgColor = _menuTap['normal']!['bgColor']!;
        _menuTapBdColor = _menuTap['normal']!['bdColor']!;
      } else if (index == 1) {
        print('ii');
        _leftTap = false;
        _centerTap = true;
        _rightTap = false;
        _id = 1;
        _menuTapTxColor = _menuTap['normal']!['txColor']!;
        _menuTapBgColor = _menuTap['normal']!['bgColor']!;
        _menuTapBdColor = _menuTap['normal']!['bdColor']!;
      } else if (index == 2) {
        print('iii');
        _leftTap = false;
        _centerTap = false;
        _rightTap = true;
        _id = 2;
        _menuTapTxColor = _menuTap['normal']!['txColor']!;
        _menuTapBgColor = _menuTap['normal']!['bgColor']!;
        _menuTapBdColor = _menuTap['normal']!['bdColor']!;
      } else if (index == 3) {
        print('iv');
        _leftTap = false;
        _centerTap = false;
        _rightTap = false;
        _id = 3;
        print(_id);
      }
    });
  }

  late Color _menuTapTxColor; // text
  late Color _menuTapBgColor; // background
  late Color _menuTapBdColor; // border
  @override
  void initState() {
    super.initState();
    _menuTapTxColor = _menuTap['normal']!['txColor']!; // text
    _menuTapBgColor = _menuTap['normal']!['bgColor']!; // background
    _menuTapBdColor = _menuTap['normal']!['bgColor']!; // border
  }

  void _enterMenuTap(PointerEvent details) {
    setState(() {
      _menuTapTxColor = _menuTap['hover']!['txColor']!;
      _menuTapBgColor = _menuTap['hover']!['bgColor']!;
      _menuTapBdColor = _menuTap['hover']!['bdColor']!;
    });
  }

  void _exitMenuTap(PointerEvent details) {
    setState(() {
      if (0 <= _id && _id <= 2) {
        print('012');
        _menuTapTxColor = _menuTap['normal']!['txColor']!;
        _menuTapBgColor = _menuTap['normal']!['bgColor']!;
        _menuTapBdColor = _menuTap['normal']!['bdColor']!;
      } else if (_id == 3) {
        print('333');
        _menuTapTxColor = _menuTap['active']!['txColor']!;
        _menuTapBgColor = _menuTap['active']!['bgColor']!;
        _menuTapBdColor = _menuTap['active']!['bdColor']!;
      }
    });
  }

  final List _tapItems = [
    {'order': '01           ', 'title': '고객 추가'},
    {'order': '02           ', 'title': '새 캠페인'},
    {'order': '03           ', 'title': '알츠윈 콜'}
  ];
  final _menuTap = {
    'normal': {
      'txColor': Colors.amber,
      'bgColor': Colors.amber,
      'bdColor': Colors.amber,
    },
    'hover': {
      'txColor': Colors.red,
      'bgColor': Colors.red,
      'bdColor': Colors.red,
    },
    'active': {
      'txColor': Colors.blue,
      'bgColor': Colors.blue,
      'bdColor': Colors.blue,
    },
  };
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1700,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.amber, width: 2),
      ),
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('알츠윈 관리자 사용 순서', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500)),
          const SizedBox(height: 50),
          Container(
            width: double.infinity,
            height: 500,
            decoration: BoxDecoration(),
            child: Stack(
              children: <Widget>[
                Positioned(
                  // 배경 탭 3개
                  left: 0,
                  top: 0,
                  right: 0,
                  child: Container(
                    decoration: BoxDecoration(
                        // border: Border.all(color: Colors.red, width: 1),
                        ),
                    height: 61,
                    // color: Colors.blueGrey[100],
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: Row(
                            children: <Widget>[
                              Expanded(child: _lowerTap(id: 0)),
                              const SizedBox(width: 10),
                              Expanded(child: _lowerTap(id: 1)),
                              const SizedBox(width: 10),
                              Expanded(child: _lowerTap(id: 2)),
                            ],
                          ),
                        ),
                        const Expanded(flex: 1, child: SizedBox()),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  // 메뉴 소개
                  left: 0,
                  top: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      const Expanded(flex: 667, child: SizedBox()),
                      Expanded(
                        flex: 130,
                        child: MouseRegion(
                          cursor: SystemMouseCursors.click,
                          onEnter: _enterMenuTap,
                          onExit: _exitMenuTap,
                          child: GestureDetector(
                            onTap: () => _onTapped(3),
                            child: Container(
                              height: 40,
                              decoration: BoxDecoration(
                                color: _menuTapBgColor,
                                border: Border.all(color: _menuTapBdColor, width: 1),
                                borderRadius: const BorderRadius.all(Radius.circular(30.0)),
                              ),
                              child: Container(
                                // width: double.infinity,
                                height: 16,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  // border: Border.all(color: Colors.red, width: 1),
                                  borderRadius: const BorderRadius.all(Radius.circular(30.0)),
                                ),
                                child: FittedBox(
                                  child: Text(
                                    '메뉴 소개',
                                    style: TextStyle(color: _menuTapTxColor),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  // 선택된 탭 3개
                  left: 0,
                  top: 1,
                  right: 0,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Row(
                          children: <Widget>[
                            const SizedBox(width: 1),
                            Expanded(
                              child: _upperTap(id: 0, visible: _leftTap),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: _upperTap(id: 1, visible: _centerTap),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: _upperTap(id: 2, visible: _rightTap),
                            ),
                            const SizedBox(width: 1),
                          ],
                        ),
                      ),
                      const Expanded(flex: 1, child: SizedBox()),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _lowerTap({required int id}) {
    return Container(
      // width: 130,
      height: 61,
      padding: const EdgeInsets.only(/* left: 15, */ top: 10, right: 15, bottom: 10),
      decoration: BoxDecoration(
        color: _inactiveColor,
        // color: Colors.yellowAccent,
        border: Border.all(color: _borderColor, width: 1),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(5), // bottomLeft: Radius.circular(40.0),
          topRight: Radius.circular(5), // bottomRight: Radius.circular(40.0),
        ),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 15,
            child: SizedBox(width: 15),
          ),
          Expanded(
            flex: 115,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: 17,
                  alignment: Alignment.topLeft,
                  child: FittedBox(
                    child: Text(
                      _tapItems[id]['order'],
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 17,
                  alignment: Alignment.bottomLeft,
                  child: FittedBox(
                    child: Text(
                      _tapItems[id]['title'],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _upperTap({required int id, required bool visible}) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => _onTapped(id),
        child: Visibility(
          visible: visible,
          maintainSize: true,
          maintainAnimation: true,
          maintainState: true,
          maintainInteractivity: true,
          child: Container(
            height: 60,
            padding: const EdgeInsets.only(top: 10, right: 15, bottom: 10),
            decoration: BoxDecoration(
              color: _activeColor,
              // color: Colors.greenAccent,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(5), // bottomLeft: Radius.circular(40.0),
                topRight: Radius.circular(5), // bottomRight: Radius.circular(40.0),
              ),
            ),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 5,
                  child: Container(
                    height: 40,
                    color: _tapPhraseColor,
                  ),
                ),
                const Expanded(flex: 8, child: SizedBox()),
                Expanded(
                  flex: 115,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        height: 17,
                        alignment: Alignment.topLeft,
                        child: FittedBox(
                          child: Text(
                            _tapItems[id]['order'],
                            style: TextStyle(color: _tapPhraseColor),
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 17,
                        alignment: Alignment.bottomLeft,
                        child: FittedBox(
                          child: Text(
                            _tapItems[id]['title'],
                            style: TextStyle(color: _tapPhraseColor),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
