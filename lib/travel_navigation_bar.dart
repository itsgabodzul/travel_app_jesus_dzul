import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class TravelNavigationBar extends StatelessWidget {
  const TravelNavigationBar({
    Key? key, 
    required this.items,
    required this.onTap,
    this.currentIndex = 0, // Índice actual de la barra de navegación
  }) : assert(items.length == 2, ''), // Asegura que solo haya 2 ítems
  super(key: key);

  final List<TravelNavigationBarItem> items;
  final ValueChanged<int> onTap;
  final int currentIndex;

  @override
  Widget build(BuildContext context) { //Esta parte inserta el "lienzo" para poder usar las coordenadas en la barra de navegacion
    return CustomPaint(
      painter: _NavPainter(), //Usa el canvas
      child: SizedBox(
          height: kToolbarHeight, // Establece la altura de la barra de navegación
          child: Row(
            children: List.generate(
              items.length,
              (index) => Expanded(
                child: Icon(
                  currentIndex == index
                  ? items[index].selectedIcon // Si el índice actual es igual al índice del ítem, se usa el ícono seleccionado
                  : items[index].icon,
                color: currentIndex == index
                ? Theme.of(context).primaryColor // Si el ítem está seleccionado, cambia el color
                : null, // Si no está seleccionado, el color será el predeterminado
                ),
              )
            ) ..insert(1, const Spacer())// Inserta un espacio en la mitad de los íconos
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

class _NavPainter  extends CustomPainter { //Crea un canvas para dibujar un recorte
  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width; // Ancho total
    final h = size.height; // Alto total
    final h5 = h * 0.5; //El 50% del alto
    final w5 = w * 0.5; // El 50% del ancho
    final h6 = h * 0.6; // El 60% del alto

    final path = Path()
    ..lineTo(w5 - 80, 0) // Dibuja una línea al punto
    ..cubicTo((w5-40), 0, (w5-50), h5, w5, h6) // Dibuja una curva cúbica
    ..lineTo(w5, h) // Dibuja una línea vertical hacia abajo
    ..lineTo(w, h)
    ..lineTo(w, 0) // Dibuja una línea hacia el borde superior
    ..lineTo(w5+80, 0)
    ..cubicTo((w5+40), 0, (w5+50), h5, w5+3, h6)
    ..lineTo(w5, h6)
    ..lineTo(w5, h) // Línea hacia abajo
    ..lineTo(0, h);

    canvas.drawShadow(path, Colors.black26, 10, false);
    canvas.drawPath(path, Paint()..color = Colors.green); // Pinta de color verde
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}