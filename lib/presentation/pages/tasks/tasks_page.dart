import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:uniguard_z/presentation/misc/app_routes.dart';
import 'package:uniguard_z/presentation/misc/colors.dart';
import 'package:uniguard_z/presentation/misc/screen.dart';
import 'package:uniguard_z/presentation/misc/typography.dart';
import 'package:uniguard_z/presentation/misc/utils.dart';
import 'package:uniguard_z/presentation/providers/api/tasks_provider.dart';
import 'package:uniguard_z/presentation/providers/routes/router_provider.dart';
import 'package:uniguard_z/presentation/widgets/common/custom_view.dart';

class TasksPage extends ConsumerStatefulWidget {
  const TasksPage({super.key});

  @override
  ConsumerState<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends ConsumerState<TasksPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref.read(tasksProvider.notifier).getTasks());
  }

  @override
  Widget build(BuildContext context) {
    final tasks = ref.watch(tasksProvider);

    return Scaffold(
      body: CustomView(
        header: Container(
          height: AppScreens.height * 0.1,
          padding: const EdgeInsets.fromLTRB(16, 28, 16, 0),
          child: Row(
            children: [
              IconButton(
                onPressed: () => ref.read(routerProvider).pop(),
                icon: const FaIcon(
                  FontAwesomeIcons.arrowLeft,
                  color: Colors.white,
                  size: 20,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                "Tasks",
                style: Typogaphy.Medium.copyWith(
                  fontSize: 14,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            ref.read(tasksProvider.notifier).getTasks();
          },
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              tasks.when(
                data: (data) {
                  if (data.isEmpty) {
                    return const Center(
                      child: Text("Forms empty"),
                    );
                  }
                  return ListView.separated(
                    itemCount: data.length,
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      var task = data[index];
                      return InkWell(
                        onTap: () => ref
                            .read(routerProvider)
                            .push(Routes.TASK, extra: task),
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: AppColors.primarySoft,
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(
                                color: AppColors.primaryExtraSoft, width: 4),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.description,
                                size: 24,
                                color: AppColors.grey,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                task.name,
                                style: Typogaphy.Medium.copyWith(
                                  color: AppColors.light,
                                ),
                              ),
                              const Spacer(),
                              Icon(
                                Icons.arrow_forward,
                                size: 24,
                                color: AppColors.grey,
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                loading: () => SizedBox(
                  height: AppScreens.safeHeight,
                  child: Center(
                    child: CircularProgressIndicator(
                      color: AppColors.grey,
                    ),
                  ),
                ),
                error: (e, stack) {
                  printIfDebug('Error fetching forms: $e');
                  return SizedBox(
                    height: AppScreens.safeHeight,
                    child: Center(
                      child: Text('Error: $e'),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
