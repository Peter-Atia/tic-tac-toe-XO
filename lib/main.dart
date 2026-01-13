import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xo/Features/home/presentation/manager/app_cubit.dart';
import 'package:xo/Features/home/presentation/views/home_view.dart';

void main() {
  runApp(const XO());
}
class XO extends StatelessWidget {
  const XO({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>AppCubit(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home:HomeView(),
      ),
    );
  }
}
