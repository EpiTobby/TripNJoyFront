import 'package:json_annotation/json_annotation.dart';
import 'package:collection/collection.dart';

import 'package:chopper/chopper.dart';
import 'client_mapping.dart';
import 'package:chopper/chopper.dart' as chopper;
import 'api.enums.swagger.dart' as enums;
export 'api.enums.swagger.dart';

part 'api.swagger.chopper.dart';
part 'api.swagger.g.dart';

// **************************************************************************
// SwaggerChopperGenerator
// **************************************************************************

@ChopperApi()
abstract class Api extends ChopperService {
  static Api create({ChopperClient? client, String? baseUrl}) {
    if (client != null) {
      return _$Api(client);
    }

    final newClient = ChopperClient(
        services: [_$Api()],
        converter: $JsonSerializableConverter(),
        baseUrl: baseUrl ?? 'http://');
    return _$Api(newClient);
  }

  ///
  ///@param id
  Future<chopper.Response<List<ProfileModel>>> idProfilesGet(
      {required num? id}) {
    generatedMapping.putIfAbsent(
        ProfileModel, () => ProfileModel.fromJsonFactory);

    return _idProfilesGet(id: id);
  }

  ///
  ///@param id
  @Get(path: '/{id}/profiles')
  Future<chopper.Response<List<ProfileModel>>> _idProfilesGet(
      {@Path('id') required num? id});

  ///
  ///@param id
  Future<chopper.Response<ProfileModel>> idProfilesPost(
      {required num? id, required ProfileCreationModel? body}) {
    generatedMapping.putIfAbsent(
        ProfileModel, () => ProfileModel.fromJsonFactory);

    return _idProfilesPost(id: id, body: body);
  }

  ///
  ///@param id
  @Post(path: '/{id}/profiles')
  Future<chopper.Response<ProfileModel>> _idProfilesPost(
      {@Path('id') required num? id,
      @Body() required ProfileCreationModel? body});

  ///Will send a new confirmation code to the user
  ///@param id
  Future<chopper.Response> authIdResendPost({required num? id}) {
    return _authIdResendPost(id: id);
  }

  ///Will send a new confirmation code to the user
  ///@param id
  @Post(path: '/auth/{id}/resend', optionalBody: true)
  Future<chopper.Response> _authIdResendPost({@Path('id') required num? id});

  ///Create a new account. Will send a confirmation mail to the given address
  Future<chopper.Response<AuthTokenResponse>> authRegisterPost(
      {required UserCreationRequest? body}) {
    generatedMapping.putIfAbsent(
        AuthTokenResponse, () => AuthTokenResponse.fromJsonFactory);

    return _authRegisterPost(body: body);
  }

  ///Create a new account. Will send a confirmation mail to the given address
  @Post(path: '/auth/register')
  Future<chopper.Response<AuthTokenResponse>> _authRegisterPost(
      {@Body() required UserCreationRequest? body});

  ///Log a user, to allow authenticated endpoints
  Future<chopper.Response<LoginResponse>> authLoginPost(
      {required LoginRequest? body}) {
    generatedMapping.putIfAbsent(
        LoginResponse, () => LoginResponse.fromJsonFactory);

    return _authLoginPost(body: body);
  }

  ///Log a user, to allow authenticated endpoints
  @Post(path: '/auth/login')
  Future<chopper.Response<LoginResponse>> _authLoginPost(
      {@Body() required LoginRequest? body});

  ///Log a user, to allow authenticated endpoints
  Future<chopper.Response<LoginResponse>> authGooglePost(
      {required GoogleRequest? body}) {
    generatedMapping.putIfAbsent(
        LoginResponse, () => LoginResponse.fromJsonFactory);

    return _authGooglePost(body: body);
  }

  ///Log a user, to allow authenticated endpoints
  @Post(path: '/auth/google')
  Future<chopper.Response<LoginResponse>> _authGooglePost(
      {@Body() required GoogleRequest? body});

  ///Used to receive a confirmation to update a password
  Future<chopper.Response> authForgotPasswordPost(
      {required ForgotPasswordRequest? body}) {
    return _authForgotPasswordPost(body: body);
  }

  ///Used to receive a confirmation to update a password
  @Post(path: '/auth/forgot/password')
  Future<chopper.Response> _authForgotPasswordPost(
      {@Body() required ForgotPasswordRequest? body});

  ///Used to update the user information
  ///@param id
  Future<chopper.Response> usersIdUpdatePatch(
      {required num? id, required UserUpdateRequest? body}) {
    return _usersIdUpdatePatch(id: id, body: body);
  }

  ///Used to update the user information
  ///@param id
  @Patch(path: '/users/{id}/update')
  Future<chopper.Response> _usersIdUpdatePatch(
      {@Path('id') required num? id, @Body() required UserUpdateRequest? body});

  ///Used to update the password
  ///@param id
  Future<chopper.Response> authIdPasswordPatch(
      {required num? id, required UpdatePasswordRequest? body}) {
    return _authIdPasswordPatch(id: id, body: body);
  }

  ///Used to update the password
  ///@param id
  @Patch(path: '/auth/{id}/password')
  Future<chopper.Response> _authIdPasswordPatch(
      {@Path('id') required num? id,
      @Body() required UpdatePasswordRequest? body});

  ///Used to ask update the user email. Returns a new jwt
  ///@param id
  Future<chopper.Response<LoginResponse>> authIdEmailPatch(
      {required num? id, required UpdateEmailRequest? body}) {
    generatedMapping.putIfAbsent(
        LoginResponse, () => LoginResponse.fromJsonFactory);

    return _authIdEmailPatch(id: id, body: body);
  }

  ///Used to ask update the user email. Returns a new jwt
  ///@param id
  @Patch(path: '/auth/{id}/email')
  Future<chopper.Response<LoginResponse>> _authIdEmailPatch(
      {@Path('id') required num? id,
      @Body() required UpdateEmailRequest? body});

  ///Confirm a user's email
  ///@param id
  Future<chopper.Response> authIdConfirmationPatch(
      {required num? id, required ConfirmationCodeModel? body}) {
    return _authIdConfirmationPatch(id: id, body: body);
  }

  ///Confirm a user's email
  ///@param id
  @Patch(path: '/auth/{id}/confirmation')
  Future<chopper.Response> _authIdConfirmationPatch(
      {@Path('id') required num? id,
      @Body() required ConfirmationCodeModel? body});

  ///Used to update the password with a confirmation code
  Future<chopper.Response<UserIdResponse>> authValidationPasswordPatch(
      {required ValidateCodePasswordRequest? body}) {
    generatedMapping.putIfAbsent(
        UserIdResponse, () => UserIdResponse.fromJsonFactory);

    return _authValidationPasswordPatch(body: body);
  }

  ///Used to update the password with a confirmation code
  @Patch(path: '/auth/validation/password')
  Future<chopper.Response<UserIdResponse>> _authValidationPasswordPatch(
      {@Body() required ValidateCodePasswordRequest? body});

  ///
  Future<chopper.Response<List<ProfileModel>>> idProfilesActiveGet() {
    generatedMapping.putIfAbsent(
        ProfileModel, () => ProfileModel.fromJsonFactory);

    return _idProfilesActiveGet();
  }

  ///
  @Get(path: '/{id}/profiles/active')
  Future<chopper.Response<List<ProfileModel>>> _idProfilesActiveGet();

  ///
  Future<chopper.Response<Object>> usersGet() {
    return _usersGet();
  }

  ///
  @Get(path: '/users')
  Future<chopper.Response<Object>> _usersGet();

  ///
  ///@param id
  Future<chopper.Response<UserModel>> usersIdGet({required num? id}) {
    generatedMapping.putIfAbsent(UserModel, () => UserModel.fromJsonFactory);

    return _usersIdGet(id: id);
  }

  ///
  ///@param id
  @Get(path: '/users/{id}')
  Future<chopper.Response<UserModel>> _usersIdGet(
      {@Path('id') required num? id});

  ///
  ///@param id
  Future<chopper.Response> usersIdDelete(
      {required num? id, required DeleteUserRequest? body}) {
    return _usersIdDelete(id: id, body: body);
  }

  ///
  ///@param id
  @Delete(path: '/users/{id}')
  Future<chopper.Response> _usersIdDelete(
      {@Path('id') required num? id, @Body() required DeleteUserRequest? body});

  ///
  Future<chopper.Response<UserModel>> usersMeGet() {
    generatedMapping.putIfAbsent(UserModel, () => UserModel.fromJsonFactory);

    return _usersMeGet();
  }

  ///
  @Get(path: '/users/me')
  Future<chopper.Response<UserModel>> _usersMeGet();

  ///
  ///@param id
  ///@param profile
  Future<chopper.Response> idProfilesProfileDelete(
      {required num? id, required num? profile}) {
    return _idProfilesProfileDelete(id: id, profile: profile);
  }

  ///
  ///@param id
  ///@param profile
  @Delete(path: '/{id}/profiles/{profile}')
  Future<chopper.Response> _idProfilesProfileDelete(
      {@Path('id') required num? id, @Path('profile') required num? profile});

  ///
  ///@param id
  Future<chopper.Response> usersIdAdminDelete(
      {required num? id, required DeleteUserByAdminRequest? body}) {
    return _usersIdAdminDelete(id: id, body: body);
  }

  ///
  ///@param id
  @Delete(path: '/users/{id}/admin')
  Future<chopper.Response> _usersIdAdminDelete(
      {@Path('id') required num? id,
      @Body() required DeleteUserByAdminRequest? body});
}

@JsonSerializable(explicitToJson: true)
class AvailabilityAnswerModel {
  AvailabilityAnswerModel({
    this.startDate,
    this.endDate,
  });

  factory AvailabilityAnswerModel.fromJson(Map<String, dynamic> json) =>
      _$AvailabilityAnswerModelFromJson(json);

  @JsonKey(name: 'startDate')
  final DateTime? startDate;
  @JsonKey(name: 'endDate')
  final DateTime? endDate;
  static const fromJsonFactory = _$AvailabilityAnswerModelFromJson;
  static const toJsonFactory = _$AvailabilityAnswerModelToJson;
  Map<String, dynamic> toJson() => _$AvailabilityAnswerModelToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is AvailabilityAnswerModel &&
            (identical(other.startDate, startDate) ||
                const DeepCollectionEquality()
                    .equals(other.startDate, startDate)) &&
            (identical(other.endDate, endDate) ||
                const DeepCollectionEquality().equals(other.endDate, endDate)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(startDate) ^
      const DeepCollectionEquality().hash(endDate) ^
      runtimeType.hashCode;
}

extension $AvailabilityAnswerModelExtension on AvailabilityAnswerModel {
  AvailabilityAnswerModel copyWith({DateTime? startDate, DateTime? endDate}) {
    return AvailabilityAnswerModel(
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate);
  }
}

@JsonSerializable(explicitToJson: true)
class ProfileCreationModel {
  ProfileCreationModel({
    this.availability,
    this.duration,
    this.budget,
    this.destinationTypes,
    this.ages,
    this.travelWithPersonFromSameCity,
    this.travelWithPersonFromSameCountry,
    this.travelWithPersonSameLanguage,
    this.gender,
    this.groupeSize,
    this.chillOrVisit,
    this.aboutFood,
    this.goOutAtNight,
    this.sport,
  });

  factory ProfileCreationModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileCreationModelFromJson(json);

