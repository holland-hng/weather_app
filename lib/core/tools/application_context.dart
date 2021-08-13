import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_size.dart';

class Application {
  static BuildContext? _context;
  static AppSize? _sizes;
  static AppColors? _colors = AppColors();
  static BuildContext get rootContext {
    return _context!;
  }

  static AppSize get sizes {
    return _sizes!;
  }

  static AppColors get colors {
    return _colors!;
  }

  Application._privateConstructor();

  static final Application _instance = Application._privateConstructor();

  factory Application() {
    return _instance;
  }
  static void setContext(BuildContext context) {
    Application._context = context;
    Application._sizes = AppSize(context);
  }
}
