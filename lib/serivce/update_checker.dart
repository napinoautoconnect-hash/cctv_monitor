import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_in_store_app_version_checker/flutter_in_store_app_version_checker.dart';
import 'package:url_launcher/url_launcher.dart';

class UpdateChecker {
  UpdateChecker._();

  static bool _isChecking = false;
  static bool _dialogShowing = false;

  static Future<void> checkForUpdate(BuildContext context) async {
    // ============================================================
    // WEB
    // ============================================================
    //
    // flutter_in_store_app_version_checker does not have a Web
    // implementation. So never call the plugin on Chrome/Web.
    //
    if (kIsWeb) {
      debugPrint('UPDATE: Web detected - store update check skipped.');
      return;
    }

    // Prevent multiple checks at the same time.
    if (_isChecking || _dialogShowing) {
      return;
    }

    _isChecking = true;

    try {
      // ============================================================
      // ACTUAL PLAY STORE / APP STORE VERSION CHECK
      // ============================================================

      const params = InStoreAppVersionCheckerParams(locale: 'en');

      debugPrint('--------------------------------');
      debugPrint('UPDATE: Starting actual store check');
      debugPrint('--------------------------------');

      final response = await InStoreAppVersionChecker.instance.checkUpdate(
        params,
      );

      debugPrint('UPDATE: Store check response received');

      if (!context.mounted) {
        return;
      }

      debugPrint('--------------------------------');
      debugPrint('UPDATE CHECK');
      debugPrint('Success      : ${response.isSuccess}');
      debugPrint('Current      : ${response.currentVersion}');
      debugPrint('Store        : ${response.newVersion}');
      debugPrint('Can Update   : ${response.canUpdate}');
      debugPrint('Store URL    : ${response.appURL}');
      debugPrint('Error        : ${response.errorMessage}');
      debugPrint('--------------------------------');

      // ============================================================
      // SHOW UPDATE DIALOG
      // ============================================================

      if (response.isSuccess && response.canUpdate) {
        _showUpdateDialog(
          context,
          currentVersion: response.currentVersion ?? '',
          newVersion: response.newVersion ?? '',
          storeUrl: response.appURL ?? '',
        );
      }
    } catch (e, stackTrace) {
      debugPrint('UPDATE CHECK ERROR: $e');
      debugPrint('$stackTrace');
    } finally {
      _isChecking = false;
    }
  }

  // ==============================================================
  // UPDATE DIALOG
  // ==============================================================

  static void _showUpdateDialog(
    BuildContext context, {
    required String currentVersion,
    required String newVersion,
    required String storeUrl,
  }) {
    if (_dialogShowing) {
      return;
    }

    _dialogShowing = true;

    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (dialogContext) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          titlePadding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
          contentPadding: const EdgeInsets.fromLTRB(24, 16, 24, 8),
          actionsPadding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
          title: const Row(
            children: [
              Icon(
                Icons.system_update_rounded,
                color: Color(0xFF0057B8),
                size: 30,
              ),
              SizedBox(width: 12),
              Expanded(
                child: Text(
                  'Update Available',
                  style: TextStyle(fontSize: 21, fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'A new version of CCTV Monitor is available.',
                style: TextStyle(fontSize: 15, height: 1.4),
              ),
              const SizedBox(height: 16),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: const Color(0xFFF3F7FC),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _versionRow(
                      'Current version',
                      currentVersion.isEmpty ? '-' : currentVersion,
                    ),
                    const SizedBox(height: 8),
                    _versionRow(
                      'New version',
                      newVersion.isEmpty ? '-' : newVersion,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 14),
              Text(
                'Update now to get the latest features and improvements.',
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey.shade700,
                  height: 1.4,
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(dialogContext).pop();
              },
              child: const Text(
                'Later',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
            FilledButton(
              style: FilledButton.styleFrom(
                backgroundColor: const Color(0xFF0057B8),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 11,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () async {
                Navigator.of(dialogContext).pop();

                await _openStore(storeUrl);
              },
              child: const Text(
                'Update Now',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
          ],
        );
      },
    ).then((_) {
      _dialogShowing = false;
    });
  }

  // ==============================================================
  // VERSION ROW
  // ==============================================================

  static Widget _versionRow(String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w700,
            color: Color(0xFF0057B8),
          ),
        ),
      ],
    );
  }

  // ==============================================================
  // OPEN PLAY STORE / APP STORE
  // ==============================================================

  static Future<void> _openStore(String storeUrl) async {
    if (storeUrl.isEmpty) {
      debugPrint('Store URL is empty.');
      return;
    }

    try {
      final uri = Uri.tryParse(storeUrl);

      if (uri == null) {
        debugPrint('Invalid store URL: $storeUrl');
        return;
      }

      final launched = await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );

      if (!launched) {
        debugPrint('Could not open store URL: $storeUrl');
      }
    } catch (e) {
      debugPrint('STORE OPEN ERROR: $e');
    }
  }
}