  @JsonKey(name: 'availability')
  final AvailabilityAnswerModel? availability;
  @JsonKey(name: 'duration')
  final RangeAnswerModel? duration;
  @JsonKey(name: 'budget')
  final RangeAnswerModel? budget;
  @JsonKey(
      name: 'destinationTypes',
      toJson: profileCreationModelDestinationTypesListToJson,
      fromJson: profileCreationModelDestinationTypesListFromJson)
  final List<enums.ProfileCreationModelDestinationTypes>? destinationTypes;
  @JsonKey(name: 'ages')
  final RangeAnswerModel? ages;
  @JsonKey(
      name: 'travelWithPersonFromSameCity',
      toJson: profileCreationModelTravelWithPersonFromSameCityToJson,
      fromJson: profileCreationModelTravelWithPersonFromSameCityFromJson)
  final enums.ProfileCreationModelTravelWithPersonFromSameCity?
      travelWithPersonFromSameCity;
  @JsonKey(
      name: 'travelWithPersonFromSameCountry',
      toJson: profileCreationModelTravelWithPersonFromSameCountryToJson,
      fromJson: profileCreationModelTravelWithPersonFromSameCountryFromJson)
  final enums.ProfileCreationModelTravelWithPersonFromSameCountry?
      travelWithPersonFromSameCountry;
  @JsonKey(
      name: 'travelWithPersonSameLanguage',
      toJson: profileCreationModelTravelWithPersonSameLanguageToJson,
      fromJson: profileCreationModelTravelWithPersonSameLanguageFromJson)
  final enums.ProfileCreationModelTravelWithPersonSameLanguage?
      travelWithPersonSameLanguage;
  @JsonKey(
      name: 'gender',
      toJson: profileCreationModelGenderToJson,
      fromJson: profileCreationModelGenderFromJson)
  final enums.ProfileCreationModelGender? gender;
  @JsonKey(name: 'groupeSize')
  final RangeAnswerModel? groupeSize;
  @JsonKey(
      name: 'chillOrVisit',
      toJson: profileCreationModelChillOrVisitToJson,
      fromJson: profileCreationModelChillOrVisitFromJson)
  final enums.ProfileCreationModelChillOrVisit? chillOrVisit;
  @JsonKey(
      name: 'aboutFood',
      toJson: profileCreationModelAboutFoodToJson,
      fromJson: profileCreationModelAboutFoodFromJson)
  final enums.ProfileCreationModelAboutFood? aboutFood;
  @JsonKey(
      name: 'goOutAtNight',
      toJson: profileCreationModelGoOutAtNightToJson,
      fromJson: profileCreationModelGoOutAtNightFromJson)
  final enums.ProfileCreationModelGoOutAtNight? goOutAtNight;
  @JsonKey(
      name: 'sport',
      toJson: profileCreationModelSportToJson,
      fromJson: profileCreationModelSportFromJson)
  final enums.ProfileCreationModelSport? sport;
  static const fromJsonFactory = _$ProfileCreationModelFromJson;
  static const toJsonFactory = _$ProfileCreationModelToJson;
  Map<String, dynamic> toJson() => _$ProfileCreationModelToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ProfileCreationModel &&
            (identical(other.availability, availability) ||
                const DeepCollectionEquality()
                    .equals(other.availability, availability)) &&
            (identical(other.duration, duration) ||
                const DeepCollectionEquality()
                    .equals(other.duration, duration)) &&
            (identical(other.budget, budget) ||
                const DeepCollectionEquality().equals(other.budget, budget)) &&
            (identical(other.destinationTypes, destinationTypes) ||
                const DeepCollectionEquality()
                    .equals(other.destinationTypes, destinationTypes)) &&
            (identical(other.ages, ages) ||
                const DeepCollectionEquality().equals(other.ages, ages)) &&
            (identical(other.travelWithPersonFromSameCity, travelWithPersonFromSameCity) ||
                const DeepCollectionEquality().equals(
                    other.travelWithPersonFromSameCity,
                    travelWithPersonFromSameCity)) &&
            (identical(other.travelWithPersonFromSameCountry,
                    travelWithPersonFromSameCountry) ||
                const DeepCollectionEquality().equals(
                    other.travelWithPersonFromSameCountry,
                    travelWithPersonFromSameCountry)) &&
            (identical(other.travelWithPersonSameLanguage, travelWithPersonSameLanguage) ||
                const DeepCollectionEquality().equals(
                    other.travelWithPersonSameLanguage,
                    travelWithPersonSameLanguage)) &&
            (identical(other.gender, gender) ||
                const DeepCollectionEquality().equals(other.gender, gender)) &&
            (identical(other.groupeSize, groupeSize) ||
                const DeepCollectionEquality()
                    .equals(other.groupeSize, groupeSize)) &&
            (identical(other.chillOrVisit, chillOrVisit) ||
                const DeepCollectionEquality()
                    .equals(other.chillOrVisit, chillOrVisit)) &&
            (identical(other.aboutFood, aboutFood) ||
                const DeepCollectionEquality()
                    .equals(other.aboutFood, aboutFood)) &&
            (identical(other.goOutAtNight, goOutAtNight) ||
                const DeepCollectionEquality()
                    .equals(other.goOutAtNight, goOutAtNight)) &&
            (identical(other.sport, sport) ||
                const DeepCollectionEquality().equals(other.sport, sport)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(availability) ^
      const DeepCollectionEquality().hash(duration) ^
      const DeepCollectionEquality().hash(budget) ^
      const DeepCollectionEquality().hash(destinationTypes) ^
      const DeepCollectionEquality().hash(ages) ^
      const DeepCollectionEquality().hash(travelWithPersonFromSameCity) ^
      const DeepCollectionEquality().hash(travelWithPersonFromSameCountry) ^
      const DeepCollectionEquality().hash(travelWithPersonSameLanguage) ^
      const DeepCollectionEquality().hash(gender) ^
      const DeepCollectionEquality().hash(groupeSize) ^
      const DeepCollectionEquality().hash(chillOrVisit) ^
      const DeepCollectionEquality().hash(aboutFood) ^
      const DeepCollectionEquality().hash(goOutAtNight) ^
      const DeepCollectionEquality().hash(sport) ^
      runtimeType.hashCode;
}

extension $ProfileCreationModelExtension on ProfileCreationModel {
  ProfileCreationModel copyWith(
      {AvailabilityAnswerModel? availability,
      RangeAnswerModel? duration,
      RangeAnswerModel? budget,
      List<enums.ProfileCreationModelDestinationTypes>? destinationTypes,
      RangeAnswerModel? ages,
      enums.ProfileCreationModelTravelWithPersonFromSameCity?
          travelWithPersonFromSameCity,
      enums.ProfileCreationModelTravelWithPersonFromSameCountry?
          travelWithPersonFromSameCountry,
      enums.ProfileCreationModelTravelWithPersonSameLanguage?
          travelWithPersonSameLanguage,
      enums.ProfileCreationModelGender? gender,
      RangeAnswerModel? groupeSize,
      enums.ProfileCreationModelChillOrVisit? chillOrVisit,
      enums.ProfileCreationModelAboutFood? aboutFood,
      enums.ProfileCreationModelGoOutAtNight? goOutAtNight,
      enums.ProfileCreationModelSport? sport}) {
    return ProfileCreationModel(
        availability: availability ?? this.availability,
        duration: duration ?? this.duration,
        budget: budget ?? this.budget,
        destinationTypes: destinationTypes ?? this.destinationTypes,
        ages: ages ?? this.ages,
        travelWithPersonFromSameCity:
            travelWithPersonFromSameCity ?? this.travelWithPersonFromSameCity,
        travelWithPersonFromSameCountry: travelWithPersonFromSameCountry ??
            this.travelWithPersonFromSameCountry,
        travelWithPersonSameLanguage:
            travelWithPersonSameLanguage ?? this.travelWithPersonSameLanguage,
        gender: gender ?? this.gender,
        groupeSize: groupeSize ?? this.groupeSize,
        chillOrVisit: chillOrVisit ?? this.chillOrVisit,
        aboutFood: aboutFood ?? this.aboutFood,
        goOutAtNight: goOutAtNight ?? this.goOutAtNight,
        sport: sport ?? this.sport);
  }
}

@JsonSerializable(explicitToJson: true)
class RangeAnswerModel {
  RangeAnswerModel({
    this.minValue,
    this.maxValue,
  });

  factory RangeAnswerModel.fromJson(Map<String, dynamic> json) =>
      _$RangeAnswerModelFromJson(json);

