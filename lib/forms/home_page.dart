import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:radio_tile_example/block.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home page'),
        centerTitle: true,
      ),
      body: BlocBuilder<DataCubit, Keeper>(
        builder: (context, state) {
          return Center(
            child: ElevatedButton(
              style: TextButton.styleFrom(foregroundColor: Colors.white),
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/RadioPage',
                );
              },
              child: Text(
                context.read<DataCubit>().getselectedvalue,
                style: const TextStyle(fontSize: 30),
              ),
            ),
          );
        },
      ),
    );
  }
}
