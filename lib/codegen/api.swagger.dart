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

  ///Get all profiles from a user
  ///@param id
  Future<chopper.Response<List<ProfileModel>>> idProfilesGet(
      {required num? id}) {
    generatedMapping.putIfAbsent(
        ProfileModel, () => ProfileModel.fromJsonFactory);

    return _idProfilesGet(id: id);
  }

  ///Get all profiles from a user
  ///@param id
  @Get(path: '/{id}/profiles')
  Future<chopper.Response<List<ProfileModel>>> _idProfilesGet(
      {@Path('id') required num? id});

  ///Create a profile
  ///@param id
  Future<chopper.Response<ProfileModel>> idProfilesPost(
      {required num? id, required ProfileCreationRequest? body}) {
    generatedMapping.putIfAbsent(
        ProfileModel, () => ProfileModel.fromJsonFactory);

    return _idProfilesPost(id: id, body: body);
  }

  ///Create a profile
  ///@param id
  @Post(path: '/{id}/profiles')
  Future<chopper.Response<ProfileModel>> _idProfilesPost(
      {@Path('id') required num? id,
      @Body() required ProfileCreationRequest? body});

  ///Create a profile and start the matchmaking
  ///@param user_id
  Future<chopper.Response> matchmakingPost(
      {required num? userId, required ProfileCreationRequest? body}) {
    return _matchmakingPost(userId: userId, body: body);
  }

  ///Create a profile and start the matchmaking
  ///@param user_id
  @Post(path: '/matchmaking')
  Future<chopper.Response> _matchmakingPost(
      {@Query('user_id') required num? userId,
      @Body() required ProfileCreationRequest? body});

  ///Create a private group
  ///@param id
  Future<chopper.Response<GroupModel>> groupsPrivateIdPost(
      {required num? id, required CreatePrivateGroupRequest? body}) {
    generatedMapping.putIfAbsent(GroupModel, () => GroupModel.fromJsonFactory);

    return _groupsPrivateIdPost(id: id, body: body);
  }

  ///Create a private group
  ///@param id
  @Post(path: '/groups/private/{id}')
  Future<chopper.Response<GroupModel>> _groupsPrivateIdPost(
      {@Path('id') required num? id,
      @Body() required CreatePrivateGroupRequest? body});

  ///Add user to private group
  ///@param group
  Future<chopper.Response> groupsPrivateGroupUserPost(
      {required num? group, required ModelWithEmail? body}) {
    return _groupsPrivateGroupUserPost(group: group, body: body);
  }

  ///Add user to private group
  ///@param group
  @Post(path: '/groups/private/{group}/user')
  Future<chopper.Response> _groupsPrivateGroupUserPost(
      {@Path('group') required num? group,
      @Body() required ModelWithEmail? body});

  ///Get all the channels from a group
  ///@param group
  Future<chopper.Response<List<ChannelModel>>> channelsGroupGet(
      {required num? group}) {
    generatedMapping.putIfAbsent(
        ChannelModel, () => ChannelModel.fromJsonFactory);

    return _channelsGroupGet(group: group);
  }

  ///Get all the channels from a group
  ///@param group
  @Get(path: '/channels/{group}')
  Future<chopper.Response<List<ChannelModel>>> _channelsGroupGet(
      {@Path('group') required num? group});

  ///Create a channel
  ///@param group
  Future<chopper.Response<ChannelModel>> channelsGroupPost(
      {required num? group, required CreateChannelRequest? body}) {
    generatedMapping.putIfAbsent(
        ChannelModel, () => ChannelModel.fromJsonFactory);

    return _channelsGroupPost(group: group, body: body);
  }

  ///Create a channel
  ///@param group
  @Post(path: '/channels/{group}')
  Future<chopper.Response<ChannelModel>> _channelsGroupPost(
      {@Path('group') required num? group,
      @Body() required CreateChannelRequest? body});

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
  Future<chopper.Response<GoogleAuthResponse>> authGooglePost(
      {required GoogleRequest? body}) {
    generatedMapping.putIfAbsent(
        GoogleAuthResponse, () => GoogleAuthResponse.fromJsonFactory);

    return _authGooglePost(body: body);
  }

  ///Log a user, to allow authenticated endpoints
  @Post(path: '/auth/google')
  Future<chopper.Response<GoogleAuthResponse>> _authGooglePost(
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

  ///Update a profile
  ///@param id
  ///@param profile
  Future<chopper.Response> idProfilesProfileUpdatePatch(
      {required num? id,
      required num? profile,
      required ProfileUpdateRequest? body}) {
    return _idProfilesProfileUpdatePatch(id: id, profile: profile, body: body);
  }

  ///Update a profile
  ///@param id
  ///@param profile
  @Patch(path: '/{id}/profiles/{profile}/update')
  Future<chopper.Response> _idProfilesProfileUpdatePatch(
      {@Path('id') required num? id,
      @Path('profile') required num? profile,
      @Body() required ProfileUpdateRequest? body});

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

  ///Accept the invitation to the group
  ///@param group
  ///@param id
  Future<chopper.Response> groupsGroupJoinIdPatch(
      {required num? group, required num? id}) {
    return _groupsGroupJoinIdPatch(group: group, id: id);
  }

  ///Accept the invitation to the group
  ///@param group
  ///@param id
  @Patch(path: '/groups/{group}/join/{id}', optionalBody: true)
  Future<chopper.Response> _groupsGroupJoinIdPatch(
      {@Path('group') required num? group, @Path('id') required num? id});

  ///Delete the private group
  ///@param group
  Future<chopper.Response> groupsPrivateGroupDelete({required num? group}) {
    return _groupsPrivateGroupDelete(group: group);
  }

  ///Delete the private group
  ///@param group
  @Delete(path: '/groups/private/{group}')
  Future<chopper.Response> _groupsPrivateGroupDelete(
      {@Path('group') required num? group});

  ///Update the private group
  ///@param group
  Future<chopper.Response> groupsPrivateGroupPatch(
      {required num? group, required UpdateGroupRequest? body}) {
    return _groupsPrivateGroupPatch(group: group, body: body);
  }

  ///Update the private group
  ///@param group
  @Patch(path: '/groups/private/{group}')
  Future<chopper.Response> _groupsPrivateGroupPatch(
      {@Path('group') required num? group,
      @Body() required UpdateGroupRequest? body});

  ///Pin a message
  ///@param message_id
  ///@param pin
  Future<chopper.Response<MessageResponse>> chatMessageIdPinnedPatch(
      {required num? messageId, bool? pin}) {
    generatedMapping.putIfAbsent(
        MessageResponse, () => MessageResponse.fromJsonFactory);

    return _chatMessageIdPinnedPatch(messageId: messageId, pin: pin);
  }

  ///Pin a message
  ///@param message_id
  ///@param pin
  @Patch(path: '/chat/{message_id}/pinned', optionalBody: true)
  Future<chopper.Response<MessageResponse>> _chatMessageIdPinnedPatch(
      {@Path('message_id') required num? messageId, @Query('pin') bool? pin});

  ///Delete a channel
  ///@param id
  Future<chopper.Response> channelsIdDelete({required num? id}) {
    return _channelsIdDelete(id: id);
  }

  ///Delete a channel
  ///@param id
  @Delete(path: '/channels/{id}')
  Future<chopper.Response> _channelsIdDelete({@Path('id') required num? id});

  ///Update a channel
  ///@param id
  Future<chopper.Response> channelsIdPatch(
      {required num? id, required UpdateChannelRequest? body}) {
    return _channelsIdPatch(id: id, body: body);
  }

  ///Update a channel
  ///@param id
  @Patch(path: '/channels/{id}')
  Future<chopper.Response> _channelsIdPatch(
      {@Path('id') required num? id,
      @Body() required UpdateChannelRequest? body});

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
  Future<chopper.Response<List<UserEntity>>> usersGet() {
    generatedMapping.putIfAbsent(UserEntity, () => UserEntity.fromJsonFactory);

    return _usersGet();
  }

  ///
  @Get(path: '/users')
  Future<chopper.Response<List<UserEntity>>> _usersGet();

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

  ///Get the state of a match making task
  ///@param taskId
  Future<chopper.Response<MatchMakingResult>> matchmakingTaskIdGet(
      {required num? taskId}) {
    generatedMapping.putIfAbsent(
        MatchMakingResult, () => MatchMakingResult.fromJsonFactory);

    return _matchmakingTaskIdGet(taskId: taskId);
  }

  ///Get the state of a match making task
  ///@param taskId
  @Get(path: '/matchmaking/{taskId}')
  Future<chopper.Response<MatchMakingResult>> _matchmakingTaskIdGet(
      {@Path('taskId') required num? taskId});

  ///Get all the group of the user
  ///@param id
  Future<chopper.Response<List<GroupModel>>> groupsIdGet({required num? id}) {
    generatedMapping.putIfAbsent(GroupModel, () => GroupModel.fromJsonFactory);

    return _groupsIdGet(id: id);
  }

  ///Get all the group of the user
  ///@param id
  @Get(path: '/groups/{id}')
  Future<chopper.Response<List<GroupModel>>> _groupsIdGet(
      {@Path('id') required num? id});

  ///Get all the group invitation of the user
  ///@param id
  Future<chopper.Response<List<GroupModel>>> groupsInvitesIdGet(
      {required num? id}) {
    generatedMapping.putIfAbsent(GroupModel, () => GroupModel.fromJsonFactory);

    return _groupsInvitesIdGet(id: id);
  }

  ///Get all the group invitation of the user
  ///@param id
  @Get(path: '/groups/invites/{id}')
  Future<chopper.Response<List<GroupModel>>> _groupsInvitesIdGet(
      {@Path('id') required num? id});

  ///Get the most recent channel's messages, by pages of size 50
  ///@param channel_id
  ///@param page
  Future<chopper.Response<List<MessageResponse>>> chatChannelIdGet(
      {required num? channelId, int? page}) {
    generatedMapping.putIfAbsent(
        MessageResponse, () => MessageResponse.fromJsonFactory);

    return _chatChannelIdGet(channelId: channelId, page: page);
  }

  ///Get the most recent channel's messages, by pages of size 50
  ///@param channel_id
  ///@param page
  @Get(path: '/chat/{channel_id}')
  Future<chopper.Response<List<MessageResponse>>> _chatChannelIdGet(
      {@Path('channel_id') required num? channelId, @Query('page') int? page});

  ///Get all pinned messages
  ///@param channel_id
  Future<chopper.Response<List<MessageResponse>>> chatChannelIdPinnedGet(
      {required num? channelId}) {
    generatedMapping.putIfAbsent(
        MessageResponse, () => MessageResponse.fromJsonFactory);

    return _chatChannelIdPinnedGet(channelId: channelId);
  }

  ///Get all pinned messages
  ///@param channel_id
  @Get(path: '/chat/{channel_id}/pinned')
  Future<chopper.Response<List<MessageResponse>>> _chatChannelIdPinnedGet(
      {@Path('channel_id') required num? channelId});

  ///Delete the profile of a user
  ///@param id
  ///@param profile
  Future<chopper.Response> idProfilesProfileDelete(
      {required num? id, required num? profile}) {
    return _idProfilesProfileDelete(id: id, profile: profile);
  }

  ///Delete the profile of a user
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

  ///Remove the user from a group
  ///@param group
  ///@param id
  Future<chopper.Response> groupsGroupUserIdDelete(
      {required num? group, required num? id}) {
    return _groupsGroupUserIdDelete(group: group, id: id);
  }

  ///Remove the user from a group
  ///@param group
  ///@param id
  @Delete(path: '/groups/{group}/user/{id}')
  Future<chopper.Response> _groupsGroupUserIdDelete(
      {@Path('group') required num? group, @Path('id') required num? id});

  ///Remove user from private group
  ///@param group
  ///@param id
  Future<chopper.Response> groupsPrivateGroupUserIdDelete(
      {required num? group, required num? id}) {
    return _groupsPrivateGroupUserIdDelete(group: group, id: id);
  }

  ///Remove user from private group
  ///@param group
  ///@param id
  @Delete(path: '/groups/private/{group}/user/{id}')
  Future<chopper.Response> _groupsPrivateGroupUserIdDelete(
      {@Path('group') required num? group, @Path('id') required num? id});
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
  final String? startDate;
  @JsonKey(name: 'endDate')
  final String? endDate;
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
  AvailabilityAnswerModel copyWith({String? startDate, String? endDate}) {
    return AvailabilityAnswerModel(
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate);
  }
}

@JsonSerializable(explicitToJson: true)
class ProfileCreationRequest {
  ProfileCreationRequest({
    this.name,
    this.duration,
    this.budget,
    this.destinationTypes,
    this.ages,
    this.travelWithPersonFromSameCity,
    this.travelWithPersonFromSameCountry,
    this.travelWithPersonSameLanguage,
    this.gender,
    this.groupSize,
    this.chillOrVisit,
    this.aboutFood,
    this.goOutAtNight,
    this.sport,
    this.availabilities,
  });