  @JsonKey(name: 'minValue')
  final int? minValue;
  @JsonKey(name: 'maxValue')
  final int? maxValue;
  static const fromJsonFactory = _$RangeAnswerModelFromJson;
  static const toJsonFactory = _$RangeAnswerModelToJson;
  Map<String, dynamic> toJson() => _$RangeAnswerModelToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is RangeAnswerModel &&
            (identical(other.minValue, minValue) ||
                const DeepCollectionEquality()
                    .equals(other.minValue, minValue)) &&
            (identical(other.maxValue, maxValue) ||
                const DeepCollectionEquality()
                    .equals(other.maxValue, maxValue)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(minValue) ^
      const DeepCollectionEquality().hash(maxValue) ^
      runtimeType.hashCode;
}

extension $RangeAnswerModelExtension on RangeAnswerModel {
  RangeAnswerModel copyWith({int? minValue, int? maxValue}) {
    return RangeAnswerModel(
        minValue: minValue ?? this.minValue,
        maxValue: maxValue ?? this.maxValue);
  }
}

@JsonSerializable(explicitToJson: true)
class ProfileModel {
  ProfileModel({
    this.id,
    this.availability,
    this.duration,
    this.budget,
    this.destinationTypes,
    this.ages,
    this.travelWithPersonFromSameCity,
    this.travelWithPersonFromSameCountry,
    this.travelWithPersonSameLanguage,
    this.gender,
    this.groupeSize,
    this.chillOrVisit,
    this.aboutFood,
    this.goOutAtNight,
    this.sport,
    this.userId,
    this.active,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);

  @JsonKey(name: 'id')
  final num? id;
  @JsonKey(name: 'availability')
  final AvailabilityAnswerModel? availability;
  @JsonKey(name: 'duration')
  final RangeAnswerModel? duration;
  @JsonKey(name: 'budget')
  final RangeAnswerModel? budget;
  @JsonKey(
      name: 'destinationTypes',
      toJson: profileModelDestinationTypesListToJson,
      fromJson: profileModelDestinationTypesListFromJson)
  final List<enums.ProfileModelDestinationTypes>? destinationTypes;
  @JsonKey(name: 'ages')
  final RangeAnswerModel? ages;
  @JsonKey(
      name: 'travelWithPersonFromSameCity',
      toJson: profileModelTravelWithPersonFromSameCityToJson,
      fromJson: profileModelTravelWithPersonFromSameCityFromJson)
  final enums.ProfileModelTravelWithPersonFromSameCity?
      travelWithPersonFromSameCity;
  @JsonKey(
      name: 'travelWithPersonFromSameCountry',
      toJson: profileModelTravelWithPersonFromSameCountryToJson,
      fromJson: profileModelTravelWithPersonFromSameCountryFromJson)
  final enums.ProfileModelTravelWithPersonFromSameCountry?
      travelWithPersonFromSameCountry;
  @JsonKey(
      name: 'travelWithPersonSameLanguage',
      toJson: profileModelTravelWithPersonSameLanguageToJson,
      fromJson: profileModelTravelWithPersonSameLanguageFromJson)
  final enums.ProfileModelTravelWithPersonSameLanguage?
      travelWithPersonSameLanguage;
  @JsonKey(
      name: 'gender',
      toJson: profileModelGenderToJson,
      fromJson: profileModelGenderFromJson)
  final enums.ProfileModelGender? gender;
  @JsonKey(name: 'groupeSize')
  final RangeAnswerModel? groupeSize;
  @JsonKey(
      name: 'chillOrVisit',
      toJson: profileModelChillOrVisitToJson,
      fromJson: profileModelChillOrVisitFromJson)
  final enums.ProfileModelChillOrVisit? chillOrVisit;
  @JsonKey(
      name: 'aboutFood',
      toJson: profileModelAboutFoodToJson,
      fromJson: profileModelAboutFoodFromJson)
  final enums.ProfileModelAboutFood? aboutFood;
  @JsonKey(
      name: 'goOutAtNight',
      toJson: profileModelGoOutAtNightToJson,
      fromJson: profileModelGoOutAtNightFromJson)
  final enums.ProfileModelGoOutAtNight? goOutAtNight;
  @JsonKey(
      name: 'sport',
      toJson: profileModelSportToJson,
      fromJson: profileModelSportFromJson)
  final enums.ProfileModelSport? sport;
  @JsonKey(name: 'userId')
  final num? userId;
  @JsonKey(name: 'active')
  final bool? active;
  static const fromJsonFactory = _$ProfileModelFromJson;
  static const toJsonFactory = _$ProfileModelToJson;
  Map<String, dynamic> toJson() => _$ProfileModelToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ProfileModel &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.availability, availability) ||
                const DeepCollectionEquality()
                    .equals(other.availability, availability)) &&
            (identical(other.duration, duration) ||
                const DeepCollectionEquality()
                    .equals(other.duration, duration)) &&
            (identical(other.budget, budget) ||
                const DeepCollectionEquality().equals(other.budget, budget)) &&
            (identical(other.destinationTypes, destinationTypes) ||
                const DeepCollectionEquality()
                    .equals(other.destinationTypes, destinationTypes)) &&
            (identical(other.ages, ages) ||
                const DeepCollectionEquality().equals(other.ages, ages)) &&
            (identical(other.travelWithPersonFromSameCity, travelWithPersonFromSameCity) ||
                const DeepCollectionEquality().equals(
                    other.travelWithPersonFromSameCity,
                    travelWithPersonFromSameCity)) &&
            (identical(other.travelWithPersonFromSameCountry, travelWithPersonFromSameCountry) ||
                const DeepCollectionEquality().equals(
                    other.travelWithPersonFromSameCountry,
                    travelWithPersonFromSameCountry)) &&
            (identical(other.travelWithPersonSameLanguage, travelWithPersonSameLanguage) ||
                const DeepCollectionEquality().equals(
                    other.travelWithPersonSameLanguage,
                    travelWithPersonSameLanguage)) &&
            (identical(other.gender, gender) ||
                const DeepCollectionEquality().equals(other.gender, gender)) &&
            (identical(other.groupeSize, groupeSize) ||
                const DeepCollectionEquality()
                    .equals(other.groupeSize, groupeSize)) &&
            (identical(other.chillOrVisit, chillOrVisit) ||
                const DeepCollectionEquality()
                    .equals(other.chillOrVisit, chillOrVisit)) &&
            (identical(other.aboutFood, aboutFood) ||
                const DeepCollectionEquality()
                    .equals(other.aboutFood, aboutFood)) &&
            (identical(other.goOutAtNight, goOutAtNight) ||
                const DeepCollectionEquality()
                    .equals(other.goOutAtNight, goOutAtNight)) &&
            (identical(other.sport, sport) ||
                const DeepCollectionEquality().equals(other.sport, sport)) &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)) &&
            (identical(other.active, active) ||
                const DeepCollectionEquality().equals(other.active, active)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(availability) ^
      const DeepCollectionEquality().hash(duration) ^
      const DeepCollectionEquality().hash(budget) ^
      const DeepCollectionEquality().hash(destinationTypes) ^
      const DeepCollectionEquality().hash(ages) ^
      const DeepCollectionEquality().hash(travelWithPersonFromSameCity) ^
      const DeepCollectionEquality().hash(travelWithPersonFromSameCountry) ^
      const DeepCollectionEquality().hash(travelWithPersonSameLanguage) ^
      const DeepCollectionEquality().hash(gender) ^
      const DeepCollectionEquality().hash(groupeSize) ^
      const DeepCollectionEquality().hash(chillOrVisit) ^
      const DeepCollectionEquality().hash(aboutFood) ^
      const DeepCollectionEquality().hash(goOutAtNight) ^
      const DeepCollectionEquality().hash(sport) ^
      const DeepCollectionEquality().hash(userId) ^
      const DeepCollectionEquality().hash(active) ^
      runtimeType.hashCode;
}

extension $ProfileModelExtension on ProfileModel {
  ProfileModel copyWith(
      {num? id,
      AvailabilityAnswerModel? availability,
      RangeAnswerModel? duration,
      RangeAnswerModel? budget,
      List<enums.ProfileModelDestinationTypes>? destinationTypes,
      RangeAnswerModel? ages,
      enums.ProfileModelTravelWithPersonFromSameCity?
          travelWithPersonFromSameCity,
      enums.ProfileModelTravelWithPersonFromSameCountry?
          travelWithPersonFromSameCountry,
      enums.ProfileModelTravelWithPersonSameLanguage?
          travelWithPersonSameLanguage,
      enums.ProfileModelGender? gender,
      RangeAnswerModel? groupeSize,
      enums.ProfileModelChillOrVisit? chillOrVisit,
      enums.ProfileModelAboutFood? aboutFood,
      enums.ProfileModelGoOutAtNight? goOutAtNight,
      enums.ProfileModelSport? sport,
      num? userId,
      bool? active}) {
    return ProfileModel(
        id: id ?? this.id,
        availability: availability ?? this.availability,
        duration: duration ?? this.duration,
        budget: budget ?? this.budget,
        destinationTypes: destinationTypes ?? this.destinationTypes,
        ages: ages ?? this.ages,
        travelWithPersonFromSameCity:
            travelWithPersonFromSameCity ?? this.travelWithPersonFromSameCity,
        travelWithPersonFromSameCountry: travelWithPersonFromSameCountry ??
            this.travelWithPersonFromSameCountry,
        travelWithPersonSameLanguage:
            travelWithPersonSameLanguage ?? this.travelWithPersonSameLanguage,
        gender: gender ?? this.gender,
        groupeSize: groupeSize ?? this.groupeSize,
        chillOrVisit: chillOrVisit ?? this.chillOrVisit,
        aboutFood: aboutFood ?? this.aboutFood,
        goOutAtNight: goOutAtNight ?? this.goOutAtNight,
        sport: sport ?? this.sport,
        userId: userId ?? this.userId,
        active: active ?? this.active);
  }
}

@JsonSerializable(explicitToJson: true)
class UserCreationRequest {
  UserCreationRequest({
    this.firstname,
    this.lastname,
    this.password,
    this.gender,
    this.birthDate,
    this.phoneNumber,
    this.email,
  });

  factory UserCreationRequest.fromJson(Map<String, dynamic> json) =>
      _$UserCreationRequestFromJson(json);

  @JsonKey(name: 'firstname')
  final String? firstname;
  @JsonKey(name: 'lastname')
  final String? lastname;
  @JsonKey(name: 'password')
  final String? password;
  @JsonKey(name: 'gender')
  final String? gender;
  @JsonKey(name: 'birthDate')
  final DateTime? birthDate;
  @JsonKey(name: 'phoneNumber')
  final String? phoneNumber;
  @JsonKey(name: 'email')
  final String? email;
  static const fromJsonFactory = _$UserCreationRequestFromJson;
  static const toJsonFactory = _$UserCreationRequestToJson;
  Map<String, dynamic> toJson() => _$UserCreationRequestToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UserCreationRequest &&
            (identical(other.firstname, firstname) ||
                const DeepCollectionEquality()
                    .equals(other.firstname, firstname)) &&
            (identical(other.lastname, lastname) ||
                const DeepCollectionEquality()
                    .equals(other.lastname, lastname)) &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)) &&
            (identical(other.gender, gender) ||
                const DeepCollectionEquality().equals(other.gender, gender)) &&
            (identical(other.birthDate, birthDate) ||
                const DeepCollectionEquality()
                    .equals(other.birthDate, birthDate)) &&
            (identical(other.phoneNumber, phoneNumber) ||
                const DeepCollectionEquality()
                    .equals(other.phoneNumber, phoneNumber)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(firstname) ^
      const DeepCollectionEquality().hash(lastname) ^
      const DeepCollectionEquality().hash(password) ^
      const DeepCollectionEquality().hash(gender) ^
      const DeepCollectionEquality().hash(birthDate) ^
      const DeepCollectionEquality().hash(phoneNumber) ^
      const DeepCollectionEquality().hash(email) ^
      runtimeType.hashCode;
}

extension $UserCreationRequestExtension on UserCreationRequest {
  UserCreationRequest copyWith(
      {String? firstname,
      String? lastname,
      String? password,
      String? gender,
      DateTime? birthDate,
      String? phoneNumber,
      String? email}) {
    return UserCreationRequest(
        firstname: firstname ?? this.firstname,
        lastname: lastname ?? this.lastname,
        password: password ?? this.password,
        gender: gender ?? this.gender,
        birthDate: birthDate ?? this.birthDate,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        email: email ?? this.email);
  }
}

@JsonSerializable(explicitToJson: true)
class AuthTokenResponse {
  AuthTokenResponse({
    this.token,
  });

  factory AuthTokenResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthTokenResponseFromJson(json);

  @JsonKey(name: 'token')
  final String? token;
  static const fromJsonFactory = _$AuthTokenResponseFromJson;
  static const toJsonFactory = _$AuthTokenResponseToJson;
  Map<String, dynamic> toJson() => _$AuthTokenResponseToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is AuthTokenResponse &&
            (identical(other.token, token) ||
                const DeepCollectionEquality().equals(other.token, token)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(token) ^ runtimeType.hashCode;
}

extension $AuthTokenResponseExtension on AuthTokenResponse {
  AuthTokenResponse copyWith({String? token}) {
    return AuthTokenResponse(token: token ?? this.token);
  }
}

@JsonSerializable(explicitToJson: true)
class LoginRequest {
  LoginRequest({
    this.password,
    this.username,
  });

  factory LoginRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestFromJson(json);

  @JsonKey(name: 'password')
  final String? password;
  @JsonKey(name: 'username')
  final String? username;
  static const fromJsonFactory = _$LoginRequestFromJson;
  static const toJsonFactory = _$LoginRequestToJson;
  Map<String, dynamic> toJson() => _$LoginRequestToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is LoginRequest &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)) &&
            (identical(other.username, username) ||
                const DeepCollectionEquality()
                    .equals(other.username, username)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(password) ^
      const DeepCollectionEquality().hash(username) ^
      runtimeType.hashCode;
}

extension $LoginRequestExtension on LoginRequest {
  LoginRequest copyWith({String? password, String? username}) {
    return LoginRequest(
        password: password ?? this.password,
        username: username ?? this.username);
  }
}

