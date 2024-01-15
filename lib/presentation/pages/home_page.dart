import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plant_client/core/helpers/constant_values.dart';
import 'package:plant_client/presentation/pages/pages.dart';
import 'package:plant_client/presentation/pages/water_chart_tab_page.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ValueNotifier<int> indexPageSelected = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
            colors: [
              Color(0xffDDEDFE),
              Colors.white,
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: ConstantValues.home_padding, vertical: 21),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/img/person_img.png",
                      width: 50,
                      height: 50,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Steve wizard",
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          "Farmer",
                          style: GoogleFonts.poppins(
                              fontSize: 14, color: const Color(0xff6B6B6B)),
                        )
                      ],
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: const Color(0xff44F1A6),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.location_on),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text(
                        "Other\nGarden",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: ConstantValues.home_padding, top: 10),
                child: Text(
                  "Alocasia macrorrhiza",
                  style: GoogleFonts.poppins(
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: ConstantValues.home_padding),
                child: Text(
                  "Herb",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: const Color(0xff7D86A8),
                  ),
                ),
              ),
              ValueListenableBuilder(
                  valueListenable: indexPageSelected,
                  builder: (context, value, _) {
                    return Padding(
                      padding: const EdgeInsets.only(
                        top: 40.0,
                        left: ConstantValues.home_padding,
                        bottom: 20,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Hybrid",
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                                width: value == 0 ? 30 : 10,
                                height: 10,
                                decoration: BoxDecoration(
                                  color: value == 0
                                      ? Colors.black
                                      : const Color(0xffC1D5F4),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              Row(
                                children: List.generate(
                                  3,
                                  (index) => Container(
                                    width: 2,
                                    height: 2,
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 3),
                                    decoration: const BoxDecoration(
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                              AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                                width: value == 1 ? 30 : 10,
                                height: 10,
                                decoration: BoxDecoration(
                                  color: value == 1
                                      ? Colors.black
                                      : const Color(0xffC1D5F4),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              Row(
                                children: List.generate(
                                  3,
                                  (index) => Container(
                                    width: 2,
                                    height: 2,
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 3),
                                    decoration: const BoxDecoration(
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                              AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                                width: value == 2 ? 30 : 10,
                                height: 10,
                                decoration: BoxDecoration(
                                  color: value == 2
                                      ? Colors.black
                                      : const Color(0xffC1D5F4),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              Row(
                                children: List.generate(
                                  3,
                                  (index) => Container(
                                    width: 2,
                                    height: 2,
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 3),
                                    decoration: const BoxDecoration(
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                              AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                                width: value == 3 ? 30 : 10,
                                height: 10,
                                decoration: BoxDecoration(
                                  color: value == 3
                                      ? Colors.black
                                      : const Color(0xffC1D5F4),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  }),
              Expanded(
                child: PageView(
                  onPageChanged: (value) {
                    indexPageSelected.value = value;
                  },
                  children: const [
                    InformationTabPage(),
                    PlantConditionTabPage(),
                    TempChartTabPage(),
                    WaterChartTabPage(),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 21.0,
                  horizontal: ConstantValues.home_padding,
                ),
                child: Row(
                  children: [
                    const Icon(Icons.compare_arrows),
                    Text(
                      "Compare",
                      style: GoogleFonts.poppins(fontSize: 16),
                    ),
                    const Spacer(),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        minimumSize: const Size(100, 60),
                      ),
                      onPressed: () {},
                      child: const Icon(
                        Icons.call,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