  factory ProfileCreationRequest.fromJson(Map<String, dynamic> json) =>
      _$ProfileCreationRequestFromJson(json);

  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'duration')
  final RangeAnswerModel? duration;
  @JsonKey(name: 'budget')
  final RangeAnswerModel? budget;
  @JsonKey(
      name: 'destinationTypes',
      toJson: profileCreationRequestDestinationTypesListToJson,
      fromJson: profileCreationRequestDestinationTypesListFromJson)
  final List<enums.ProfileCreationRequestDestinationTypes>? destinationTypes;
  @JsonKey(name: 'ages')
  final RangeAnswerModel? ages;
  @JsonKey(
      name: 'travelWithPersonFromSameCity',
      toJson: profileCreationRequestTravelWithPersonFromSameCityToJson,
      fromJson: profileCreationRequestTravelWithPersonFromSameCityFromJson)
  final enums.ProfileCreationRequestTravelWithPersonFromSameCity?
      travelWithPersonFromSameCity;
  @JsonKey(
      name: 'travelWithPersonFromSameCountry',
      toJson: profileCreationRequestTravelWithPersonFromSameCountryToJson,
      fromJson: profileCreationRequestTravelWithPersonFromSameCountryFromJson)
  final enums.ProfileCreationRequestTravelWithPersonFromSameCountry?
      travelWithPersonFromSameCountry;
  @JsonKey(
      name: 'travelWithPersonSameLanguage',
      toJson: profileCreationRequestTravelWithPersonSameLanguageToJson,
      fromJson: profileCreationRequestTravelWithPersonSameLanguageFromJson)
  final enums.ProfileCreationRequestTravelWithPersonSameLanguage?
      travelWithPersonSameLanguage;
  @JsonKey(
      name: 'gender',
      toJson: profileCreationRequestGenderToJson,
      fromJson: profileCreationRequestGenderFromJson)
  final enums.ProfileCreationRequestGender? gender;
  @JsonKey(name: 'groupSize')
  final RangeAnswerModel? groupSize;
  @JsonKey(
      name: 'chillOrVisit',
      toJson: profileCreationRequestChillOrVisitToJson,
      fromJson: profileCreationRequestChillOrVisitFromJson)
  final enums.ProfileCreationRequestChillOrVisit? chillOrVisit;
  @JsonKey(
      name: 'aboutFood',
      toJson: profileCreationRequestAboutFoodToJson,
      fromJson: profileCreationRequestAboutFoodFromJson)
  final enums.ProfileCreationRequestAboutFood? aboutFood;
  @JsonKey(
      name: 'goOutAtNight',
      toJson: profileCreationRequestGoOutAtNightToJson,
      fromJson: profileCreationRequestGoOutAtNightFromJson)
  final enums.ProfileCreationRequestGoOutAtNight? goOutAtNight;
  @JsonKey(
      name: 'sport',
      toJson: profileCreationRequestSportToJson,
      fromJson: profileCreationRequestSportFromJson)
  final enums.ProfileCreationRequestSport? sport;
  @JsonKey(name: 'availabilities', defaultValue: <AvailabilityAnswerModel>[])
  final List<AvailabilityAnswerModel>? availabilities;
  static const fromJsonFactory = _$ProfileCreationRequestFromJson;
  static const toJsonFactory = _$ProfileCreationRequestToJson;
  Map<String, dynamic> toJson() => _$ProfileCreationRequestToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ProfileCreationRequest &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
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
            (identical(other.groupSize, groupSize) ||
                const DeepCollectionEquality()
                    .equals(other.groupSize, groupSize)) &&
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
            (identical(other.availabilities, availabilities) ||
                const DeepCollectionEquality().equals(other.availabilities, availabilities)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(duration) ^
      const DeepCollectionEquality().hash(budget) ^
      const DeepCollectionEquality().hash(destinationTypes) ^
      const DeepCollectionEquality().hash(ages) ^
      const DeepCollectionEquality().hash(travelWithPersonFromSameCity) ^
      const DeepCollectionEquality().hash(travelWithPersonFromSameCountry) ^
      const DeepCollectionEquality().hash(travelWithPersonSameLanguage) ^
      const DeepCollectionEquality().hash(gender) ^
      const DeepCollectionEquality().hash(groupSize) ^
      const DeepCollectionEquality().hash(chillOrVisit) ^
      const DeepCollectionEquality().hash(aboutFood) ^
      const DeepCollectionEquality().hash(goOutAtNight) ^
      const DeepCollectionEquality().hash(sport) ^
      const DeepCollectionEquality().hash(availabilities) ^
      runtimeType.hashCode;
}

extension $ProfileCreationRequestExtension on ProfileCreationRequest {
  ProfileCreationRequest copyWith(
      {String? name,
      RangeAnswerModel? duration,
      RangeAnswerModel? budget,
      List<enums.ProfileCreationRequestDestinationTypes>? destinationTypes,
      RangeAnswerModel? ages,
      enums.ProfileCreationRequestTravelWithPersonFromSameCity?
          travelWithPersonFromSameCity,
      enums.ProfileCreationRequestTravelWithPersonFromSameCountry?
          travelWithPersonFromSameCountry,
      enums.ProfileCreationRequestTravelWithPersonSameLanguage?
          travelWithPersonSameLanguage,
      enums.ProfileCreationRequestGender? gender,
      RangeAnswerModel? groupSize,
      enums.ProfileCreationRequestChillOrVisit? chillOrVisit,
      enums.ProfileCreationRequestAboutFood? aboutFood,
      enums.ProfileCreationRequestGoOutAtNight? goOutAtNight,
      enums.ProfileCreationRequestSport? sport,
      List<AvailabilityAnswerModel>? availabilities}) {
    return ProfileCreationRequest(
        name: name ?? this.name,
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
        groupSize: groupSize ?? this.groupSize,
        chillOrVisit: chillOrVisit ?? this.chillOrVisit,
        aboutFood: aboutFood ?? this.aboutFood,
        goOutAtNight: goOutAtNight ?? this.goOutAtNight,
        sport: sport ?? this.sport,
        availabilities: availabilities ?? this.availabilities);
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
    this.name,
    this.availabilities,
    this.duration,
    this.budget,
    this.destinationTypes,
    this.ages,
    this.travelWithPersonFromSameCity,
    this.travelWithPersonFromSameCountry,
    this.travelWithPersonSameLanguage,
    this.gender,
    this.groupSize,
    this.chillOrVisit,
    this.aboutFood,
    this.goOutAtNight,
    this.sport,
    this.active,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);

  @JsonKey(name: 'id')
  final num? id;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'availabilities', defaultValue: <AvailabilityAnswerModel>[])
  final List<AvailabilityAnswerModel>? availabilities;
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
  @JsonKey(name: 'groupSize')
  final RangeAnswerModel? groupSize;
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
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.availabilities, availabilities) ||
                const DeepCollectionEquality()
                    .equals(other.availabilities, availabilities)) &&
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
            (identical(other.groupSize, groupSize) ||
                const DeepCollectionEquality()
                    .equals(other.groupSize, groupSize)) &&
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
            (identical(other.active, active) ||
                const DeepCollectionEquality().equals(other.active, active)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(availabilities) ^
      const DeepCollectionEquality().hash(duration) ^
      const DeepCollectionEquality().hash(budget) ^
      const DeepCollectionEquality().hash(destinationTypes) ^
      const DeepCollectionEquality().hash(ages) ^
      const DeepCollectionEquality().hash(travelWithPersonFromSameCity) ^
      const DeepCollectionEquality().hash(travelWithPersonFromSameCountry) ^
      const DeepCollectionEquality().hash(travelWithPersonSameLanguage) ^
      const DeepCollectionEquality().hash(gender) ^
      const DeepCollectionEquality().hash(groupSize) ^
      const DeepCollectionEquality().hash(chillOrVisit) ^
      const DeepCollectionEquality().hash(aboutFood) ^
      const DeepCollectionEquality().hash(goOutAtNight) ^
      const DeepCollectionEquality().hash(sport) ^
      const DeepCollectionEquality().hash(active) ^
      runtimeType.hashCode;
}

extension $ProfileModelExtension on ProfileModel {
  ProfileModel copyWith(
      {num? id,
      String? name,
      List<AvailabilityAnswerModel>? availabilities,
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
      RangeAnswerModel? groupSize,
      enums.ProfileModelChillOrVisit? chillOrVisit,
      enums.ProfileModelAboutFood? aboutFood,
      enums.ProfileModelGoOutAtNight? goOutAtNight,
      enums.ProfileModelSport? sport,
      bool? active}) {
    return ProfileModel(
        id: id ?? this.id,
        name: name ?? this.name,
        availabilities: availabilities ?? this.availabilities,
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
        groupSize: groupSize ?? this.groupSize,
        chillOrVisit: chillOrVisit ?? this.chillOrVisit,
        aboutFood: aboutFood ?? this.aboutFood,
        goOutAtNight: goOutAtNight ?? this.goOutAtNight,
        sport: sport ?? this.sport,
        active: active ?? this.active);
  }
}

@JsonSerializable(explicitToJson: true)
class MatchMakingResponse {
  MatchMakingResponse({
    this.taskId,
    this.errorMessage,
  });

  factory MatchMakingResponse.fromJson(Map<String, dynamic> json) =>
      _$MatchMakingResponseFromJson(json);

  @JsonKey(name: 'taskId')
  final num? taskId;
  @JsonKey(name: 'errorMessage')
  final String? errorMessage;
  static const fromJsonFactory = _$MatchMakingResponseFromJson;
  static const toJsonFactory = _$MatchMakingResponseToJson;
  Map<String, dynamic> toJson() => _$MatchMakingResponseToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is MatchMakingResponse &&
            (identical(other.taskId, taskId) ||
                const DeepCollectionEquality().equals(other.taskId, taskId)) &&
            (identical(other.errorMessage, errorMessage) ||
                const DeepCollectionEquality()
                    .equals(other.errorMessage, errorMessage)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(taskId) ^
      const DeepCollectionEquality().hash(errorMessage) ^
      runtimeType.hashCode;
}

extension $MatchMakingResponseExtension on MatchMakingResponse {
  MatchMakingResponse copyWith({num? taskId, String? errorMessage}) {
    return MatchMakingResponse(
        taskId: taskId ?? this.taskId,
        errorMessage: errorMessage ?? this.errorMessage);
  }
}

@JsonSerializable(explicitToJson: true)
class CreatePrivateGroupRequest {
  CreatePrivateGroupRequest({
    this.name,
    this.maxSize,
  });

  factory CreatePrivateGroupRequest.fromJson(Map<String, dynamic> json) =>
      _$CreatePrivateGroupRequestFromJson(json);

  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'maxSize')
  final int? maxSize;
  static const fromJsonFactory = _$CreatePrivateGroupRequestFromJson;
  static const toJsonFactory = _$CreatePrivateGroupRequestToJson;
  Map<String, dynamic> toJson() => _$CreatePrivateGroupRequestToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CreatePrivateGroupRequest &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.maxSize, maxSize) ||
                const DeepCollectionEquality().equals(other.maxSize, maxSize)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(maxSize) ^
      runtimeType.hashCode;
}

