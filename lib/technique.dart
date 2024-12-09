import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:only_healing_breath_93a/models/breathing_technique.dart';
import 'package:only_healing_breath_93a/providers/provider_technique.dart';
import 'package:provider/provider.dart';

class Technique extends StatefulWidget {
  const Technique({super.key});

  @override
  State<Technique> createState() => _TechniqueState();
}

class _TechniqueState extends State<Technique> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      appBar: AppBar(title: const Text('Breathing Techniques')),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Consumer<TechniqueProvider>(
          builder: (context, provider, _) {
            return Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(16.0.w),
                  child: MainTechniqueCard(technique: provider.mainTechnique),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 3.w, right: 13.w),
                  child: Column(
                    children: List.generate(2, (rowIndex) {
                      return Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(2, (cardIndex) {
                          int techIndex = rowIndex * 2 + cardIndex;
                          // Check if the technique index is within bounds
                          if (techIndex < provider.displayTechniques.length) {
                            return Expanded(
                              child: Padding(
                                padding:
                                    EdgeInsets.only(left: 10.w, bottom: 12.h),
                                child: SmallTechniqueCard(
                                  technique:
                                      provider.displayTechniques[techIndex],
                                ),
                              ),
                            );
                          } else {
                            return const SizedBox(); // Return an empty widget if no technique is available
                          }
                        }),
                      );
                    }),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}

class SmallTechniqueCard extends StatelessWidget {
  final BreathingTechnique technique;

  const SmallTechniqueCard({super.key, required this.technique});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Provider.of<TechniqueProvider>(context, listen: false)
          .swapTechnique(technique.id),
      child: Container(
        width: 165.w,
        height: 218.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: const Color(0xffFFFFFF),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 20.h,
              right: 18.w,
              left: 18.w,
              child: SizedBox(
                width: 130.w,
                height: 24.h,
                child: Text(
                  technique.title,
                  style:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Positioned(
              top: 52.h,
              right: 19.w,
              left: 17.w,
              child: Text(
                technique.description,
                style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff666666)),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
            Positioned(
              top: 130.h,
              right: 11.w,
              left: 10.w,
              child: Image.asset(technique.image),
            ),
          ],
        ),
      ),
    );
  }
}

class MainTechniqueCard extends StatelessWidget {
  final BreathingTechnique technique;

  const MainTechniqueCard({super.key, required this.technique});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 343.w,
      height: 356.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: const Color(0xffFFFFFF)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              technique.title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(technique.description),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(icon: Icon(Icons.timer), onPressed: () {}),
                IconButton(icon: Icon(Icons.play_arrow), onPressed: () {}),
                IconButton(icon: Icon(Icons.refresh), onPressed: () {}),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                // Implement specific functionality for the main technique
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Background color
              ),
              child: Text(technique.buttonText),
            )
          ],
        ),
      ),
    );
  }
}
