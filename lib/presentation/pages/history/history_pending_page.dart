import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uniguard_z/presentation/misc/colors.dart';
import 'package:uniguard_z/presentation/misc/typography.dart';
import 'package:uniguard_z/presentation/widgets/button/custom_button.dart';

class HistoryPendingPage extends ConsumerStatefulWidget {
  const HistoryPendingPage({super.key});

  @override
  ConsumerState<HistoryPendingPage> createState() => _HistoryPendingPageState();
}

class _HistoryPendingPageState extends ConsumerState<HistoryPendingPage> {
  final List<Map<String, dynamic>> _items = [
    {
      "label": "Forms",
      "count": 0,
      "icon": Icons.description,
    },
    {
      "label": "Tasks",
      "count": 0,
      "icon": Icons.check_circle,
    },
    {
      "label": "Activity Log",
      "count": 0,
      "icon": Icons.local_activity,
    },
    {"label": "Checkpoints", "count": 0, "icon": Icons.location_pin},
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: CustomButton(
            title: "Retry Upload",
            fullwidth: true,
            onPressed: () {},
          ),
        ),
        GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            childAspectRatio: 1,
          ),
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemCount: _items.length,
          itemBuilder: (context, index) {
            var item = _items[index];
            return Stack(
              alignment: Alignment.center, // Menjaga item berada di tengah
              children: [
                Container(
                  width: double.infinity, // Mengisi penuh lebar kolom
                  decoration: BoxDecoration(
                    color: AppColors.primarySoft,
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: AppColors.primaryExtraSoft, width: 3),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        item['icon'],
                        size: 36,
                        color: AppColors.grey,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        item['label'].toUpperCase(),
                        style: Typogaphy.Regular.copyWith(fontSize: 16),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  right: 3,
                  top: 3,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppColors.secondary,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(4),
                      ),
                    ),
                    child: Text(
                      item['count'].toString(),
                      style: Typogaphy.Regular.copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ],
            );
          },
        )
      ],
    );
  }
}