extension $CreatePrivateGroupRequestExtension on CreatePrivateGroupRequest {
  CreatePrivateGroupRequest copyWith({String? name, int? maxSize}) {
    return CreatePrivateGroupRequest(
        name: name ?? this.name, maxSize: maxSize ?? this.maxSize);
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
class GroupModel {
  GroupModel({
    this.id,
    this.name,
    this.state,
    this.owner,
    this.maxSize,
    this.startOfTrip,
    this.endOfTrip,
    this.picture,
    this.members,
    this.createdDate,
  });

  factory GroupModel.fromJson(Map<String, dynamic> json) =>
      _$GroupModelFromJson(json);

  @JsonKey(name: 'id')
  final num? id;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(
      name: 'state',
      toJson: groupModelStateToJson,
      fromJson: groupModelStateFromJson)
  final enums.GroupModelState? state;
  @JsonKey(name: 'owner')
  final UserModel? owner;
  @JsonKey(name: 'maxSize')
  final int? maxSize;
  @JsonKey(name: 'startOfTrip')
  final DateTime? startOfTrip;
  @JsonKey(name: 'endOfTrip')
  final DateTime? endOfTrip;
  @JsonKey(name: 'picture')
  final String? picture;
  @JsonKey(name: 'members', defaultValue: <MemberModel>[])
  final List<MemberModel>? members;
  @JsonKey(name: 'createdDate')
  final String? createdDate;
  static const fromJsonFactory = _$GroupModelFromJson;
  static const toJsonFactory = _$GroupModelToJson;
  Map<String, dynamic> toJson() => _$GroupModelToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is GroupModel &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.state, state) ||
                const DeepCollectionEquality().equals(other.state, state)) &&
            (identical(other.owner, owner) ||
                const DeepCollectionEquality().equals(other.owner, owner)) &&
            (identical(other.maxSize, maxSize) ||
                const DeepCollectionEquality()
                    .equals(other.maxSize, maxSize)) &&
            (identical(other.startOfTrip, startOfTrip) ||
                const DeepCollectionEquality()
                    .equals(other.startOfTrip, startOfTrip)) &&
            (identical(other.endOfTrip, endOfTrip) ||
                const DeepCollectionEquality()
                    .equals(other.endOfTrip, endOfTrip)) &&
            (identical(other.picture, picture) ||
                const DeepCollectionEquality()
                    .equals(other.picture, picture)) &&
            (identical(other.members, members) ||
                const DeepCollectionEquality()
                    .equals(other.members, members)) &&
            (identical(other.createdDate, createdDate) ||
                const DeepCollectionEquality()
                    .equals(other.createdDate, createdDate)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(state) ^
      const DeepCollectionEquality().hash(owner) ^
      const DeepCollectionEquality().hash(maxSize) ^
      const DeepCollectionEquality().hash(startOfTrip) ^
      const DeepCollectionEquality().hash(endOfTrip) ^
      const DeepCollectionEquality().hash(picture) ^
      const DeepCollectionEquality().hash(members) ^
      const DeepCollectionEquality().hash(createdDate) ^
      runtimeType.hashCode;
}

extension $GroupModelExtension on GroupModel {
  GroupModel copyWith(
      {num? id,
      String? name,
      enums.GroupModelState? state,
      UserModel? owner,
      int? maxSize,
      DateTime? startOfTrip,
      DateTime? endOfTrip,
      String? picture,
      List<MemberModel>? members,
      String? createdDate}) {
    return GroupModel(
        id: id ?? this.id,
        name: name ?? this.name,
        state: state ?? this.state,
        owner: owner ?? this.owner,
        maxSize: maxSize ?? this.maxSize,
        startOfTrip: startOfTrip ?? this.startOfTrip,
        endOfTrip: endOfTrip ?? this.endOfTrip,
        picture: picture ?? this.picture,
        members: members ?? this.members,
        createdDate: createdDate ?? this.createdDate);
  }
}

@JsonSerializable(explicitToJson: true)
class MemberModel {
  MemberModel({
    this.id,
    this.firstname,
    this.lastname,
    this.email,
    this.birthDate,
    this.gender,
    this.profilePicture,
    this.city,
    this.createdDate,
    this.phoneNumber,
    this.confirmed,
  });

  factory MemberModel.fromJson(Map<String, dynamic> json) =>
      _$MemberModelFromJson(json);

  @JsonKey(name: 'id')
  final num? id;
  @JsonKey(name: 'firstname')
  final String? firstname;
  @JsonKey(name: 'lastname')
  final String? lastname;
  @JsonKey(name: 'email')
  final String? email;
  @JsonKey(name: 'birthDate')
  final DateTime? birthDate;
  @JsonKey(
      name: 'gender',
      toJson: memberModelGenderToJson,
      fromJson: memberModelGenderFromJson)
  final enums.MemberModelGender? gender;
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
  static const fromJsonFactory = _$MemberModelFromJson;
  static const toJsonFactory = _$MemberModelToJson;
  Map<String, dynamic> toJson() => _$MemberModelToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is MemberModel &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.firstname, firstname) ||
                const DeepCollectionEquality()
                    .equals(other.firstname, firstname)) &&
            (identical(other.lastname, lastname) ||
                const DeepCollectionEquality()
                    .equals(other.lastname, lastname)) &&
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
                    .equals(other.confirmed, confirmed)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(firstname) ^
      const DeepCollectionEquality().hash(lastname) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(birthDate) ^
      const DeepCollectionEquality().hash(gender) ^
      const DeepCollectionEquality().hash(profilePicture) ^
      const DeepCollectionEquality().hash(city) ^
      const DeepCollectionEquality().hash(createdDate) ^
      const DeepCollectionEquality().hash(phoneNumber) ^
      const DeepCollectionEquality().hash(confirmed) ^
      runtimeType.hashCode;
}

extension $MemberModelExtension on MemberModel {
  MemberModel copyWith(
      {num? id,
      String? firstname,
      String? lastname,
      String? email,
      DateTime? birthDate,
      enums.MemberModelGender? gender,
      String? profilePicture,
      CityModel? city,
      DateTime? createdDate,
      String? phoneNumber,
      bool? confirmed}) {
    return MemberModel(
        id: id ?? this.id,
        firstname: firstname ?? this.firstname,
        lastname: lastname ?? this.lastname,
        email: email ?? this.email,
        birthDate: birthDate ?? this.birthDate,
        gender: gender ?? this.gender,
        profilePicture: profilePicture ?? this.profilePicture,
        city: city ?? this.city,
        createdDate: createdDate ?? this.createdDate,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        confirmed: confirmed ?? this.confirmed);
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
    this.language,
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
  @JsonKey(name: 'language')
  final String? language;
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
            (identical(other.language, language) ||
                const DeepCollectionEquality()
                    .equals(other.language, language)) &&
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
      const DeepCollectionEquality().hash(language) ^
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
      String? language,
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
        language: language ?? this.language,
        roles: roles ?? this.roles);
  }
}

@JsonSerializable(explicitToJson: true)
class ModelWithEmail {
  ModelWithEmail({
    this.email,
  });

  factory ModelWithEmail.fromJson(Map<String, dynamic> json) =>
      _$ModelWithEmailFromJson(json);

  @JsonKey(name: 'email')
  final String? email;
  static const fromJsonFactory = _$ModelWithEmailFromJson;
  static const toJsonFactory = _$ModelWithEmailToJson;
  Map<String, dynamic> toJson() => _$ModelWithEmailToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ModelWithEmail &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(email) ^ runtimeType.hashCode;
}

extension $ModelWithEmailExtension on ModelWithEmail {
  ModelWithEmail copyWith({String? email}) {
    return ModelWithEmail(email: email ?? this.email);
  }
}

@JsonSerializable(explicitToJson: true)
class CreateChannelRequest {
  CreateChannelRequest({
    this.name,
  });

  factory CreateChannelRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateChannelRequestFromJson(json);

  @JsonKey(name: 'name')
  final String? name;
  static const fromJsonFactory = _$CreateChannelRequestFromJson;
  static const toJsonFactory = _$CreateChannelRequestToJson;
  Map<String, dynamic> toJson() => _$CreateChannelRequestToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CreateChannelRequest &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(name) ^ runtimeType.hashCode;
}

extension $CreateChannelRequestExtension on CreateChannelRequest {
  CreateChannelRequest copyWith({String? name}) {
    return CreateChannelRequest(name: name ?? this.name);
  }
}

@JsonSerializable(explicitToJson: true)
class ChannelModel {
  ChannelModel({
    this.id,
    this.name,
    this.index,
  });

  factory ChannelModel.fromJson(Map<String, dynamic> json) =>
      _$ChannelModelFromJson(json);

  @JsonKey(name: 'id')
  final num? id;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'index')
  final int? index;
  static const fromJsonFactory = _$ChannelModelFromJson;
  static const toJsonFactory = _$ChannelModelToJson;
  Map<String, dynamic> toJson() => _$ChannelModelToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ChannelModel &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.index, index) ||
                const DeepCollectionEquality().equals(other.index, index)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(index) ^
      runtimeType.hashCode;
}

