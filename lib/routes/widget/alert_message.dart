import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class AlertMessage extends StatelessWidget {
  final Map<String, dynamic> data;
  const AlertMessage({super.key, required this.data});

  String convertTime() {
    // Convert the Firebase timestamp object to a DateTime object.
    final DateTime dateTime = data['datetime'].toDate();
    return DateFormat('EEEE h.mm a').format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    final geopoint = data['geohash'] as GeoPoint;
    String googleUrl = 'https://www.google.com/maps/search/?api=1&query=${geopoint.latitude},${geopoint.longitude}';

    return GestureDetector(
      onTap: () async {
        await launchUrl(Uri.parse(googleUrl));
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(16),
        width: MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color.fromRGBO(179, 179, 179, 0.1),
        ),
        child: Column(
          children: [
            Image.asset("assets/images/map-img.png"),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Emergency",
                  style: GoogleFonts.inter(
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  convertTime(),
                  style: GoogleFonts.inter(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: const Color(0x807F7F7F),
                  ),
                )
              ],
            ),
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Location near ${data['location']['sub']}",
                style: GoogleFonts.inter(
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF000000),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                data['phone'],
                style: GoogleFonts.inter(
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF000000),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
