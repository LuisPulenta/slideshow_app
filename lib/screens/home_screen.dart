import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:slideshow_app/widgets/slideshow.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: SlideShow(
                puntosArriba: true,
                colorPrimario: Colors.green,
                colorSecundario: Colors.green.withOpacity(0.4),
                bulletPrimario: 16,
                bulletSecundario: 12,
                slides: [
                  SvgPicture.asset('assets/slide-1.svg'),
                  SvgPicture.asset('assets/slide-3.svg'),
                  SvgPicture.asset('assets/slide-4.svg'),
                  SvgPicture.asset('assets/slide-5.svg'),
                  Center(
                      child: Container(
                    width: 100,
                    height: 100,
                    color: Colors.orange,
                  )),
                  const Center(
                      child: Icon(
                    Icons.home,
                    size: 60,
                  )),
                ],
              ),
            ),
            Expanded(
              child: SlideShow(
                puntosArriba: false,
                colorPrimario: Colors.orange,
                colorSecundario: Colors.orange.withOpacity(0.4),
                bulletPrimario: 20,
                bulletSecundario: 10,
                slides: [
                  SvgPicture.asset('assets/slide-2.svg'),
                  SvgPicture.asset('assets/slide-3.svg'),
                  Center(
                      child: Container(
                    width: 100,
                    height: 100,
                    color: Colors.orange,
                  )),
                  const Center(
                      child: Icon(
                    Icons.home,
                    size: 60,
                  )),
                  SvgPicture.asset('assets/slide-5.svg'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