extension $ChannelModelExtension on ChannelModel {
  ChannelModel copyWith({num? id, String? name, int? index}) {
    return ChannelModel(
        id: id ?? this.id, name: name ?? this.name, index: index ?? this.index);
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
    this.language,
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
  @JsonKey(name: 'language')
  final String? language;
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
            (identical(other.language, language) ||
                const DeepCollectionEquality()
                    .equals(other.language, language)) &&
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
      const DeepCollectionEquality().hash(language) ^
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
      String? language,
      String? email}) {
    return UserCreationRequest(
        firstname: firstname ?? this.firstname,
        lastname: lastname ?? this.lastname,
        password: password ?? this.password,
        gender: gender ?? this.gender,
        birthDate: birthDate ?? this.birthDate,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        language: language ?? this.language,
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
class GoogleAuthResponse {
  GoogleAuthResponse({
    this.username,
    this.token,
    this.newUser,
  });

  factory GoogleAuthResponse.fromJson(Map<String, dynamic> json) =>
      _$GoogleAuthResponseFromJson(json);

  @JsonKey(name: 'username')
  final String? username;
  @JsonKey(name: 'token')
  final String? token;
  @JsonKey(name: 'newUser')
  final bool? newUser;
  static const fromJsonFactory = _$GoogleAuthResponseFromJson;
  static const toJsonFactory = _$GoogleAuthResponseToJson;
  Map<String, dynamic> toJson() => _$GoogleAuthResponseToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is GoogleAuthResponse &&
            (identical(other.username, username) ||
                const DeepCollectionEquality()
                    .equals(other.username, username)) &&
            (identical(other.token, token) ||
                const DeepCollectionEquality().equals(other.token, token)) &&
            (identical(other.newUser, newUser) ||
                const DeepCollectionEquality().equals(other.newUser, newUser)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(username) ^
      const DeepCollectionEquality().hash(token) ^
      const DeepCollectionEquality().hash(newUser) ^
      runtimeType.hashCode;
}

extension $GoogleAuthResponseExtension on GoogleAuthResponse {
  GoogleAuthResponse copyWith(
      {String? username, String? token, bool? newUser}) {
    return GoogleAuthResponse(
        username: username ?? this.username,
        token: token ?? this.token,
        newUser: newUser ?? this.newUser);
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
class ProfileUpdateRequest {
  ProfileUpdateRequest({
    this.name,
    this.availabilities,
    this.duration,
    this.budget,
    this.destinationTypes,
    this.ages,
    this.travelWithPersonFromSameCity,
    this.travelWithPersonFromSameCountry,
    this.travelWithPersonSameLanguage,
    this.gender,
    this.groupSize,
    this.chillOrVisit,
    this.aboutFood,
    this.goOutAtNight,
    this.sport,
    this.active,
  });

  factory ProfileUpdateRequest.fromJson(Map<String, dynamic> json) =>
      _$ProfileUpdateRequestFromJson(json);

  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'availabilities', defaultValue: <AvailabilityAnswerModel>[])
  final List<AvailabilityAnswerModel>? availabilities;
  @JsonKey(name: 'duration')
  final RangeAnswerModel? duration;
  @JsonKey(name: 'budget')
  final RangeAnswerModel? budget;
  @JsonKey(
      name: 'destinationTypes',
      toJson: profileUpdateRequestDestinationTypesListToJson,
      fromJson: profileUpdateRequestDestinationTypesListFromJson)
  final List<enums.ProfileUpdateRequestDestinationTypes>? destinationTypes;
  @JsonKey(name: 'ages')
  final RangeAnswerModel? ages;
  @JsonKey(
      name: 'travelWithPersonFromSameCity',
      toJson: profileUpdateRequestTravelWithPersonFromSameCityToJson,
      fromJson: profileUpdateRequestTravelWithPersonFromSameCityFromJson)
  final enums.ProfileUpdateRequestTravelWithPersonFromSameCity?
      travelWithPersonFromSameCity;
  @JsonKey(
      name: 'travelWithPersonFromSameCountry',
      toJson: profileUpdateRequestTravelWithPersonFromSameCountryToJson,
      fromJson: profileUpdateRequestTravelWithPersonFromSameCountryFromJson)
  final enums.ProfileUpdateRequestTravelWithPersonFromSameCountry?
      travelWithPersonFromSameCountry;
  @JsonKey(
      name: 'travelWithPersonSameLanguage',
      toJson: profileUpdateRequestTravelWithPersonSameLanguageToJson,
      fromJson: profileUpdateRequestTravelWithPersonSameLanguageFromJson)
  final enums.ProfileUpdateRequestTravelWithPersonSameLanguage?
      travelWithPersonSameLanguage;
  @JsonKey(
      name: 'gender',
      toJson: profileUpdateRequestGenderToJson,
      fromJson: profileUpdateRequestGenderFromJson)
  final enums.ProfileUpdateRequestGender? gender;
  @JsonKey(name: 'groupSize')
  final RangeAnswerModel? groupSize;
  @JsonKey(
      name: 'chillOrVisit',
      toJson: profileUpdateRequestChillOrVisitToJson,
      fromJson: profileUpdateRequestChillOrVisitFromJson)
  final enums.ProfileUpdateRequestChillOrVisit? chillOrVisit;
  @JsonKey(
      name: 'aboutFood',
      toJson: profileUpdateRequestAboutFoodToJson,
      fromJson: profileUpdateRequestAboutFoodFromJson)
  final enums.ProfileUpdateRequestAboutFood? aboutFood;
  @JsonKey(
      name: 'goOutAtNight',
      toJson: profileUpdateRequestGoOutAtNightToJson,
      fromJson: profileUpdateRequestGoOutAtNightFromJson)
  final enums.ProfileUpdateRequestGoOutAtNight? goOutAtNight;
  @JsonKey(
      name: 'sport',
      toJson: profileUpdateRequestSportToJson,
      fromJson: profileUpdateRequestSportFromJson)
  final enums.ProfileUpdateRequestSport? sport;
  @JsonKey(name: 'active')
  final bool? active;
  static const fromJsonFactory = _$ProfileUpdateRequestFromJson;
  static const toJsonFactory = _$ProfileUpdateRequestToJson;
  Map<String, dynamic> toJson() => _$ProfileUpdateRequestToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ProfileUpdateRequest &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.availabilities, availabilities) ||
                const DeepCollectionEquality()
                    .equals(other.availabilities, availabilities)) &&
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
            (identical(other.groupSize, groupSize) ||
                const DeepCollectionEquality()
                    .equals(other.groupSize, groupSize)) &&
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
            (identical(other.active, active) ||
                const DeepCollectionEquality().equals(other.active, active)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(availabilities) ^
      const DeepCollectionEquality().hash(duration) ^
      const DeepCollectionEquality().hash(budget) ^
      const DeepCollectionEquality().hash(destinationTypes) ^
      const DeepCollectionEquality().hash(ages) ^
      const DeepCollectionEquality().hash(travelWithPersonFromSameCity) ^
      const DeepCollectionEquality().hash(travelWithPersonFromSameCountry) ^
      const DeepCollectionEquality().hash(travelWithPersonSameLanguage) ^
      const DeepCollectionEquality().hash(gender) ^
      const DeepCollectionEquality().hash(groupSize) ^
      const DeepCollectionEquality().hash(chillOrVisit) ^
      const DeepCollectionEquality().hash(aboutFood) ^
      const DeepCollectionEquality().hash(goOutAtNight) ^
      const DeepCollectionEquality().hash(sport) ^
      const DeepCollectionEquality().hash(active) ^
      runtimeType.hashCode;
}

extension $ProfileUpdateRequestExtension on ProfileUpdateRequest {
  ProfileUpdateRequest copyWith(
      {String? name,
      List<AvailabilityAnswerModel>? availabilities,
      RangeAnswerModel? duration,
      RangeAnswerModel? budget,
      List<enums.ProfileUpdateRequestDestinationTypes>? destinationTypes,
      RangeAnswerModel? ages,
      enums.ProfileUpdateRequestTravelWithPersonFromSameCity?
          travelWithPersonFromSameCity,
      enums.ProfileUpdateRequestTravelWithPersonFromSameCountry?
          travelWithPersonFromSameCountry,
      enums.ProfileUpdateRequestTravelWithPersonSameLanguage?
          travelWithPersonSameLanguage,
      enums.ProfileUpdateRequestGender? gender,
      RangeAnswerModel? groupSize,
      enums.ProfileUpdateRequestChillOrVisit? chillOrVisit,
      enums.ProfileUpdateRequestAboutFood? aboutFood,
      enums.ProfileUpdateRequestGoOutAtNight? goOutAtNight,
      enums.ProfileUpdateRequestSport? sport,
      bool? active}) {
    return ProfileUpdateRequest(
        name: name ?? this.name,
        availabilities: availabilities ?? this.availabilities,
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
        groupSize: groupSize ?? this.groupSize,
        chillOrVisit: chillOrVisit ?? this.chillOrVisit,
        aboutFood: aboutFood ?? this.aboutFood,
        goOutAtNight: goOutAtNight ?? this.goOutAtNight,
        sport: sport ?? this.sport,
        active: active ?? this.active);
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
    this.birthdate,
    this.gender,
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
  @JsonKey(name: 'birthdate')
  final DateTime? birthdate;
  @JsonKey(name: 'gender')
  final String? gender;
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
                    .equals(other.phoneNumber, phoneNumber)) &&
            (identical(other.birthdate, birthdate) ||
                const DeepCollectionEquality()
                    .equals(other.birthdate, birthdate)) &&
            (identical(other.gender, gender) ||
                const DeepCollectionEquality().equals(other.gender, gender)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(firstname) ^
      const DeepCollectionEquality().hash(lastname) ^
      const DeepCollectionEquality().hash(profilePicture) ^
      const DeepCollectionEquality().hash(city) ^
      const DeepCollectionEquality().hash(phoneNumber) ^
      const DeepCollectionEquality().hash(birthdate) ^
      const DeepCollectionEquality().hash(gender) ^
      runtimeType.hashCode;
}

extension $UserUpdateRequestExtension on UserUpdateRequest {
  UserUpdateRequest copyWith(
      {String? firstname,
      String? lastname,
      String? profilePicture,
      CityModel? city,
      String? phoneNumber,
      DateTime? birthdate,
      String? gender}) {
    return UserUpdateRequest(
        firstname: firstname ?? this.firstname,
        lastname: lastname ?? this.lastname,
        profilePicture: profilePicture ?? this.profilePicture,
        city: city ?? this.city,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        birthdate: birthdate ?? this.birthdate,
        gender: gender ?? this.gender);
  }
}

@JsonSerializable(explicitToJson: true)
class UpdateGroupRequest {
  UpdateGroupRequest({
    this.name,
    this.state,
    this.ownerId,
    this.maxSize,
    this.startOfTrip,
    this.endOfTrip,
    this.picture,
  });

  factory UpdateGroupRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateGroupRequestFromJson(json);

  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(
      name: 'state',
      toJson: updateGroupRequestStateToJson,
      fromJson: updateGroupRequestStateFromJson)
  final enums.UpdateGroupRequestState? state;
  @JsonKey(name: 'ownerId')
  final num? ownerId;
  @JsonKey(name: 'maxSize')
  final int? maxSize;
  @JsonKey(name: 'startOfTrip')
  final DateTime? startOfTrip;
  @JsonKey(name: 'endOfTrip')
  final DateTime? endOfTrip;
  @JsonKey(name: 'picture')
  final String? picture;
  static const fromJsonFactory = _$UpdateGroupRequestFromJson;
  static const toJsonFactory = _$UpdateGroupRequestToJson;
  Map<String, dynamic> toJson() => _$UpdateGroupRequestToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UpdateGroupRequest &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.state, state) ||
                const DeepCollectionEquality().equals(other.state, state)) &&
            (identical(other.ownerId, ownerId) ||
                const DeepCollectionEquality()
                    .equals(other.ownerId, ownerId)) &&
            (identical(other.maxSize, maxSize) ||
                const DeepCollectionEquality()
                    .equals(other.maxSize, maxSize)) &&
            (identical(other.startOfTrip, startOfTrip) ||
                const DeepCollectionEquality()
                    .equals(other.startOfTrip, startOfTrip)) &&
            (identical(other.endOfTrip, endOfTrip) ||
                const DeepCollectionEquality()
                    .equals(other.endOfTrip, endOfTrip)) &&
            (identical(other.picture, picture) ||
                const DeepCollectionEquality().equals(other.picture, picture)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(state) ^
      const DeepCollectionEquality().hash(ownerId) ^
      const DeepCollectionEquality().hash(maxSize) ^
      const DeepCollectionEquality().hash(startOfTrip) ^
      const DeepCollectionEquality().hash(endOfTrip) ^
      const DeepCollectionEquality().hash(picture) ^
      runtimeType.hashCode;
}

extension $UpdateGroupRequestExtension on UpdateGroupRequest {
  UpdateGroupRequest copyWith(
      {String? name,
      enums.UpdateGroupRequestState? state,
      num? ownerId,
      int? maxSize,
      DateTime? startOfTrip,
      DateTime? endOfTrip,
      String? picture}) {
    return UpdateGroupRequest(
        name: name ?? this.name,
        state: state ?? this.state,
        ownerId: ownerId ?? this.ownerId,
        maxSize: maxSize ?? this.maxSize,
        startOfTrip: startOfTrip ?? this.startOfTrip,
        endOfTrip: endOfTrip ?? this.endOfTrip,
        picture: picture ?? this.picture);
  }
}

@JsonSerializable(explicitToJson: true)
class MessageResponse {
  MessageResponse({
    this.id,
    this.channelId,
    this.userId,
    this.content,
    this.sentDate,
    this.modifiedDate,
    this.pinned,
    this.type,
  });

  factory MessageResponse.fromJson(Map<String, dynamic> json) =>
      _$MessageResponseFromJson(json);

  @JsonKey(name: 'id')
  final num? id;
  @JsonKey(name: 'channelId')
  final num? channelId;
  @JsonKey(name: 'userId')
  final num? userId;
  @JsonKey(name: 'content')
  final String? content;
  @JsonKey(name: 'sentDate')
  final DateTime? sentDate;
  @JsonKey(name: 'modifiedDate')
  final DateTime? modifiedDate;
  @JsonKey(name: 'pinned')
  final bool? pinned;
  @JsonKey(
      name: 'type',
      toJson: messageResponseType$ToJson,
      fromJson: messageResponseType$FromJson)
  final enums.MessageResponseType$? type;
  static const fromJsonFactory = _$MessageResponseFromJson;
  static const toJsonFactory = _$MessageResponseToJson;
  Map<String, dynamic> toJson() => _$MessageResponseToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is MessageResponse &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.channelId, channelId) ||
                const DeepCollectionEquality()
                    .equals(other.channelId, channelId)) &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)) &&
            (identical(other.content, content) ||
                const DeepCollectionEquality()
                    .equals(other.content, content)) &&
            (identical(other.sentDate, sentDate) ||
                const DeepCollectionEquality()
                    .equals(other.sentDate, sentDate)) &&
            (identical(other.modifiedDate, modifiedDate) ||
                const DeepCollectionEquality()
                    .equals(other.modifiedDate, modifiedDate)) &&
            (identical(other.pinned, pinned) ||
                const DeepCollectionEquality().equals(other.pinned, pinned)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(channelId) ^
      const DeepCollectionEquality().hash(userId) ^
      const DeepCollectionEquality().hash(content) ^
      const DeepCollectionEquality().hash(sentDate) ^
      const DeepCollectionEquality().hash(modifiedDate) ^
      const DeepCollectionEquality().hash(pinned) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $MessageResponseExtension on MessageResponse {
  MessageResponse copyWith(
      {num? id,
      num? channelId,
      num? userId,
      String? content,
      DateTime? sentDate,
      DateTime? modifiedDate,
      bool? pinned,
      enums.MessageResponseType$? type}) {
    return MessageResponse(
        id: id ?? this.id,
        channelId: channelId ?? this.channelId,
        userId: userId ?? this.userId,
        content: content ?? this.content,
        sentDate: sentDate ?? this.sentDate,
        modifiedDate: modifiedDate ?? this.modifiedDate,
        pinned: pinned ?? this.pinned,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class UpdateChannelRequest {
  UpdateChannelRequest({
    this.name,
    this.index,
  });

  factory UpdateChannelRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateChannelRequestFromJson(json);

  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'index')
  final int? index;
  static const fromJsonFactory = _$UpdateChannelRequestFromJson;
  static const toJsonFactory = _$UpdateChannelRequestToJson;
  Map<String, dynamic> toJson() => _$UpdateChannelRequestToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UpdateChannelRequest &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.index, index) ||
                const DeepCollectionEquality().equals(other.index, index)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(index) ^
      runtimeType.hashCode;
}

extension $UpdateChannelRequestExtension on UpdateChannelRequest {
  UpdateChannelRequest copyWith({String? name, int? index}) {
    return UpdateChannelRequest(
        name: name ?? this.name, index: index ?? this.index);
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
class CityEntity {
  CityEntity({
    this.id,
    this.name,
  });

  factory CityEntity.fromJson(Map<String, dynamic> json) =>
      _$CityEntityFromJson(json);

  @JsonKey(name: 'id')
  final num? id;
  @JsonKey(name: 'name')
  final String? name;
  static const fromJsonFactory = _$CityEntityFromJson;
  static const toJsonFactory = _$CityEntityToJson;
  Map<String, dynamic> toJson() => _$CityEntityToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CityEntity &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      runtimeType.hashCode;
}

extension $CityEntityExtension on CityEntity {
  CityEntity copyWith({num? id, String? name}) {
    return CityEntity(id: id ?? this.id, name: name ?? this.name);
  }
}

@JsonSerializable(explicitToJson: true)
class GenderEntity {
  GenderEntity({
    this.id,
    this.value,
  });

  factory GenderEntity.fromJson(Map<String, dynamic> json) =>
      _$GenderEntityFromJson(json);

  @JsonKey(name: 'id')
  final num? id;
  @JsonKey(name: 'value')
  final String? value;
  static const fromJsonFactory = _$GenderEntityFromJson;
  static const toJsonFactory = _$GenderEntityToJson;
  Map<String, dynamic> toJson() => _$GenderEntityToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is GenderEntity &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(value) ^
      runtimeType.hashCode;
}

extension $GenderEntityExtension on GenderEntity {
  GenderEntity copyWith({num? id, String? value}) {
    return GenderEntity(id: id ?? this.id, value: value ?? this.value);
  }
}

@JsonSerializable(explicitToJson: true)
class LanguageEntity {
  LanguageEntity({
    this.id,
    this.value,
  });

  factory LanguageEntity.fromJson(Map<String, dynamic> json) =>
      _$LanguageEntityFromJson(json);

  @JsonKey(name: 'id')
  final num? id;
  @JsonKey(name: 'value')
  final String? value;
  static const fromJsonFactory = _$LanguageEntityFromJson;
  static const toJsonFactory = _$LanguageEntityToJson;
  Map<String, dynamic> toJson() => _$LanguageEntityToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is LanguageEntity &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(value) ^
      runtimeType.hashCode;
}

extension $LanguageEntityExtension on LanguageEntity {
  LanguageEntity copyWith({num? id, String? value}) {
    return LanguageEntity(id: id ?? this.id, value: value ?? this.value);
  }
}

@JsonSerializable(explicitToJson: true)
class ProfileEntity {
  ProfileEntity({
    this.id,
    this.name,
    this.active,
  });

  factory ProfileEntity.fromJson(Map<String, dynamic> json) =>
      _$ProfileEntityFromJson(json);

  @JsonKey(name: 'id')
  final num? id;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'active')
  final bool? active;
  static const fromJsonFactory = _$ProfileEntityFromJson;
  static const toJsonFactory = _$ProfileEntityToJson;
  Map<String, dynamic> toJson() => _$ProfileEntityToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ProfileEntity &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.active, active) ||
                const DeepCollectionEquality().equals(other.active, active)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(active) ^
      runtimeType.hashCode;
}

extension $ProfileEntityExtension on ProfileEntity {
  ProfileEntity copyWith({num? id, String? name, bool? active}) {
    return ProfileEntity(
        id: id ?? this.id,
        name: name ?? this.name,
        active: active ?? this.active);
  }
}

@JsonSerializable(explicitToJson: true)
class RoleEntity {
  RoleEntity({
    this.id,
    this.name,
    this.authority,
  });

  factory RoleEntity.fromJson(Map<String, dynamic> json) =>
      _$RoleEntityFromJson(json);

  @JsonKey(name: 'id')
  final num? id;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'authority')
  final String? authority;
  static const fromJsonFactory = _$RoleEntityFromJson;
  static const toJsonFactory = _$RoleEntityToJson;
  Map<String, dynamic> toJson() => _$RoleEntityToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is RoleEntity &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.authority, authority) ||
                const DeepCollectionEquality()
                    .equals(other.authority, authority)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(authority) ^
      runtimeType.hashCode;
}

