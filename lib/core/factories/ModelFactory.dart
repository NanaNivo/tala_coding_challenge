import 'dart:convert';

class ModelFactory {
  final Map<String, dynamic Function(dynamic)> _modelMap = {};

  static ModelFactory? _instance;

  static ModelFactory getInstance() {
    if (_instance != null) {
      return _instance!;
    } else {
      _instance = ModelFactory();
    }
    return _instance!;
  }

  void registerModel(
    String modelName,
    dynamic Function(dynamic) modelMapper,
  ) {
     _modelMap.putIfAbsent(modelName, () => modelMapper);
     print('Categories Tracing ModelFactory.registerModel modelMapper ${modelMapper}');
  }

  T createModel<T>(json) {
    assert(_modelMap.containsKey(T.toString()));
    return _modelMap[T.toString()]!(json) as T;
  }


}

