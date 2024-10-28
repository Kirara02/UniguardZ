import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uniguard_z/presentation/misc/app_routes.dart';
import 'package:uniguard_z/presentation/misc/colors.dart';
import 'package:uniguard_z/presentation/misc/typography.dart';
import 'package:uniguard_z/presentation/providers/routes/router_provider.dart';

class HistoryUploadedPage extends ConsumerStatefulWidget {
  const HistoryUploadedPage({super.key});

  @override
  ConsumerState createState() => _HistoryUploadedPageState();
}

class _HistoryUploadedPageState extends ConsumerState<HistoryUploadedPage> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {},
      child: ListView(
        children: [
          ListView.builder(
            itemCount: 2,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Column(
                      children: [
                        Container(
                          height: 24,
                          width: 4,
                          decoration: BoxDecoration(color: AppColors.primarySoft),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                          decoration: BoxDecoration(
                            color: AppColors.primarySoft,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Icon(
                            Icons.local_activity,
                            size: 36,
                            color: AppColors.grey,
                          ),
                        ),
                        Container(
                          height: 24,
                          width: 4,
                          decoration: BoxDecoration(color: AppColors.primarySoft),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(color: AppColors.primaryExtraSoft, width: 4)),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Activity Logged",
                                    style: Typogaphy.Medium,
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    "14:23:32 10-10-2024",
                                    style: Typogaphy.Regular.copyWith(fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                ref.read(routerProvider).push(Routes.MAPS);
                              },
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: AppColors.primaryExtraSoft,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Icon(
                                  Icons.location_on_sharp,
                                  size: 32,
                                  color: AppColors.grey,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
