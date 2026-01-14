import 'package:flutter/material.dart';
import 'package:xo/Features/home/presentation/views/widgets/grid_design.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.of(context).size.height * .2),
        const GridDesign(),
      ],
    );
  }
}