extension $RoleEntityExtension on RoleEntity {
  RoleEntity copyWith({num? id, String? name, String? authority}) {
    return RoleEntity(
        id: id ?? this.id,
        name: name ?? this.name,
        authority: authority ?? this.authority);
  }
}

@JsonSerializable(explicitToJson: true)
class UserEntity {
  UserEntity({
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
    this.language,
    this.roles,
    this.profiles,
    this.waitingForGroup,
  });

  factory UserEntity.fromJson(Map<String, dynamic> json) =>
      _$UserEntityFromJson(json);

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
  @JsonKey(name: 'gender')
  final GenderEntity? gender;
  @JsonKey(name: 'profilePicture')
  final String? profilePicture;
  @JsonKey(name: 'city')
  final CityEntity? city;
  @JsonKey(name: 'createdDate')
  final DateTime? createdDate;
  @JsonKey(name: 'phoneNumber')
  final String? phoneNumber;
  @JsonKey(name: 'confirmed')
  final bool? confirmed;
  @JsonKey(name: 'language')
  final LanguageEntity? language;
  @JsonKey(name: 'roles', defaultValue: <RoleEntity>[])
  final List<RoleEntity>? roles;
  @JsonKey(name: 'profiles', defaultValue: <ProfileEntity>[])
  final List<ProfileEntity>? profiles;
  @JsonKey(name: 'waitingForGroup')
  final bool? waitingForGroup;
  static const fromJsonFactory = _$UserEntityFromJson;
  static const toJsonFactory = _$UserEntityToJson;
  Map<String, dynamic> toJson() => _$UserEntityToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UserEntity &&
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
            (identical(other.language, language) ||
                const DeepCollectionEquality()
                    .equals(other.language, language)) &&
            (identical(other.roles, roles) ||
                const DeepCollectionEquality().equals(other.roles, roles)) &&
            (identical(other.profiles, profiles) ||
                const DeepCollectionEquality()
                    .equals(other.profiles, profiles)) &&
            (identical(other.waitingForGroup, waitingForGroup) ||
                const DeepCollectionEquality()
                    .equals(other.waitingForGroup, waitingForGroup)));
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
      const DeepCollectionEquality().hash(language) ^
      const DeepCollectionEquality().hash(roles) ^
      const DeepCollectionEquality().hash(profiles) ^
      const DeepCollectionEquality().hash(waitingForGroup) ^
      runtimeType.hashCode;
}

extension $UserEntityExtension on UserEntity {
  UserEntity copyWith(
      {num? id,
      String? firstname,
      String? lastname,
      String? password,
      String? email,
      DateTime? birthDate,
      GenderEntity? gender,
      String? profilePicture,
      CityEntity? city,
      DateTime? createdDate,
      String? phoneNumber,
      bool? confirmed,
      LanguageEntity? language,
      List<RoleEntity>? roles,
      List<ProfileEntity>? profiles,
      bool? waitingForGroup}) {
    return UserEntity(
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
        language: language ?? this.language,
        roles: roles ?? this.roles,
        profiles: profiles ?? this.profiles,
        waitingForGroup: waitingForGroup ?? this.waitingForGroup);
  }
}

@JsonSerializable(explicitToJson: true)
class MatchMakingResult {
  MatchMakingResult({
    this.type,
    this.groupId,
  });

  factory MatchMakingResult.fromJson(Map<String, dynamic> json) =>
      _$MatchMakingResultFromJson(json);

  @JsonKey(
      name: 'type',
      toJson: matchMakingResultType$ToJson,
      fromJson: matchMakingResultType$FromJson)
  final enums.MatchMakingResultType$? type;
  @JsonKey(name: 'groupId')
  final num? groupId;
  static const fromJsonFactory = _$MatchMakingResultFromJson;
  static const toJsonFactory = _$MatchMakingResultToJson;
  Map<String, dynamic> toJson() => _$MatchMakingResultToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is MatchMakingResult &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.groupId, groupId) ||
                const DeepCollectionEquality().equals(other.groupId, groupId)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(groupId) ^
      runtimeType.hashCode;
}

extension $MatchMakingResultExtension on MatchMakingResult {
  MatchMakingResult copyWith(
      {enums.MatchMakingResultType$? type, num? groupId}) {
    return MatchMakingResult(
        type: type ?? this.type, groupId: groupId ?? this.groupId);
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

String? profileCreationRequestDestinationTypesToJson(
    enums.ProfileCreationRequestDestinationTypes?
        profileCreationRequestDestinationTypes) {
  return enums.$ProfileCreationRequestDestinationTypesMap[
      profileCreationRequestDestinationTypes];
}

enums.ProfileCreationRequestDestinationTypes
    profileCreationRequestDestinationTypesFromJson(
        Object? profileCreationRequestDestinationTypes) {
  if (profileCreationRequestDestinationTypes is int) {
    return enums.$ProfileCreationRequestDestinationTypesMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                profileCreationRequestDestinationTypes.toString(),
            orElse: () => const MapEntry(
                enums.ProfileCreationRequestDestinationTypes
                    .swaggerGeneratedUnknown,
                ''))
        .key;
  }

  if (profileCreationRequestDestinationTypes is String) {
    return enums.$ProfileCreationRequestDestinationTypesMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                profileCreationRequestDestinationTypes.toLowerCase(),
            orElse: () => const MapEntry(
                enums.ProfileCreationRequestDestinationTypes
                    .swaggerGeneratedUnknown,
                ''))
        .key;
  }

  return enums.ProfileCreationRequestDestinationTypes.swaggerGeneratedUnknown;
}

List<String> profileCreationRequestDestinationTypesListToJson(
    List<enums.ProfileCreationRequestDestinationTypes>?
        profileCreationRequestDestinationTypes) {
  if (profileCreationRequestDestinationTypes == null) {
    return [];
  }

  return profileCreationRequestDestinationTypes
      .map((e) => enums.$ProfileCreationRequestDestinationTypesMap[e]!)
      .toList();
}

List<enums.ProfileCreationRequestDestinationTypes>
    profileCreationRequestDestinationTypesListFromJson(
        List? profileCreationRequestDestinationTypes) {
  if (profileCreationRequestDestinationTypes == null) {
    return [];
  }

  return profileCreationRequestDestinationTypes
      .map((e) => profileCreationRequestDestinationTypesFromJson(e.toString()))
      .toList();
}

String? profileCreationRequestTravelWithPersonFromSameCityToJson(
    enums.ProfileCreationRequestTravelWithPersonFromSameCity?
        profileCreationRequestTravelWithPersonFromSameCity) {
  return enums.$ProfileCreationRequestTravelWithPersonFromSameCityMap[
      profileCreationRequestTravelWithPersonFromSameCity];
}

enums.ProfileCreationRequestTravelWithPersonFromSameCity
    profileCreationRequestTravelWithPersonFromSameCityFromJson(
        Object? profileCreationRequestTravelWithPersonFromSameCity) {
  if (profileCreationRequestTravelWithPersonFromSameCity is int) {
    return enums.$ProfileCreationRequestTravelWithPersonFromSameCityMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                profileCreationRequestTravelWithPersonFromSameCity.toString(),
            orElse: () => const MapEntry(
                enums.ProfileCreationRequestTravelWithPersonFromSameCity
                    .swaggerGeneratedUnknown,
                ''))
        .key;
  }

  if (profileCreationRequestTravelWithPersonFromSameCity is String) {
    return enums.$ProfileCreationRequestTravelWithPersonFromSameCityMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                profileCreationRequestTravelWithPersonFromSameCity
                    .toLowerCase(),
            orElse: () => const MapEntry(
                enums.ProfileCreationRequestTravelWithPersonFromSameCity
                    .swaggerGeneratedUnknown,
                ''))
        .key;
  }

  return enums.ProfileCreationRequestTravelWithPersonFromSameCity
      .swaggerGeneratedUnknown;
}

List<String> profileCreationRequestTravelWithPersonFromSameCityListToJson(
    List<enums.ProfileCreationRequestTravelWithPersonFromSameCity>?
        profileCreationRequestTravelWithPersonFromSameCity) {
  if (profileCreationRequestTravelWithPersonFromSameCity == null) {
    return [];
  }

  return profileCreationRequestTravelWithPersonFromSameCity
      .map((e) =>
          enums.$ProfileCreationRequestTravelWithPersonFromSameCityMap[e]!)
      .toList();
}

List<enums.ProfileCreationRequestTravelWithPersonFromSameCity>
    profileCreationRequestTravelWithPersonFromSameCityListFromJson(
        List? profileCreationRequestTravelWithPersonFromSameCity) {
  if (profileCreationRequestTravelWithPersonFromSameCity == null) {
    return [];
  }

  return profileCreationRequestTravelWithPersonFromSameCity
      .map((e) => profileCreationRequestTravelWithPersonFromSameCityFromJson(
          e.toString()))
      .toList();
}

String? profileCreationRequestTravelWithPersonFromSameCountryToJson(
    enums.ProfileCreationRequestTravelWithPersonFromSameCountry?
        profileCreationRequestTravelWithPersonFromSameCountry) {
  return enums.$ProfileCreationRequestTravelWithPersonFromSameCountryMap[
      profileCreationRequestTravelWithPersonFromSameCountry];
}

enums.ProfileCreationRequestTravelWithPersonFromSameCountry
    profileCreationRequestTravelWithPersonFromSameCountryFromJson(
        Object? profileCreationRequestTravelWithPersonFromSameCountry) {
  if (profileCreationRequestTravelWithPersonFromSameCountry is int) {
    return enums
        .$ProfileCreationRequestTravelWithPersonFromSameCountryMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                profileCreationRequestTravelWithPersonFromSameCountry
                    .toString(),
            orElse: () => const MapEntry(
                enums.ProfileCreationRequestTravelWithPersonFromSameCountry
                    .swaggerGeneratedUnknown,
                ''))
        .key;
  }

  if (profileCreationRequestTravelWithPersonFromSameCountry is String) {
    return enums
        .$ProfileCreationRequestTravelWithPersonFromSameCountryMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                profileCreationRequestTravelWithPersonFromSameCountry
                    .toLowerCase(),
            orElse: () => const MapEntry(
                enums.ProfileCreationRequestTravelWithPersonFromSameCountry
                    .swaggerGeneratedUnknown,
                ''))
        .key;
  }

  return enums.ProfileCreationRequestTravelWithPersonFromSameCountry
      .swaggerGeneratedUnknown;
}