@JsonSerializable(explicitToJson: true)
class LoginResponse {
  LoginResponse({
    this.username,
    this.token,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  @JsonKey(name: 'username')
  final String? username;
  @JsonKey(name: 'token')
  final String? token;
  static const fromJsonFactory = _$LoginResponseFromJson;
  static const toJsonFactory = _$LoginResponseToJson;
  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is LoginResponse &&
            (identical(other.username, username) ||
                const DeepCollectionEquality()
                    .equals(other.username, username)) &&
            (identical(other.token, token) ||
                const DeepCollectionEquality().equals(other.token, token)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(username) ^
      const DeepCollectionEquality().hash(token) ^
      runtimeType.hashCode;
}

extension $LoginResponseExtension on LoginResponse {
  LoginResponse copyWith({String? username, String? token}) {
    return LoginResponse(
        username: username ?? this.username, token: token ?? this.token);
  }
}

@JsonSerializable(explicitToJson: true)
class GoogleRequest {
  GoogleRequest({
    this.firstname,
    this.lastname,
    this.accessToken,
    this.profilePicture,
    this.phoneNumber,
    this.email,
  });

  factory GoogleRequest.fromJson(Map<String, dynamic> json) =>
      _$GoogleRequestFromJson(json);

  @JsonKey(name: 'firstname')
  final String? firstname;
  @JsonKey(name: 'lastname')
  final String? lastname;
  @JsonKey(name: 'accessToken')
  final String? accessToken;
  @JsonKey(name: 'profilePicture')
  final String? profilePicture;
  @JsonKey(name: 'phoneNumber')
  final String? phoneNumber;
  @JsonKey(name: 'email')
  final String? email;
  static const fromJsonFactory = _$GoogleRequestFromJson;
  static const toJsonFactory = _$GoogleRequestToJson;
  Map<String, dynamic> toJson() => _$GoogleRequestToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is GoogleRequest &&
            (identical(other.firstname, firstname) ||
                const DeepCollectionEquality()
                    .equals(other.firstname, firstname)) &&
            (identical(other.lastname, lastname) ||
                const DeepCollectionEquality()
                    .equals(other.lastname, lastname)) &&
            (identical(other.accessToken, accessToken) ||
                const DeepCollectionEquality()
                    .equals(other.accessToken, accessToken)) &&
            (identical(other.profilePicture, profilePicture) ||
                const DeepCollectionEquality()
                    .equals(other.profilePicture, profilePicture)) &&
            (identical(other.phoneNumber, phoneNumber) ||
                const DeepCollectionEquality()
                    .equals(other.phoneNumber, phoneNumber)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(firstname) ^
      const DeepCollectionEquality().hash(lastname) ^
      const DeepCollectionEquality().hash(accessToken) ^
      const DeepCollectionEquality().hash(profilePicture) ^
      const DeepCollectionEquality().hash(phoneNumber) ^
      const DeepCollectionEquality().hash(email) ^
      runtimeType.hashCode;
}

extension $GoogleRequestExtension on GoogleRequest {
  GoogleRequest copyWith(
      {String? firstname,
      String? lastname,
      String? accessToken,
      String? profilePicture,
      String? phoneNumber,
      String? email}) {
    return GoogleRequest(
        firstname: firstname ?? this.firstname,
        lastname: lastname ?? this.lastname,
        accessToken: accessToken ?? this.accessToken,
        profilePicture: profilePicture ?? this.profilePicture,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        email: email ?? this.email);
  }
}

@JsonSerializable(explicitToJson: true)
class ForgotPasswordRequest {
  ForgotPasswordRequest({
    this.email,
  });

  factory ForgotPasswordRequest.fromJson(Map<String, dynamic> json) =>
      _$ForgotPasswordRequestFromJson(json);

  @JsonKey(name: 'email')
  final String? email;
  static const fromJsonFactory = _$ForgotPasswordRequestFromJson;
  static const toJsonFactory = _$ForgotPasswordRequestToJson;
  Map<String, dynamic> toJson() => _$ForgotPasswordRequestToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ForgotPasswordRequest &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(email) ^ runtimeType.hashCode;
}

extension $ForgotPasswordRequestExtension on ForgotPasswordRequest {
  ForgotPasswordRequest copyWith({String? email}) {
    return ForgotPasswordRequest(email: email ?? this.email);
  }
}

@JsonSerializable(explicitToJson: true)
class CityModel {
  CityModel({
    this.name,
  });

  factory CityModel.fromJson(Map<String, dynamic> json) =>
      _$CityModelFromJson(json);

  @JsonKey(name: 'name')
  final String? name;
  static const fromJsonFactory = _$CityModelFromJson;
  static const toJsonFactory = _$CityModelToJson;
  Map<String, dynamic> toJson() => _$CityModelToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CityModel &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(name) ^ runtimeType.hashCode;
}

extension $CityModelExtension on CityModel {
  CityModel copyWith({String? name}) {
    return CityModel(name: name ?? this.name);
  }
}

@JsonSerializable(explicitToJson: true)
class UserUpdateRequest {
  UserUpdateRequest({
    this.firstname,
    this.lastname,
    this.profilePicture,
    this.city,
    this.phoneNumber,
  });

  factory UserUpdateRequest.fromJson(Map<String, dynamic> json) =>
      _$UserUpdateRequestFromJson(json);

  @JsonKey(name: 'firstname')
  final String? firstname;
  @JsonKey(name: 'lastname')
  final String? lastname;
  @JsonKey(name: 'profilePicture')
  final String? profilePicture;
  @JsonKey(name: 'city')
  final CityModel? city;
  @JsonKey(name: 'phoneNumber')
  final String? phoneNumber;
  static const fromJsonFactory = _$UserUpdateRequestFromJson;
  static const toJsonFactory = _$UserUpdateRequestToJson;
  Map<String, dynamic> toJson() => _$UserUpdateRequestToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UserUpdateRequest &&
            (identical(other.firstname, firstname) ||
                const DeepCollectionEquality()
                    .equals(other.firstname, firstname)) &&
            (identical(other.lastname, lastname) ||
                const DeepCollectionEquality()
                    .equals(other.lastname, lastname)) &&
            (identical(other.profilePicture, profilePicture) ||
                const DeepCollectionEquality()
                    .equals(other.profilePicture, profilePicture)) &&
            (identical(other.city, city) ||
                const DeepCollectionEquality().equals(other.city, city)) &&
            (identical(other.phoneNumber, phoneNumber) ||
                const DeepCollectionEquality()
                    .equals(other.phoneNumber, phoneNumber)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(firstname) ^
      const DeepCollectionEquality().hash(lastname) ^
      const DeepCollectionEquality().hash(profilePicture) ^
      const DeepCollectionEquality().hash(city) ^
      const DeepCollectionEquality().hash(phoneNumber) ^
      runtimeType.hashCode;
}

extension $UserUpdateRequestExtension on UserUpdateRequest {
  UserUpdateRequest copyWith(
      {String? firstname,
      String? lastname,
      String? profilePicture,
      CityModel? city,
      String? phoneNumber}) {
    return UserUpdateRequest(
        firstname: firstname ?? this.firstname,
        lastname: lastname ?? this.lastname,
        profilePicture: profilePicture ?? this.profilePicture,
        city: city ?? this.city,
        phoneNumber: phoneNumber ?? this.phoneNumber);
  }
}

@JsonSerializable(explicitToJson: true)
class UpdatePasswordRequest {
  UpdatePasswordRequest({
    this.oldPassword,
    this.newPassword,
  });

  factory UpdatePasswordRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdatePasswordRequestFromJson(json);

  @JsonKey(name: 'oldPassword')
  final String? oldPassword;
  @JsonKey(name: 'newPassword')
  final String? newPassword;
  static const fromJsonFactory = _$UpdatePasswordRequestFromJson;
  static const toJsonFactory = _$UpdatePasswordRequestToJson;
  Map<String, dynamic> toJson() => _$UpdatePasswordRequestToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UpdatePasswordRequest &&
            (identical(other.oldPassword, oldPassword) ||
                const DeepCollectionEquality()
                    .equals(other.oldPassword, oldPassword)) &&
            (identical(other.newPassword, newPassword) ||
                const DeepCollectionEquality()
                    .equals(other.newPassword, newPassword)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(oldPassword) ^
      const DeepCollectionEquality().hash(newPassword) ^
      runtimeType.hashCode;
}

extension $UpdatePasswordRequestExtension on UpdatePasswordRequest {
  UpdatePasswordRequest copyWith({String? oldPassword, String? newPassword}) {
    return UpdatePasswordRequest(
        oldPassword: oldPassword ?? this.oldPassword,
        newPassword: newPassword ?? this.newPassword);
  }
}

@JsonSerializable(explicitToJson: true)
class UpdateEmailRequest {
  UpdateEmailRequest({
    this.newEmail,
    this.password,
  });

  factory UpdateEmailRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateEmailRequestFromJson(json);

  @JsonKey(name: 'newEmail')
  final String? newEmail;
  @JsonKey(name: 'password')
  final String? password;
  static const fromJsonFactory = _$UpdateEmailRequestFromJson;
  static const toJsonFactory = _$UpdateEmailRequestToJson;
  Map<String, dynamic> toJson() => _$UpdateEmailRequestToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UpdateEmailRequest &&
            (identical(other.newEmail, newEmail) ||
                const DeepCollectionEquality()
                    .equals(other.newEmail, newEmail)) &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(newEmail) ^
      const DeepCollectionEquality().hash(password) ^
      runtimeType.hashCode;
}

extension $UpdateEmailRequestExtension on UpdateEmailRequest {
  UpdateEmailRequest copyWith({String? newEmail, String? password}) {
    return UpdateEmailRequest(
        newEmail: newEmail ?? this.newEmail,
        password: password ?? this.password);
  }
}

@JsonSerializable(explicitToJson: true)
class ConfirmationCodeModel {
  ConfirmationCodeModel({
    this.value,
  });

  factory ConfirmationCodeModel.fromJson(Map<String, dynamic> json) =>
      _$ConfirmationCodeModelFromJson(json);

  @JsonKey(name: 'value')
  final String? value;
  static const fromJsonFactory = _$ConfirmationCodeModelFromJson;
  static const toJsonFactory = _$ConfirmationCodeModelToJson;
  Map<String, dynamic> toJson() => _$ConfirmationCodeModelToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ConfirmationCodeModel &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(value) ^ runtimeType.hashCode;
}

extension $ConfirmationCodeModelExtension on ConfirmationCodeModel {
  ConfirmationCodeModel copyWith({String? value}) {
    return ConfirmationCodeModel(value: value ?? this.value);
  }
}

@JsonSerializable(explicitToJson: true)
class ValidateCodePasswordRequest {
  ValidateCodePasswordRequest({
    this.value,
    this.newPassword,
    this.email,
  });

  factory ValidateCodePasswordRequest.fromJson(Map<String, dynamic> json) =>
      _$ValidateCodePasswordRequestFromJson(json);

  @JsonKey(name: 'value')
  final String? value;
  @JsonKey(name: 'newPassword')
  final String? newPassword;
  @JsonKey(name: 'email')
  final String? email;
  static const fromJsonFactory = _$ValidateCodePasswordRequestFromJson;
  static const toJsonFactory = _$ValidateCodePasswordRequestToJson;
  Map<String, dynamic> toJson() => _$ValidateCodePasswordRequestToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ValidateCodePasswordRequest &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)) &&
            (identical(other.newPassword, newPassword) ||
                const DeepCollectionEquality()
                    .equals(other.newPassword, newPassword)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(value) ^
      const DeepCollectionEquality().hash(newPassword) ^
      const DeepCollectionEquality().hash(email) ^
      runtimeType.hashCode;
}

extension $ValidateCodePasswordRequestExtension on ValidateCodePasswordRequest {
  ValidateCodePasswordRequest copyWith(
      {String? value, String? newPassword, String? email}) {
    return ValidateCodePasswordRequest(
        value: value ?? this.value,
        newPassword: newPassword ?? this.newPassword,
        email: email ?? this.email);
  }
}

@JsonSerializable(explicitToJson: true)
class UserIdResponse {
  UserIdResponse({
    this.userId,
  });

  factory UserIdResponse.fromJson(Map<String, dynamic> json) =>
      _$UserIdResponseFromJson(json);

  @JsonKey(name: 'userId')
  final num? userId;
  static const fromJsonFactory = _$UserIdResponseFromJson;
  static const toJsonFactory = _$UserIdResponseToJson;
  Map<String, dynamic> toJson() => _$UserIdResponseToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UserIdResponse &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(userId) ^ runtimeType.hashCode;
}

extension $UserIdResponseExtension on UserIdResponse {
  UserIdResponse copyWith({num? userId}) {
    return UserIdResponse(userId: userId ?? this.userId);
  }
}

@JsonSerializable(explicitToJson: true)
class UserModel {
  UserModel({
    this.id,
    this.firstname,
    this.lastname,
    this.password,
    this.email,
    this.birthDate,
    this.gender,
    this.profilePicture,
    this.city,
    this.createdDate,
    this.phoneNumber,
    this.confirmed,
    this.roles,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  @JsonKey(name: 'id')
  final num? id;
  @JsonKey(name: 'firstname')
  final String? firstname;
  @JsonKey(name: 'lastname')
  final String? lastname;
  @JsonKey(name: 'password')
  final String? password;
  @JsonKey(name: 'email')
  final String? email;
  @JsonKey(name: 'birthDate')
  final DateTime? birthDate;
  @JsonKey(
      name: 'gender',
      toJson: userModelGenderToJson,
      fromJson: userModelGenderFromJson)
  final enums.UserModelGender? gender;
  @JsonKey(name: 'profilePicture')
  final String? profilePicture;
  @JsonKey(name: 'city')
  final CityModel? city;
  @JsonKey(name: 'createdDate')
  final DateTime? createdDate;
  @JsonKey(name: 'phoneNumber')
  final String? phoneNumber;
  @JsonKey(name: 'confirmed')
  final bool? confirmed;
  @JsonKey(
      name: 'roles',
      toJson: userModelRolesListToJson,
      fromJson: userModelRolesListFromJson)
  final List<enums.UserModelRoles>? roles;
  static const fromJsonFactory = _$UserModelFromJson;
  static const toJsonFactory = _$UserModelToJson;
  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UserModel &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.firstname, firstname) ||
                const DeepCollectionEquality()
                    .equals(other.firstname, firstname)) &&
            (identical(other.lastname, lastname) ||
                const DeepCollectionEquality()
                    .equals(other.lastname, lastname)) &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.birthDate, birthDate) ||
                const DeepCollectionEquality()
                    .equals(other.birthDate, birthDate)) &&
            (identical(other.gender, gender) ||
                const DeepCollectionEquality().equals(other.gender, gender)) &&
            (identical(other.profilePicture, profilePicture) ||
                const DeepCollectionEquality()
                    .equals(other.profilePicture, profilePicture)) &&
            (identical(other.city, city) ||
                const DeepCollectionEquality().equals(other.city, city)) &&
            (identical(other.createdDate, createdDate) ||
                const DeepCollectionEquality()
                    .equals(other.createdDate, createdDate)) &&
            (identical(other.phoneNumber, phoneNumber) ||
                const DeepCollectionEquality()
                    .equals(other.phoneNumber, phoneNumber)) &&
            (identical(other.confirmed, confirmed) ||
                const DeepCollectionEquality()
                    .equals(other.confirmed, confirmed)) &&
            (identical(other.roles, roles) ||
                const DeepCollectionEquality().equals(other.roles, roles)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(firstname) ^
      const DeepCollectionEquality().hash(lastname) ^
      const DeepCollectionEquality().hash(password) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(birthDate) ^
      const DeepCollectionEquality().hash(gender) ^
      const DeepCollectionEquality().hash(profilePicture) ^
      const DeepCollectionEquality().hash(city) ^
      const DeepCollectionEquality().hash(createdDate) ^
      const DeepCollectionEquality().hash(phoneNumber) ^
      const DeepCollectionEquality().hash(confirmed) ^
      const DeepCollectionEquality().hash(roles) ^
      runtimeType.hashCode;
}

extension $UserModelExtension on UserModel {
  UserModel copyWith(
      {num? id,
      String? firstname,
      String? lastname,
      String? password,
      String? email,
      DateTime? birthDate,
      enums.UserModelGender? gender,
      String? profilePicture,
      CityModel? city,
      DateTime? createdDate,
      String? phoneNumber,
      bool? confirmed,
      List<enums.UserModelRoles>? roles}) {
    return UserModel(
        id: id ?? this.id,
        firstname: firstname ?? this.firstname,
        lastname: lastname ?? this.lastname,
        password: password ?? this.password,
        email: email ?? this.email,
        birthDate: birthDate ?? this.birthDate,
        gender: gender ?? this.gender,
        profilePicture: profilePicture ?? this.profilePicture,
        city: city ?? this.city,
        createdDate: createdDate ?? this.createdDate,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        confirmed: confirmed ?? this.confirmed,
        roles: roles ?? this.roles);
  }
}

@JsonSerializable(explicitToJson: true)
class DeleteUserRequest {
  DeleteUserRequest({
    this.password,
  });

  factory DeleteUserRequest.fromJson(Map<String, dynamic> json) =>
      _$DeleteUserRequestFromJson(json);

  @JsonKey(name: 'password')
  final String? password;
  static const fromJsonFactory = _$DeleteUserRequestFromJson;
  static const toJsonFactory = _$DeleteUserRequestToJson;
  Map<String, dynamic> toJson() => _$DeleteUserRequestToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is DeleteUserRequest &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(password) ^ runtimeType.hashCode;
}

extension $DeleteUserRequestExtension on DeleteUserRequest {
  DeleteUserRequest copyWith({String? password}) {
    return DeleteUserRequest(password: password ?? this.password);
  }
}

@JsonSerializable(explicitToJson: true)
class DeleteUserByAdminRequest {
  DeleteUserByAdminRequest({
    this.reason,
  });

  factory DeleteUserByAdminRequest.fromJson(Map<String, dynamic> json) =>
      _$DeleteUserByAdminRequestFromJson(json);

  @JsonKey(name: 'reason')
  final String? reason;
  static const fromJsonFactory = _$DeleteUserByAdminRequestFromJson;
  static const toJsonFactory = _$DeleteUserByAdminRequestToJson;
  Map<String, dynamic> toJson() => _$DeleteUserByAdminRequestToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is DeleteUserByAdminRequest &&
            (identical(other.reason, reason) ||
                const DeepCollectionEquality().equals(other.reason, reason)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(reason) ^ runtimeType.hashCode;
}

extension $DeleteUserByAdminRequestExtension on DeleteUserByAdminRequest {
  DeleteUserByAdminRequest copyWith({String? reason}) {
    return DeleteUserByAdminRequest(reason: reason ?? this.reason);
  }
}

String? profileCreationModelDestinationTypesToJson(
    enums.ProfileCreationModelDestinationTypes?
        profileCreationModelDestinationTypes) {
  return enums.$ProfileCreationModelDestinationTypesMap[
      profileCreationModelDestinationTypes];
}

enums.ProfileCreationModelDestinationTypes
    profileCreationModelDestinationTypesFromJson(
        Object? profileCreationModelDestinationTypes) {
  if (profileCreationModelDestinationTypes is int) {
    return enums.$ProfileCreationModelDestinationTypesMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                profileCreationModelDestinationTypes.toString(),
            orElse: () => const MapEntry(
                enums.ProfileCreationModelDestinationTypes
                    .swaggerGeneratedUnknown,
                ''))
        .key;
  }

  if (profileCreationModelDestinationTypes is String) {
    return enums.$ProfileCreationModelDestinationTypesMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                profileCreationModelDestinationTypes.toLowerCase(),
            orElse: () => const MapEntry(
                enums.ProfileCreationModelDestinationTypes
                    .swaggerGeneratedUnknown,
                ''))
        .key;
  }

  return enums.ProfileCreationModelDestinationTypes.swaggerGeneratedUnknown;
}

List<String> profileCreationModelDestinationTypesListToJson(
    List<enums.ProfileCreationModelDestinationTypes>?
        profileCreationModelDestinationTypes) {
  if (profileCreationModelDestinationTypes == null) {
    return [];
  }

  return profileCreationModelDestinationTypes
      .map((e) => enums.$ProfileCreationModelDestinationTypesMap[e]!)
      .toList();
}

List<enums.ProfileCreationModelDestinationTypes>
    profileCreationModelDestinationTypesListFromJson(
        List? profileCreationModelDestinationTypes) {
  if (profileCreationModelDestinationTypes == null) {
    return [];
  }

  return profileCreationModelDestinationTypes
      .map((e) => profileCreationModelDestinationTypesFromJson(e.toString()))
      .toList();
}

String? profileCreationModelTravelWithPersonFromSameCityToJson(
    enums.ProfileCreationModelTravelWithPersonFromSameCity?
        profileCreationModelTravelWithPersonFromSameCity) {
  return enums.$ProfileCreationModelTravelWithPersonFromSameCityMap[
      profileCreationModelTravelWithPersonFromSameCity];
}

enums.ProfileCreationModelTravelWithPersonFromSameCity
    profileCreationModelTravelWithPersonFromSameCityFromJson(
        Object? profileCreationModelTravelWithPersonFromSameCity) {
  if (profileCreationModelTravelWithPersonFromSameCity is int) {
    return enums.$ProfileCreationModelTravelWithPersonFromSameCityMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                profileCreationModelTravelWithPersonFromSameCity.toString(),
            orElse: () => const MapEntry(
                enums.ProfileCreationModelTravelWithPersonFromSameCity
                    .swaggerGeneratedUnknown,
                ''))
        .key;
  }

  if (profileCreationModelTravelWithPersonFromSameCity is String) {
    return enums.$ProfileCreationModelTravelWithPersonFromSameCityMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                profileCreationModelTravelWithPersonFromSameCity.toLowerCase(),
            orElse: () => const MapEntry(
                enums.ProfileCreationModelTravelWithPersonFromSameCity
                    .swaggerGeneratedUnknown,
                ''))
        .key;
  }

  return enums
      .ProfileCreationModelTravelWithPersonFromSameCity.swaggerGeneratedUnknown;
}

List<String> profileCreationModelTravelWithPersonFromSameCityListToJson(
    List<enums.ProfileCreationModelTravelWithPersonFromSameCity>?
        profileCreationModelTravelWithPersonFromSameCity) {
  if (profileCreationModelTravelWithPersonFromSameCity == null) {
    return [];
  }

  return profileCreationModelTravelWithPersonFromSameCity
      .map(
          (e) => enums.$ProfileCreationModelTravelWithPersonFromSameCityMap[e]!)
      .toList();
}

List<enums.ProfileCreationModelTravelWithPersonFromSameCity>
    profileCreationModelTravelWithPersonFromSameCityListFromJson(
        List? profileCreationModelTravelWithPersonFromSameCity) {
  if (profileCreationModelTravelWithPersonFromSameCity == null) {
    return [];
  }

  return profileCreationModelTravelWithPersonFromSameCity
      .map((e) => profileCreationModelTravelWithPersonFromSameCityFromJson(
          e.toString()))
      .toList();
}

String? profileCreationModelTravelWithPersonFromSameCountryToJson(
    enums.ProfileCreationModelTravelWithPersonFromSameCountry?
        profileCreationModelTravelWithPersonFromSameCountry) {
  return enums.$ProfileCreationModelTravelWithPersonFromSameCountryMap[
      profileCreationModelTravelWithPersonFromSameCountry];
}

enums.ProfileCreationModelTravelWithPersonFromSameCountry
    profileCreationModelTravelWithPersonFromSameCountryFromJson(
        Object? profileCreationModelTravelWithPersonFromSameCountry) {
  if (profileCreationModelTravelWithPersonFromSameCountry is int) {
    return enums.$ProfileCreationModelTravelWithPersonFromSameCountryMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                profileCreationModelTravelWithPersonFromSameCountry.toString(),
            orElse: () => const MapEntry(
                enums.ProfileCreationModelTravelWithPersonFromSameCountry
                    .swaggerGeneratedUnknown,
                ''))
        .key;
  }

