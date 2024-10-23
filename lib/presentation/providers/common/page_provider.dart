import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uniguard_z/presentation/enums/drawer_page.dart';

final pageProvider = StateProvider<DrawerPage>((ref) => DrawerPage.home);
