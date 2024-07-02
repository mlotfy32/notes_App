import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notesapp/Add%20Note_Cubit/add_note_cubit.dart';

class ColorList extends StatefulWidget {
  const ColorList({super.key});

  @override
  State<ColorList> createState() => _ColorListState();
}

class _ColorListState extends State<ColorList> {
  int currentIndex = 0;
  List<Color> color = [
    Color(0xff00291a),
    Color(0xff007e45),
    Color(0xff2f5236),
    Color(0xff485e2d),
    Color(0xff3d212a),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 76,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: GestureDetector(
              onTap: () {
                currentIndex = index;
                BlocProvider.of<AddNoteCubit>(context).color = color[index];
                setState(() {});
              },
              child: Circle(
                isActive: currentIndex == index,
                color: color[index],
              ),
            )),
        itemCount: color.length,
      ),
    );
  }
}

class Circle extends StatelessWidget {
  Circle({super.key, required this.isActive, required this.color});
  final Color color;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return isActive == true
        ? CircleAvatar(
            radius: 38,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 35,
              backgroundColor: color,
            ),
          )
        : CircleAvatar(
            radius: 35,
            backgroundColor: color,
          );
  }
}
