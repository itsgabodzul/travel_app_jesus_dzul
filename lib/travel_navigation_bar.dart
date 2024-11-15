import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class TravelNavigationBar extends StatelessWidget {
  const TravelNavigationBar({
    Key? key, 
    required this.items,
    required this.onTap,
    this.currentIndex = 0,
  }) : assert(items.length == 2, ''),
  super(key: key);

  final List<TravelNavigationBarItem> items;
  final ValueChanged<int> onTap;
  final int currentIndex;

  @override
  Widget build(BuildContext context) { //Esta parte inserta el "lienzo" para poder usar las coordenadas en la barra de navegacion
    return CustomPaint(
      painter: _NavPainter(),
      child: SizedBox(
          height: kToolbarHeight,
          child: Row(
            children: List.generate(
              items.length,
              (index) => Expanded(
                child: Icon(
                  currentIndex == index
                  ? items[index].selectedIcon
                  : items[index].icon,
                color: currentIndex == index
                ? Theme.of(context).primaryColor
                : null,
                ),
              )
            ) ..insert(1, const Spacer())
          ),
        ),
    );
  }
}

class TravelNavigationBarItem{ //Esta es la clase para poder insertar los iconos
  TravelNavigationBarItem({
    required this.icon,
    required this.selectedIcon,
  });

  final IconData icon;
  final IconData selectedIcon;
}

class _NavPainter  extends CustomPainter { //Se lo explico sencillo y como lo entendi, esta parte usa coordendas para recortar y darle esa forma de recorte que tiene
  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;
    final h5 = h * 0.5;
    final w5 = w * 0.5;
    final h6 = h * 0.6;

    final path = Path()
    ..lineTo(w5 - 80, 0)
    ..cubicTo((w5-40), 0, (w5-50), h5, w5, h6)
    ..lineTo(w5, h)
    ..lineTo(w, h)
    ..lineTo(w, 0)
    ..lineTo(w5+80, 0)
    ..cubicTo((w5+40), 0, (w5+50), h5, w5+3, h6)
    ..lineTo(w5, h6)
    ..lineTo(w5, h)
    ..lineTo(0, h);

    canvas.drawShadow(path, Colors.black26, 10, false);
    canvas.drawPath(path, Paint()..color = Colors.green);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}