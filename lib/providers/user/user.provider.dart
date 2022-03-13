import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../models/user/user.model.dart';

final userProvider = StateProvider<User>((ref) => User(
      id: "",
      firstname: "Tony",
      lastname: "Heng",
      email: "tony.heng@epita.fr",
      birthDate: DateTime.now(),
    ));
