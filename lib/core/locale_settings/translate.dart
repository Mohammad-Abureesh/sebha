//Translate file passed into GetMaterial inside root widget
//add an new lang key into [keys]

import 'package:get/get.dart';

import 'languages/ar.dart';
import 'languages/en.dart';

class Translate extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {'en': en, 'ar': ar};
} //Translate
