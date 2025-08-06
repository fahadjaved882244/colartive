import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:colartive2/extensions/firebase_x.dart';
import 'package:colartive2/features/template/data/i_template_repository.dart';
import 'package:colartive2/features/template/model/template.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final templateRepositoryProvider = Provider<ITemplateRepository>((ref) {
  return TemplateRepository();
});

class TemplateRepository implements ITemplateRepository {
  final firestore = FirebaseFirestore.instance;
  final storage = FirebaseStorage.instance;
  @override
  Future<List<Template>> getAll() async {
    // Fetch templates from Firestore
    // only fetch templates that are active
    final querySnapshot = await firestore.templateCollection
        .where('isActive', isEqualTo: true)
        .get();
    return querySnapshot.docs
        .map((doc) => Template.fromMap(doc.data()))
        .toList();
  }

  @override
  Future<Template> get(String id) {
    // Fetch template from Firestore by ID
    if (id.isEmpty) {
      throw ArgumentError("Template ID cannot be empty");
    }
    return firestore.templateCollection.doc(id).get().then((doc) {
      if (doc.exists) {
        final template = Template.fromMap(doc.data()!);
        if (template.isActive) {
          return template;
        } else {
          throw Exception("Template is not active");
        }
      } else {
        throw Exception("Template not found");
      }
    });
  }

  @override
  Future<void> loadFont(String path, String familyName) async {
    try {
      final reference = FirebaseStorage.instance.ref().child(path);
      final Uint8List? bytes = await reference.getData(2 * 1024 * 1024);
      if (bytes != null) {
        await ui.loadFontFromList(bytes, fontFamily: familyName);
        return;
      }
      throw Exception("Failed to load font data");
    } catch (e) {
      throw Exception("Error loading font: $e");
    }
  }
}
