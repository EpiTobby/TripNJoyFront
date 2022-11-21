// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api.swagger.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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

VoteModel _$VoteModelFromJson(Map<String, dynamic> json) => VoteModel(
      id: json['id'] as num?,
      voter: json['voter'] as num?,
      answer: json['answer'] == null
          ? null
          : PossibleAnswerModel.fromJson(
              json['answer'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$VoteModelToJson(VoteModel instance) => <String, dynamic>{
      'id': instance.id,
      'voter': instance.voter,
      'answer': instance.answer?.toJson(),
    };

GroupMemoriesResponse _$GroupMemoriesResponseFromJson(
        Map<String, dynamic> json) =>
    GroupMemoriesResponse(
      memories: (json['memories'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
    );

Map<String, dynamic> _$GroupMemoriesResponseToJson(
        GroupMemoriesResponse instance) =>
    <String, dynamic>{
      'memories': instance.memories,
    };

CreatePrivateGroupRequest _$CreatePrivateGroupRequestFromJson(
        Map<String, dynamic> json) =>
    CreatePrivateGroupRequest(
      name: json['name'] as String?,
      description: json['description'] as String?,
      maxSize: json['maxSize'] as int?,
    );

Map<String, dynamic> _$CreatePrivateGroupRequestToJson(
        CreatePrivateGroupRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'maxSize': instance.maxSize,
    };

PossibleAnswerRequest _$PossibleAnswerRequestFromJson(
        Map<String, dynamic> json) =>
    PossibleAnswerRequest(
      content: json['content'] as String?,
      rightAnswer: json['rightAnswer'] as bool?,
    );

Map<String, dynamic> _$PossibleAnswerRequestToJson(
        PossibleAnswerRequest instance) =>
    <String, dynamic>{
      'content': instance.content,
      'rightAnswer': instance.rightAnswer,
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

SubmitRecommendationRequest _$SubmitRecommendationRequestFromJson(
        Map<String, dynamic> json) =>
    SubmitRecommendationRequest(
      reviewedUserId: json['reviewedUserId'] as num?,
      comment: json['comment'] as String?,
    );

Map<String, dynamic> _$SubmitRecommendationRequestToJson(
        SubmitRecommendationRequest instance) =>
    <String, dynamic>{
      'reviewedUserId': instance.reviewedUserId,
      'comment': instance.comment,
    };

DebtDetailsResponse _$DebtDetailsResponseFromJson(Map<String, dynamic> json) =>
    DebtDetailsResponse(
      indebtedUser: json['indebtedUser'] as num?,
      purchaser: json['purchaser'] as num?,
      description: json['description'] as String?,
      amountToPay: (json['amountToPay'] as num?)?.toDouble(),
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$DebtDetailsResponseToJson(
        DebtDetailsResponse instance) =>
    <String, dynamic>{
      'indebtedUser': instance.indebtedUser,
      'purchaser': instance.purchaser,
      'description': instance.description,
      'amountToPay': instance.amountToPay,
      'date': instance.date?.toIso8601String(),
    };

ActivityResponse _$ActivityResponseFromJson(Map<String, dynamic> json) =>
    ActivityResponse(
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
              ?.map((e) => e as num)
              .toList() ??
          [],
      color: json['color'] as String?,
      location: json['location'] as String?,
      icon: json['icon'] as String?,
      infos:
          (json['infos'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              [],
    );

Map<String, dynamic> _$ActivityResponseToJson(ActivityResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'startDate': instance.startDate?.toIso8601String(),
      'endDate': instance.endDate?.toIso8601String(),
      'participants': instance.participants,
      'color': instance.color,
      'location': instance.location,
      'icon': instance.icon,
      'infos': instance.infos,
    };

AuthTokenResponse _$AuthTokenResponseFromJson(Map<String, dynamic> json) =>
    AuthTokenResponse(
      token: json['token'] as String?,
    );

Map<String, dynamic> _$AuthTokenResponseToJson(AuthTokenResponse instance) =>
    <String, dynamic>{
      'token': instance.token,
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

DeleteUserRequest _$DeleteUserRequestFromJson(Map<String, dynamic> json) =>
    DeleteUserRequest(
      password: json['password'] as String?,
    );

Map<String, dynamic> _$DeleteUserRequestToJson(DeleteUserRequest instance) =>
    <String, dynamic>{
      'password': instance.password,
    };

JwtUserDetails _$JwtUserDetailsFromJson(Map<String, dynamic> json) =>
    JwtUserDetails(
      userId: json['userId'] as num?,
      username: json['username'] as String?,
      roles:
          (json['roles'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              [],
    );

Map<String, dynamic> _$JwtUserDetailsToJson(JwtUserDetails instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'username': instance.username,
      'roles': instance.roles,
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

GroupInfoModel _$GroupInfoModelFromJson(Map<String, dynamic> json) =>
    GroupInfoModel(
      id: json['id'] as num?,
      name: json['name'] as String?,
      members: (json['members'] as List<dynamic>?)
              ?.map((e) => GroupMemberModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      maxSize: json['maxSize'] as int?,
      state: groupInfoModelStateFromJson(json['state']),
      picture: json['picture'] as String?,
    );

Map<String, dynamic> _$GroupInfoModelToJson(GroupInfoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'members': instance.members?.map((e) => e.toJson()).toList(),
      'maxSize': instance.maxSize,
      'state': groupInfoModelStateToJson(instance.state),
      'picture': instance.picture,
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

CreatePublicGroupRequest _$CreatePublicGroupRequestFromJson(
        Map<String, dynamic> json) =>
    CreatePublicGroupRequest(
      user1: json['user1'] as num?,
      user2: json['user2'] as num?,
      profile1: json['profile1'] as num?,
      profile2: json['profile2'] as num?,
      maxSize: json['maxSize'] as int?,
    );

Map<String, dynamic> _$CreatePublicGroupRequestToJson(
        CreatePublicGroupRequest instance) =>
    <String, dynamic>{
      'user1': instance.user1,
      'user2': instance.user2,
      'profile1': instance.profile1,
      'profile2': instance.profile2,
      'maxSize': instance.maxSize,
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
      createdDate: json['createdDate'] == null
          ? null
          : DateTime.parse(json['createdDate'] as String),
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
      'createdDate': instance.createdDate?.toIso8601String(),
      'active': instance.active,
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

UpdateSurveyRequest _$UpdateSurveyRequestFromJson(Map<String, dynamic> json) =>
    UpdateSurveyRequest(
      question: json['question'] as String?,
      possibleAnswers: (json['possibleAnswers'] as List<dynamic>?)
              ?.map((e) =>
                  PossibleAnswerRequest.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      multipleChoiceSurvey: json['multipleChoiceSurvey'] as bool?,
    );

Map<String, dynamic> _$UpdateSurveyRequestToJson(
        UpdateSurveyRequest instance) =>
    <String, dynamic>{
      'question': instance.question,
      'possibleAnswers':
          instance.possibleAnswers?.map((e) => e.toJson()).toList(),
      'multipleChoiceSurvey': instance.multipleChoiceSurvey,
    };

ScanResponse _$ScanResponseFromJson(Map<String, dynamic> json) => ScanResponse(
      items: json['items'] as Map<String, dynamic>?,
      total: (json['total'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ScanResponseToJson(ScanResponse instance) =>
    <String, dynamic>{
      'items': instance.items,
      'total': instance.total,
    };

ExpenseMemberModel _$ExpenseMemberModelFromJson(Map<String, dynamic> json) =>
    ExpenseMemberModel(
      userId: json['userId'] as num?,
      amountToPay: (json['amountToPay'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ExpenseMemberModelToJson(ExpenseMemberModel instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'amountToPay': instance.amountToPay,
    };

UpdatePrivateGroupRequest _$UpdatePrivateGroupRequestFromJson(
        Map<String, dynamic> json) =>
    UpdatePrivateGroupRequest(
      name: json['name'] as String?,
      description: json['description'] as String?,
      state: updatePrivateGroupRequestStateFromJson(json['state']),
      ownerId: json['ownerId'] as num?,
      maxSize: json['maxSize'] as int?,
      startOfTrip: json['startOfTrip'] == null
          ? null
          : DateTime.parse(json['startOfTrip'] as String),
      endOfTrip: json['endOfTrip'] == null
          ? null
          : DateTime.parse(json['endOfTrip'] as String),
      picture: json['picture'] as String?,
      destination: json['destination'] as String?,
    );

Map<String, dynamic> _$UpdatePrivateGroupRequestToJson(
        UpdatePrivateGroupRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'state': updatePrivateGroupRequestStateToJson(instance.state),
      'ownerId': instance.ownerId,
      'maxSize': instance.maxSize,
      'startOfTrip': instance.startOfTrip?.toIso8601String(),
      'endOfTrip': instance.endOfTrip?.toIso8601String(),
      'picture': instance.picture,
      'destination': instance.destination,
    };

CheckJwtResponse _$CheckJwtResponseFromJson(Map<String, dynamic> json) =>
    CheckJwtResponse(
      isValid: json['isValid'] as bool?,
      userDetails: json['userDetails'] == null
          ? null
          : JwtUserDetails.fromJson(
              json['userDetails'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CheckJwtResponseToJson(CheckJwtResponse instance) =>
    <String, dynamic>{
      'isValid': instance.isValid,
      'userDetails': instance.userDetails?.toJson(),
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

UpdateReportRequest _$UpdateReportRequestFromJson(Map<String, dynamic> json) =>
    UpdateReportRequest(
      reason: updateReportRequestReasonFromJson(json['reason']),
      details: json['details'] as String?,
    );

Map<String, dynamic> _$UpdateReportRequestToJson(
        UpdateReportRequest instance) =>
    <String, dynamic>{
      'reason': updateReportRequestReasonToJson(instance.reason),
      'details': instance.details,
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

PostSurveyRequest _$PostSurveyRequestFromJson(Map<String, dynamic> json) =>
    PostSurveyRequest(
      userId: json['userId'] as num?,
      content: json['content'] as String?,
      quizz: json['quizz'] as bool?,
      possibleAnswers: (json['possibleAnswers'] as List<dynamic>?)
              ?.map((e) =>
                  PossibleAnswerRequest.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      isMultipleChoiceSurvey: json['isMultipleChoiceSurvey'] as bool?,
      type: postSurveyRequestType$FromJson(json['type']),
      multipleChoiceSurvey: json['multipleChoiceSurvey'] as bool?,
    );

Map<String, dynamic> _$PostSurveyRequestToJson(PostSurveyRequest instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'content': instance.content,
      'quizz': instance.quizz,
      'possibleAnswers':
          instance.possibleAnswers?.map((e) => e.toJson()).toList(),
      'isMultipleChoiceSurvey': instance.isMultipleChoiceSurvey,
      'type': postSurveyRequestType$ToJson(instance.type),
      'multipleChoiceSurvey': instance.multipleChoiceSurvey,
    };

PossibleAnswerModel _$PossibleAnswerModelFromJson(Map<String, dynamic> json) =>
    PossibleAnswerModel(
      id: json['id'] as num?,
      content: json['content'] as String?,
      rightAnswer: json['rightAnswer'] as bool?,
    );

Map<String, dynamic> _$PossibleAnswerModelToJson(
        PossibleAnswerModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'rightAnswer': instance.rightAnswer,
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

CheckJwtRequest _$CheckJwtRequestFromJson(Map<String, dynamic> json) =>
    CheckJwtRequest(
      jwt: json['jwt'] as String?,
    );

Map<String, dynamic> _$CheckJwtRequestToJson(CheckJwtRequest instance) =>
    <String, dynamic>{
      'jwt': instance.jwt,
    };

MoneyDueResponse _$MoneyDueResponseFromJson(Map<String, dynamic> json) =>
    MoneyDueResponse(
      userId: json['userId'] as num?,
      total: (json['total'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$MoneyDueResponseToJson(MoneyDueResponse instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'total': instance.total,
    };

NotificationModel _$NotificationModelFromJson(Map<String, dynamic> json) =>
    NotificationModel(
      title: json['title'] as String?,
      body: json['body'] as String?,
      userId: json['userId'] as num?,
      id: json['id'] as num?,
      firebaseId: json['firebaseId'] as String?,
    );

Map<String, dynamic> _$NotificationModelToJson(NotificationModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'body': instance.body,
      'userId': instance.userId,
      'id': instance.id,
      'firebaseId': instance.firebaseId,
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

ReportResponse _$ReportResponseFromJson(Map<String, dynamic> json) =>
    ReportResponse(
      id: json['id'] as num?,
      reason: reportResponseReasonFromJson(json['reason']),
      details: json['details'] as String?,
      reportedUser: json['reportedUser'] as num?,
      submitter: json['submitter'] as num?,
      createdDate: json['createdDate'] == null
          ? null
          : DateTime.parse(json['createdDate'] as String),
    );

Map<String, dynamic> _$ReportResponseToJson(ReportResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'reason': reportResponseReasonToJson(instance.reason),
      'details': instance.details,
      'reportedUser': instance.reportedUser,
      'submitter': instance.submitter,
      'createdDate': instance.createdDate?.toIso8601String(),
    };

MatchMakingResult _$MatchMakingResultFromJson(Map<String, dynamic> json) =>
    MatchMakingResult(
      type: matchMakingResultType$FromJson(json['type']),
      groupId: json['groupId'] as num?,
      userId: json['userId'] as num?,
      profileId: json['profileId'] as num?,
    );

Map<String, dynamic> _$MatchMakingResultToJson(MatchMakingResult instance) =>
    <String, dynamic>{
      'type': matchMakingResultType$ToJson(instance.type),
      'groupId': instance.groupId,
      'userId': instance.userId,
      'profileId': instance.profileId,
    };

CityModel _$CityModelFromJson(Map<String, dynamic> json) => CityModel(
      name: json['name'] as String?,
    );

Map<String, dynamic> _$CityModelToJson(CityModel instance) => <String, dynamic>{
      'name': instance.name,
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

UpdatePublicGroupRequest _$UpdatePublicGroupRequestFromJson(
        Map<String, dynamic> json) =>
    UpdatePublicGroupRequest(
      name: json['name'] as String?,
      description: json['description'] as String?,
      startOfTrip: json['startOfTrip'] == null
          ? null
          : DateTime.parse(json['startOfTrip'] as String),
      endOfTrip: json['endOfTrip'] == null
          ? null
          : DateTime.parse(json['endOfTrip'] as String),
      picture: json['picture'] as String?,
      destination: json['destination'] as String?,
    );

Map<String, dynamic> _$UpdatePublicGroupRequestToJson(
        UpdatePublicGroupRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'startOfTrip': instance.startOfTrip?.toIso8601String(),
      'endOfTrip': instance.endOfTrip?.toIso8601String(),
      'picture': instance.picture,
      'destination': instance.destination,
    };

VoteSurveyRequest _$VoteSurveyRequestFromJson(Map<String, dynamic> json) =>
    VoteSurveyRequest(
      answerId: json['answerId'] as num?,
    );

Map<String, dynamic> _$VoteSurveyRequestToJson(VoteSurveyRequest instance) =>
    <String, dynamic>{
      'answerId': instance.answerId,
    };

ModelWithEmail _$ModelWithEmailFromJson(Map<String, dynamic> json) =>
    ModelWithEmail(
      email: json['email'] as String?,
    );

Map<String, dynamic> _$ModelWithEmailToJson(ModelWithEmail instance) =>
    <String, dynamic>{
      'email': instance.email,
    };

SubmitReportRequest _$SubmitReportRequestFromJson(Map<String, dynamic> json) =>
    SubmitReportRequest(
      reportedUserId: json['reportedUserId'] as num?,
      reason: submitReportRequestReasonFromJson(json['reason']),
      details: json['details'] as String?,
    );

Map<String, dynamic> _$SubmitReportRequestToJson(
        SubmitReportRequest instance) =>
    <String, dynamic>{
      'reportedUserId': instance.reportedUserId,
      'reason': submitReportRequestReasonToJson(instance.reason),
      'details': instance.details,
    };

UserIdResponse _$UserIdResponseFromJson(Map<String, dynamic> json) =>
    UserIdResponse(
      userId: json['userId'] as num?,
    );

Map<String, dynamic> _$UserIdResponseToJson(UserIdResponse instance) =>
    <String, dynamic>{
      'userId': instance.userId,
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

BooleanResponse _$BooleanResponseFromJson(Map<String, dynamic> json) =>
    BooleanResponse(
      value: json['value'] as bool?,
    );

Map<String, dynamic> _$BooleanResponseToJson(BooleanResponse instance) =>
    <String, dynamic>{
      'value': instance.value,
    };

GroupResponse _$GroupResponseFromJson(Map<String, dynamic> json) =>
    GroupResponse(
      id: json['id'] as num?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      state: groupResponseStateFromJson(json['state']),
      ownerId: json['ownerId'] as num?,
      maxSize: json['maxSize'] as int?,
      startOfTrip: json['startOfTrip'] == null
          ? null
          : DateTime.parse(json['startOfTrip'] as String),
      endOfTrip: json['endOfTrip'] == null
          ? null
          : DateTime.parse(json['endOfTrip'] as String),
      picture: json['picture'] as String?,
      destination: json['destination'] as String?,
      members:
          (json['members'] as List<dynamic>?)?.map((e) => e as num).toList() ??
              [],
      createdDate: json['createdDate'] as String?,
    );

Map<String, dynamic> _$GroupResponseToJson(GroupResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'state': groupResponseStateToJson(instance.state),
      'ownerId': instance.ownerId,
      'maxSize': instance.maxSize,
      'startOfTrip': instance.startOfTrip?.toIso8601String(),
      'endOfTrip': instance.endOfTrip?.toIso8601String(),
      'picture': instance.picture,
      'destination': instance.destination,
      'members': instance.members,
      'createdDate': instance.createdDate,
    };

UserResponse _$UserResponseFromJson(Map<String, dynamic> json) => UserResponse(
      id: json['id'] as num?,
      firstname: json['firstname'] as String?,
      lastname: json['lastname'] as String?,
      email: json['email'] as String?,
      birthDate: json['birthDate'] == null
          ? null
          : DateTime.parse(json['birthDate'] as String),
      gender: userResponseGenderFromJson(json['gender']),
      profilePicture: json['profilePicture'] as String?,
      city: json['city'] as String?,
      createdDate: json['createdDate'] == null
          ? null
          : DateTime.parse(json['createdDate'] as String),
      phoneNumber: json['phoneNumber'] as String?,
      confirmed: json['confirmed'] as bool?,
      language: json['language'] as String?,
    );

Map<String, dynamic> _$UserResponseToJson(UserResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'email': instance.email,
      'birthDate': instance.birthDate?.toIso8601String(),
      'gender': userResponseGenderToJson(instance.gender),
      'profilePicture': instance.profilePicture,
      'city': instance.city,
      'createdDate': instance.createdDate?.toIso8601String(),
      'phoneNumber': instance.phoneNumber,
      'confirmed': instance.confirmed,
      'language': instance.language,
    };

MoneyDueRequest _$MoneyDueRequestFromJson(Map<String, dynamic> json) =>
    MoneyDueRequest(
      userId: json['userId'] as num?,
      money: (json['money'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$MoneyDueRequestToJson(MoneyDueRequest instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'money': instance.money,
    };

ScanRequest _$ScanRequestFromJson(Map<String, dynamic> json) => ScanRequest(
      minioUrl: json['minioUrl'] as String?,
    );

Map<String, dynamic> _$ScanRequestToJson(ScanRequest instance) =>
    <String, dynamic>{
      'minioUrl': instance.minioUrl,
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

BalanceResponse _$BalanceResponseFromJson(Map<String, dynamic> json) =>
    BalanceResponse(
      user: json['user'] as num?,
      money: (json['money'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$BalanceResponseToJson(BalanceResponse instance) =>
    <String, dynamic>{
      'user': instance.user,
      'money': instance.money,
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

SurveyModel _$SurveyModelFromJson(Map<String, dynamic> json) => SurveyModel(
      id: json['id'] as num?,
      channelId: json['channelId'] as num?,
      question: json['question'] as String?,
      submitter: json['submitter'] as num?,
      quizz: json['quizz'] as bool?,
      sendDate: json['sendDate'] == null
          ? null
          : DateTime.parse(json['sendDate'] as String),
      modifiedDate: json['modifiedDate'] == null
          ? null
          : DateTime.parse(json['modifiedDate'] as String),
      possibleAnswers: (json['possibleAnswers'] as List<dynamic>?)
              ?.map((e) =>
                  PossibleAnswerModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      votes: (json['votes'] as List<dynamic>?)
              ?.map((e) => VoteModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      type: surveyModelType$FromJson(json['type']),
      multipleChoiceSurvey: json['multipleChoiceSurvey'] as bool?,
    );

Map<String, dynamic> _$SurveyModelToJson(SurveyModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'channelId': instance.channelId,
      'question': instance.question,
      'submitter': instance.submitter,
      'quizz': instance.quizz,
      'sendDate': instance.sendDate?.toIso8601String(),
      'modifiedDate': instance.modifiedDate?.toIso8601String(),
      'possibleAnswers':
          instance.possibleAnswers?.map((e) => e.toJson()).toList(),
      'votes': instance.votes?.map((e) => e.toJson()).toList(),
      'type': surveyModelType$ToJson(instance.type),
      'multipleChoiceSurvey': instance.multipleChoiceSurvey,
    };

JoinGroupWithoutInviteModel _$JoinGroupWithoutInviteModelFromJson(
        Map<String, dynamic> json) =>
    JoinGroupWithoutInviteModel(
      message: json['message'] as String?,
    );

Map<String, dynamic> _$JoinGroupWithoutInviteModelToJson(
        JoinGroupWithoutInviteModel instance) =>
    <String, dynamic>{
      'message': instance.message,
    };

RecommendationResponse _$RecommendationResponseFromJson(
        Map<String, dynamic> json) =>
    RecommendationResponse(
      id: json['id'] as num?,
      reviewer: json['reviewer'] as num?,
      recommendedUser: json['recommendedUser'] as num?,
      comment: json['comment'] as String?,
    );

Map<String, dynamic> _$RecommendationResponseToJson(
        RecommendationResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'reviewer': instance.reviewer,
      'recommendedUser': instance.recommendedUser,
      'comment': instance.comment,
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

ExpenseRequest _$ExpenseRequestFromJson(Map<String, dynamic> json) =>
    ExpenseRequest(
      description: json['description'] as String?,
      moneyDueByEachUser: (json['moneyDueByEachUser'] as List<dynamic>?)
              ?.map((e) => MoneyDueRequest.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      icon: json['icon'] as String?,
      evenlyDivided: json['evenlyDivided'] as bool?,
      total: (json['total'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ExpenseRequestToJson(ExpenseRequest instance) =>
    <String, dynamic>{
      'description': instance.description,
      'moneyDueByEachUser':
          instance.moneyDueByEachUser?.map((e) => e.toJson()).toList(),
      'icon': instance.icon,
      'evenlyDivided': instance.evenlyDivided,
      'total': instance.total,
    };

FirebaseTokenResponse _$FirebaseTokenResponseFromJson(
        Map<String, dynamic> json) =>
    FirebaseTokenResponse(
      token: json['token'] as String?,
    );

Map<String, dynamic> _$FirebaseTokenResponseToJson(
        FirebaseTokenResponse instance) =>
    <String, dynamic>{
      'token': instance.token,
    };

ExpenseModel _$ExpenseModelFromJson(Map<String, dynamic> json) => ExpenseModel(
      id: json['id'] as num?,
      description: json['description'] as String?,
      total: (json['total'] as num?)?.toDouble(),
      groupId: json['groupId'] as num?,
      purchaserId: json['purchaserId'] as num?,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      icon: json['icon'] as String?,
      indebtedUsers: (json['indebtedUsers'] as List<dynamic>?)
              ?.map(
                  (e) => ExpenseMemberModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$ExpenseModelToJson(ExpenseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'total': instance.total,
      'groupId': instance.groupId,
      'purchaserId': instance.purchaserId,
      'date': instance.date?.toIso8601String(),
      'icon': instance.icon,
      'indebtedUsers': instance.indebtedUsers?.map((e) => e.toJson()).toList(),
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
      participants: (json['participants'] as List<dynamic>?)
              ?.map((e) => e as num)
              .toList() ??
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
      'participants': instance.participants,
    };

GroupMemoryRequest _$GroupMemoryRequestFromJson(Map<String, dynamic> json) =>
    GroupMemoryRequest(
      memoryUrl: json['memoryUrl'] as String?,
    );

Map<String, dynamic> _$GroupMemoryRequestToJson(GroupMemoryRequest instance) =>
    <String, dynamic>{
      'memoryUrl': instance.memoryUrl,
    };