List<String> profileCreationRequestTravelWithPersonFromSameCountryListToJson(
    List<enums.ProfileCreationRequestTravelWithPersonFromSameCountry>?
        profileCreationRequestTravelWithPersonFromSameCountry) {
  if (profileCreationRequestTravelWithPersonFromSameCountry == null) {
    return [];
  }

  return profileCreationRequestTravelWithPersonFromSameCountry
      .map((e) =>
          enums.$ProfileCreationRequestTravelWithPersonFromSameCountryMap[e]!)
      .toList();
}

List<enums.ProfileCreationRequestTravelWithPersonFromSameCountry>
    profileCreationRequestTravelWithPersonFromSameCountryListFromJson(
        List? profileCreationRequestTravelWithPersonFromSameCountry) {
  if (profileCreationRequestTravelWithPersonFromSameCountry == null) {
    return [];
  }

  return profileCreationRequestTravelWithPersonFromSameCountry
      .map((e) => profileCreationRequestTravelWithPersonFromSameCountryFromJson(
          e.toString()))
      .toList();
}

String? profileCreationRequestTravelWithPersonSameLanguageToJson(
    enums.ProfileCreationRequestTravelWithPersonSameLanguage?
        profileCreationRequestTravelWithPersonSameLanguage) {
  return enums.$ProfileCreationRequestTravelWithPersonSameLanguageMap[
      profileCreationRequestTravelWithPersonSameLanguage];
}

enums.ProfileCreationRequestTravelWithPersonSameLanguage
    profileCreationRequestTravelWithPersonSameLanguageFromJson(
        Object? profileCreationRequestTravelWithPersonSameLanguage) {
  if (profileCreationRequestTravelWithPersonSameLanguage is int) {
    return enums.$ProfileCreationRequestTravelWithPersonSameLanguageMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                profileCreationRequestTravelWithPersonSameLanguage.toString(),
            orElse: () => const MapEntry(
                enums.ProfileCreationRequestTravelWithPersonSameLanguage
                    .swaggerGeneratedUnknown,
                ''))
        .key;
  }

  if (profileCreationRequestTravelWithPersonSameLanguage is String) {
    return enums.$ProfileCreationRequestTravelWithPersonSameLanguageMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                profileCreationRequestTravelWithPersonSameLanguage
                    .toLowerCase(),
            orElse: () => const MapEntry(
                enums.ProfileCreationRequestTravelWithPersonSameLanguage
                    .swaggerGeneratedUnknown,
                ''))
        .key;
  }

  return enums.ProfileCreationRequestTravelWithPersonSameLanguage
      .swaggerGeneratedUnknown;
}

List<String> profileCreationRequestTravelWithPersonSameLanguageListToJson(
    List<enums.ProfileCreationRequestTravelWithPersonSameLanguage>?
        profileCreationRequestTravelWithPersonSameLanguage) {
  if (profileCreationRequestTravelWithPersonSameLanguage == null) {
    return [];
  }

  return profileCreationRequestTravelWithPersonSameLanguage
      .map((e) =>
          enums.$ProfileCreationRequestTravelWithPersonSameLanguageMap[e]!)
      .toList();
}

List<enums.ProfileCreationRequestTravelWithPersonSameLanguage>
    profileCreationRequestTravelWithPersonSameLanguageListFromJson(
        List? profileCreationRequestTravelWithPersonSameLanguage) {
  if (profileCreationRequestTravelWithPersonSameLanguage == null) {
    return [];
  }

  return profileCreationRequestTravelWithPersonSameLanguage
      .map((e) => profileCreationRequestTravelWithPersonSameLanguageFromJson(
          e.toString()))
      .toList();
}

String? profileCreationRequestGenderToJson(
    enums.ProfileCreationRequestGender? profileCreationRequestGender) {
  return enums.$ProfileCreationRequestGenderMap[profileCreationRequestGender];
}

enums.ProfileCreationRequestGender profileCreationRequestGenderFromJson(
    Object? profileCreationRequestGender) {
  if (profileCreationRequestGender is int) {
    return enums.$ProfileCreationRequestGenderMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                profileCreationRequestGender.toString(),
            orElse: () => const MapEntry(
                enums.ProfileCreationRequestGender.swaggerGeneratedUnknown, ''))
        .key;
  }

  if (profileCreationRequestGender is String) {
    return enums.$ProfileCreationRequestGenderMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                profileCreationRequestGender.toLowerCase(),
            orElse: () => const MapEntry(
                enums.ProfileCreationRequestGender.swaggerGeneratedUnknown, ''))
        .key;
  }

  return enums.ProfileCreationRequestGender.swaggerGeneratedUnknown;
}

List<String> profileCreationRequestGenderListToJson(
    List<enums.ProfileCreationRequestGender>? profileCreationRequestGender) {
  if (profileCreationRequestGender == null) {
    return [];
  }

  return profileCreationRequestGender
      .map((e) => enums.$ProfileCreationRequestGenderMap[e]!)
      .toList();
}

List<enums.ProfileCreationRequestGender>
    profileCreationRequestGenderListFromJson(
        List? profileCreationRequestGender) {
  if (profileCreationRequestGender == null) {
    return [];
  }

  return profileCreationRequestGender
      .map((e) => profileCreationRequestGenderFromJson(e.toString()))
      .toList();
}

String? profileCreationRequestChillOrVisitToJson(
    enums.ProfileCreationRequestChillOrVisit?
        profileCreationRequestChillOrVisit) {
  return enums.$ProfileCreationRequestChillOrVisitMap[
      profileCreationRequestChillOrVisit];
}

enums.ProfileCreationRequestChillOrVisit
    profileCreationRequestChillOrVisitFromJson(
        Object? profileCreationRequestChillOrVisit) {
  if (profileCreationRequestChillOrVisit is int) {
    return enums.$ProfileCreationRequestChillOrVisitMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                profileCreationRequestChillOrVisit.toString(),
            orElse: () => const MapEntry(
                enums
                    .ProfileCreationRequestChillOrVisit.swaggerGeneratedUnknown,
                ''))
        .key;
  }

  if (profileCreationRequestChillOrVisit is String) {
    return enums.$ProfileCreationRequestChillOrVisitMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                profileCreationRequestChillOrVisit.toLowerCase(),
            orElse: () => const MapEntry(
                enums
                    .ProfileCreationRequestChillOrVisit.swaggerGeneratedUnknown,
                ''))
        .key;
  }

  return enums.ProfileCreationRequestChillOrVisit.swaggerGeneratedUnknown;
}

List<String> profileCreationRequestChillOrVisitListToJson(
    List<enums.ProfileCreationRequestChillOrVisit>?
        profileCreationRequestChillOrVisit) {
  if (profileCreationRequestChillOrVisit == null) {
    return [];
  }

  return profileCreationRequestChillOrVisit
      .map((e) => enums.$ProfileCreationRequestChillOrVisitMap[e]!)
      .toList();
}

List<enums.ProfileCreationRequestChillOrVisit>
    profileCreationRequestChillOrVisitListFromJson(
        List? profileCreationRequestChillOrVisit) {
  if (profileCreationRequestChillOrVisit == null) {
    return [];
  }

  return profileCreationRequestChillOrVisit
      .map((e) => profileCreationRequestChillOrVisitFromJson(e.toString()))
      .toList();
}

String? profileCreationRequestAboutFoodToJson(
    enums.ProfileCreationRequestAboutFood? profileCreationRequestAboutFood) {
  return enums
      .$ProfileCreationRequestAboutFoodMap[profileCreationRequestAboutFood];
}

enums.ProfileCreationRequestAboutFood profileCreationRequestAboutFoodFromJson(
    Object? profileCreationRequestAboutFood) {
  if (profileCreationRequestAboutFood is int) {
    return enums.$ProfileCreationRequestAboutFoodMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                profileCreationRequestAboutFood.toString(),
            orElse: () => const MapEntry(
                enums.ProfileCreationRequestAboutFood.swaggerGeneratedUnknown,
                ''))
        .key;
  }

  if (profileCreationRequestAboutFood is String) {
    return enums.$ProfileCreationRequestAboutFoodMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                profileCreationRequestAboutFood.toLowerCase(),
            orElse: () => const MapEntry(
                enums.ProfileCreationRequestAboutFood.swaggerGeneratedUnknown,
                ''))
        .key;
  }

  return enums.ProfileCreationRequestAboutFood.swaggerGeneratedUnknown;
}

List<String> profileCreationRequestAboutFoodListToJson(
    List<enums.ProfileCreationRequestAboutFood>?
        profileCreationRequestAboutFood) {
  if (profileCreationRequestAboutFood == null) {
    return [];
  }

  return profileCreationRequestAboutFood
      .map((e) => enums.$ProfileCreationRequestAboutFoodMap[e]!)
      .toList();
}

List<enums.ProfileCreationRequestAboutFood>
    profileCreationRequestAboutFoodListFromJson(
        List? profileCreationRequestAboutFood) {
  if (profileCreationRequestAboutFood == null) {
    return [];
  }

  return profileCreationRequestAboutFood
      .map((e) => profileCreationRequestAboutFoodFromJson(e.toString()))
      .toList();
}

String? profileCreationRequestGoOutAtNightToJson(
    enums.ProfileCreationRequestGoOutAtNight?
        profileCreationRequestGoOutAtNight) {
  return enums.$ProfileCreationRequestGoOutAtNightMap[
      profileCreationRequestGoOutAtNight];
}

enums.ProfileCreationRequestGoOutAtNight
    profileCreationRequestGoOutAtNightFromJson(
        Object? profileCreationRequestGoOutAtNight) {
  if (profileCreationRequestGoOutAtNight is int) {
    return enums.$ProfileCreationRequestGoOutAtNightMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                profileCreationRequestGoOutAtNight.toString(),
            orElse: () => const MapEntry(
                enums
                    .ProfileCreationRequestGoOutAtNight.swaggerGeneratedUnknown,
                ''))
        .key;
  }

  if (profileCreationRequestGoOutAtNight is String) {
    return enums.$ProfileCreationRequestGoOutAtNightMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                profileCreationRequestGoOutAtNight.toLowerCase(),
            orElse: () => const MapEntry(
                enums
                    .ProfileCreationRequestGoOutAtNight.swaggerGeneratedUnknown,
                ''))
        .key;
  }

  return enums.ProfileCreationRequestGoOutAtNight.swaggerGeneratedUnknown;
}

List<String> profileCreationRequestGoOutAtNightListToJson(
    List<enums.ProfileCreationRequestGoOutAtNight>?
        profileCreationRequestGoOutAtNight) {
  if (profileCreationRequestGoOutAtNight == null) {
    return [];
  }

  return profileCreationRequestGoOutAtNight
      .map((e) => enums.$ProfileCreationRequestGoOutAtNightMap[e]!)
      .toList();
}

List<enums.ProfileCreationRequestGoOutAtNight>
    profileCreationRequestGoOutAtNightListFromJson(
        List? profileCreationRequestGoOutAtNight) {
  if (profileCreationRequestGoOutAtNight == null) {
    return [];
  }

  return profileCreationRequestGoOutAtNight
      .map((e) => profileCreationRequestGoOutAtNightFromJson(e.toString()))
      .toList();
}

String? profileCreationRequestSportToJson(
    enums.ProfileCreationRequestSport? profileCreationRequestSport) {
  return enums.$ProfileCreationRequestSportMap[profileCreationRequestSport];
}

enums.ProfileCreationRequestSport profileCreationRequestSportFromJson(
    Object? profileCreationRequestSport) {
  if (profileCreationRequestSport is int) {
    return enums.$ProfileCreationRequestSportMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                profileCreationRequestSport.toString(),
            orElse: () => const MapEntry(
                enums.ProfileCreationRequestSport.swaggerGeneratedUnknown, ''))
        .key;
  }

  if (profileCreationRequestSport is String) {
    return enums.$ProfileCreationRequestSportMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                profileCreationRequestSport.toLowerCase(),
            orElse: () => const MapEntry(
                enums.ProfileCreationRequestSport.swaggerGeneratedUnknown, ''))
        .key;
  }

  return enums.ProfileCreationRequestSport.swaggerGeneratedUnknown;
}

List<String> profileCreationRequestSportListToJson(
    List<enums.ProfileCreationRequestSport>? profileCreationRequestSport) {
  if (profileCreationRequestSport == null) {
    return [];
  }

  return profileCreationRequestSport
      .map((e) => enums.$ProfileCreationRequestSportMap[e]!)
      .toList();
}

List<enums.ProfileCreationRequestSport> profileCreationRequestSportListFromJson(
    List? profileCreationRequestSport) {
  if (profileCreationRequestSport == null) {
    return [];
  }

  return profileCreationRequestSport
      .map((e) => profileCreationRequestSportFromJson(e.toString()))
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

String? groupModelStateToJson(enums.GroupModelState? groupModelState) {
  return enums.$GroupModelStateMap[groupModelState];
}

enums.GroupModelState groupModelStateFromJson(Object? groupModelState) {
  if (groupModelState is int) {
    return enums.$GroupModelStateMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() == groupModelState.toString(),
            orElse: () => const MapEntry(
                enums.GroupModelState.swaggerGeneratedUnknown, ''))
        .key;
  }

  if (groupModelState is String) {
    return enums.$GroupModelStateMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() == groupModelState.toLowerCase(),
            orElse: () => const MapEntry(
                enums.GroupModelState.swaggerGeneratedUnknown, ''))
        .key;
  }

  return enums.GroupModelState.swaggerGeneratedUnknown;
}

