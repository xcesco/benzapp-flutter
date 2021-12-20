// GENERATED CODE - DO NOT MODIFY BY HAND

part of serializers;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializers _$serializers = (new Serializers().toBuilder()
      ..add(AdminUserDTO.serializer)
      ..add(Cittadino.serializer)
      ..add(Delega.serializer)
      ..add(Device.serializer)
      ..add(Fascia.serializer)
      ..add(Gestore.serializer)
      ..add(GestoreTipoEnum.serializer)
      ..add(JWTToken.serializer)
      ..add(KeyAndPasswordVM.serializer)
      ..add(LoginVM.serializer)
      ..add(ManagedUserVM.serializer)
      ..add(Marchio.serializer)
      ..add(NotificaDTO.serializer)
      ..add(PasswordChangeDTO.serializer)
      ..add(Rifornimento.serializer)
      ..add(RifornimentoTipoCarburanteEnum.serializer)
      ..add(Tessera.serializer)
      ..add(TesseraCarburanteEnum.serializer)
      ..add(TesseraVeicoloEnum.serializer)
      ..add(User.serializer)
      ..add(UserDTO.serializer)
      ..addBuilderFactory(
          const FullType(BuiltSet, const [const FullType(Cittadino)]),
          () => new SetBuilder<Cittadino>())
      ..addBuilderFactory(
          const FullType(BuiltSet, const [const FullType(Delega)]),
          () => new SetBuilder<Delega>())
      ..addBuilderFactory(
          const FullType(BuiltSet, const [const FullType(Rifornimento)]),
          () => new SetBuilder<Rifornimento>())
      ..addBuilderFactory(
          const FullType(BuiltSet, const [const FullType(Delega)]),
          () => new SetBuilder<Delega>())
      ..addBuilderFactory(
          const FullType(BuiltSet, const [const FullType(Tessera)]),
          () => new SetBuilder<Tessera>())
      ..addBuilderFactory(
          const FullType(BuiltSet, const [const FullType(Gestore)]),
          () => new SetBuilder<Gestore>())
      ..addBuilderFactory(
          const FullType(BuiltSet, const [const FullType(Rifornimento)]),
          () => new SetBuilder<Rifornimento>())
      ..addBuilderFactory(
          const FullType(BuiltSet, const [const FullType(String)]),
          () => new SetBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltSet, const [const FullType(String)]),
          () => new SetBuilder<String>()))
    .build();

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
