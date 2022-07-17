import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/services/api/http.service.dart';
import 'package:trip_n_joy_front/viewmodels/groups/group.viewmodel.dart';

class QRCodeViewModel extends StateNotifier<int?> {
  QRCodeViewModel(this.httpService, this.groupViewModel) : super(null);

  final HttpService httpService;
  final GroupViewModel groupViewModel;

  void extractGroupIdFromQRCode(String code) {
    // TODO: check identifier is present and extract groupId
    state = 100;
  }

  bool checkGroupAlreadyJoined(int groupId) {
    return groupViewModel.groups.any((group) => group.id == groupId);
  }
}
