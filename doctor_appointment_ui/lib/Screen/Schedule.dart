import 'package:flutter/material.dart';

import '../Model/schedule.dart';
import '../Widgets/schedule_items.dart';
import '../const.dart';

class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              "Schedule",
              style: TextStyle(
                fontSize: 28,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: DefaultTabController(
              length: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Tabs
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Container(
                      decoration: BoxDecoration(
                        color: grey.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: TabBar(
                        indicatorColor: purple,
                        unselectedLabelColor: black.withOpacity(0.5),
                        labelStyle: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                        labelColor: Colors.white,
                        indicator: BoxDecoration(
                          color: purple,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        tabs: tabs
                            .map((tab) => Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Tab(text: tab),
                                ))
                            .toList(),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Tab Content
                  Expanded(
                    child: TabBarView(
                      children: [
                        // Upcoming Tab
                        SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Nearest visit",
                                style: TextStyle(
                                  color: black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: -.4,
                                ),
                              ),
                              const SizedBox(height: 20),
                              ...List.generate(
                                todaySchedules.length,
                                (index) => Padding(
                                  padding: const EdgeInsets.only(bottom: 15),
                                  child: ScheduleItems(
                                    schedule: todaySchedules[index],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                "Future visit",
                                style: TextStyle(
                                  color: black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: -.4,
                                ),
                              ),
                              const SizedBox(height: 20),
                              ...List.generate(
                                futureSchedules.length,
                                (index) => Padding(
                                  padding: const EdgeInsets.only(bottom: 15),
                                  child: ScheduleItems(
                                    schedule: futureSchedules[index],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Completed Tab
                        SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Completed visits",
                                style: TextStyle(
                                  color: black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: -.4,
                                ),
                              ),
                              const SizedBox(height: 20),
                              ...List.generate(
                                pastSchedules.length,
                                (index) => Padding(
                                  padding: const EdgeInsets.only(bottom: 15),
                                  child: ScheduleItems(
                                    schedule: pastSchedules[index],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Canceled Tab
                        const Center(
                          child: Text(
                            "Canceled",
                            style: TextStyle(
                              fontSize: 24,
                              color: purple,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
