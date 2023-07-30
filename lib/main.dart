import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Launch Pad",
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              "Launch Pad",
              style: GoogleFonts.orbitron(),
            ),
            backgroundColor: Colors.black,
          ),
          body: Center(
            child: Wrap(
              spacing: 5,
              runSpacing: 5,
              children: [
                Pad(Color(0xffadcbfc), Color(0xff067ccb), "a1.mp3"),
                Pad(Color(0xffff2525), Color(0xffc40050), "2.mp3"),
                Pad(Color(0xffadcbfc), Color(0xff067ccb), "3.mp3"),
                Pad(Color(0xffe247fc), Color(0xffa23ab7), "4.mp3"),
                Pad(Color(0xffadcbfc), Color(0xff067ccb), "5.mp3"),
                Pad(Color(0xffff2525), Color(0xffc40050), "6.mp3"),
                Pad(Color(0xffadcbfc), Color(0xff067ccb), "7.mp3"),
                Pad(Color(0xffe247fc), Color(0xffa23ab7), "8.mp3"),
                Pad(Color(0xffadcbfc), Color(0xff067ccb), "9.mp3"),
                Pad(Color(0xffff2525), Color(0xffc40050), "10.mp3"),
                Pad(Color(0xffadcbfc), Color(0xff067ccb), "11.mp3"),
                Pad(Color(0xffe247fc), Color(0xffa23ab7), "12.mp3"),
                Pad(Color(0xffadcbfc), Color(0xff067ccb), "13.mp3"),
                Pad(Color(0xffff2525), Color(0xffc40050), "14.mp3"),
                Pad(Color(0xffadcbfc), Color(0xff067ccb), "15.mp3"),
                Pad(Color(0xffe247fc), Color(0xffa23ab7), "16.mp3"),
                Pad(Color(0xffadcbfc), Color(0xff067ccb), "17.mp3"),
                Pad(Color(0xffff2525), Color(0xffc40050), "18.mp3"),
                Pad(Color(0xffadcbfc), Color(0xff067ccb), "19.mp3"),
                Pad(Color(0xffe247fc), Color(0xffa23ab7), "20.wav"),
                Pad(Color(0xffadcbfc), Color(0xff067ccb), "21.mp3"),
                Pad(Color(0xffff2525), Color(0xffc40050), "22.wav"),
                Pad(Color(0xffadcbfc), Color(0xff067ccb), "23.wav"),
                Pad(Color(0xffe247fc), Color(0xffa23ab7), "24.wav"),
                Pad(Color(0xffadcbfc), Color(0xff067ccb), "25.wav"),
                Pad(Color(0xffff2525), Color(0xffc40050), "26.wav"),
                Pad(Color(0xffadcbfc), Color(0xff067ccb), "27.wav"),
                Pad(Color(0xffe247fc), Color(0xffa23ab7), "28.wav"),
              ],
            ),
          ),
          backgroundColor: Colors.black,
        ),
      ),
    );
  }
}

class Pad extends StatefulWidget {
  final colorCenter;
  final colorOutline;
  final note;

  const Pad(this.colorCenter, this.colorOutline, this.note, {super.key});

  @override
  State<Pad> createState() => _PadState();
}

class _PadState extends State<Pad> {
  late Color _colorCenter;
  late Color _colorOutline;
  final player = AudioPlayer();

  @override
  void initState() {
    // TODO: implement initState
    _colorCenter = widget.colorCenter;
    _colorOutline = widget.colorOutline;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () async {
        setState(() {
          _colorCenter = Colors.white;
          _colorOutline = Colors.white;
          player.play(
            // widget.note
            // AssetSource(widget.note),
            AssetSource(widget.note),
          );
        });
        await Future.delayed(
          Duration(milliseconds: 500),
        );
        setState(() {
          _colorCenter = widget.colorCenter;
          _colorOutline = widget.colorOutline;
        });
      },
      child: Container(
        height: screenHeight / 8.3,
        width: screenWidth / 4.3,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(8.0),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.pink,
              blurRadius: 5.0,
            ),
          ],
          gradient: RadialGradient(
            colors: [_colorCenter, _colorOutline],
            radius: 0.5,
          ),
        ),
      ),
    );
  }
}
