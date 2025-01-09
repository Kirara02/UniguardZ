import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:uniguard_z/presentation/misc/app_routes.dart';
import 'package:uniguard_z/presentation/misc/colors.dart';
import 'package:uniguard_z/presentation/misc/screen.dart';
import 'package:uniguard_z/presentation/misc/typography.dart';
import 'package:uniguard_z/presentation/misc/utils.dart';
import 'package:uniguard_z/presentation/providers/api/forms_provider.dart';
import 'package:uniguard_z/presentation/providers/routes/router_provider.dart';
import 'package:uniguard_z/presentation/widgets/common/custom_view.dart';

class FormsPage extends ConsumerStatefulWidget {
  const FormsPage({super.key});

  @override
  ConsumerState<FormsPage> createState() => _FormsPageState();
}

class _FormsPageState extends ConsumerState<FormsPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref.read(formsProvider.notifier).getForms());
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final forms = ref.watch(formsProvider);
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

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
                "Forms",
                style: textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
        body: RefreshIndicator(
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      var form = data[index];
                      return InkWell(
                        onTap: () => ref
                            .read(routerProvider)
                            .push(Routes.FORM, extra: form),
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: colorScheme.secondary,
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(
                              color: colorScheme.tertiary,
                              width: 4,
                            ),
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
        ),
      ),
    );
  }
}
