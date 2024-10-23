import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uniguard_z/presentation/misc/app_routes.dart';
import 'package:uniguard_z/presentation/misc/colors.dart';
import 'package:uniguard_z/presentation/misc/screen.dart';
import 'package:uniguard_z/presentation/misc/typography.dart';
import 'package:uniguard_z/presentation/misc/utils.dart';
import 'package:uniguard_z/presentation/providers/api/forms_provider.dart';
import 'package:uniguard_z/presentation/providers/routes/router_provider.dart';

class FormsPage extends ConsumerStatefulWidget {
  const FormsPage({super.key});

  @override
  FormsPageState createState() => FormsPageState();
}

class FormsPageState extends ConsumerState<FormsPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref.read(formsProvider.notifier).getForms());
  }

  @override
  Widget build(BuildContext context) {
    final forms = ref.watch(formsProvider);

    return RefreshIndicator(
      onRefresh: () async {
        ref.read(formsProvider.notifier).getForms();
      },
      child: ListView(
        children: [
          forms.when(
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
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                separatorBuilder: (context, index) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  var form = data[index];
                  return InkWell(
                    onTap: () => ref.read(routerProvider).push(Routes.FORM, extra: form),
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: AppColors.primarySoft,
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color: AppColors.primaryExtraSoft, width: 4),
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
                            form.name,
                            style: Typogaphy.Medium.copyWith(
                              color: AppColors.grey,
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
              child: const Center(
                child: CircularProgressIndicator(),
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
    );
  }
}