  if (profileCreationModelTravelWithPersonFromSameCountry is String) {
    return enums.$ProfileCreationModelTravelWithPersonFromSameCountryMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                profileCreationModelTravelWithPersonFromSameCountry
                    .toLowerCase(),
            orElse: () => const MapEntry(
                enums.ProfileCreationModelTravelWithPersonFromSameCountry
                    .swaggerGeneratedUnknown,
                ''))
        .key;
  }

  return enums.ProfileCreationModelTravelWithPersonFromSameCountry
      .swaggerGeneratedUnknown;
}

List<String> profileCreationModelTravelWithPersonFromSameCountryListToJson(
    List<enums.ProfileCreationModelTravelWithPersonFromSameCountry>?
        profileCreationModelTravelWithPersonFromSameCountry) {
  if (profileCreationModelTravelWithPersonFromSameCountry == null) {
    return [];
  }

  return profileCreationModelTravelWithPersonFromSameCountry
      .map((e) =>
          enums.$ProfileCreationModelTravelWithPersonFromSameCountryMap[e]!)
      .toList();
}

List<enums.ProfileCreationModelTravelWithPersonFromSameCountry>
    profileCreationModelTravelWithPersonFromSameCountryListFromJson(
        List? profileCreationModelTravelWithPersonFromSameCountry) {
  if (profileCreationModelTravelWithPersonFromSameCountry == null) {
    return [];
  }

  return profileCreationModelTravelWithPersonFromSameCountry
      .map((e) => profileCreationModelTravelWithPersonFromSameCountryFromJson(
          e.toString()))
      .toList();
}

