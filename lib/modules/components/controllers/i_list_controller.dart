import 'dart:async';

import 'package:get/get.dart';
import 'i_base_controller.dart';

abstract class IListController<M, P> extends IBaseController<P> {
  final RxList<M> _list = <M>[].obs;
  List<M> get dataList => _list;
  set dataList(List<M> list) => _list.value = list;

  final RxBool _isSelectable = false.obs;
  bool get isSelectable => _isSelectable.value;
  set isSelectable(value) => _isSelectable(value);

  final RxList<M> _selectedItems = <M>[].obs;
  List<M> get selectedItems => _selectedItems;

  StreamSubscription<List<M>>? dataStream;
  final Function()? subsribeToStream = null;

  @override
  void onReady() async {
    super.onReady();
    await subsribeToStream?.call();
  }

  @override
  void onClose() {
    dataStream?.cancel();
    super.onClose();
  }

  void selectItem(M value) {
    if (selectedItems.contains(value)) {
      selectedItems.remove(value);
    } else {
      selectedItems.add(value);
    }
  }
}
