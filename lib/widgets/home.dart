import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:slideshow_app/models/slider_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SliderModel(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('SlideShow'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            children: const [
              Expanded(child: _Slides()),
              _Dots(),
            ],
          ),
        ),
      ),
    );
  }
}

//------------------ _Dots -------------------

class _Dots extends StatelessWidget {
  const _Dots({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          _Dot(0),
          _Dot(1),
          _Dot(2),
        ],
      ),
    );
  }
}

//------------------ _Dot -------------------

class _Dot extends StatelessWidget {
  final int index;
  const _Dot(this.index);

  @override
  Widget build(BuildContext context) {
    final pageViewIndex = Provider.of<SliderModel>(
      context,
    ).currentPage;
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      width: 14,
      height: 14,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
          color: pageViewIndex >= index - 0.5 && pageViewIndex <= index + 0.5
              ? Colors.blue
              : Colors.grey,
          shape: BoxShape.circle),
    );
  }
}

//------------------ _Slides -------------------

class _Slides extends StatefulWidget {
  const _Slides({Key? key}) : super(key: key);

  @override
  State<_Slides> createState() => _SlidesState();
}

class _SlidesState extends State<_Slides> {
//------------------------ Variables ----------------------------------

  final pageViewController = PageController();

//------------------------ initState ----------------------------------
  @override
  void initState() {
    pageViewController.addListener(() {
      //print(pageViewController.page);
      Provider.of<SliderModel>(context, listen: false).currentPage =
          pageViewController.page!;
    });

    super.initState();
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageViewController,
      children: const [
        _Slide('assets/slide-1.svg'),
        _Slide('assets/slide-2.svg'),
        _Slide('assets/slide-3.svg'),
      ],
    );
  }
}

//------------------ _Slide -------------------
class _Slide extends StatelessWidget {
  final String svg;
  const _Slide(this.svg);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(30),
        child: SvgPicture.asset(svg));
  }
}
