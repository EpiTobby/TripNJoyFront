// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api.swagger.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AvailabilityAnswerModel _$AvailabilityAnswerModelFromJson(
        Map<String, dynamic> json) =>
    AvailabilityAnswerModel(
      startDate: json['startDate'] as String?,
      endDate: json['endDate'] as String?,
    );

Map<String, dynamic> _$AvailabilityAnswerModelToJson(
        AvailabilityAnswerModel instance) =>
    <String, dynamic>{
      'startDate': instance.startDate,
      'endDate': instance.endDate,
    };

ProfileCreationRequest _$ProfileCreationRequestFromJson(
        Map<String, dynamic> json) =>
    ProfileCreationRequest(
      name: json['name'] as String?,
      duration: json['duration'] == null
          ? null
          : RangeAnswerModel.fromJson(json['duration'] as Map<String, dynamic>),
      budget: json['budget'] == null
          ? null
          : RangeAnswerModel.fromJson(json['budget'] as Map<String, dynamic>),
      destinationTypes: profileCreationRequestDestinationTypesListFromJson(
          json['destinationTypes'] as List?),
      ages: json['ages'] == null
          ? null
          : RangeAnswerModel.fromJson(json['ages'] as Map<String, dynamic>),
      travelWithPersonFromSameCity:
          profileCreationRequestTravelWithPersonFromSameCityFromJson(
              json['travelWithPersonFromSameCity']),
      travelWithPersonFromSameCountry:
          profileCreationRequestTravelWithPersonFromSameCountryFromJson(
              json['travelWithPersonFromSameCountry']),
      travelWithPersonSameLanguage:
          profileCreationRequestTravelWithPersonSameLanguageFromJson(
              json['travelWithPersonSameLanguage']),
      gender: profileCreationRequestGenderFromJson(json['gender']),
      groupSize: json['groupSize'] == null
          ? null
          : RangeAnswerModel.fromJson(
              json['groupSize'] as Map<String, dynamic>),
      chillOrVisit:
          profileCreationRequestChillOrVisitFromJson(json['chillOrVisit']),
      aboutFood: profileCreationRequestAboutFoodFromJson(json['aboutFood']),
      goOutAtNight:
          profileCreationRequestGoOutAtNightFromJson(json['goOutAtNight']),
      sport: profileCreationRequestSportFromJson(json['sport']),
      availabilities: (json['availabilities'] as List<dynamic>?)
              ?.map((e) =>
                  AvailabilityAnswerModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$ProfileCreationRequestToJson(
        ProfileCreationRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'duration': instance.duration?.toJson(),
      'budget': instance.budget?.toJson(),
      'destinationTypes': profileCreationRequestDestinationTypesListToJson(
          instance.destinationTypes),
      'ages': instance.ages?.toJson(),
      'travelWithPersonFromSameCity':
          profileCreationRequestTravelWithPersonFromSameCityToJson(
              instance.travelWithPersonFromSameCity),
      'travelWithPersonFromSameCountry':
          profileCreationRequestTravelWithPersonFromSameCountryToJson(
              instance.travelWithPersonFromSameCountry),
      'travelWithPersonSameLanguage':
          profileCreationRequestTravelWithPersonSameLanguageToJson(
              instance.travelWithPersonSameLanguage),
      'gender': profileCreationRequestGenderToJson(instance.gender),
      'groupSize': instance.groupSize?.toJson(),
      'chillOrVisit':
          profileCreationRequestChillOrVisitToJson(instance.chillOrVisit),
      'aboutFood': profileCreationRequestAboutFoodToJson(instance.aboutFood),
      'goOutAtNight':
          profileCreationRequestGoOutAtNightToJson(instance.goOutAtNight),
      'sport': profileCreationRequestSportToJson(instance.sport),
      'availabilities':
          instance.availabilities?.map((e) => e.toJson()).toList(),
    };

RangeAnswerModel _$RangeAnswerModelFromJson(Map<String, dynamic> json) =>
    RangeAnswerModel(
      minValue: json['minValue'] as int?,
      maxValue: json['maxValue'] as int?,
    );

Map<String, dynamic> _$RangeAnswerModelToJson(RangeAnswerModel instance) =>
    <String, dynamic>{
      'minValue': instance.minValue,
      'maxValue': instance.maxValue,
    };

ProfileModel _$ProfileModelFromJson(Map<String, dynamic> json) => ProfileModel(
      id: json['id'] as num?,
      name: json['name'] as String?,
      availabilities: (json['availabilities'] as List<dynamic>?)
              ?.map((e) =>
                  AvailabilityAnswerModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      duration: json['duration'] == null
          ? null
          : RangeAnswerModel.fromJson(json['duration'] as Map<String, dynamic>),
      budget: json['budget'] == null
          ? null
          : RangeAnswerModel.fromJson(json['budget'] as Map<String, dynamic>),
      destinationTypes: profileModelDestinationTypesListFromJson(
          json['destinationTypes'] as List?),
      ages: json['ages'] == null
          ? null
          : RangeAnswerModel.fromJson(json['ages'] as Map<String, dynamic>),
      travelWithPersonFromSameCity:
          profileModelTravelWithPersonFromSameCityFromJson(
              json['travelWithPersonFromSameCity']),
      travelWithPersonFromSameCountry:
          profileModelTravelWithPersonFromSameCountryFromJson(
              json['travelWithPersonFromSameCountry']),
      travelWithPersonSameLanguage:
          profileModelTravelWithPersonSameLanguageFromJson(
              json['travelWithPersonSameLanguage']),
      gender: profileModelGenderFromJson(json['gender']),
      groupSize: json['groupSize'] == null
          ? null
          : RangeAnswerModel.fromJson(
              json['groupSize'] as Map<String, dynamic>),
      chillOrVisit: profileModelChillOrVisitFromJson(json['chillOrVisit']),
      aboutFood: profileModelAboutFoodFromJson(json['aboutFood']),
      goOutAtNight: profileModelGoOutAtNightFromJson(json['goOutAtNight']),
      sport: profileModelSportFromJson(json['sport']),
      active: json['active'] as bool?,
    );

Map<String, dynamic> _$ProfileModelToJson(ProfileModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'availabilities':
          instance.availabilities?.map((e) => e.toJson()).toList(),
      'duration': instance.duration?.toJson(),
      'budget': instance.budget?.toJson(),
      'destinationTypes':
          profileModelDestinationTypesListToJson(instance.destinationTypes),
      'ages': instance.ages?.toJson(),
      'travelWithPersonFromSameCity':
          profileModelTravelWithPersonFromSameCityToJson(
              instance.travelWithPersonFromSameCity),
      'travelWithPersonFromSameCountry':
          profileModelTravelWithPersonFromSameCountryToJson(
              instance.travelWithPersonFromSameCountry),
      'travelWithPersonSameLanguage':
          profileModelTravelWithPersonSameLanguageToJson(
              instance.travelWithPersonSameLanguage),
      'gender': profileModelGenderToJson(instance.gender),
      'groupSize': instance.groupSize?.toJson(),
      'chillOrVisit': profileModelChillOrVisitToJson(instance.chillOrVisit),
      'aboutFood': profileModelAboutFoodToJson(instance.aboutFood),
      'goOutAtNight': profileModelGoOutAtNightToJson(instance.goOutAtNight),
      'sport': profileModelSportToJson(instance.sport),
      'active': instance.active,
    };

PlacesFromCoordinatesRequest _$PlacesFromCoordinatesRequestFromJson(
        Map<String, dynamic> json) =>
    PlacesFromCoordinatesRequest(
      longitude: (json['longitude'] as num?)?.toDouble(),
      latitude: (json['latitude'] as num?)?.toDouble(),
      categories: placesFromCoordinatesRequestCategoriesListFromJson(
          json['categories'] as List?),
      radiusMeter: json['radiusMeter'] as int?,
    );

Map<String, dynamic> _$PlacesFromCoordinatesRequestToJson(
        PlacesFromCoordinatesRequest instance) =>
    <String, dynamic>{
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'categories':
          placesFromCoordinatesRequestCategoriesListToJson(instance.categories),
      'radiusMeter': instance.radiusMeter,
    };

PlaceResponse _$PlaceResponseFromJson(Map<String, dynamic> json) =>
    PlaceResponse(
      name: json['name'] as String?,
      street: json['street'] as String?,
      city: json['city'] as String?,
      country: json['country'] as String?,
    );

Map<String, dynamic> _$PlaceResponseToJson(PlaceResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
      'street': instance.street,
      'city': instance.city,
      'country': instance.country,
    };

PlacesFromAddressRequest _$PlacesFromAddressRequestFromJson(
        Map<String, dynamic> json) =>
    PlacesFromAddressRequest(
      categories: placesFromAddressRequestCategoriesListFromJson(
          json['categories'] as List?),
      radiusMeter: json['radiusMeter'] as int?,
      address: json['address'] as String?,
      countryCode: json['countryCode'] as String?,
      city: json['city'] as String?,
    );

Map<String, dynamic> _$PlacesFromAddressRequestToJson(
        PlacesFromAddressRequest instance) =>
    <String, dynamic>{
      'categories':
          placesFromAddressRequestCategoriesListToJson(instance.categories),
      'radiusMeter': instance.radiusMeter,
      'address': instance.address,
      'countryCode': instance.countryCode,
      'city': instance.city,
    };

MatchMakingResponse _$MatchMakingResponseFromJson(Map<String, dynamic> json) =>
    MatchMakingResponse(
      taskId: json['taskId'] as num?,
      errorMessage: json['errorMessage'] as String?,
    );

Map<String, dynamic> _$MatchMakingResponseToJson(
        MatchMakingResponse instance) =>
    <String, dynamic>{
      'taskId': instance.taskId,
      'errorMessage': instance.errorMessage,
    };

CreateActivityRequest _$CreateActivityRequestFromJson(
        Map<String, dynamic> json) =>
    CreateActivityRequest(
      name: json['name'] as String?,
      description: json['description'] as String?,
      startDate: json['startDate'] == null
          ? null
          : DateTime.parse(json['startDate'] as String),
      endDate: json['endDate'] == null
          ? null
          : DateTime.parse(json['endDate'] as String),
      participantsIds: (json['participantsIds'] as List<dynamic>?)
              ?.map((e) => e as num)
              .toList() ??
          [],
      color: json['color'] as String?,
      location: json['location'] as String?,
      icon: json['icon'] as String?,
    );

Map<String, dynamic> _$CreateActivityRequestToJson(
        CreateActivityRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'startDate': instance.startDate?.toIso8601String(),
      'endDate': instance.endDate?.toIso8601String(),
      'participantsIds': instance.participantsIds,
      'color': instance.color,
      'location': instance.location,
      'icon': instance.icon,
    };

ActivityModel _$ActivityModelFromJson(Map<String, dynamic> json) =>
    ActivityModel(
      id: json['id'] as num?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      startDate: json['startDate'] == null
          ? null
          : DateTime.parse(json['startDate'] as String),
      endDate: json['endDate'] == null
          ? null
          : DateTime.parse(json['endDate'] as String),
      participants: (json['participants'] as List<dynamic>?)
              ?.map((e) => GroupMemberModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      color: json['color'] as String?,
      location: json['location'] as String?,
      icon: json['icon'] as String?,
      infos:
          (json['infos'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              [],
    );

Map<String, dynamic> _$ActivityModelToJson(ActivityModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'startDate': instance.startDate?.toIso8601String(),
      'endDate': instance.endDate?.toIso8601String(),
      'participants': instance.participants?.map((e) => e.toJson()).toList(),
      'color': instance.color,
      'location': instance.location,
      'icon': instance.icon,
      'infos': instance.infos,
    };

GroupMemberModel _$GroupMemberModelFromJson(Map<String, dynamic> json) =>
    GroupMemberModel(
      userId: json['userId'] as num?,
      firstname: json['firstname'] as String?,
      lastname: json['lastname'] as String?,
      profilePicture: json['profilePicture'] as String?,
    );

Map<String, dynamic> _$GroupMemberModelToJson(GroupMemberModel instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'profilePicture': instance.profilePicture,
    };

CreatePrivateGroupRequest _$CreatePrivateGroupRequestFromJson(
        Map<String, dynamic> json) =>
    CreatePrivateGroupRequest(
      name: json['name'] as String?,
      maxSize: json['maxSize'] as int?,
    );

Map<String, dynamic> _$CreatePrivateGroupRequestToJson(
        CreatePrivateGroupRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'maxSize': instance.maxSize,
    };

ChannelModel _$ChannelModelFromJson(Map<String, dynamic> json) => ChannelModel(
      id: json['id'] as num?,
      name: json['name'] as String?,
      index: json['index'] as int?,
    );

Map<String, dynamic> _$ChannelModelToJson(ChannelModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'index': instance.index,
    };

CityModel _$CityModelFromJson(Map<String, dynamic> json) => CityModel(
      name: json['name'] as String?,
    );

Map<String, dynamic> _$CityModelToJson(CityModel instance) => <String, dynamic>{
      'name': instance.name,
    };

GroupModel _$GroupModelFromJson(Map<String, dynamic> json) => GroupModel(
      id: json['id'] as num?,
      name: json['name'] as String?,
      state: groupModelStateFromJson(json['state']),
      owner: json['owner'] == null
          ? null
          : UserModel.fromJson(json['owner'] as Map<String, dynamic>),
      maxSize: json['maxSize'] as int?,
      startOfTrip: json['startOfTrip'] == null
          ? null
          : DateTime.parse(json['startOfTrip'] as String),
      endOfTrip: json['endOfTrip'] == null
          ? null
          : DateTime.parse(json['endOfTrip'] as String),
      picture: json['picture'] as String?,
      members: (json['members'] as List<dynamic>?)
              ?.map((e) => MemberModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      channels: (json['channels'] as List<dynamic>?)
              ?.map((e) => ChannelModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      createdDate: json['createdDate'] as String?,
    );

Map<String, dynamic> _$GroupModelToJson(GroupModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'state': groupModelStateToJson(instance.state),
      'owner': instance.owner?.toJson(),
      'maxSize': instance.maxSize,
      'startOfTrip': instance.startOfTrip?.toIso8601String(),
      'endOfTrip': instance.endOfTrip?.toIso8601String(),
      'picture': instance.picture,
      'members': instance.members?.map((e) => e.toJson()).toList(),
      'channels': instance.channels?.map((e) => e.toJson()).toList(),
      'createdDate': instance.createdDate,
    };

MemberModel _$MemberModelFromJson(Map<String, dynamic> json) => MemberModel(
      id: json['id'] as num?,
      firstname: json['firstname'] as String?,
      lastname: json['lastname'] as String?,
      email: json['email'] as String?,
      birthDate: json['birthDate'] == null
          ? null
          : DateTime.parse(json['birthDate'] as String),
      gender: memberModelGenderFromJson(json['gender']),
      profilePicture: json['profilePicture'] as String?,
      city: json['city'] == null
          ? null
          : CityModel.fromJson(json['city'] as Map<String, dynamic>),
      createdDate: json['createdDate'] == null
          ? null
          : DateTime.parse(json['createdDate'] as String),
      phoneNumber: json['phoneNumber'] as String?,
      confirmed: json['confirmed'] as bool?,
    );

Map<String, dynamic> _$MemberModelToJson(MemberModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'email': instance.email,
      'birthDate': instance.birthDate?.toIso8601String(),
      'gender': memberModelGenderToJson(instance.gender),
      'profilePicture': instance.profilePicture,
      'city': instance.city?.toJson(),
      'createdDate': instance.createdDate?.toIso8601String(),
      'phoneNumber': instance.phoneNumber,
      'confirmed': instance.confirmed,
    };

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      id: json['id'] as num?,
      firstname: json['firstname'] as String?,
      lastname: json['lastname'] as String?,
      password: json['password'] as String?,
      email: json['email'] as String?,
      birthDate: json['birthDate'] == null
          ? null
          : DateTime.parse(json['birthDate'] as String),
      gender: userModelGenderFromJson(json['gender']),
      profilePicture: json['profilePicture'] as String?,
      city: json['city'] == null
          ? null
          : CityModel.fromJson(json['city'] as Map<String, dynamic>),
      createdDate: json['createdDate'] == null
          ? null
          : DateTime.parse(json['createdDate'] as String),
      phoneNumber: json['phoneNumber'] as String?,
      confirmed: json['confirmed'] as bool?,
      language: json['language'] as String?,
      roles: userModelRolesListFromJson(json['roles'] as List?),
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'password': instance.password,
      'email': instance.email,
      'birthDate': instance.birthDate?.toIso8601String(),
      'gender': userModelGenderToJson(instance.gender),
      'profilePicture': instance.profilePicture,
      'city': instance.city?.toJson(),
      'createdDate': instance.createdDate?.toIso8601String(),
      'phoneNumber': instance.phoneNumber,
      'confirmed': instance.confirmed,
      'language': instance.language,
      'roles': userModelRolesListToJson(instance.roles),
    };

ModelWithEmail _$ModelWithEmailFromJson(Map<String, dynamic> json) =>
    ModelWithEmail(
      email: json['email'] as String?,
    );

Map<String, dynamic> _$ModelWithEmailToJson(ModelWithEmail instance) =>
    <String, dynamic>{
      'email': instance.email,
    };

CreateChannelRequest _$CreateChannelRequestFromJson(
        Map<String, dynamic> json) =>
    CreateChannelRequest(
      name: json['name'] as String?,
    );

Map<String, dynamic> _$CreateChannelRequestToJson(
        CreateChannelRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
    };

UserCreationRequest _$UserCreationRequestFromJson(Map<String, dynamic> json) =>
    UserCreationRequest(
      firstname: json['firstname'] as String?,
      lastname: json['lastname'] as String?,
      password: json['password'] as String?,
      gender: json['gender'] as String?,
      birthDate: json['birthDate'] == null
          ? null
          : DateTime.parse(json['birthDate'] as String),
      phoneNumber: json['phoneNumber'] as String?,
      language: json['language'] as String?,
      city: json['city'] as String?,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$UserCreationRequestToJson(
        UserCreationRequest instance) =>
    <String, dynamic>{
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'password': instance.password,
      'gender': instance.gender,
      'birthDate': instance.birthDate?.toIso8601String(),
      'phoneNumber': instance.phoneNumber,
      'language': instance.language,
      'city': instance.city,
      'email': instance.email,
    };

AuthTokenResponse _$AuthTokenResponseFromJson(Map<String, dynamic> json) =>
    AuthTokenResponse(
      token: json['token'] as String?,
    );

Map<String, dynamic> _$AuthTokenResponseToJson(AuthTokenResponse instance) =>
    <String, dynamic>{
      'token': instance.token,
    };

LoginRequest _$LoginRequestFromJson(Map<String, dynamic> json) => LoginRequest(
      password: json['password'] as String?,
      username: json['username'] as String?,
    );

Map<String, dynamic> _$LoginRequestToJson(LoginRequest instance) =>
    <String, dynamic>{
      'password': instance.password,
      'username': instance.username,
    };

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      username: json['username'] as String?,
      token: json['token'] as String?,
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'username': instance.username,
      'token': instance.token,
    };

GoogleRequest _$GoogleRequestFromJson(Map<String, dynamic> json) =>
    GoogleRequest(
      firstname: json['firstname'] as String?,
      lastname: json['lastname'] as String?,
      accessToken: json['accessToken'] as String?,
      profilePicture: json['profilePicture'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$GoogleRequestToJson(GoogleRequest instance) =>
    <String, dynamic>{
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'accessToken': instance.accessToken,
      'profilePicture': instance.profilePicture,
      'phoneNumber': instance.phoneNumber,
      'email': instance.email,
    };

GoogleAuthResponse _$GoogleAuthResponseFromJson(Map<String, dynamic> json) =>
    GoogleAuthResponse(
      username: json['username'] as String?,
      token: json['token'] as String?,
      newUser: json['newUser'] as bool?,
    );

Map<String, dynamic> _$GoogleAuthResponseToJson(GoogleAuthResponse instance) =>
    <String, dynamic>{
      'username': instance.username,
      'token': instance.token,
      'newUser': instance.newUser,
    };

ForgotPasswordRequest _$ForgotPasswordRequestFromJson(
        Map<String, dynamic> json) =>
    ForgotPasswordRequest(
      email: json['email'] as String?,
    );

Map<String, dynamic> _$ForgotPasswordRequestToJson(
        ForgotPasswordRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
    };

ProfileUpdateRequest _$ProfileUpdateRequestFromJson(
        Map<String, dynamic> json) =>
    ProfileUpdateRequest(
      name: json['name'] as String?,
      availabilities: (json['availabilities'] as List<dynamic>?)
              ?.map((e) =>
                  AvailabilityAnswerModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      duration: json['duration'] == null
          ? null
          : RangeAnswerModel.fromJson(json['duration'] as Map<String, dynamic>),
      budget: json['budget'] == null
          ? null
          : RangeAnswerModel.fromJson(json['budget'] as Map<String, dynamic>),
      destinationTypes: profileUpdateRequestDestinationTypesListFromJson(
          json['destinationTypes'] as List?),
      ages: json['ages'] == null
          ? null
          : RangeAnswerModel.fromJson(json['ages'] as Map<String, dynamic>),
      travelWithPersonFromSameCity:
          profileUpdateRequestTravelWithPersonFromSameCityFromJson(
              json['travelWithPersonFromSameCity']),
      travelWithPersonFromSameCountry:
          profileUpdateRequestTravelWithPersonFromSameCountryFromJson(
              json['travelWithPersonFromSameCountry']),
      travelWithPersonSameLanguage:
          profileUpdateRequestTravelWithPersonSameLanguageFromJson(
              json['travelWithPersonSameLanguage']),
      gender: profileUpdateRequestGenderFromJson(json['gender']),
      groupSize: json['groupSize'] == null
          ? null
          : RangeAnswerModel.fromJson(
              json['groupSize'] as Map<String, dynamic>),
      chillOrVisit:
          profileUpdateRequestChillOrVisitFromJson(json['chillOrVisit']),
      aboutFood: profileUpdateRequestAboutFoodFromJson(json['aboutFood']),
      goOutAtNight:
          profileUpdateRequestGoOutAtNightFromJson(json['goOutAtNight']),
      sport: profileUpdateRequestSportFromJson(json['sport']),
      active: json['active'] as bool?,
    );

Map<String, dynamic> _$ProfileUpdateRequestToJson(
        ProfileUpdateRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'availabilities':
          instance.availabilities?.map((e) => e.toJson()).toList(),
      'duration': instance.duration?.toJson(),
      'budget': instance.budget?.toJson(),
      'destinationTypes': profileUpdateRequestDestinationTypesListToJson(
          instance.destinationTypes),
      'ages': instance.ages?.toJson(),
      'travelWithPersonFromSameCity':
          profileUpdateRequestTravelWithPersonFromSameCityToJson(
              instance.travelWithPersonFromSameCity),
      'travelWithPersonFromSameCountry':
          profileUpdateRequestTravelWithPersonFromSameCountryToJson(
              instance.travelWithPersonFromSameCountry),
      'travelWithPersonSameLanguage':
          profileUpdateRequestTravelWithPersonSameLanguageToJson(
              instance.travelWithPersonSameLanguage),
      'gender': profileUpdateRequestGenderToJson(instance.gender),
      'groupSize': instance.groupSize?.toJson(),
      'chillOrVisit':
          profileUpdateRequestChillOrVisitToJson(instance.chillOrVisit),
      'aboutFood': profileUpdateRequestAboutFoodToJson(instance.aboutFood),
      'goOutAtNight':
          profileUpdateRequestGoOutAtNightToJson(instance.goOutAtNight),
      'sport': profileUpdateRequestSportToJson(instance.sport),
      'active': instance.active,
    };

UserUpdateRequest _$UserUpdateRequestFromJson(Map<String, dynamic> json) =>
    UserUpdateRequest(
      firstname: json['firstname'] as String?,
      lastname: json['lastname'] as String?,
      profilePicture: json['profilePicture'] as String?,
      city: json['city'] == null
          ? null
          : CityModel.fromJson(json['city'] as Map<String, dynamic>),
      phoneNumber: json['phoneNumber'] as String?,
      birthdate: json['birthdate'] == null
          ? null
          : DateTime.parse(json['birthdate'] as String),
      gender: json['gender'] as String?,
      language: json['language'] as String?,
    );

Map<String, dynamic> _$UserUpdateRequestToJson(UserUpdateRequest instance) =>
    <String, dynamic>{
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'profilePicture': instance.profilePicture,
      'city': instance.city?.toJson(),
      'phoneNumber': instance.phoneNumber,
      'birthdate': instance.birthdate?.toIso8601String(),
      'gender': instance.gender,
      'language': instance.language,
    };

UpdateActivityRequest _$UpdateActivityRequestFromJson(
        Map<String, dynamic> json) =>
    UpdateActivityRequest(
      name: json['name'] as String?,
      description: json['description'] as String?,
      startDate: json['startDate'] == null
          ? null
          : DateTime.parse(json['startDate'] as String),
      endDate: json['endDate'] == null
          ? null
          : DateTime.parse(json['endDate'] as String),
      color: json['color'] as String?,
      location: json['location'] as String?,
      icon: json['icon'] as String?,
      infos:
          (json['infos'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              [],
    );

Map<String, dynamic> _$UpdateActivityRequestToJson(
        UpdateActivityRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'startDate': instance.startDate?.toIso8601String(),
      'endDate': instance.endDate?.toIso8601String(),
      'color': instance.color,
      'location': instance.location,
      'icon': instance.icon,
      'infos': instance.infos,
    };

UpdateGroupRequest _$UpdateGroupRequestFromJson(Map<String, dynamic> json) =>
    UpdateGroupRequest(
      name: json['name'] as String?,
      state: updateGroupRequestStateFromJson(json['state']),
      ownerId: json['ownerId'] as num?,
      maxSize: json['maxSize'] as int?,
      startOfTrip: json['startOfTrip'] == null
          ? null
          : DateTime.parse(json['startOfTrip'] as String),
      endOfTrip: json['endOfTrip'] == null
          ? null
          : DateTime.parse(json['endOfTrip'] as String),
      picture: json['picture'] as String?,
    );

Map<String, dynamic> _$UpdateGroupRequestToJson(UpdateGroupRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'state': updateGroupRequestStateToJson(instance.state),
      'ownerId': instance.ownerId,
      'maxSize': instance.maxSize,
      'startOfTrip': instance.startOfTrip?.toIso8601String(),
      'endOfTrip': instance.endOfTrip?.toIso8601String(),
      'picture': instance.picture,
    };

MessageResponse _$MessageResponseFromJson(Map<String, dynamic> json) =>
    MessageResponse(
      id: json['id'] as num?,
      channelId: json['channelId'] as num?,
      userId: json['userId'] as num?,
      content: json['content'] as String?,
      sentDate: json['sentDate'] == null
          ? null
          : DateTime.parse(json['sentDate'] as String),
      modifiedDate: json['modifiedDate'] == null
          ? null
          : DateTime.parse(json['modifiedDate'] as String),
      pinned: json['pinned'] as bool?,
      type: messageResponseType$FromJson(json['type']),
    );

Map<String, dynamic> _$MessageResponseToJson(MessageResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'channelId': instance.channelId,
      'userId': instance.userId,
      'content': instance.content,
      'sentDate': instance.sentDate?.toIso8601String(),
      'modifiedDate': instance.modifiedDate?.toIso8601String(),
      'pinned': instance.pinned,
      'type': messageResponseType$ToJson(instance.type),
    };

UpdateChannelRequest _$UpdateChannelRequestFromJson(
        Map<String, dynamic> json) =>
    UpdateChannelRequest(
      name: json['name'] as String?,
      index: json['index'] as int?,
    );

Map<String, dynamic> _$UpdateChannelRequestToJson(
        UpdateChannelRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'index': instance.index,
    };

UpdatePasswordRequest _$UpdatePasswordRequestFromJson(
        Map<String, dynamic> json) =>
    UpdatePasswordRequest(
      oldPassword: json['oldPassword'] as String?,
      newPassword: json['newPassword'] as String?,
    );

Map<String, dynamic> _$UpdatePasswordRequestToJson(
        UpdatePasswordRequest instance) =>
    <String, dynamic>{
      'oldPassword': instance.oldPassword,
      'newPassword': instance.newPassword,
    };

UpdateEmailRequest _$UpdateEmailRequestFromJson(Map<String, dynamic> json) =>
    UpdateEmailRequest(
      newEmail: json['newEmail'] as String?,
      password: json['password'] as String?,
    );

Map<String, dynamic> _$UpdateEmailRequestToJson(UpdateEmailRequest instance) =>
    <String, dynamic>{
      'newEmail': instance.newEmail,
      'password': instance.password,
    };

ConfirmationCodeModel _$ConfirmationCodeModelFromJson(
        Map<String, dynamic> json) =>
    ConfirmationCodeModel(
      value: json['value'] as String?,
    );

Map<String, dynamic> _$ConfirmationCodeModelToJson(
        ConfirmationCodeModel instance) =>
    <String, dynamic>{
      'value': instance.value,
    };

ValidateCodePasswordRequest _$ValidateCodePasswordRequestFromJson(
        Map<String, dynamic> json) =>
    ValidateCodePasswordRequest(
      value: json['value'] as String?,
      newPassword: json['newPassword'] as String?,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$ValidateCodePasswordRequestToJson(
        ValidateCodePasswordRequest instance) =>
    <String, dynamic>{
      'value': instance.value,
      'newPassword': instance.newPassword,
      'email': instance.email,
    };

UserIdResponse _$UserIdResponseFromJson(Map<String, dynamic> json) =>
    UserIdResponse(
      userId: json['userId'] as num?,
    );

Map<String, dynamic> _$UserIdResponseToJson(UserIdResponse instance) =>
    <String, dynamic>{
      'userId': instance.userId,
    };

CityEntity _$CityEntityFromJson(Map<String, dynamic> json) => CityEntity(
      id: json['id'] as num?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$CityEntityToJson(CityEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

GenderEntity _$GenderEntityFromJson(Map<String, dynamic> json) => GenderEntity(
      id: json['id'] as num?,
      value: json['value'] as String?,
    );

Map<String, dynamic> _$GenderEntityToJson(GenderEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'value': instance.value,
    };

LanguageEntity _$LanguageEntityFromJson(Map<String, dynamic> json) =>
    LanguageEntity(
      id: json['id'] as num?,
      value: json['value'] as String?,
    );

Map<String, dynamic> _$LanguageEntityToJson(LanguageEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'value': instance.value,
    };

ProfileEntity _$ProfileEntityFromJson(Map<String, dynamic> json) =>
    ProfileEntity(
      id: json['id'] as num?,
      name: json['name'] as String?,
      active: json['active'] as bool?,
    );

Map<String, dynamic> _$ProfileEntityToJson(ProfileEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'active': instance.active,
    };

RoleEntity _$RoleEntityFromJson(Map<String, dynamic> json) => RoleEntity(
      id: json['id'] as num?,
      name: json['name'] as String?,
      authority: json['authority'] as String?,
    );

Map<String, dynamic> _$RoleEntityToJson(RoleEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'authority': instance.authority,
    };

UserEntity _$UserEntityFromJson(Map<String, dynamic> json) => UserEntity(
      id: json['id'] as num?,
      firstname: json['firstname'] as String?,
      lastname: json['lastname'] as String?,
      password: json['password'] as String?,
      email: json['email'] as String?,
      birthDate: json['birthDate'] == null
          ? null
          : DateTime.parse(json['birthDate'] as String),
      gender: json['gender'] == null
          ? null
          : GenderEntity.fromJson(json['gender'] as Map<String, dynamic>),
      profilePicture: json['profilePicture'] as String?,
      city: json['city'] == null
          ? null
          : CityEntity.fromJson(json['city'] as Map<String, dynamic>),
      createdDate: json['createdDate'] == null
          ? null
          : DateTime.parse(json['createdDate'] as String),
      phoneNumber: json['phoneNumber'] as String?,
      confirmed: json['confirmed'] as bool?,
      language: json['language'] == null
          ? null
          : LanguageEntity.fromJson(json['language'] as Map<String, dynamic>),
      roles: (json['roles'] as List<dynamic>?)
              ?.map((e) => RoleEntity.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      profiles: (json['profiles'] as List<dynamic>?)
              ?.map((e) => ProfileEntity.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      waitingForGroup: json['waitingForGroup'] as bool?,
    );

Map<String, dynamic> _$UserEntityToJson(UserEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'password': instance.password,
      'email': instance.email,
      'birthDate': instance.birthDate?.toIso8601String(),
      'gender': instance.gender?.toJson(),
      'profilePicture': instance.profilePicture,
      'city': instance.city?.toJson(),
      'createdDate': instance.createdDate?.toIso8601String(),
      'phoneNumber': instance.phoneNumber,
      'confirmed': instance.confirmed,
      'language': instance.language?.toJson(),
      'roles': instance.roles?.map((e) => e.toJson()).toList(),
      'profiles': instance.profiles?.map((e) => e.toJson()).toList(),
      'waitingForGroup': instance.waitingForGroup,
    };

MatchMakingResult _$MatchMakingResultFromJson(Map<String, dynamic> json) =>
    MatchMakingResult(
      type: matchMakingResultType$FromJson(json['type']),
      groupId: json['groupId'] as num?,
    );

Map<String, dynamic> _$MatchMakingResultToJson(MatchMakingResult instance) =>
    <String, dynamic>{
      'type': matchMakingResultType$ToJson(instance.type),
      'groupId': instance.groupId,
    };

DeleteUserRequest _$DeleteUserRequestFromJson(Map<String, dynamic> json) =>
    DeleteUserRequest(
      password: json['password'] as String?,
    );

Map<String, dynamic> _$DeleteUserRequestToJson(DeleteUserRequest instance) =>
    <String, dynamic>{
      'password': instance.password,
    };

DeleteUserByAdminRequest _$DeleteUserByAdminRequestFromJson(
        Map<String, dynamic> json) =>
    DeleteUserByAdminRequest(
      reason: json['reason'] as String?,
    );

Map<String, dynamic> _$DeleteUserByAdminRequestToJson(
        DeleteUserByAdminRequest instance) =>
    <String, dynamic>{
      'reason': instance.reason,
    };