List<String> groupModelStateListToJson(
    List<enums.GroupModelState>? groupModelState) {
  if (groupModelState == null) {
    return [];
  }

  return groupModelState.map((e) => enums.$GroupModelStateMap[e]!).toList();
}

List<enums.GroupModelState> groupModelStateListFromJson(List? groupModelState) {
  if (groupModelState == null) {
    return [];
  }

  return groupModelState
      .map((e) => groupModelStateFromJson(e.toString()))
      .toList();
}

String? memberModelGenderToJson(enums.MemberModelGender? memberModelGender) {
  return enums.$MemberModelGenderMap[memberModelGender];
}

enums.MemberModelGender memberModelGenderFromJson(Object? memberModelGender) {
  if (memberModelGender is int) {
    return enums.$MemberModelGenderMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() == memberModelGender.toString(),
            orElse: () => const MapEntry(
                enums.MemberModelGender.swaggerGeneratedUnknown, ''))
        .key;
  }

  if (memberModelGender is String) {
    return enums.$MemberModelGenderMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() == memberModelGender.toLowerCase(),
            orElse: () => const MapEntry(
                enums.MemberModelGender.swaggerGeneratedUnknown, ''))
        .key;
  }

  return enums.MemberModelGender.swaggerGeneratedUnknown;
}

List<String> memberModelGenderListToJson(
    List<enums.MemberModelGender>? memberModelGender) {
  if (memberModelGender == null) {
    return [];
  }

  return memberModelGender.map((e) => enums.$MemberModelGenderMap[e]!).toList();
}

List<enums.MemberModelGender> memberModelGenderListFromJson(
    List? memberModelGender) {
  if (memberModelGender == null) {
    return [];
  }

  return memberModelGender
      .map((e) => memberModelGenderFromJson(e.toString()))
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

String? profileUpdateRequestDestinationTypesToJson(
    enums.ProfileUpdateRequestDestinationTypes?
        profileUpdateRequestDestinationTypes) {
  return enums.$ProfileUpdateRequestDestinationTypesMap[
      profileUpdateRequestDestinationTypes];
}

enums.ProfileUpdateRequestDestinationTypes
    profileUpdateRequestDestinationTypesFromJson(
        Object? profileUpdateRequestDestinationTypes) {
  if (profileUpdateRequestDestinationTypes is int) {
    return enums.$ProfileUpdateRequestDestinationTypesMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                profileUpdateRequestDestinationTypes.toString(),
            orElse: () => const MapEntry(
                enums.ProfileUpdateRequestDestinationTypes
                    .swaggerGeneratedUnknown,
                ''))
        .key;
  }

  if (profileUpdateRequestDestinationTypes is String) {
    return enums.$ProfileUpdateRequestDestinationTypesMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                profileUpdateRequestDestinationTypes.toLowerCase(),
            orElse: () => const MapEntry(
                enums.ProfileUpdateRequestDestinationTypes
                    .swaggerGeneratedUnknown,
                ''))
        .key;
  }

  return enums.ProfileUpdateRequestDestinationTypes.swaggerGeneratedUnknown;
}

List<String> profileUpdateRequestDestinationTypesListToJson(
    List<enums.ProfileUpdateRequestDestinationTypes>?
        profileUpdateRequestDestinationTypes) {
  if (profileUpdateRequestDestinationTypes == null) {
    return [];
  }

  return profileUpdateRequestDestinationTypes
      .map((e) => enums.$ProfileUpdateRequestDestinationTypesMap[e]!)
      .toList();
}

List<enums.ProfileUpdateRequestDestinationTypes>
    profileUpdateRequestDestinationTypesListFromJson(
        List? profileUpdateRequestDestinationTypes) {
  if (profileUpdateRequestDestinationTypes == null) {
    return [];
  }

  return profileUpdateRequestDestinationTypes
      .map((e) => profileUpdateRequestDestinationTypesFromJson(e.toString()))
      .toList();
}

String? profileUpdateRequestTravelWithPersonFromSameCityToJson(
    enums.ProfileUpdateRequestTravelWithPersonFromSameCity?
        profileUpdateRequestTravelWithPersonFromSameCity) {
  return enums.$ProfileUpdateRequestTravelWithPersonFromSameCityMap[
      profileUpdateRequestTravelWithPersonFromSameCity];
}

enums.ProfileUpdateRequestTravelWithPersonFromSameCity
    profileUpdateRequestTravelWithPersonFromSameCityFromJson(
        Object? profileUpdateRequestTravelWithPersonFromSameCity) {
  if (profileUpdateRequestTravelWithPersonFromSameCity is int) {
    return enums.$ProfileUpdateRequestTravelWithPersonFromSameCityMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                profileUpdateRequestTravelWithPersonFromSameCity.toString(),
            orElse: () => const MapEntry(
                enums.ProfileUpdateRequestTravelWithPersonFromSameCity
                    .swaggerGeneratedUnknown,
                ''))
        .key;
  }

  if (profileUpdateRequestTravelWithPersonFromSameCity is String) {
    return enums.$ProfileUpdateRequestTravelWithPersonFromSameCityMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                profileUpdateRequestTravelWithPersonFromSameCity.toLowerCase(),
            orElse: () => const MapEntry(
                enums.ProfileUpdateRequestTravelWithPersonFromSameCity
                    .swaggerGeneratedUnknown,
                ''))
        .key;
  }

  return enums
      .ProfileUpdateRequestTravelWithPersonFromSameCity.swaggerGeneratedUnknown;
}

List<String> profileUpdateRequestTravelWithPersonFromSameCityListToJson(
    List<enums.ProfileUpdateRequestTravelWithPersonFromSameCity>?
        profileUpdateRequestTravelWithPersonFromSameCity) {
  if (profileUpdateRequestTravelWithPersonFromSameCity == null) {
    return [];
  }

  return profileUpdateRequestTravelWithPersonFromSameCity
      .map(
          (e) => enums.$ProfileUpdateRequestTravelWithPersonFromSameCityMap[e]!)
      .toList();
}

List<enums.ProfileUpdateRequestTravelWithPersonFromSameCity>
    profileUpdateRequestTravelWithPersonFromSameCityListFromJson(
        List? profileUpdateRequestTravelWithPersonFromSameCity) {
  if (profileUpdateRequestTravelWithPersonFromSameCity == null) {
    return [];
  }

  return profileUpdateRequestTravelWithPersonFromSameCity
      .map((e) => profileUpdateRequestTravelWithPersonFromSameCityFromJson(
          e.toString()))
      .toList();
}

String? profileUpdateRequestTravelWithPersonFromSameCountryToJson(
    enums.ProfileUpdateRequestTravelWithPersonFromSameCountry?
        profileUpdateRequestTravelWithPersonFromSameCountry) {
  return enums.$ProfileUpdateRequestTravelWithPersonFromSameCountryMap[
      profileUpdateRequestTravelWithPersonFromSameCountry];
}

enums.ProfileUpdateRequestTravelWithPersonFromSameCountry
    profileUpdateRequestTravelWithPersonFromSameCountryFromJson(
        Object? profileUpdateRequestTravelWithPersonFromSameCountry) {
  if (profileUpdateRequestTravelWithPersonFromSameCountry is int) {
    return enums.$ProfileUpdateRequestTravelWithPersonFromSameCountryMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                profileUpdateRequestTravelWithPersonFromSameCountry.toString(),
            orElse: () => const MapEntry(
                enums.ProfileUpdateRequestTravelWithPersonFromSameCountry
                    .swaggerGeneratedUnknown,
                ''))
        .key;
  }

  if (profileUpdateRequestTravelWithPersonFromSameCountry is String) {
    return enums.$ProfileUpdateRequestTravelWithPersonFromSameCountryMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                profileUpdateRequestTravelWithPersonFromSameCountry
                    .toLowerCase(),
            orElse: () => const MapEntry(
                enums.ProfileUpdateRequestTravelWithPersonFromSameCountry
                    .swaggerGeneratedUnknown,
                ''))
        .key;
  }

  return enums.ProfileUpdateRequestTravelWithPersonFromSameCountry
      .swaggerGeneratedUnknown;
}

List<String> profileUpdateRequestTravelWithPersonFromSameCountryListToJson(
    List<enums.ProfileUpdateRequestTravelWithPersonFromSameCountry>?
        profileUpdateRequestTravelWithPersonFromSameCountry) {
  if (profileUpdateRequestTravelWithPersonFromSameCountry == null) {
    return [];
  }

  return profileUpdateRequestTravelWithPersonFromSameCountry
      .map((e) =>
          enums.$ProfileUpdateRequestTravelWithPersonFromSameCountryMap[e]!)
      .toList();
}

List<enums.ProfileUpdateRequestTravelWithPersonFromSameCountry>
    profileUpdateRequestTravelWithPersonFromSameCountryListFromJson(
        List? profileUpdateRequestTravelWithPersonFromSameCountry) {
  if (profileUpdateRequestTravelWithPersonFromSameCountry == null) {
    return [];
  }

  return profileUpdateRequestTravelWithPersonFromSameCountry
      .map((e) => profileUpdateRequestTravelWithPersonFromSameCountryFromJson(
          e.toString()))
      .toList();
}

String? profileUpdateRequestTravelWithPersonSameLanguageToJson(
    enums.ProfileUpdateRequestTravelWithPersonSameLanguage?
        profileUpdateRequestTravelWithPersonSameLanguage) {
  return enums.$ProfileUpdateRequestTravelWithPersonSameLanguageMap[
      profileUpdateRequestTravelWithPersonSameLanguage];
}

enums.ProfileUpdateRequestTravelWithPersonSameLanguage
    profileUpdateRequestTravelWithPersonSameLanguageFromJson(
        Object? profileUpdateRequestTravelWithPersonSameLanguage) {
  if (profileUpdateRequestTravelWithPersonSameLanguage is int) {
    return enums.$ProfileUpdateRequestTravelWithPersonSameLanguageMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                profileUpdateRequestTravelWithPersonSameLanguage.toString(),
            orElse: () => const MapEntry(
                enums.ProfileUpdateRequestTravelWithPersonSameLanguage
                    .swaggerGeneratedUnknown,
                ''))
        .key;
  }

  if (profileUpdateRequestTravelWithPersonSameLanguage is String) {
    return enums.$ProfileUpdateRequestTravelWithPersonSameLanguageMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                profileUpdateRequestTravelWithPersonSameLanguage.toLowerCase(),
            orElse: () => const MapEntry(
                enums.ProfileUpdateRequestTravelWithPersonSameLanguage
                    .swaggerGeneratedUnknown,
                ''))
        .key;
  }

  return enums
      .ProfileUpdateRequestTravelWithPersonSameLanguage.swaggerGeneratedUnknown;
}

List<String> profileUpdateRequestTravelWithPersonSameLanguageListToJson(
    List<enums.ProfileUpdateRequestTravelWithPersonSameLanguage>?
        profileUpdateRequestTravelWithPersonSameLanguage) {
  if (profileUpdateRequestTravelWithPersonSameLanguage == null) {
    return [];
  }

  return profileUpdateRequestTravelWithPersonSameLanguage
      .map(
          (e) => enums.$ProfileUpdateRequestTravelWithPersonSameLanguageMap[e]!)
      .toList();
}

List<enums.ProfileUpdateRequestTravelWithPersonSameLanguage>
    profileUpdateRequestTravelWithPersonSameLanguageListFromJson(
        List? profileUpdateRequestTravelWithPersonSameLanguage) {
  if (profileUpdateRequestTravelWithPersonSameLanguage == null) {
    return [];
  }

  return profileUpdateRequestTravelWithPersonSameLanguage
      .map((e) => profileUpdateRequestTravelWithPersonSameLanguageFromJson(
          e.toString()))
      .toList();
}

String? profileUpdateRequestGenderToJson(
    enums.ProfileUpdateRequestGender? profileUpdateRequestGender) {
  return enums.$ProfileUpdateRequestGenderMap[profileUpdateRequestGender];
}

enums.ProfileUpdateRequestGender profileUpdateRequestGenderFromJson(
    Object? profileUpdateRequestGender) {
  if (profileUpdateRequestGender is int) {
    return enums.$ProfileUpdateRequestGenderMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                profileUpdateRequestGender.toString(),
            orElse: () => const MapEntry(
                enums.ProfileUpdateRequestGender.swaggerGeneratedUnknown, ''))
        .key;
  }

  if (profileUpdateRequestGender is String) {
    return enums.$ProfileUpdateRequestGenderMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                profileUpdateRequestGender.toLowerCase(),
            orElse: () => const MapEntry(
                enums.ProfileUpdateRequestGender.swaggerGeneratedUnknown, ''))
        .key;
  }

  return enums.ProfileUpdateRequestGender.swaggerGeneratedUnknown;
}

