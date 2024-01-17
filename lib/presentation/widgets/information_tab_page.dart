import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plant_client/core/helpers/constant_values.dart';
import 'package:plant_client/domain/entities/chart_data_entity.dart';

class InformationTabPage extends StatefulWidget {
  const InformationTabPage({
    super.key,
  });

  @override
  State<InformationTabPage> createState() => _InformationTabPageState();
}

class _InformationTabPageState extends State<InformationTabPage> {
  final Stream<QuerySnapshot> tempStream =
      FirebaseFirestore.instance.collection('temp').snapshots();
  final Stream<QuerySnapshot> waterStream =
      FirebaseFirestore.instance.collection('water').snapshots();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: ConstantValues.home_padding,
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Yield",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: const Color(0xff7D86A8),
                    ),
                  ),
                  Text(
                    "±523 gr",
                    style: GoogleFonts.montserrat(
                        fontSize: 22, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Temp",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: const Color(0xff7D86A8),
                    ),
                  ),
                  StreamBuilder<QuerySnapshot>(
                      stream: tempStream,
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.hasError) {
                          return Text('Error');
                        }

                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Text("");
                        }
                        final listData = snapshot.data?.docs
                            .map(
                              (e) => ChartDataEntity.fromJson(
                                  e.data() as Map<String, dynamic>),
                            )
                            .toList();
                        listData?.sort((a, b) => a.date.compareTo(b.date));
                        return Text(
                          "${listData?.last.value} C",
                          style: GoogleFonts.montserrat(
                              fontSize: 22, fontWeight: FontWeight.w700),
                        );
                      }),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Water",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: const Color(0xff7D86A8),
                    ),
                  ),
                  StreamBuilder<QuerySnapshot>(
                      stream: waterStream,
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.hasError) {
                          return Text('Error');
                        }

                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Text("");
                        }
                        final listData = snapshot.data?.docs
                            .map(
                              (e) => ChartDataEntity.fromJson(
                                  e.data() as Map<String, dynamic>),
                            )
                            .toList();
                        listData?.sort((a, b) => a.date.compareTo(b.date));
                        return Text(
                          "${listData?.last.value} (Ph)",
                          style: GoogleFonts.montserrat(
                              fontSize: 22, fontWeight: FontWeight.w700),
                        );
                      }),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Flowering",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: const Color(0xff7D86A8),
                    ),
                  ),
                  Text(
                    "6-8 weeks",
                    style: GoogleFonts.montserrat(
                        fontSize: 22, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ],
          ),
          Expanded(
            child: Stack(
              children: [
                Positioned(
                  left: MediaQuery.of(context).size.width * 0.03,
                  top: MediaQuery.of(context).size.height * 0.05,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 1,
                    height: MediaQuery.of(context).size.height * 0.43,
                    decoration: const ShapeDecoration(
                      gradient: LinearGradient(
                        begin: Alignment(0.00, -1.00),
                        end: Alignment(0, 1),
                        colors: [Color(0xFFDDEDFE), Color(0xFFC1D5F4)],
                      ),
                      shape: OvalBorder(),
                    ),
                  ),
                ),
                Positioned(
                  right: -60,
                  top: MediaQuery.of(context).size.height * 0.02,
                  child: Image.asset(
                    "assets/img/plant_img.png",
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.46,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
