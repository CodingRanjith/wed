import 'dart:convert';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:share_plus/share_plus.dart';
import 'package:wedding_planner_india/core/constants/brand_constants.dart';
import 'package:wedding_planner_india/core/services/backup_service.dart';

class BackupFileHelper {
  BackupFileHelper(this._backupService);

  final BackupService _backupService;

  Future<BackupResult> createAndShareBackup() async {
    try {
      final json = await _backupService.exportToJson();
      final bytes = Uint8List.fromList(utf8.encode(json));
      final fileName =
          'wedding_diary_backup_${DateTime.now().millisecondsSinceEpoch}.json';

      if (kIsWeb) {
        final saved = await FilePicker.platform.saveFile(
          fileName: fileName,
          bytes: bytes,
          type: FileType.custom,
          allowedExtensions: ['json'],
        );
        if (saved == null) {
          return const BackupResult(
            success: false,
            message: 'Backup cancelled.',
          );
        }
      } else {
        await Share.shareXFiles(
          [
            XFile.fromData(
              bytes,
              name: fileName,
              mimeType: 'application/json',
            ),
          ],
          subject: '${BrandConstants.productName} Backup',
          text:
              'Save this file safely. Use Settings → Restore Backup to continue your wedding planning later.',
        );
      }

      await _backupService.markBackupCreated();
      return const BackupResult(
        success: true,
        message:
            'Backup created! Save the file to Google Drive, email, or USB.',
      );
    } catch (e) {
      debugPrint('Backup export failed: $e');
      return const BackupResult(
        success: false,
        message: 'Could not create backup. Please try again.',
      );
    }
  }

  Future<BackupResult> pickAndRestoreBackup() async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['json'],
        withData: true,
      );

      if (result == null || result.files.isEmpty) {
        return const BackupResult(success: false, message: 'Restore cancelled.');
      }

      final file = result.files.first;
      if (file.bytes == null) {
        return const BackupResult(
          success: false,
          message: 'Could not read backup file.',
        );
      }

      final jsonString = utf8.decode(file.bytes!);
      return _backupService.restoreFromJson(jsonString);
    } catch (e) {
      debugPrint('Backup import failed: $e');
      return const BackupResult(
        success: false,
        message: 'Failed to restore backup. Check the file format.',
      );
    }
  }
}