List<String> profileUpdateRequestGenderListToJson(
    List<enums.ProfileUpdateRequestGender>? profileUpdateRequestGender) {
  if (profileUpdateRequestGender == null) {
    return [];
  }

  return profileUpdateRequestGender
      .map((e) => enums.$ProfileUpdateRequestGenderMap[e]!)
      .toList();
}

List<enums.ProfileUpdateRequestGender> profileUpdateRequestGenderListFromJson(
    List? profileUpdateRequestGender) {
  if (profileUpdateRequestGender == null) {
    return [];
  }

  return profileUpdateRequestGender
      .map((e) => profileUpdateRequestGenderFromJson(e.toString()))
      .toList();
}

String? profileUpdateRequestChillOrVisitToJson(
    enums.ProfileUpdateRequestChillOrVisit? profileUpdateRequestChillOrVisit) {
  return enums
      .$ProfileUpdateRequestChillOrVisitMap[profileUpdateRequestChillOrVisit];
}

enums.ProfileUpdateRequestChillOrVisit profileUpdateRequestChillOrVisitFromJson(
    Object? profileUpdateRequestChillOrVisit) {
  if (profileUpdateRequestChillOrVisit is int) {
    return enums.$ProfileUpdateRequestChillOrVisitMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                profileUpdateRequestChillOrVisit.toString(),
            orElse: () => const MapEntry(
                enums.ProfileUpdateRequestChillOrVisit.swaggerGeneratedUnknown,
                ''))
        .key;
  }

  if (profileUpdateRequestChillOrVisit is String) {
    return enums.$ProfileUpdateRequestChillOrVisitMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                profileUpdateRequestChillOrVisit.toLowerCase(),
            orElse: () => const MapEntry(
                enums.ProfileUpdateRequestChillOrVisit.swaggerGeneratedUnknown,
                ''))
        .key;
  }

  return enums.ProfileUpdateRequestChillOrVisit.swaggerGeneratedUnknown;
}

List<String> profileUpdateRequestChillOrVisitListToJson(
    List<enums.ProfileUpdateRequestChillOrVisit>?
        profileUpdateRequestChillOrVisit) {
  if (profileUpdateRequestChillOrVisit == null) {
    return [];
  }

  return profileUpdateRequestChillOrVisit
      .map((e) => enums.$ProfileUpdateRequestChillOrVisitMap[e]!)
      .toList();
}

List<enums.ProfileUpdateRequestChillOrVisit>
    profileUpdateRequestChillOrVisitListFromJson(
        List? profileUpdateRequestChillOrVisit) {
  if (profileUpdateRequestChillOrVisit == null) {
    return [];
  }

  return profileUpdateRequestChillOrVisit
      .map((e) => profileUpdateRequestChillOrVisitFromJson(e.toString()))
      .toList();
}

String? profileUpdateRequestAboutFoodToJson(
    enums.ProfileUpdateRequestAboutFood? profileUpdateRequestAboutFood) {
  return enums.$ProfileUpdateRequestAboutFoodMap[profileUpdateRequestAboutFood];
}

enums.ProfileUpdateRequestAboutFood profileUpdateRequestAboutFoodFromJson(
    Object? profileUpdateRequestAboutFood) {
  if (profileUpdateRequestAboutFood is int) {
    return enums.$ProfileUpdateRequestAboutFoodMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                profileUpdateRequestAboutFood.toString(),
            orElse: () => const MapEntry(
                enums.ProfileUpdateRequestAboutFood.swaggerGeneratedUnknown,
                ''))
        .key;
  }

  if (profileUpdateRequestAboutFood is String) {
    return enums.$ProfileUpdateRequestAboutFoodMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                profileUpdateRequestAboutFood.toLowerCase(),
            orElse: () => const MapEntry(
                enums.ProfileUpdateRequestAboutFood.swaggerGeneratedUnknown,
                ''))
        .key;
  }

  return enums.ProfileUpdateRequestAboutFood.swaggerGeneratedUnknown;
}

List<String> profileUpdateRequestAboutFoodListToJson(
    List<enums.ProfileUpdateRequestAboutFood>? profileUpdateRequestAboutFood) {
  if (profileUpdateRequestAboutFood == null) {
    return [];
  }

  return profileUpdateRequestAboutFood
      .map((e) => enums.$ProfileUpdateRequestAboutFoodMap[e]!)
      .toList();
}

List<enums.ProfileUpdateRequestAboutFood>
    profileUpdateRequestAboutFoodListFromJson(
        List? profileUpdateRequestAboutFood) {
  if (profileUpdateRequestAboutFood == null) {
    return [];
  }

  return profileUpdateRequestAboutFood
      .map((e) => profileUpdateRequestAboutFoodFromJson(e.toString()))
      .toList();
}

String? profileUpdateRequestGoOutAtNightToJson(
    enums.ProfileUpdateRequestGoOutAtNight? profileUpdateRequestGoOutAtNight) {
  return enums
      .$ProfileUpdateRequestGoOutAtNightMap[profileUpdateRequestGoOutAtNight];
}

enums.ProfileUpdateRequestGoOutAtNight profileUpdateRequestGoOutAtNightFromJson(
    Object? profileUpdateRequestGoOutAtNight) {
  if (profileUpdateRequestGoOutAtNight is int) {
    return enums.$ProfileUpdateRequestGoOutAtNightMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                profileUpdateRequestGoOutAtNight.toString(),
            orElse: () => const MapEntry(
                enums.ProfileUpdateRequestGoOutAtNight.swaggerGeneratedUnknown,
                ''))
        .key;
  }

  if (profileUpdateRequestGoOutAtNight is String) {
    return enums.$ProfileUpdateRequestGoOutAtNightMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                profileUpdateRequestGoOutAtNight.toLowerCase(),
            orElse: () => const MapEntry(
                enums.ProfileUpdateRequestGoOutAtNight.swaggerGeneratedUnknown,
                ''))
        .key;
  }

  return enums.ProfileUpdateRequestGoOutAtNight.swaggerGeneratedUnknown;
}

List<String> profileUpdateRequestGoOutAtNightListToJson(
    List<enums.ProfileUpdateRequestGoOutAtNight>?
        profileUpdateRequestGoOutAtNight) {
  if (profileUpdateRequestGoOutAtNight == null) {
    return [];
  }

  return profileUpdateRequestGoOutAtNight
      .map((e) => enums.$ProfileUpdateRequestGoOutAtNightMap[e]!)
      .toList();
}

List<enums.ProfileUpdateRequestGoOutAtNight>
    profileUpdateRequestGoOutAtNightListFromJson(
        List? profileUpdateRequestGoOutAtNight) {
  if (profileUpdateRequestGoOutAtNight == null) {
    return [];
  }

  return profileUpdateRequestGoOutAtNight
      .map((e) => profileUpdateRequestGoOutAtNightFromJson(e.toString()))
      .toList();
}

String? profileUpdateRequestSportToJson(
    enums.ProfileUpdateRequestSport? profileUpdateRequestSport) {
  return enums.$ProfileUpdateRequestSportMap[profileUpdateRequestSport];
}

enums.ProfileUpdateRequestSport profileUpdateRequestSportFromJson(
    Object? profileUpdateRequestSport) {
  if (profileUpdateRequestSport is int) {
    return enums.$ProfileUpdateRequestSportMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                profileUpdateRequestSport.toString(),
            orElse: () => const MapEntry(
                enums.ProfileUpdateRequestSport.swaggerGeneratedUnknown, ''))
        .key;
  }

  if (profileUpdateRequestSport is String) {
    return enums.$ProfileUpdateRequestSportMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                profileUpdateRequestSport.toLowerCase(),
            orElse: () => const MapEntry(
                enums.ProfileUpdateRequestSport.swaggerGeneratedUnknown, ''))
        .key;
  }

  return enums.ProfileUpdateRequestSport.swaggerGeneratedUnknown;
}

List<String> profileUpdateRequestSportListToJson(
    List<enums.ProfileUpdateRequestSport>? profileUpdateRequestSport) {
  if (profileUpdateRequestSport == null) {
    return [];
  }

  return profileUpdateRequestSport
      .map((e) => enums.$ProfileUpdateRequestSportMap[e]!)
      .toList();
}

List<enums.ProfileUpdateRequestSport> profileUpdateRequestSportListFromJson(
    List? profileUpdateRequestSport) {
  if (profileUpdateRequestSport == null) {
    return [];
  }

  return profileUpdateRequestSport
      .map((e) => profileUpdateRequestSportFromJson(e.toString()))
      .toList();
}

String? updateGroupRequestStateToJson(
    enums.UpdateGroupRequestState? updateGroupRequestState) {
  return enums.$UpdateGroupRequestStateMap[updateGroupRequestState];
}

enums.UpdateGroupRequestState updateGroupRequestStateFromJson(
    Object? updateGroupRequestState) {
  if (updateGroupRequestState is int) {
    return enums.$UpdateGroupRequestStateMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                updateGroupRequestState.toString(),
            orElse: () => const MapEntry(
                enums.UpdateGroupRequestState.swaggerGeneratedUnknown, ''))
        .key;
  }

  if (updateGroupRequestState is String) {
    return enums.$UpdateGroupRequestStateMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                updateGroupRequestState.toLowerCase(),
            orElse: () => const MapEntry(
                enums.UpdateGroupRequestState.swaggerGeneratedUnknown, ''))
        .key;
  }

  return enums.UpdateGroupRequestState.swaggerGeneratedUnknown;
}

List<String> updateGroupRequestStateListToJson(
    List<enums.UpdateGroupRequestState>? updateGroupRequestState) {
  if (updateGroupRequestState == null) {
    return [];
  }

  return updateGroupRequestState
      .map((e) => enums.$UpdateGroupRequestStateMap[e]!)
      .toList();
}

List<enums.UpdateGroupRequestState> updateGroupRequestStateListFromJson(
    List? updateGroupRequestState) {
  if (updateGroupRequestState == null) {
    return [];
  }

  return updateGroupRequestState
      .map((e) => updateGroupRequestStateFromJson(e.toString()))
      .toList();
}

String? messageResponseType$ToJson(
    enums.MessageResponseType$? messageResponseType$) {
  return enums.$MessageResponseType$Map[messageResponseType$];
}

enums.MessageResponseType$ messageResponseType$FromJson(
    Object? messageResponseType$) {
  if (messageResponseType$ is int) {
    return enums.$MessageResponseType$Map.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() == messageResponseType$.toString(),
            orElse: () => const MapEntry(
                enums.MessageResponseType$.swaggerGeneratedUnknown, ''))
        .key;
  }

  if (messageResponseType$ is String) {
    return enums.$MessageResponseType$Map.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                messageResponseType$.toLowerCase(),
            orElse: () => const MapEntry(
                enums.MessageResponseType$.swaggerGeneratedUnknown, ''))
        .key;
  }

  return enums.MessageResponseType$.swaggerGeneratedUnknown;
}

List<String> messageResponseType$ListToJson(
    List<enums.MessageResponseType$>? messageResponseType$) {
  if (messageResponseType$ == null) {
    return [];
  }

  return messageResponseType$
      .map((e) => enums.$MessageResponseType$Map[e]!)
      .toList();
}

List<enums.MessageResponseType$> messageResponseType$ListFromJson(
    List? messageResponseType$) {
  if (messageResponseType$ == null) {
    return [];
  }

  return messageResponseType$
      .map((e) => messageResponseType$FromJson(e.toString()))
      .toList();
}

String? matchMakingResultType$ToJson(
    enums.MatchMakingResultType$? matchMakingResultType$) {
  return enums.$MatchMakingResultType$Map[matchMakingResultType$];
}

enums.MatchMakingResultType$ matchMakingResultType$FromJson(
    Object? matchMakingResultType$) {
  if (matchMakingResultType$ is int) {
    return enums.$MatchMakingResultType$Map.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                matchMakingResultType$.toString(),
            orElse: () => const MapEntry(
                enums.MatchMakingResultType$.swaggerGeneratedUnknown, ''))
        .key;
  }

  if (matchMakingResultType$ is String) {
    return enums.$MatchMakingResultType$Map.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                matchMakingResultType$.toLowerCase(),
            orElse: () => const MapEntry(
                enums.MatchMakingResultType$.swaggerGeneratedUnknown, ''))
        .key;
  }

  return enums.MatchMakingResultType$.swaggerGeneratedUnknown;
}

List<String> matchMakingResultType$ListToJson(
    List<enums.MatchMakingResultType$>? matchMakingResultType$) {
  if (matchMakingResultType$ == null) {
    return [];
  }

  return matchMakingResultType$
      .map((e) => enums.$MatchMakingResultType$Map[e]!)
      .toList();
}

List<enums.MatchMakingResultType$> matchMakingResultType$ListFromJson(
    List? matchMakingResultType$) {
  if (matchMakingResultType$ == null) {
    return [];
  }

  return matchMakingResultType$
      .map((e) => matchMakingResultType$FromJson(e.toString()))
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
