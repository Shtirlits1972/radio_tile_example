import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:radio_tile_example/block.dart';
import 'package:radio_tile_example/constants.dart';

class RadioPage extends StatefulWidget {
  const RadioPage({Key? key}) : super(key: key);

  @override
  _RadioPageState createState() => _RadioPageState();
}

class _RadioPageState extends State<RadioPage> {
  late String selectValue;
  @override
  Widget build(BuildContext context) {
    List<String> listString = ['unknown', 'male', 'female'];

    return Scaffold(
      appBar: AppBar(
        title: Text('Radio Page'),
        centerTitle: true,
      ),
      body: BlocBuilder<DataCubit, Keeper>(
        builder: (context, state) {
          return Center(
            child: Column(
              children: [
                Expanded(
                  child: ListView.separated(
                      separatorBuilder: (context, index) => const Divider(
                            color: Colors.black,
                            thickness: 1,
                          ),
                      itemCount: listString.length,
                      itemBuilder: (context, index) {
                        return RadioListTile(
                          title: Text(
                            listString[index],
                            style: styleBlack20,
                          ),
                          value: listString[index],
                          groupValue: selectValue,
                          onChanged: (value) {
                            print(value);

                            setState(() {
                              selectValue = value!;
                            });
                          },
                        );
                      }),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 150,
                      child: ElevatedButton(
                        onPressed: () {
                          print('OK');

                          context
                              .read<DataCubit>()
                              .setSelectedValue(selectValue);

                          Navigator.pushNamed(
                            context,
                            '/',
                          );
                        },
                        child: Text(
                          'OK',
                          style: styleBlack30,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 50,
                    ),
                    SizedBox(
                      width: 150,
                      child: ElevatedButton(
                        onPressed: () {
                          print('Cancel');
                          // context
                          //     .read<DataCubit>()
                          //     .setSelectedValue(selectValue);
                          Navigator.pushNamed(
                            context,
                            '/',
                          );
                        },
                        child: Text(
                          'Cancel',
                          style: styleBlack30,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    selectValue = context.read<DataCubit>().getselectedvalue;
  }
}
