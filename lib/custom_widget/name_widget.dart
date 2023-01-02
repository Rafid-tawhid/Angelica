import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:random_game_new_version/models/players_info_model.dart';

FittedBox ShowName(List<String>? playerInfo) {
  return FittedBox(
    child: playerInfo == null
        ? Text(
      'Hello!',
      style: GoogleFonts.bubblegumSans(
          fontSize: 20, color: Colors.pinkAccent),
    )
        : Text(
      playerInfo[7],
      style: GoogleFonts.bubblegumSans(
          fontSize: 20, color: Colors.pinkAccent),
    ),
  );
}