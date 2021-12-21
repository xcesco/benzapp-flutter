library serializers;

import 'package:benzapp_flutter/model/admin_user_dto.dart';
import 'package:benzapp_flutter/model/cittadino.dart';
import 'package:benzapp_flutter/model/delega.dart';
import 'package:benzapp_flutter/model/device.dart';
import 'package:benzapp_flutter/model/fascia.dart';
import 'package:benzapp_flutter/model/gestore.dart';
import 'package:benzapp_flutter/model/jwt_token.dart';
import 'package:benzapp_flutter/model/key_and_password_vm.dart';
import 'package:benzapp_flutter/model/login_vm.dart';
import 'package:benzapp_flutter/model/managed_user_vm.dart';
import 'package:benzapp_flutter/model/marchio.dart';
import 'package:benzapp_flutter/model/notifica_dto.dart';
import 'package:benzapp_flutter/model/password_change_dto.dart';
import 'package:benzapp_flutter/model/rifornimento.dart';
import 'package:benzapp_flutter/model/tessera.dart';
import 'package:benzapp_flutter/model/user.dart';
import 'package:benzapp_flutter/model/user_dto.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/iso_8601_date_time_serializer.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';

part 'serializers.g.dart';

@SerializersFor([
  AdminUserDTO,
  Cittadino,
  Delega,
  Device,
  Fascia,
  Gestore,
  JWTToken,
  KeyAndPasswordVM,
  LoginVM,
  ManagedUserVM,
  Marchio,
  NotificaDTO,
  PasswordChangeDTO,
  Rifornimento,
  Tessera,
  User,
  UserDTO,
])
//allow all models to be serialized within a list
Serializers serializers = (_$serializers.toBuilder()
      ..addBuilderFactory(const FullType(BuiltList, [FullType(AdminUserDTO)]),
          () => ListBuilder<AdminUserDTO>())
      ..addBuilderFactory(const FullType(BuiltList, [FullType(Cittadino)]),
          () => ListBuilder<Cittadino>())
      ..addBuilderFactory(const FullType(BuiltList, [FullType(Delega)]),
          () => ListBuilder<Delega>())
      ..addBuilderFactory(const FullType(BuiltList, [FullType(Device)]),
          () => ListBuilder<Device>())
      ..addBuilderFactory(const FullType(BuiltList, [FullType(Fascia)]),
          () => ListBuilder<Fascia>())
      ..addBuilderFactory(const FullType(BuiltList, [FullType(Gestore)]),
          () => ListBuilder<Gestore>())
      ..addBuilderFactory(const FullType(BuiltList, [FullType(JWTToken)]),
          () => ListBuilder<JWTToken>())
      ..addBuilderFactory(
          const FullType(BuiltList, [FullType(KeyAndPasswordVM)]),
          () => ListBuilder<KeyAndPasswordVM>())
      ..addBuilderFactory(const FullType(BuiltList, [FullType(LoginVM)]),
          () => ListBuilder<LoginVM>())
      ..addBuilderFactory(const FullType(BuiltList, [FullType(ManagedUserVM)]),
          () => ListBuilder<ManagedUserVM>())
      ..addBuilderFactory(const FullType(BuiltList, [FullType(Marchio)]),
          () => ListBuilder<Marchio>())
      ..addBuilderFactory(const FullType(BuiltList, [FullType(NotificaDTO)]),
          () => ListBuilder<NotificaDTO>())
      ..addBuilderFactory(
          const FullType(BuiltList, [FullType(PasswordChangeDTO)]),
          () => ListBuilder<PasswordChangeDTO>())
      ..addBuilderFactory(const FullType(BuiltList, [FullType(Rifornimento)]),
          () => ListBuilder<Rifornimento>())
      ..addBuilderFactory(const FullType(BuiltList, [FullType(Tessera)]),
          () => ListBuilder<Tessera>())
      ..addBuilderFactory(const FullType(BuiltList, [FullType(User)]),
          () => ListBuilder<User>())
      ..addBuilderFactory(const FullType(BuiltList, [FullType(UserDTO)]),
          () => ListBuilder<UserDTO>())
      ..add(Iso8601DateTimeSerializer()))
    .build();

Serializers standardSerializers =
    (serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