String? profileCreationModelTravelWithPersonSameLanguageToJson(
    enums.ProfileCreationModelTravelWithPersonSameLanguage?
        profileCreationModelTravelWithPersonSameLanguage) {
  return enums.$ProfileCreationModelTravelWithPersonSameLanguageMap[
      profileCreationModelTravelWithPersonSameLanguage];
}

enums.ProfileCreationModelTravelWithPersonSameLanguage
    profileCreationModelTravelWithPersonSameLanguageFromJson(
        Object? profileCreationModelTravelWithPersonSameLanguage) {
  if (profileCreationModelTravelWithPersonSameLanguage is int) {
    return enums.$ProfileCreationModelTravelWithPersonSameLanguageMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                profileCreationModelTravelWithPersonSameLanguage.toString(),
            orElse: () => const MapEntry(
                enums.ProfileCreationModelTravelWithPersonSameLanguage
                    .swaggerGeneratedUnknown,
                ''))
        .key;
  }

  if (profileCreationModelTravelWithPersonSameLanguage is String) {
    return enums.$ProfileCreationModelTravelWithPersonSameLanguageMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                profileCreationModelTravelWithPersonSameLanguage.toLowerCase(),
            orElse: () => const MapEntry(
                enums.ProfileCreationModelTravelWithPersonSameLanguage
                    .swaggerGeneratedUnknown,
                ''))
        .key;
  }

  return enums
      .ProfileCreationModelTravelWithPersonSameLanguage.swaggerGeneratedUnknown;
}

List<String> profileCreationModelTravelWithPersonSameLanguageListToJson(
    List<enums.ProfileCreationModelTravelWithPersonSameLanguage>?
        profileCreationModelTravelWithPersonSameLanguage) {
  if (profileCreationModelTravelWithPersonSameLanguage == null) {
    return [];
  }

  return profileCreationModelTravelWithPersonSameLanguage
      .map(
          (e) => enums.$ProfileCreationModelTravelWithPersonSameLanguageMap[e]!)
      .toList();
}

List<enums.ProfileCreationModelTravelWithPersonSameLanguage>
    profileCreationModelTravelWithPersonSameLanguageListFromJson(
        List? profileCreationModelTravelWithPersonSameLanguage) {
  if (profileCreationModelTravelWithPersonSameLanguage == null) {
    return [];
  }

  return profileCreationModelTravelWithPersonSameLanguage
      .map((e) => profileCreationModelTravelWithPersonSameLanguageFromJson(
          e.toString()))
      .toList();
}

String? profileCreationModelGenderToJson(
    enums.ProfileCreationModelGender? profileCreationModelGender) {
  return enums.$ProfileCreationModelGenderMap[profileCreationModelGender];
}

enums.ProfileCreationModelGender profileCreationModelGenderFromJson(
    Object? profileCreationModelGender) {
  if (profileCreationModelGender is int) {
    return enums.$ProfileCreationModelGenderMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                profileCreationModelGender.toString(),
            orElse: () => const MapEntry(
                enums.ProfileCreationModelGender.swaggerGeneratedUnknown, ''))
        .key;
  }

  if (profileCreationModelGender is String) {
    return enums.$ProfileCreationModelGenderMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                profileCreationModelGender.toLowerCase(),
            orElse: () => const MapEntry(
                enums.ProfileCreationModelGender.swaggerGeneratedUnknown, ''))
        .key;
  }

  return enums.ProfileCreationModelGender.swaggerGeneratedUnknown;
}

List<String> profileCreationModelGenderListToJson(
    List<enums.ProfileCreationModelGender>? profileCreationModelGender) {
  if (profileCreationModelGender == null) {
    return [];
  }

  return profileCreationModelGender
      .map((e) => enums.$ProfileCreationModelGenderMap[e]!)
      .toList();
}

List<enums.ProfileCreationModelGender> profileCreationModelGenderListFromJson(
    List? profileCreationModelGender) {
  if (profileCreationModelGender == null) {
    return [];
  }

  return profileCreationModelGender
      .map((e) => profileCreationModelGenderFromJson(e.toString()))
      .toList();
}

String? profileCreationModelChillOrVisitToJson(
    enums.ProfileCreationModelChillOrVisit? profileCreationModelChillOrVisit) {
  return enums
      .$ProfileCreationModelChillOrVisitMap[profileCreationModelChillOrVisit];
}

enums.ProfileCreationModelChillOrVisit profileCreationModelChillOrVisitFromJson(
    Object? profileCreationModelChillOrVisit) {
  if (profileCreationModelChillOrVisit is int) {
    return enums.$ProfileCreationModelChillOrVisitMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                profileCreationModelChillOrVisit.toString(),
            orElse: () => const MapEntry(
                enums.ProfileCreationModelChillOrVisit.swaggerGeneratedUnknown,
                ''))
        .key;
  }

  if (profileCreationModelChillOrVisit is String) {
    return enums.$ProfileCreationModelChillOrVisitMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                profileCreationModelChillOrVisit.toLowerCase(),
            orElse: () => const MapEntry(
                enums.ProfileCreationModelChillOrVisit.swaggerGeneratedUnknown,
                ''))
        .key;
  }

  return enums.ProfileCreationModelChillOrVisit.swaggerGeneratedUnknown;
}

List<String> profileCreationModelChillOrVisitListToJson(
    List<enums.ProfileCreationModelChillOrVisit>?
        profileCreationModelChillOrVisit) {
  if (profileCreationModelChillOrVisit == null) {
    return [];
  }

  return profileCreationModelChillOrVisit
      .map((e) => enums.$ProfileCreationModelChillOrVisitMap[e]!)
      .toList();
}

List<enums.ProfileCreationModelChillOrVisit>
    profileCreationModelChillOrVisitListFromJson(
        List? profileCreationModelChillOrVisit) {
  if (profileCreationModelChillOrVisit == null) {
    return [];
  }

  return profileCreationModelChillOrVisit
      .map((e) => profileCreationModelChillOrVisitFromJson(e.toString()))
      .toList();
}

String? profileCreationModelAboutFoodToJson(
    enums.ProfileCreationModelAboutFood? profileCreationModelAboutFood) {
  return enums.$ProfileCreationModelAboutFoodMap[profileCreationModelAboutFood];
}

enums.ProfileCreationModelAboutFood profileCreationModelAboutFoodFromJson(
    Object? profileCreationModelAboutFood) {
  if (profileCreationModelAboutFood is int) {
    return enums.$ProfileCreationModelAboutFoodMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                profileCreationModelAboutFood.toString(),
            orElse: () => const MapEntry(
                enums.ProfileCreationModelAboutFood.swaggerGeneratedUnknown,
                ''))
        .key;
  }

  if (profileCreationModelAboutFood is String) {
    return enums.$ProfileCreationModelAboutFoodMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                profileCreationModelAboutFood.toLowerCase(),
            orElse: () => const MapEntry(
                enums.ProfileCreationModelAboutFood.swaggerGeneratedUnknown,
                ''))
        .key;
  }

  return enums.ProfileCreationModelAboutFood.swaggerGeneratedUnknown;
}

List<String> profileCreationModelAboutFoodListToJson(
    List<enums.ProfileCreationModelAboutFood>? profileCreationModelAboutFood) {
  if (profileCreationModelAboutFood == null) {
    return [];
  }

  return profileCreationModelAboutFood
      .map((e) => enums.$ProfileCreationModelAboutFoodMap[e]!)
      .toList();
}

List<enums.ProfileCreationModelAboutFood>
    profileCreationModelAboutFoodListFromJson(
        List? profileCreationModelAboutFood) {
  if (profileCreationModelAboutFood == null) {
    return [];
  }

  return profileCreationModelAboutFood
      .map((e) => profileCreationModelAboutFoodFromJson(e.toString()))
      .toList();
}

String? profileCreationModelGoOutAtNightToJson(
    enums.ProfileCreationModelGoOutAtNight? profileCreationModelGoOutAtNight) {
  return enums
      .$ProfileCreationModelGoOutAtNightMap[profileCreationModelGoOutAtNight];
}

enums.ProfileCreationModelGoOutAtNight profileCreationModelGoOutAtNightFromJson(
    Object? profileCreationModelGoOutAtNight) {
  if (profileCreationModelGoOutAtNight is int) {
    return enums.$ProfileCreationModelGoOutAtNightMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                profileCreationModelGoOutAtNight.toString(),
            orElse: () => const MapEntry(
                enums.ProfileCreationModelGoOutAtNight.swaggerGeneratedUnknown,
                ''))
        .key;
  }

  if (profileCreationModelGoOutAtNight is String) {
    return enums.$ProfileCreationModelGoOutAtNightMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                profileCreationModelGoOutAtNight.toLowerCase(),
            orElse: () => const MapEntry(
                enums.ProfileCreationModelGoOutAtNight.swaggerGeneratedUnknown,
                ''))
        .key;
  }

  return enums.ProfileCreationModelGoOutAtNight.swaggerGeneratedUnknown;
}

