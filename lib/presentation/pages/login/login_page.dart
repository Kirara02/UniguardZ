import 'dart:io';

import 'package:android_intent_plus/android_intent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';
// import 'package:disable_battery_optimization/disable_battery_optimization.dart';
import 'package:uniguard_z/presentation/extensions/build_context_extension.dart';
import 'package:uniguard_z/presentation/misc/app_routes.dart';
import 'package:uniguard_z/presentation/misc/typography.dart';
import 'package:uniguard_z/presentation/providers/routes/router_provider.dart';
import 'package:uniguard_z/presentation/providers/user_data/user_data_provider.dart';
import 'package:uniguard_z/presentation/widgets/button/custom_button.dart';
import 'package:uniguard_z/presentation/widgets/dialog/loading_dialog.dart';
import 'package:uniguard_z/presentation/widgets/text_field/ug_text_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:device_info_plus/device_info_plus.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage>
    with WidgetsBindingObserver {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isLoadingDialogVisible = false;
  bool _isPermissionDialogVisible = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _requestPermissions();
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  // Listen to app lifecycle changes
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      _requestPermissions();
    }
  }

  // Show loading dialog
  Future<void> _showLoadingDialog(BuildContext context, String message) async {
    if (!_isLoadingDialogVisible) {
      _isLoadingDialogVisible = true;
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Row(
              children: [
                const CircularProgressIndicator(),
                const SizedBox(width: 20),
                Text(message),
              ],
            ),
          );
        },
      );
    }
  }

