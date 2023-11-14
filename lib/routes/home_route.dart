import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:reakt_admin/routes/widget/alert_message.dart';

class HomeRoute extends StatelessWidget {
  const HomeRoute({super.key});

  @override
  Widget build(BuildContext context) {
    final database = context.read<FirebaseFirestore>();

    return SafeArea(
      child: Scaffold(
        body: Center(
          child: ListView(
            children: [
              Container(
                margin: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    Text(
                      "Reakt",
                      style: GoogleFonts.inter(
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      "Emergency alerts",
                      style: GoogleFonts.inter(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF06080A),
                      ),
                    ),
                    const SizedBox(height: 20),
                    StreamBuilder<List<Map<String, dynamic>>>(
                      stream:
                          database.collection("requests").snapshots().map((x) => x.docs.map((y) => y.data()).toList()),
                      initialData: const [],
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Column(children: [...snapshot.data!.map((x) => AlertMessage(data: x))]);
                        }
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