List<String> profileCreationModelGoOutAtNightListToJson(
    List<enums.ProfileCreationModelGoOutAtNight>?
        profileCreationModelGoOutAtNight) {
  if (profileCreationModelGoOutAtNight == null) {
    return [];
  }

  return profileCreationModelGoOutAtNight
      .map((e) => enums.$ProfileCreationModelGoOutAtNightMap[e]!)
      .toList();
}

List<enums.ProfileCreationModelGoOutAtNight>
    profileCreationModelGoOutAtNightListFromJson(
        List? profileCreationModelGoOutAtNight) {
  if (profileCreationModelGoOutAtNight == null) {
    return [];
  }

  return profileCreationModelGoOutAtNight
      .map((e) => profileCreationModelGoOutAtNightFromJson(e.toString()))
      .toList();
}

String? profileCreationModelSportToJson(
    enums.ProfileCreationModelSport? profileCreationModelSport) {
  return enums.$ProfileCreationModelSportMap[profileCreationModelSport];
}

enums.ProfileCreationModelSport profileCreationModelSportFromJson(
    Object? profileCreationModelSport) {
  if (profileCreationModelSport is int) {
    return enums.$ProfileCreationModelSportMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                profileCreationModelSport.toString(),
            orElse: () => const MapEntry(
                enums.ProfileCreationModelSport.swaggerGeneratedUnknown, ''))
        .key;
  }

  if (profileCreationModelSport is String) {
    return enums.$ProfileCreationModelSportMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                profileCreationModelSport.toLowerCase(),
            orElse: () => const MapEntry(
                enums.ProfileCreationModelSport.swaggerGeneratedUnknown, ''))
        .key;
  }

  return enums.ProfileCreationModelSport.swaggerGeneratedUnknown;
}

List<String> profileCreationModelSportListToJson(
    List<enums.ProfileCreationModelSport>? profileCreationModelSport) {
  if (profileCreationModelSport == null) {
    return [];
  }

  return profileCreationModelSport
      .map((e) => enums.$ProfileCreationModelSportMap[e]!)
      .toList();
}

List<enums.ProfileCreationModelSport> profileCreationModelSportListFromJson(
    List? profileCreationModelSport) {
  if (profileCreationModelSport == null) {
    return [];
  }

  return profileCreationModelSport
      .map((e) => profileCreationModelSportFromJson(e.toString()))
      .toList();
}

String? profileModelDestinationTypesToJson(
    enums.ProfileModelDestinationTypes? profileModelDestinationTypes) {
  return enums.$ProfileModelDestinationTypesMap[profileModelDestinationTypes];
}

enums.ProfileModelDestinationTypes profileModelDestinationTypesFromJson(
    Object? profileModelDestinationTypes) {
  if (profileModelDestinationTypes is int) {
    return enums.$ProfileModelDestinationTypesMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                profileModelDestinationTypes.toString(),
            orElse: () => const MapEntry(
                enums.ProfileModelDestinationTypes.swaggerGeneratedUnknown, ''))
        .key;
  }

  if (profileModelDestinationTypes is String) {
    return enums.$ProfileModelDestinationTypesMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                profileModelDestinationTypes.toLowerCase(),
            orElse: () => const MapEntry(
                enums.ProfileModelDestinationTypes.swaggerGeneratedUnknown, ''))
        .key;
  }

  return enums.ProfileModelDestinationTypes.swaggerGeneratedUnknown;
}

List<String> profileModelDestinationTypesListToJson(
    List<enums.ProfileModelDestinationTypes>? profileModelDestinationTypes) {
  if (profileModelDestinationTypes == null) {
    return [];
  }

  return profileModelDestinationTypes
      .map((e) => enums.$ProfileModelDestinationTypesMap[e]!)
      .toList();
}

List<enums.ProfileModelDestinationTypes>
    profileModelDestinationTypesListFromJson(
        List? profileModelDestinationTypes) {
  if (profileModelDestinationTypes == null) {
    return [];
  }

  return profileModelDestinationTypes
      .map((e) => profileModelDestinationTypesFromJson(e.toString()))
      .toList();
}

String? profileModelTravelWithPersonFromSameCityToJson(
    enums.ProfileModelTravelWithPersonFromSameCity?
        profileModelTravelWithPersonFromSameCity) {
  return enums.$ProfileModelTravelWithPersonFromSameCityMap[
      profileModelTravelWithPersonFromSameCity];
}

enums.ProfileModelTravelWithPersonFromSameCity
    profileModelTravelWithPersonFromSameCityFromJson(
        Object? profileModelTravelWithPersonFromSameCity) {
  if (profileModelTravelWithPersonFromSameCity is int) {
    return enums.$ProfileModelTravelWithPersonFromSameCityMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                profileModelTravelWithPersonFromSameCity.toString(),
            orElse: () => const MapEntry(
                enums.ProfileModelTravelWithPersonFromSameCity
                    .swaggerGeneratedUnknown,
                ''))
        .key;
  }

  if (profileModelTravelWithPersonFromSameCity is String) {
    return enums.$ProfileModelTravelWithPersonFromSameCityMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                profileModelTravelWithPersonFromSameCity.toLowerCase(),
            orElse: () => const MapEntry(
                enums.ProfileModelTravelWithPersonFromSameCity
                    .swaggerGeneratedUnknown,
                ''))
        .key;
  }

  return enums.ProfileModelTravelWithPersonFromSameCity.swaggerGeneratedUnknown;
}

List<String> profileModelTravelWithPersonFromSameCityListToJson(
    List<enums.ProfileModelTravelWithPersonFromSameCity>?
        profileModelTravelWithPersonFromSameCity) {
  if (profileModelTravelWithPersonFromSameCity == null) {
    return [];
  }

  return profileModelTravelWithPersonFromSameCity
      .map((e) => enums.$ProfileModelTravelWithPersonFromSameCityMap[e]!)
      .toList();
}

List<enums.ProfileModelTravelWithPersonFromSameCity>
    profileModelTravelWithPersonFromSameCityListFromJson(
        List? profileModelTravelWithPersonFromSameCity) {
  if (profileModelTravelWithPersonFromSameCity == null) {
    return [];
  }

  return profileModelTravelWithPersonFromSameCity
      .map(
          (e) => profileModelTravelWithPersonFromSameCityFromJson(e.toString()))
      .toList();
}

String? profileModelTravelWithPersonFromSameCountryToJson(
    enums.ProfileModelTravelWithPersonFromSameCountry?
        profileModelTravelWithPersonFromSameCountry) {
  return enums.$ProfileModelTravelWithPersonFromSameCountryMap[
      profileModelTravelWithPersonFromSameCountry];
}

enums.ProfileModelTravelWithPersonFromSameCountry
    profileModelTravelWithPersonFromSameCountryFromJson(
        Object? profileModelTravelWithPersonFromSameCountry) {
  if (profileModelTravelWithPersonFromSameCountry is int) {
    return enums.$ProfileModelTravelWithPersonFromSameCountryMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                profileModelTravelWithPersonFromSameCountry.toString(),
            orElse: () => const MapEntry(
                enums.ProfileModelTravelWithPersonFromSameCountry
                    .swaggerGeneratedUnknown,
                ''))
        .key;
  }

  if (profileModelTravelWithPersonFromSameCountry is String) {
    return enums.$ProfileModelTravelWithPersonFromSameCountryMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                profileModelTravelWithPersonFromSameCountry.toLowerCase(),
            orElse: () => const MapEntry(
                enums.ProfileModelTravelWithPersonFromSameCountry
                    .swaggerGeneratedUnknown,
                ''))
        .key;
  }

  return enums
      .ProfileModelTravelWithPersonFromSameCountry.swaggerGeneratedUnknown;
}

List<String> profileModelTravelWithPersonFromSameCountryListToJson(
    List<enums.ProfileModelTravelWithPersonFromSameCountry>?
        profileModelTravelWithPersonFromSameCountry) {
  if (profileModelTravelWithPersonFromSameCountry == null) {
    return [];
  }

  return profileModelTravelWithPersonFromSameCountry
      .map((e) => enums.$ProfileModelTravelWithPersonFromSameCountryMap[e]!)
      .toList();
}

List<enums.ProfileModelTravelWithPersonFromSameCountry>
    profileModelTravelWithPersonFromSameCountryListFromJson(
        List? profileModelTravelWithPersonFromSameCountry) {
  if (profileModelTravelWithPersonFromSameCountry == null) {
    return [];
  }

  return profileModelTravelWithPersonFromSameCountry
      .map((e) =>
          profileModelTravelWithPersonFromSameCountryFromJson(e.toString()))
      .toList();
}

String? profileModelTravelWithPersonSameLanguageToJson(
    enums.ProfileModelTravelWithPersonSameLanguage?
        profileModelTravelWithPersonSameLanguage) {
  return enums.$ProfileModelTravelWithPersonSameLanguageMap[
      profileModelTravelWithPersonSameLanguage];
}

enums.ProfileModelTravelWithPersonSameLanguage
    profileModelTravelWithPersonSameLanguageFromJson(
        Object? profileModelTravelWithPersonSameLanguage) {
  if (profileModelTravelWithPersonSameLanguage is int) {
    return enums.$ProfileModelTravelWithPersonSameLanguageMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                profileModelTravelWithPersonSameLanguage.toString(),
            orElse: () => const MapEntry(
                enums.ProfileModelTravelWithPersonSameLanguage
                    .swaggerGeneratedUnknown,
                ''))
        .key;
  }

  if (profileModelTravelWithPersonSameLanguage is String) {
    return enums.$ProfileModelTravelWithPersonSameLanguageMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                profileModelTravelWithPersonSameLanguage.toLowerCase(),
            orElse: () => const MapEntry(
                enums.ProfileModelTravelWithPersonSameLanguage
                    .swaggerGeneratedUnknown,
                ''))
        .key;
  }

  return enums.ProfileModelTravelWithPersonSameLanguage.swaggerGeneratedUnknown;
}

List<String> profileModelTravelWithPersonSameLanguageListToJson(
    List<enums.ProfileModelTravelWithPersonSameLanguage>?
        profileModelTravelWithPersonSameLanguage) {
  if (profileModelTravelWithPersonSameLanguage == null) {
    return [];
  }

  return profileModelTravelWithPersonSameLanguage
      .map((e) => enums.$ProfileModelTravelWithPersonSameLanguageMap[e]!)
      .toList();
}

List<enums.ProfileModelTravelWithPersonSameLanguage>
    profileModelTravelWithPersonSameLanguageListFromJson(
        List? profileModelTravelWithPersonSameLanguage) {
  if (profileModelTravelWithPersonSameLanguage == null) {
    return [];
  }

  return profileModelTravelWithPersonSameLanguage
      .map(
          (e) => profileModelTravelWithPersonSameLanguageFromJson(e.toString()))
      .toList();
}

String? profileModelGenderToJson(enums.ProfileModelGender? profileModelGender) {
  return enums.$ProfileModelGenderMap[profileModelGender];
}

enums.ProfileModelGender profileModelGenderFromJson(
    Object? profileModelGender) {
  if (profileModelGender is int) {
    return enums.$ProfileModelGenderMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() == profileModelGender.toString(),
            orElse: () => const MapEntry(
                enums.ProfileModelGender.swaggerGeneratedUnknown, ''))
        .key;
  }

  if (profileModelGender is String) {
    return enums.$ProfileModelGenderMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() == profileModelGender.toLowerCase(),
            orElse: () => const MapEntry(
                enums.ProfileModelGender.swaggerGeneratedUnknown, ''))
        .key;
  }

  return enums.ProfileModelGender.swaggerGeneratedUnknown;
}