// Function to request permissions
  Future<void> _requestPermissions() async {
    // await _checkBatteryOptimization();
    await _checkBluetoothPermission();
    await _checkLocationPermissions();
    if (Platform.isAndroid && (await _getAndroidVersion() >= 30)) {
      _checkLocationAlwaysPermissions();
    }
  }

  // Future<void> _checkBatteryOptimization() async {
  //   await _showLoadingDialog(context, "Checking Battery Optimization...");

  //   // Cek kondisi battery optimization
  //   bool isBatteryOptimized = await _isBatteryOptimizationEnabled();
  //   if (mounted) {
  //     Navigator.of(context).pop();
  //   }
  //   _isLoadingDialogVisible = false;

  //   if (!isBatteryOptimized) {
  //     await _showPermissionDialog(
  //       message:
  //           "Battery optimizations: Battery optimization enabled. Location functions may be negatively impacted",
  //       onFix: _requestDisableBatteryOptimization,
  //     );
  //   }
  // }

  // Future<bool> _isBatteryOptimizationEnabled() async {
  //   final batteryOptimizationStatus = await DisableBatteryOptimization.isBatteryOptimizationDisabled;
  //   return batteryOptimizationStatus ?? true;
  // }

  Future<void> _checkBluetoothPermission() async {
    await _showLoadingDialog(context, "Checking Bluetooth Permission...");

    // Cek status Bluetooth
    bool isBluetoothEnabled = await _isBluetoothEnabled();
    if (mounted) {
      Navigator.of(context).pop();
    }
    _isLoadingDialogVisible = false;

    if (!isBluetoothEnabled) {
      await _showPermissionDialog(
        message:
            "Bluetooth permission: Bluetooth beacon scanning requires permission.",
        onFix: _requestEnableBluetooth,
      );
    }
  }

  Future<bool> _isBluetoothEnabled() async {
    final bluetoothStatus = await Permission.bluetooth.serviceStatus.isEnabled;
    return bluetoothStatus; // Return true if Bluetooth is enabled
  }

  Future<void> _checkLocationPermissions() async {
    await _showLoadingDialog(context, "Checking Location Permissions...");

    // Cek status permission lokasi
    bool isLocationGranted = await _isLocationPermissionGranted();
    if (mounted) {
      Navigator.of(context).pop();
    }
    _isLoadingDialogVisible = false;

    if (!isLocationGranted) {
      await _showPermissionDialog(
        message: "GPS permission: GPS required permission",
        onFix: _requestLocationPermissions,
      );
    }
  }

  Future<void> _checkLocationAlwaysPermissions() async {
    await _showLoadingDialog(
        context, "Checking Background Location Permissions...");

    bool isLocationAlwaysGranted = await _isLocationAlwaysPermissionGranted();
    if (mounted) {
      Navigator.of(context).pop();
    }
    _isLoadingDialogVisible = false;

    if (!isLocationAlwaysGranted) {
      await _showPermissionDialog(
        message:
            "GPS Background permission: Uniguard collects location data to enable tracking even when the app is in the background. Background access is not enabled. Location tracking may be negatively impacted.",
        onFix: _requestLocationsAlwaysPermissions,
      );
    }
  }

  Future<bool> _isLocationPermissionGranted() async {
    final locationStatus = await Permission.location.isGranted;
    return locationStatus; // Return true if location permission is granted
  }

  Future<bool> _isLocationAlwaysPermissionGranted() async {
    final locationAlwaysStatus = await Permission.locationAlways.isGranted;
    return locationAlwaysStatus;
  }

  Future<int> _getAndroidVersion() async {
    final androidInfo = await DeviceInfoPlugin().androidInfo;
    return androidInfo.version.sdkInt;
  }

  Future<void> _requestDisableBatteryOptimization() async {
    const intent = AndroidIntent(
      action: 'android.settings.IGNORE_BATTERY_OPTIMIZATION_SETTINGS',
    );
    await intent.launch();
  }

  Future<void> _requestEnableBluetooth() async {
    // Minta izin Bluetooth
    final status = await Permission.bluetoothConnect.request();
    if (status.isGranted) {
      const intent = AndroidIntent(
        action: 'android.bluetooth.adapter.action.REQUEST_ENABLE',
      );
      await intent.launch();
    }
  }

  Future<void> _requestLocationPermissions() async {
    await Permission.location.request();
  }

  Future<void> _requestLocationsAlwaysPermissions() async {
    await Permission.locationAlways.request();
    if (await Permission.locationAlways.isPermanentlyDenied) {
      openAppSettings();
    }
  }

  // Function to show permission dialog
  Future<void> _showPermissionDialog({
    required String message,
    required Future<void> Function() onFix,
  }) async {
    if (!_isPermissionDialogVisible) {
      _isPermissionDialogVisible = true;
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Image.asset(
                      "assets/images/uniguard_icon.png",
                      height: 24,
                    ),
                    const SizedBox(width: 12),
                    Text(
                      "UniGuard",
                      style: Typogaphy.Medium.copyWith(fontSize: 18),
                    )
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  message,
                  style: Typogaphy.Regular.copyWith(fontSize: 12),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close dialog
                  _isPermissionDialogVisible = false; // Update status dialog
                },
                child: const Text("IGNORE"),
              ),
              TextButton(
                onPressed: () async {
                  Navigator.of(context).pop(); // Close dialog
                  await onFix(); // Call the function to fix the permission
                  _isPermissionDialogVisible = false; // Update status dialog
                },
                child: const Text("FIX"),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(
      userDataProvider,
      (previous, next) {
        if (next is AsyncData) {
          hideLoadingDialog(context);
          if (next.value != null) {
            ref.read(routerProvider).go(Routes.MAIN);
          }
        } else if (next is AsyncError) {
          // hideLoadingDialog(context);
          context.showSnackBar(next.error.toString());
        } else if (next.isLoading) {
          showLoadingDialog(context);
        }
      },
    );

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: context.colorScheme.surface,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 180,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/uniguard_icon.png",
                          width: 60,
                          color: Colors.blue,
                        ),
                        const SizedBox(width: 20),
                        Text(
                          "UNIGUARD",
                          style: context.textTheme.headlineLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 36),
                  UGTextField(
                    controller: _emailController,
                    label: AppLocalizations.of(context)!.email,
                    hintText: "user@mail.com",
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      // const emailPattern =
                      //     r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
                      // final regExp = RegExp(emailPattern);
                      // if (!regExp.hasMatch(value)) {
                      //   return 'Please enter a valid email address';
                      // }
                      return null;
                    },
                  ),
                  const SizedBox(height: 12),
                  UGTextField(
                    controller: _passwordController,
                    label: AppLocalizations.of(context)!.password,
                    hintText: "********",
                    obscureText: true,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.go,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: () =>
                          ref.read(routerProvider).push(Routes.FORGOT_PASSWORD),
                      child: Text(
                        "${AppLocalizations.of(context)!.forgot_password}?",
                        style:
                            Theme.of(context).textTheme.labelMedium!.copyWith(
                                  fontWeight: FontWeight.w500,
                                ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  CustomButton(
                    fullwidth: true,
                    title: AppLocalizations.of(context)!.login,
                    onPressed: () async {
                      context.hideKeyboard();
                      if (_formKey.currentState!.validate()) {
                        ref.read(userDataProvider.notifier).login(
                            email: _emailController.text,
                            password: _passwordController.text);
                      }
                    },
                  ),
                  const Divider(height: 50),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