List<String> profileModelGenderListToJson(
    List<enums.ProfileModelGender>? profileModelGender) {
  if (profileModelGender == null) {
    return [];
  }

  return profileModelGender
      .map((e) => enums.$ProfileModelGenderMap[e]!)
      .toList();
}

List<enums.ProfileModelGender> profileModelGenderListFromJson(
    List? profileModelGender) {
  if (profileModelGender == null) {
    return [];
  }

  return profileModelGender
      .map((e) => profileModelGenderFromJson(e.toString()))
      .toList();
}

String? profileModelChillOrVisitToJson(
    enums.ProfileModelChillOrVisit? profileModelChillOrVisit) {
  return enums.$ProfileModelChillOrVisitMap[profileModelChillOrVisit];
}

enums.ProfileModelChillOrVisit profileModelChillOrVisitFromJson(
    Object? profileModelChillOrVisit) {
  if (profileModelChillOrVisit is int) {
    return enums.$ProfileModelChillOrVisitMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                profileModelChillOrVisit.toString(),
            orElse: () => const MapEntry(
                enums.ProfileModelChillOrVisit.swaggerGeneratedUnknown, ''))
        .key;
  }

  if (profileModelChillOrVisit is String) {
    return enums.$ProfileModelChillOrVisitMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                profileModelChillOrVisit.toLowerCase(),
            orElse: () => const MapEntry(
                enums.ProfileModelChillOrVisit.swaggerGeneratedUnknown, ''))
        .key;
  }

  return enums.ProfileModelChillOrVisit.swaggerGeneratedUnknown;
}

List<String> profileModelChillOrVisitListToJson(
    List<enums.ProfileModelChillOrVisit>? profileModelChillOrVisit) {
  if (profileModelChillOrVisit == null) {
    return [];
  }

  return profileModelChillOrVisit
      .map((e) => enums.$ProfileModelChillOrVisitMap[e]!)
      .toList();
}

List<enums.ProfileModelChillOrVisit> profileModelChillOrVisitListFromJson(
    List? profileModelChillOrVisit) {
  if (profileModelChillOrVisit == null) {
    return [];
  }

  return profileModelChillOrVisit
      .map((e) => profileModelChillOrVisitFromJson(e.toString()))
      .toList();
}

String? profileModelAboutFoodToJson(
    enums.ProfileModelAboutFood? profileModelAboutFood) {
  return enums.$ProfileModelAboutFoodMap[profileModelAboutFood];
}

enums.ProfileModelAboutFood profileModelAboutFoodFromJson(
    Object? profileModelAboutFood) {
  if (profileModelAboutFood is int) {
    return enums.$ProfileModelAboutFoodMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() == profileModelAboutFood.toString(),
            orElse: () => const MapEntry(
                enums.ProfileModelAboutFood.swaggerGeneratedUnknown, ''))
        .key;
  }

  if (profileModelAboutFood is String) {
    return enums.$ProfileModelAboutFoodMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                profileModelAboutFood.toLowerCase(),
            orElse: () => const MapEntry(
                enums.ProfileModelAboutFood.swaggerGeneratedUnknown, ''))
        .key;
  }

  return enums.ProfileModelAboutFood.swaggerGeneratedUnknown;
}

List<String> profileModelAboutFoodListToJson(
    List<enums.ProfileModelAboutFood>? profileModelAboutFood) {
  if (profileModelAboutFood == null) {
    return [];
  }

  return profileModelAboutFood
      .map((e) => enums.$ProfileModelAboutFoodMap[e]!)
      .toList();
}

List<enums.ProfileModelAboutFood> profileModelAboutFoodListFromJson(
    List? profileModelAboutFood) {
  if (profileModelAboutFood == null) {
    return [];
  }

  return profileModelAboutFood
      .map((e) => profileModelAboutFoodFromJson(e.toString()))
      .toList();
}

String? profileModelGoOutAtNightToJson(
    enums.ProfileModelGoOutAtNight? profileModelGoOutAtNight) {
  return enums.$ProfileModelGoOutAtNightMap[profileModelGoOutAtNight];
}

enums.ProfileModelGoOutAtNight profileModelGoOutAtNightFromJson(
    Object? profileModelGoOutAtNight) {
  if (profileModelGoOutAtNight is int) {
    return enums.$ProfileModelGoOutAtNightMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                profileModelGoOutAtNight.toString(),
            orElse: () => const MapEntry(
                enums.ProfileModelGoOutAtNight.swaggerGeneratedUnknown, ''))
        .key;
  }

  if (profileModelGoOutAtNight is String) {
    return enums.$ProfileModelGoOutAtNightMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                profileModelGoOutAtNight.toLowerCase(),
            orElse: () => const MapEntry(
                enums.ProfileModelGoOutAtNight.swaggerGeneratedUnknown, ''))
        .key;
  }

  return enums.ProfileModelGoOutAtNight.swaggerGeneratedUnknown;
}

List<String> profileModelGoOutAtNightListToJson(
    List<enums.ProfileModelGoOutAtNight>? profileModelGoOutAtNight) {
  if (profileModelGoOutAtNight == null) {
    return [];
  }

  return profileModelGoOutAtNight
      .map((e) => enums.$ProfileModelGoOutAtNightMap[e]!)
      .toList();
}

List<enums.ProfileModelGoOutAtNight> profileModelGoOutAtNightListFromJson(
    List? profileModelGoOutAtNight) {
  if (profileModelGoOutAtNight == null) {
    return [];
  }

  return profileModelGoOutAtNight
      .map((e) => profileModelGoOutAtNightFromJson(e.toString()))
      .toList();
}

String? profileModelSportToJson(enums.ProfileModelSport? profileModelSport) {
  return enums.$ProfileModelSportMap[profileModelSport];
}

enums.ProfileModelSport profileModelSportFromJson(Object? profileModelSport) {
  if (profileModelSport is int) {
    return enums.$ProfileModelSportMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() == profileModelSport.toString(),
            orElse: () => const MapEntry(
                enums.ProfileModelSport.swaggerGeneratedUnknown, ''))
        .key;
  }

  if (profileModelSport is String) {
    return enums.$ProfileModelSportMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() == profileModelSport.toLowerCase(),
            orElse: () => const MapEntry(
                enums.ProfileModelSport.swaggerGeneratedUnknown, ''))
        .key;
  }

  return enums.ProfileModelSport.swaggerGeneratedUnknown;
}

List<String> profileModelSportListToJson(
    List<enums.ProfileModelSport>? profileModelSport) {
  if (profileModelSport == null) {
    return [];
  }

  return profileModelSport.map((e) => enums.$ProfileModelSportMap[e]!).toList();
}

List<enums.ProfileModelSport> profileModelSportListFromJson(
    List? profileModelSport) {
  if (profileModelSport == null) {
    return [];
  }

  return profileModelSport
      .map((e) => profileModelSportFromJson(e.toString()))
      .toList();
}

String? userModelGenderToJson(enums.UserModelGender? userModelGender) {
  return enums.$UserModelGenderMap[userModelGender];
}

enums.UserModelGender userModelGenderFromJson(Object? userModelGender) {
  if (userModelGender is int) {
    return enums.$UserModelGenderMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() == userModelGender.toString(),
            orElse: () => const MapEntry(
                enums.UserModelGender.swaggerGeneratedUnknown, ''))
        .key;
  }

  if (userModelGender is String) {
    return enums.$UserModelGenderMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() == userModelGender.toLowerCase(),
            orElse: () => const MapEntry(
                enums.UserModelGender.swaggerGeneratedUnknown, ''))
        .key;
  }

  return enums.UserModelGender.swaggerGeneratedUnknown;
}

List<String> userModelGenderListToJson(
    List<enums.UserModelGender>? userModelGender) {
  if (userModelGender == null) {
    return [];
  }

  return userModelGender.map((e) => enums.$UserModelGenderMap[e]!).toList();
}

List<enums.UserModelGender> userModelGenderListFromJson(List? userModelGender) {
  if (userModelGender == null) {
    return [];
  }

  return userModelGender
      .map((e) => userModelGenderFromJson(e.toString()))
      .toList();
}

String? userModelRolesToJson(enums.UserModelRoles? userModelRoles) {
  return enums.$UserModelRolesMap[userModelRoles];
}

enums.UserModelRoles userModelRolesFromJson(Object? userModelRoles) {
  if (userModelRoles is int) {
    return enums.$UserModelRolesMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() == userModelRoles.toString(),
            orElse: () => const MapEntry(
                enums.UserModelRoles.swaggerGeneratedUnknown, ''))
        .key;
  }

  if (userModelRoles is String) {
    return enums.$UserModelRolesMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() == userModelRoles.toLowerCase(),
            orElse: () => const MapEntry(
                enums.UserModelRoles.swaggerGeneratedUnknown, ''))
        .key;
  }

  return enums.UserModelRoles.swaggerGeneratedUnknown;
}

List<String> userModelRolesListToJson(
    List<enums.UserModelRoles>? userModelRoles) {
  if (userModelRoles == null) {
    return [];
  }

  return userModelRoles.map((e) => enums.$UserModelRolesMap[e]!).toList();
}

List<enums.UserModelRoles> userModelRolesListFromJson(List? userModelRoles) {
  if (userModelRoles == null) {
    return [];
  }

  return userModelRoles
      .map((e) => userModelRolesFromJson(e.toString()))
      .toList();
}

typedef $JsonFactory<T> = T Function(Map<String, dynamic> json);

class $CustomJsonDecoder {
  $CustomJsonDecoder(this.factories);

  final Map<Type, $JsonFactory> factories;

  dynamic decode<T>(dynamic entity) {
    if (entity is Iterable) {
      return _decodeList<T>(entity);
    }

    if (entity is T) {
      return entity;
    }

    if (entity is Map<String, dynamic>) {
      return _decodeMap<T>(entity);
    }

    return entity;
  }

  T _decodeMap<T>(Map<String, dynamic> values) {
    final jsonFactory = factories[T];
    if (jsonFactory == null || jsonFactory is! $JsonFactory<T>) {
      return throw "Could not find factory for type $T. Is '$T: $T.fromJsonFactory' included in the CustomJsonDecoder instance creation in bootstrapper.dart?";
    }

    return jsonFactory(values);
  }

  List<T> _decodeList<T>(Iterable values) =>
      values.where((v) => v != null).map<T>((v) => decode<T>(v) as T).toList();
}

class $JsonSerializableConverter extends chopper.JsonConverter {
  @override
  chopper.Response<ResultType> convertResponse<ResultType, Item>(
      chopper.Response response) {
    if (response.bodyString.isEmpty) {
      // In rare cases, when let's say 204 (no content) is returned -
      // we cannot decode the missing json with the result type specified
      return chopper.Response(response.base, null, error: response.error);
    }

    final jsonRes = super.convertResponse(response);
    return jsonRes.copyWith<ResultType>(
        body: $jsonDecoder.decode<Item>(jsonRes.body) as ResultType);
  }
}

final $jsonDecoder = $CustomJsonDecoder(generatedMapping);

// ignore: unused_element
String? _dateToJson(DateTime? date) {
  if (date == null) {
    return null;
  }

  final year = date.year.toString();
  final month = date.month < 10 ? '0${date.month}' : date.month.toString();
  final day = date.day < 10 ? '0${date.day}' : date.day.toString();

  return '$year-$month-$day';
}
