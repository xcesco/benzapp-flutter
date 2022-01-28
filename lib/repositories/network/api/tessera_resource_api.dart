import 'dart:async';
import 'dart:convert';

import 'package:benzapp_flutter/repositories/network/model/tessera.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:dio/dio.dart';

class TesseraResourceApi {
  final Dio _dio;
  Serializers _serializers;

  TesseraResourceApi(this._dio, this._serializers);


  /// getAllTesseras
  ///
  ///
  Future<Response<BuiltList<Tessera>>> getAllTesserasUsingGET({
    String? carburantePeriodEquals,
    BuiltList<String>? carburantePeriodIn,
    String? carburantePeriodNotEquals,
    BuiltList<String>? carburantePeriodNotIn,
    bool? carburantePeriodSpecified,
    int? cittadinoIdPeriodEquals,
    int? cittadinoIdPeriodGreaterThan,
    int? cittadinoIdPeriodGreaterThanOrEqual,
    BuiltList<int>? cittadinoIdPeriodIn,
    int? cittadinoIdPeriodLessThan,
    int? cittadinoIdPeriodLessThanOrEqual,
    int? cittadinoIdPeriodNotEquals,
    BuiltList<int>? cittadinoIdPeriodNotIn,
    bool? cittadinoIdPeriodSpecified,
    String? codicePeriodContains,
    String? codicePeriodDoesNotContain,
    String? codicePeriodEquals,
    BuiltList<String>? codicePeriodIn,
    String? codicePeriodNotEquals,
    BuiltList<String>? codicePeriodNotIn,
    bool? codicePeriodSpecified,
    DateTime? dataEmissionePeriodEquals,
    DateTime? dataEmissionePeriodGreaterThan,
    DateTime? dataEmissionePeriodGreaterThanOrEqual,
    int?
        dataEmissionePeriodInLeftSquareBracket0RightSquareBracketPeriodDayOfMonth,
    String?
        dataEmissionePeriodInLeftSquareBracket0RightSquareBracketPeriodDayOfWeek,
    int?
        dataEmissionePeriodInLeftSquareBracket0RightSquareBracketPeriodDayOfYear,
    int? dataEmissionePeriodInLeftSquareBracket0RightSquareBracketPeriodHour,
    int? dataEmissionePeriodInLeftSquareBracket0RightSquareBracketPeriodMinute,
    String?
        dataEmissionePeriodInLeftSquareBracket0RightSquareBracketPeriodMonth,
    int?
        dataEmissionePeriodInLeftSquareBracket0RightSquareBracketPeriodMonthValue,
    int? dataEmissionePeriodInLeftSquareBracket0RightSquareBracketPeriodNano,
    String?
        dataEmissionePeriodInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodId,
    bool?
        dataEmissionePeriodInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodFixedOffset,
    int?
        dataEmissionePeriodInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodDayOfMonthIndicator,
    String?
        dataEmissionePeriodInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodDayOfWeek,
    int?
        dataEmissionePeriodInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodLocalTimePeriodHour,
    int?
        dataEmissionePeriodInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodLocalTimePeriodMinute,
    int?
        dataEmissionePeriodInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodLocalTimePeriodNano,
    int?
        dataEmissionePeriodInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodLocalTimePeriodSecond,
    bool?
        dataEmissionePeriodInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodMidnightEndOfDay,
    String?
        dataEmissionePeriodInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodMonth,
    String?
        dataEmissionePeriodInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodTimeDefinition,
    DateTime?
        dataEmissionePeriodInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodDateTimeAfter,
    DateTime?
        dataEmissionePeriodInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodDateTimeBefore,
    int?
        dataEmissionePeriodInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodDurationPeriodNano,
    bool?
        dataEmissionePeriodInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodDurationPeriodNegative,
    int?
        dataEmissionePeriodInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodDurationPeriodSeconds,
    bool?
        dataEmissionePeriodInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodDurationPeriodUnitsLeftSquareBracket0RightSquareBracketPeriodDateBased,
    bool?
        dataEmissionePeriodInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodDurationPeriodUnitsLeftSquareBracket0RightSquareBracketPeriodDurationEstimated,
    bool?
        dataEmissionePeriodInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodDurationPeriodUnitsLeftSquareBracket0RightSquareBracketPeriodTimeBased,
    bool?
        dataEmissionePeriodInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodDurationPeriodZero,
    bool?
        dataEmissionePeriodInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodGap,
    DateTime?
        dataEmissionePeriodInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodInstant,
    bool?
        dataEmissionePeriodInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodOverlap,
    int?
        dataEmissionePeriodInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodTotalSeconds,
    int? dataEmissionePeriodInLeftSquareBracket0RightSquareBracketPeriodSecond,
    int? dataEmissionePeriodInLeftSquareBracket0RightSquareBracketPeriodYear,
    String?
        dataEmissionePeriodInLeftSquareBracket0RightSquareBracketPeriodZonePeriodId,
    bool?
        dataEmissionePeriodInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodFixedOffset,
    int?
        dataEmissionePeriodInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodDayOfMonthIndicator,
    String?
        dataEmissionePeriodInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodDayOfWeek,
    int?
        dataEmissionePeriodInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodLocalTimePeriodHour,
    int?
        dataEmissionePeriodInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodLocalTimePeriodMinute,
    int?
        dataEmissionePeriodInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodLocalTimePeriodNano,
    int?
        dataEmissionePeriodInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodLocalTimePeriodSecond,
    bool?
        dataEmissionePeriodInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodMidnightEndOfDay,
    String?
        dataEmissionePeriodInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodMonth,
    String?
        dataEmissionePeriodInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodOffsetAfterPeriodId,
    int?
        dataEmissionePeriodInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodOffsetAfterPeriodTotalSeconds,
    String?
        dataEmissionePeriodInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodOffsetBeforePeriodId,
    int?
        dataEmissionePeriodInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodOffsetBeforePeriodTotalSeconds,
    String?
        dataEmissionePeriodInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodStandardOffsetPeriodId,
    int?
        dataEmissionePeriodInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodStandardOffsetPeriodTotalSeconds,
    String?
        dataEmissionePeriodInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodTimeDefinition,
    DateTime?
        dataEmissionePeriodInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodDateTimeAfter,
    DateTime?
        dataEmissionePeriodInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodDateTimeBefore,
    int?
        dataEmissionePeriodInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodDurationPeriodNano,
    bool?
        dataEmissionePeriodInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodDurationPeriodNegative,
    int?
        dataEmissionePeriodInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodDurationPeriodSeconds,
    bool?
        dataEmissionePeriodInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodDurationPeriodUnitsLeftSquareBracket0RightSquareBracketPeriodDateBased,
    bool?
        dataEmissionePeriodInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodDurationPeriodUnitsLeftSquareBracket0RightSquareBracketPeriodDurationEstimated,
    bool?
        dataEmissionePeriodInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodDurationPeriodUnitsLeftSquareBracket0RightSquareBracketPeriodTimeBased,
    bool?
        dataEmissionePeriodInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodDurationPeriodZero,
    bool?
        dataEmissionePeriodInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodGap,
    DateTime?
        dataEmissionePeriodInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodInstant,
    String?
        dataEmissionePeriodInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodOffsetAfterPeriodId,
    int?
        dataEmissionePeriodInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodOffsetAfterPeriodTotalSeconds,
    String?
        dataEmissionePeriodInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodOffsetBeforePeriodId,
    int?
        dataEmissionePeriodInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodOffsetBeforePeriodTotalSeconds,
    bool?
        dataEmissionePeriodInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodOverlap,
    DateTime? dataEmissionePeriodLessThan,
    DateTime? dataEmissionePeriodLessThanOrEqual,
    DateTime? dataEmissionePeriodNotEquals,
    int?
        dataEmissionePeriodNotInLeftSquareBracket0RightSquareBracketPeriodDayOfMonth,
    String?
        dataEmissionePeriodNotInLeftSquareBracket0RightSquareBracketPeriodDayOfWeek,
    int?
        dataEmissionePeriodNotInLeftSquareBracket0RightSquareBracketPeriodDayOfYear,
    int? dataEmissionePeriodNotInLeftSquareBracket0RightSquareBracketPeriodHour,
    int?
        dataEmissionePeriodNotInLeftSquareBracket0RightSquareBracketPeriodMinute,
    String?
        dataEmissionePeriodNotInLeftSquareBracket0RightSquareBracketPeriodMonth,
    int?
        dataEmissionePeriodNotInLeftSquareBracket0RightSquareBracketPeriodMonthValue,
    int? dataEmissionePeriodNotInLeftSquareBracket0RightSquareBracketPeriodNano,
    String?
        dataEmissionePeriodNotInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodId,
    bool?
        dataEmissionePeriodNotInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodFixedOffset,
    int?
        dataEmissionePeriodNotInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodDayOfMonthIndicator,
    String?
        dataEmissionePeriodNotInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodDayOfWeek,
    int?
        dataEmissionePeriodNotInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodLocalTimePeriodHour,
    int?
        dataEmissionePeriodNotInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodLocalTimePeriodMinute,
    int?
        dataEmissionePeriodNotInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodLocalTimePeriodNano,
    int?
        dataEmissionePeriodNotInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodLocalTimePeriodSecond,
    bool?
        dataEmissionePeriodNotInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodMidnightEndOfDay,
    String?
        dataEmissionePeriodNotInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodMonth,
    String?
        dataEmissionePeriodNotInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodTimeDefinition,
    DateTime?
        dataEmissionePeriodNotInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodDateTimeAfter,
    DateTime?
        dataEmissionePeriodNotInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodDateTimeBefore,
    int?
        dataEmissionePeriodNotInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodDurationPeriodNano,
    bool?
        dataEmissionePeriodNotInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodDurationPeriodNegative,
    int?
        dataEmissionePeriodNotInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodDurationPeriodSeconds,
    bool?
        dataEmissionePeriodNotInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodDurationPeriodUnitsLeftSquareBracket0RightSquareBracketPeriodDateBased,
    bool?
        dataEmissionePeriodNotInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodDurationPeriodUnitsLeftSquareBracket0RightSquareBracketPeriodDurationEstimated,
    bool?
        dataEmissionePeriodNotInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodDurationPeriodUnitsLeftSquareBracket0RightSquareBracketPeriodTimeBased,
    bool?
        dataEmissionePeriodNotInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodDurationPeriodZero,
    bool?
        dataEmissionePeriodNotInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodGap,
    DateTime?
        dataEmissionePeriodNotInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodInstant,
    bool?
        dataEmissionePeriodNotInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodOverlap,
    int?
        dataEmissionePeriodNotInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodTotalSeconds,
    int?
        dataEmissionePeriodNotInLeftSquareBracket0RightSquareBracketPeriodSecond,
    int? dataEmissionePeriodNotInLeftSquareBracket0RightSquareBracketPeriodYear,
    String?
        dataEmissionePeriodNotInLeftSquareBracket0RightSquareBracketPeriodZonePeriodId,
    bool?
        dataEmissionePeriodNotInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodFixedOffset,
    int?
        dataEmissionePeriodNotInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodDayOfMonthIndicator,
    String?
        dataEmissionePeriodNotInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodDayOfWeek,
    int?
        dataEmissionePeriodNotInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodLocalTimePeriodHour,
    int?
        dataEmissionePeriodNotInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodLocalTimePeriodMinute,
    int?
        dataEmissionePeriodNotInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodLocalTimePeriodNano,
    int?
        dataEmissionePeriodNotInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodLocalTimePeriodSecond,
    bool?
        dataEmissionePeriodNotInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodMidnightEndOfDay,
    String?
        dataEmissionePeriodNotInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodMonth,
    String?
        dataEmissionePeriodNotInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodOffsetAfterPeriodId,
    int?
        dataEmissionePeriodNotInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodOffsetAfterPeriodTotalSeconds,
    String?
        dataEmissionePeriodNotInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodOffsetBeforePeriodId,
    int?
        dataEmissionePeriodNotInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodOffsetBeforePeriodTotalSeconds,
    String?
        dataEmissionePeriodNotInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodStandardOffsetPeriodId,
    int?
        dataEmissionePeriodNotInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodStandardOffsetPeriodTotalSeconds,
    String?
        dataEmissionePeriodNotInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodTimeDefinition,
    DateTime?
        dataEmissionePeriodNotInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodDateTimeAfter,
    DateTime?
        dataEmissionePeriodNotInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodDateTimeBefore,
    int?
        dataEmissionePeriodNotInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodDurationPeriodNano,
    bool?
        dataEmissionePeriodNotInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodDurationPeriodNegative,
    int?
        dataEmissionePeriodNotInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodDurationPeriodSeconds,
    bool?
        dataEmissionePeriodNotInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodDurationPeriodUnitsLeftSquareBracket0RightSquareBracketPeriodDateBased,
    bool?
        dataEmissionePeriodNotInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodDurationPeriodUnitsLeftSquareBracket0RightSquareBracketPeriodDurationEstimated,
    bool?
        dataEmissionePeriodNotInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodDurationPeriodUnitsLeftSquareBracket0RightSquareBracketPeriodTimeBased,
    bool?
        dataEmissionePeriodNotInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodDurationPeriodZero,
    bool?
        dataEmissionePeriodNotInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodGap,
    DateTime?
        dataEmissionePeriodNotInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodInstant,
    String?
        dataEmissionePeriodNotInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodOffsetAfterPeriodId,
    int?
        dataEmissionePeriodNotInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodOffsetAfterPeriodTotalSeconds,
    String?
        dataEmissionePeriodNotInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodOffsetBeforePeriodId,
    int?
        dataEmissionePeriodNotInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodOffsetBeforePeriodTotalSeconds,
    bool?
        dataEmissionePeriodNotInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodOverlap,
    bool? dataEmissionePeriodSpecified,
    int? delegaIdPeriodEquals,
    int? delegaIdPeriodGreaterThan,
    int? delegaIdPeriodGreaterThanOrEqual,
    BuiltList<int>? delegaIdPeriodIn,
    int? delegaIdPeriodLessThan,
    int? delegaIdPeriodLessThanOrEqual,
    int? delegaIdPeriodNotEquals,
    BuiltList<int>? delegaIdPeriodNotIn,
    bool? delegaIdPeriodSpecified,
    int? idPeriodEquals,
    int? idPeriodGreaterThan,
    int? idPeriodGreaterThanOrEqual,
    BuiltList<int>? idPeriodIn,
    int? idPeriodLessThan,
    int? idPeriodLessThanOrEqual,
    int? idPeriodNotEquals,
    BuiltList<int>? idPeriodNotIn,
    bool? idPeriodSpecified,
    int? page,
    int? rifornimentoIdPeriodEquals,
    int? rifornimentoIdPeriodGreaterThan,
    int? rifornimentoIdPeriodGreaterThanOrEqual,
    BuiltList<int>? rifornimentoIdPeriodIn,
    int? rifornimentoIdPeriodLessThan,
    int? rifornimentoIdPeriodLessThanOrEqual,
    int? rifornimentoIdPeriodNotEquals,
    BuiltList<int>? rifornimentoIdPeriodNotIn,
    bool? rifornimentoIdPeriodSpecified,
    int? size,
    BuiltList<String>? sort,
    String? targaPeriodContains,
    String? targaPeriodDoesNotContain,
    String? targaPeriodEquals,
    BuiltList<String>? targaPeriodIn,
    String? targaPeriodNotEquals,
    BuiltList<String>? targaPeriodNotIn,
    bool? targaPeriodSpecified,
    String? veicoloPeriodEquals,
    BuiltList<String>? veicoloPeriodIn,
    String? veicoloPeriodNotEquals,
    BuiltList<String>? veicoloPeriodNotIn,
    bool? veicoloPeriodSpecified,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    const String _path = '/api/tesseras';

    final Map<String, dynamic> queryParams = {};
    final Map<String, dynamic> headerParams = {
      if (headers != null) ...headers,
    };
    dynamic bodyData;

    queryParams[r'carburante.equals'] = carburantePeriodEquals;
    queryParams[r'carburante.in'] = carburantePeriodIn;
    queryParams[r'carburante.notEquals'] = carburantePeriodNotEquals;
    queryParams[r'carburante.notIn'] = carburantePeriodNotIn;
    queryParams[r'carburante.specified'] = carburantePeriodSpecified;
    queryParams[r'cittadinoId.equals'] = cittadinoIdPeriodEquals;
    queryParams[r'cittadinoId.greaterThan'] = cittadinoIdPeriodGreaterThan;
    queryParams[r'cittadinoId.greaterThanOrEqual'] =
        cittadinoIdPeriodGreaterThanOrEqual;
    queryParams[r'cittadinoId.in'] = cittadinoIdPeriodIn;
    queryParams[r'cittadinoId.lessThan'] = cittadinoIdPeriodLessThan;
    queryParams[r'cittadinoId.lessThanOrEqual'] =
        cittadinoIdPeriodLessThanOrEqual;
    queryParams[r'cittadinoId.notEquals'] = cittadinoIdPeriodNotEquals;
    queryParams[r'cittadinoId.notIn'] = cittadinoIdPeriodNotIn;
    queryParams[r'cittadinoId.specified'] = cittadinoIdPeriodSpecified;
    queryParams[r'codice.contains'] = codicePeriodContains;
    queryParams[r'codice.doesNotContain'] = codicePeriodDoesNotContain;
    queryParams[r'codice.equals'] = codicePeriodEquals;
    queryParams[r'codice.in'] = codicePeriodIn;
    queryParams[r'codice.notEquals'] = codicePeriodNotEquals;
    queryParams[r'codice.notIn'] = codicePeriodNotIn;
    queryParams[r'codice.specified'] = codicePeriodSpecified;
    queryParams[r'dataEmissione.equals'] = dataEmissionePeriodEquals;
    queryParams[r'dataEmissione.greaterThan'] = dataEmissionePeriodGreaterThan;
    queryParams[r'dataEmissione.greaterThanOrEqual'] =
        dataEmissionePeriodGreaterThanOrEqual;
    queryParams[r'dataEmissione.in[0].dayOfMonth'] =
        dataEmissionePeriodInLeftSquareBracket0RightSquareBracketPeriodDayOfMonth;
    queryParams[r'dataEmissione.in[0].dayOfWeek'] =
        dataEmissionePeriodInLeftSquareBracket0RightSquareBracketPeriodDayOfWeek;
    queryParams[r'dataEmissione.in[0].dayOfYear'] =
        dataEmissionePeriodInLeftSquareBracket0RightSquareBracketPeriodDayOfYear;
    queryParams[r'dataEmissione.in[0].hour'] =
        dataEmissionePeriodInLeftSquareBracket0RightSquareBracketPeriodHour;
    queryParams[r'dataEmissione.in[0].minute'] =
        dataEmissionePeriodInLeftSquareBracket0RightSquareBracketPeriodMinute;
    queryParams[r'dataEmissione.in[0].month'] =
        dataEmissionePeriodInLeftSquareBracket0RightSquareBracketPeriodMonth;
    queryParams[r'dataEmissione.in[0].monthValue'] =
        dataEmissionePeriodInLeftSquareBracket0RightSquareBracketPeriodMonthValue;
    queryParams[r'dataEmissione.in[0].nano'] =
        dataEmissionePeriodInLeftSquareBracket0RightSquareBracketPeriodNano;
    queryParams[r'dataEmissione.in[0].offset.id'] =
        dataEmissionePeriodInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodId;
    queryParams[r'dataEmissione.in[0].offset.rules.fixedOffset'] =
        dataEmissionePeriodInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodFixedOffset;
    queryParams[
            r'dataEmissione.in[0].offset.rules.transitionRules[0].dayOfMonthIndicator'] =
        dataEmissionePeriodInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodDayOfMonthIndicator;
    queryParams[
            r'dataEmissione.in[0].offset.rules.transitionRules[0].dayOfWeek'] =
        dataEmissionePeriodInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodDayOfWeek;
    queryParams[
            r'dataEmissione.in[0].offset.rules.transitionRules[0].localTime.hour'] =
        dataEmissionePeriodInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodLocalTimePeriodHour;
    queryParams[
            r'dataEmissione.in[0].offset.rules.transitionRules[0].localTime.minute'] =
        dataEmissionePeriodInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodLocalTimePeriodMinute;
    queryParams[
            r'dataEmissione.in[0].offset.rules.transitionRules[0].localTime.nano'] =
        dataEmissionePeriodInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodLocalTimePeriodNano;
    queryParams[
            r'dataEmissione.in[0].offset.rules.transitionRules[0].localTime.second'] =
        dataEmissionePeriodInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodLocalTimePeriodSecond;
    queryParams[
            r'dataEmissione.in[0].offset.rules.transitionRules[0].midnightEndOfDay'] =
        dataEmissionePeriodInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodMidnightEndOfDay;
    queryParams[r'dataEmissione.in[0].offset.rules.transitionRules[0].month'] =
        dataEmissionePeriodInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodMonth;
    queryParams[
            r'dataEmissione.in[0].offset.rules.transitionRules[0].timeDefinition'] =
        dataEmissionePeriodInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodTimeDefinition;
    queryParams[
            r'dataEmissione.in[0].offset.rules.transitions[0].dateTimeAfter'] =
        dataEmissionePeriodInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodDateTimeAfter;
    queryParams[
            r'dataEmissione.in[0].offset.rules.transitions[0].dateTimeBefore'] =
        dataEmissionePeriodInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodDateTimeBefore;
    queryParams[
            r'dataEmissione.in[0].offset.rules.transitions[0].duration.nano'] =
        dataEmissionePeriodInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodDurationPeriodNano;
    queryParams[
            r'dataEmissione.in[0].offset.rules.transitions[0].duration.negative'] =
        dataEmissionePeriodInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodDurationPeriodNegative;
    queryParams[
            r'dataEmissione.in[0].offset.rules.transitions[0].duration.seconds'] =
        dataEmissionePeriodInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodDurationPeriodSeconds;
    queryParams[
            r'dataEmissione.in[0].offset.rules.transitions[0].duration.units[0].dateBased'] =
        dataEmissionePeriodInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodDurationPeriodUnitsLeftSquareBracket0RightSquareBracketPeriodDateBased;
    queryParams[
            r'dataEmissione.in[0].offset.rules.transitions[0].duration.units[0].durationEstimated'] =
        dataEmissionePeriodInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodDurationPeriodUnitsLeftSquareBracket0RightSquareBracketPeriodDurationEstimated;
    queryParams[
            r'dataEmissione.in[0].offset.rules.transitions[0].duration.units[0].timeBased'] =
        dataEmissionePeriodInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodDurationPeriodUnitsLeftSquareBracket0RightSquareBracketPeriodTimeBased;
    queryParams[
            r'dataEmissione.in[0].offset.rules.transitions[0].duration.zero'] =
        dataEmissionePeriodInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodDurationPeriodZero;
    queryParams[r'dataEmissione.in[0].offset.rules.transitions[0].gap'] =
        dataEmissionePeriodInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodGap;
    queryParams[r'dataEmissione.in[0].offset.rules.transitions[0].instant'] =
        dataEmissionePeriodInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodInstant;
    queryParams[r'dataEmissione.in[0].offset.rules.transitions[0].overlap'] =
        dataEmissionePeriodInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodOverlap;
    queryParams[r'dataEmissione.in[0].offset.totalSeconds'] =
        dataEmissionePeriodInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodTotalSeconds;
    queryParams[r'dataEmissione.in[0].second'] =
        dataEmissionePeriodInLeftSquareBracket0RightSquareBracketPeriodSecond;
    queryParams[r'dataEmissione.in[0].year'] =
        dataEmissionePeriodInLeftSquareBracket0RightSquareBracketPeriodYear;
    queryParams[r'dataEmissione.in[0].zone.id'] =
        dataEmissionePeriodInLeftSquareBracket0RightSquareBracketPeriodZonePeriodId;
    queryParams[r'dataEmissione.in[0].zone.rules.fixedOffset'] =
        dataEmissionePeriodInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodFixedOffset;
    queryParams[
            r'dataEmissione.in[0].zone.rules.transitionRules[0].dayOfMonthIndicator'] =
        dataEmissionePeriodInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodDayOfMonthIndicator;
    queryParams[
            r'dataEmissione.in[0].zone.rules.transitionRules[0].dayOfWeek'] =
        dataEmissionePeriodInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodDayOfWeek;
    queryParams[
            r'dataEmissione.in[0].zone.rules.transitionRules[0].localTime.hour'] =
        dataEmissionePeriodInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodLocalTimePeriodHour;
    queryParams[
            r'dataEmissione.in[0].zone.rules.transitionRules[0].localTime.minute'] =
        dataEmissionePeriodInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodLocalTimePeriodMinute;
    queryParams[
            r'dataEmissione.in[0].zone.rules.transitionRules[0].localTime.nano'] =
        dataEmissionePeriodInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodLocalTimePeriodNano;
    queryParams[
            r'dataEmissione.in[0].zone.rules.transitionRules[0].localTime.second'] =
        dataEmissionePeriodInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodLocalTimePeriodSecond;
    queryParams[
            r'dataEmissione.in[0].zone.rules.transitionRules[0].midnightEndOfDay'] =
        dataEmissionePeriodInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodMidnightEndOfDay;
    queryParams[r'dataEmissione.in[0].zone.rules.transitionRules[0].month'] =
        dataEmissionePeriodInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodMonth;
    queryParams[
            r'dataEmissione.in[0].zone.rules.transitionRules[0].offsetAfter.id'] =
        dataEmissionePeriodInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodOffsetAfterPeriodId;
    queryParams[
            r'dataEmissione.in[0].zone.rules.transitionRules[0].offsetAfter.totalSeconds'] =
        dataEmissionePeriodInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodOffsetAfterPeriodTotalSeconds;
    queryParams[
            r'dataEmissione.in[0].zone.rules.transitionRules[0].offsetBefore.id'] =
        dataEmissionePeriodInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodOffsetBeforePeriodId;
    queryParams[
            r'dataEmissione.in[0].zone.rules.transitionRules[0].offsetBefore.totalSeconds'] =
        dataEmissionePeriodInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodOffsetBeforePeriodTotalSeconds;
    queryParams[
            r'dataEmissione.in[0].zone.rules.transitionRules[0].standardOffset.id'] =
        dataEmissionePeriodInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodStandardOffsetPeriodId;
    queryParams[
            r'dataEmissione.in[0].zone.rules.transitionRules[0].standardOffset.totalSeconds'] =
        dataEmissionePeriodInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodStandardOffsetPeriodTotalSeconds;
    queryParams[
            r'dataEmissione.in[0].zone.rules.transitionRules[0].timeDefinition'] =
        dataEmissionePeriodInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodTimeDefinition;
    queryParams[
            r'dataEmissione.in[0].zone.rules.transitions[0].dateTimeAfter'] =
        dataEmissionePeriodInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodDateTimeAfter;
    queryParams[
            r'dataEmissione.in[0].zone.rules.transitions[0].dateTimeBefore'] =
        dataEmissionePeriodInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodDateTimeBefore;
    queryParams[
            r'dataEmissione.in[0].zone.rules.transitions[0].duration.nano'] =
        dataEmissionePeriodInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodDurationPeriodNano;
    queryParams[
            r'dataEmissione.in[0].zone.rules.transitions[0].duration.negative'] =
        dataEmissionePeriodInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodDurationPeriodNegative;
    queryParams[
            r'dataEmissione.in[0].zone.rules.transitions[0].duration.seconds'] =
        dataEmissionePeriodInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodDurationPeriodSeconds;
    queryParams[
            r'dataEmissione.in[0].zone.rules.transitions[0].duration.units[0].dateBased'] =
        dataEmissionePeriodInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodDurationPeriodUnitsLeftSquareBracket0RightSquareBracketPeriodDateBased;
    queryParams[
            r'dataEmissione.in[0].zone.rules.transitions[0].duration.units[0].durationEstimated'] =
        dataEmissionePeriodInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodDurationPeriodUnitsLeftSquareBracket0RightSquareBracketPeriodDurationEstimated;
    queryParams[
            r'dataEmissione.in[0].zone.rules.transitions[0].duration.units[0].timeBased'] =
        dataEmissionePeriodInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodDurationPeriodUnitsLeftSquareBracket0RightSquareBracketPeriodTimeBased;
    queryParams[
            r'dataEmissione.in[0].zone.rules.transitions[0].duration.zero'] =
        dataEmissionePeriodInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodDurationPeriodZero;
    queryParams[r'dataEmissione.in[0].zone.rules.transitions[0].gap'] =
        dataEmissionePeriodInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodGap;
    queryParams[r'dataEmissione.in[0].zone.rules.transitions[0].instant'] =
        dataEmissionePeriodInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodInstant;
    queryParams[
            r'dataEmissione.in[0].zone.rules.transitions[0].offsetAfter.id'] =
        dataEmissionePeriodInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodOffsetAfterPeriodId;
    queryParams[
            r'dataEmissione.in[0].zone.rules.transitions[0].offsetAfter.totalSeconds'] =
        dataEmissionePeriodInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodOffsetAfterPeriodTotalSeconds;
    queryParams[
            r'dataEmissione.in[0].zone.rules.transitions[0].offsetBefore.id'] =
        dataEmissionePeriodInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodOffsetBeforePeriodId;
    queryParams[
            r'dataEmissione.in[0].zone.rules.transitions[0].offsetBefore.totalSeconds'] =
        dataEmissionePeriodInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodOffsetBeforePeriodTotalSeconds;
    queryParams[r'dataEmissione.in[0].zone.rules.transitions[0].overlap'] =
        dataEmissionePeriodInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodOverlap;
    queryParams[r'dataEmissione.lessThan'] = dataEmissionePeriodLessThan;
    queryParams[r'dataEmissione.lessThanOrEqual'] =
        dataEmissionePeriodLessThanOrEqual;
    queryParams[r'dataEmissione.notEquals'] = dataEmissionePeriodNotEquals;
    queryParams[r'dataEmissione.notIn[0].dayOfMonth'] =
        dataEmissionePeriodNotInLeftSquareBracket0RightSquareBracketPeriodDayOfMonth;
    queryParams[r'dataEmissione.notIn[0].dayOfWeek'] =
        dataEmissionePeriodNotInLeftSquareBracket0RightSquareBracketPeriodDayOfWeek;
    queryParams[r'dataEmissione.notIn[0].dayOfYear'] =
        dataEmissionePeriodNotInLeftSquareBracket0RightSquareBracketPeriodDayOfYear;
    queryParams[r'dataEmissione.notIn[0].hour'] =
        dataEmissionePeriodNotInLeftSquareBracket0RightSquareBracketPeriodHour;
    queryParams[r'dataEmissione.notIn[0].minute'] =
        dataEmissionePeriodNotInLeftSquareBracket0RightSquareBracketPeriodMinute;
    queryParams[r'dataEmissione.notIn[0].month'] =
        dataEmissionePeriodNotInLeftSquareBracket0RightSquareBracketPeriodMonth;
    queryParams[r'dataEmissione.notIn[0].monthValue'] =
        dataEmissionePeriodNotInLeftSquareBracket0RightSquareBracketPeriodMonthValue;
    queryParams[r'dataEmissione.notIn[0].nano'] =
        dataEmissionePeriodNotInLeftSquareBracket0RightSquareBracketPeriodNano;
    queryParams[r'dataEmissione.notIn[0].offset.id'] =
        dataEmissionePeriodNotInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodId;
    queryParams[r'dataEmissione.notIn[0].offset.rules.fixedOffset'] =
        dataEmissionePeriodNotInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodFixedOffset;
    queryParams[
            r'dataEmissione.notIn[0].offset.rules.transitionRules[0].dayOfMonthIndicator'] =
        dataEmissionePeriodNotInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodDayOfMonthIndicator;
    queryParams[
            r'dataEmissione.notIn[0].offset.rules.transitionRules[0].dayOfWeek'] =
        dataEmissionePeriodNotInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodDayOfWeek;
    queryParams[
            r'dataEmissione.notIn[0].offset.rules.transitionRules[0].localTime.hour'] =
        dataEmissionePeriodNotInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodLocalTimePeriodHour;
    queryParams[
            r'dataEmissione.notIn[0].offset.rules.transitionRules[0].localTime.minute'] =
        dataEmissionePeriodNotInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodLocalTimePeriodMinute;
    queryParams[
            r'dataEmissione.notIn[0].offset.rules.transitionRules[0].localTime.nano'] =
        dataEmissionePeriodNotInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodLocalTimePeriodNano;
    queryParams[
            r'dataEmissione.notIn[0].offset.rules.transitionRules[0].localTime.second'] =
        dataEmissionePeriodNotInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodLocalTimePeriodSecond;
    queryParams[
            r'dataEmissione.notIn[0].offset.rules.transitionRules[0].midnightEndOfDay'] =
        dataEmissionePeriodNotInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodMidnightEndOfDay;
    queryParams[
            r'dataEmissione.notIn[0].offset.rules.transitionRules[0].month'] =
        dataEmissionePeriodNotInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodMonth;
    queryParams[
            r'dataEmissione.notIn[0].offset.rules.transitionRules[0].timeDefinition'] =
        dataEmissionePeriodNotInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodTimeDefinition;
    queryParams[
            r'dataEmissione.notIn[0].offset.rules.transitions[0].dateTimeAfter'] =
        dataEmissionePeriodNotInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodDateTimeAfter;
    queryParams[
            r'dataEmissione.notIn[0].offset.rules.transitions[0].dateTimeBefore'] =
        dataEmissionePeriodNotInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodDateTimeBefore;
    queryParams[
            r'dataEmissione.notIn[0].offset.rules.transitions[0].duration.nano'] =
        dataEmissionePeriodNotInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodDurationPeriodNano;
    queryParams[
            r'dataEmissione.notIn[0].offset.rules.transitions[0].duration.negative'] =
        dataEmissionePeriodNotInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodDurationPeriodNegative;
    queryParams[
            r'dataEmissione.notIn[0].offset.rules.transitions[0].duration.seconds'] =
        dataEmissionePeriodNotInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodDurationPeriodSeconds;
    queryParams[
            r'dataEmissione.notIn[0].offset.rules.transitions[0].duration.units[0].dateBased'] =
        dataEmissionePeriodNotInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodDurationPeriodUnitsLeftSquareBracket0RightSquareBracketPeriodDateBased;
    queryParams[
            r'dataEmissione.notIn[0].offset.rules.transitions[0].duration.units[0].durationEstimated'] =
        dataEmissionePeriodNotInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodDurationPeriodUnitsLeftSquareBracket0RightSquareBracketPeriodDurationEstimated;
    queryParams[
            r'dataEmissione.notIn[0].offset.rules.transitions[0].duration.units[0].timeBased'] =
        dataEmissionePeriodNotInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodDurationPeriodUnitsLeftSquareBracket0RightSquareBracketPeriodTimeBased;
    queryParams[
            r'dataEmissione.notIn[0].offset.rules.transitions[0].duration.zero'] =
        dataEmissionePeriodNotInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodDurationPeriodZero;
    queryParams[r'dataEmissione.notIn[0].offset.rules.transitions[0].gap'] =
        dataEmissionePeriodNotInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodGap;
    queryParams[r'dataEmissione.notIn[0].offset.rules.transitions[0].instant'] =
        dataEmissionePeriodNotInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodInstant;
    queryParams[r'dataEmissione.notIn[0].offset.rules.transitions[0].overlap'] =
        dataEmissionePeriodNotInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodOverlap;
    queryParams[r'dataEmissione.notIn[0].offset.totalSeconds'] =
        dataEmissionePeriodNotInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodTotalSeconds;
    queryParams[r'dataEmissione.notIn[0].second'] =
        dataEmissionePeriodNotInLeftSquareBracket0RightSquareBracketPeriodSecond;
    queryParams[r'dataEmissione.notIn[0].year'] =
        dataEmissionePeriodNotInLeftSquareBracket0RightSquareBracketPeriodYear;
    queryParams[r'dataEmissione.notIn[0].zone.id'] =
        dataEmissionePeriodNotInLeftSquareBracket0RightSquareBracketPeriodZonePeriodId;
    queryParams[r'dataEmissione.notIn[0].zone.rules.fixedOffset'] =
        dataEmissionePeriodNotInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodFixedOffset;
    queryParams[
            r'dataEmissione.notIn[0].zone.rules.transitionRules[0].dayOfMonthIndicator'] =
        dataEmissionePeriodNotInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodDayOfMonthIndicator;
    queryParams[
            r'dataEmissione.notIn[0].zone.rules.transitionRules[0].dayOfWeek'] =
        dataEmissionePeriodNotInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodDayOfWeek;
    queryParams[
            r'dataEmissione.notIn[0].zone.rules.transitionRules[0].localTime.hour'] =
        dataEmissionePeriodNotInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodLocalTimePeriodHour;
    queryParams[
            r'dataEmissione.notIn[0].zone.rules.transitionRules[0].localTime.minute'] =
        dataEmissionePeriodNotInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodLocalTimePeriodMinute;
    queryParams[
            r'dataEmissione.notIn[0].zone.rules.transitionRules[0].localTime.nano'] =
        dataEmissionePeriodNotInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodLocalTimePeriodNano;
    queryParams[
            r'dataEmissione.notIn[0].zone.rules.transitionRules[0].localTime.second'] =
        dataEmissionePeriodNotInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodLocalTimePeriodSecond;
    queryParams[
            r'dataEmissione.notIn[0].zone.rules.transitionRules[0].midnightEndOfDay'] =
        dataEmissionePeriodNotInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodMidnightEndOfDay;
    queryParams[r'dataEmissione.notIn[0].zone.rules.transitionRules[0].month'] =
        dataEmissionePeriodNotInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodMonth;
    queryParams[
            r'dataEmissione.notIn[0].zone.rules.transitionRules[0].offsetAfter.id'] =
        dataEmissionePeriodNotInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodOffsetAfterPeriodId;
    queryParams[
            r'dataEmissione.notIn[0].zone.rules.transitionRules[0].offsetAfter.totalSeconds'] =
        dataEmissionePeriodNotInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodOffsetAfterPeriodTotalSeconds;
    queryParams[
            r'dataEmissione.notIn[0].zone.rules.transitionRules[0].offsetBefore.id'] =
        dataEmissionePeriodNotInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodOffsetBeforePeriodId;
    queryParams[
            r'dataEmissione.notIn[0].zone.rules.transitionRules[0].offsetBefore.totalSeconds'] =
        dataEmissionePeriodNotInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodOffsetBeforePeriodTotalSeconds;
    queryParams[
            r'dataEmissione.notIn[0].zone.rules.transitionRules[0].standardOffset.id'] =
        dataEmissionePeriodNotInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodStandardOffsetPeriodId;
    queryParams[
            r'dataEmissione.notIn[0].zone.rules.transitionRules[0].standardOffset.totalSeconds'] =
        dataEmissionePeriodNotInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodStandardOffsetPeriodTotalSeconds;
    queryParams[
            r'dataEmissione.notIn[0].zone.rules.transitionRules[0].timeDefinition'] =
        dataEmissionePeriodNotInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodTimeDefinition;
    queryParams[
            r'dataEmissione.notIn[0].zone.rules.transitions[0].dateTimeAfter'] =
        dataEmissionePeriodNotInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodDateTimeAfter;
    queryParams[
            r'dataEmissione.notIn[0].zone.rules.transitions[0].dateTimeBefore'] =
        dataEmissionePeriodNotInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodDateTimeBefore;
    queryParams[
            r'dataEmissione.notIn[0].zone.rules.transitions[0].duration.nano'] =
        dataEmissionePeriodNotInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodDurationPeriodNano;
    queryParams[
            r'dataEmissione.notIn[0].zone.rules.transitions[0].duration.negative'] =
        dataEmissionePeriodNotInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodDurationPeriodNegative;
    queryParams[
            r'dataEmissione.notIn[0].zone.rules.transitions[0].duration.seconds'] =
        dataEmissionePeriodNotInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodDurationPeriodSeconds;
    queryParams[
            r'dataEmissione.notIn[0].zone.rules.transitions[0].duration.units[0].dateBased'] =
        dataEmissionePeriodNotInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodDurationPeriodUnitsLeftSquareBracket0RightSquareBracketPeriodDateBased;
    queryParams[
            r'dataEmissione.notIn[0].zone.rules.transitions[0].duration.units[0].durationEstimated'] =
        dataEmissionePeriodNotInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodDurationPeriodUnitsLeftSquareBracket0RightSquareBracketPeriodDurationEstimated;
    queryParams[
            r'dataEmissione.notIn[0].zone.rules.transitions[0].duration.units[0].timeBased'] =
        dataEmissionePeriodNotInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodDurationPeriodUnitsLeftSquareBracket0RightSquareBracketPeriodTimeBased;
    queryParams[
            r'dataEmissione.notIn[0].zone.rules.transitions[0].duration.zero'] =
        dataEmissionePeriodNotInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodDurationPeriodZero;
    queryParams[r'dataEmissione.notIn[0].zone.rules.transitions[0].gap'] =
        dataEmissionePeriodNotInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodGap;
    queryParams[r'dataEmissione.notIn[0].zone.rules.transitions[0].instant'] =
        dataEmissionePeriodNotInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodInstant;
    queryParams[
            r'dataEmissione.notIn[0].zone.rules.transitions[0].offsetAfter.id'] =
        dataEmissionePeriodNotInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodOffsetAfterPeriodId;
    queryParams[
            r'dataEmissione.notIn[0].zone.rules.transitions[0].offsetAfter.totalSeconds'] =
        dataEmissionePeriodNotInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodOffsetAfterPeriodTotalSeconds;
    queryParams[
            r'dataEmissione.notIn[0].zone.rules.transitions[0].offsetBefore.id'] =
        dataEmissionePeriodNotInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodOffsetBeforePeriodId;
    queryParams[
            r'dataEmissione.notIn[0].zone.rules.transitions[0].offsetBefore.totalSeconds'] =
        dataEmissionePeriodNotInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodOffsetBeforePeriodTotalSeconds;
    queryParams[r'dataEmissione.notIn[0].zone.rules.transitions[0].overlap'] =
        dataEmissionePeriodNotInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodOverlap;
    queryParams[r'dataEmissione.specified'] = dataEmissionePeriodSpecified;
    queryParams[r'delegaId.equals'] = delegaIdPeriodEquals;
    queryParams[r'delegaId.greaterThan'] = delegaIdPeriodGreaterThan;
    queryParams[r'delegaId.greaterThanOrEqual'] =
        delegaIdPeriodGreaterThanOrEqual;
    queryParams[r'delegaId.in'] = delegaIdPeriodIn;
    queryParams[r'delegaId.lessThan'] = delegaIdPeriodLessThan;
    queryParams[r'delegaId.lessThanOrEqual'] = delegaIdPeriodLessThanOrEqual;
    queryParams[r'delegaId.notEquals'] = delegaIdPeriodNotEquals;
    queryParams[r'delegaId.notIn'] = delegaIdPeriodNotIn;
    queryParams[r'delegaId.specified'] = delegaIdPeriodSpecified;
    queryParams[r'id.equals'] = idPeriodEquals;
    queryParams[r'id.greaterThan'] = idPeriodGreaterThan;
    queryParams[r'id.greaterThanOrEqual'] = idPeriodGreaterThanOrEqual;
    queryParams[r'id.in'] = idPeriodIn;
    queryParams[r'id.lessThan'] = idPeriodLessThan;
    queryParams[r'id.lessThanOrEqual'] = idPeriodLessThanOrEqual;
    queryParams[r'id.notEquals'] = idPeriodNotEquals;
    queryParams[r'id.notIn'] = idPeriodNotIn;
    queryParams[r'id.specified'] = idPeriodSpecified;
    queryParams[r'page'] = page;
    queryParams[r'rifornimentoId.equals'] = rifornimentoIdPeriodEquals;
    queryParams[r'rifornimentoId.greaterThan'] =
        rifornimentoIdPeriodGreaterThan;
    queryParams[r'rifornimentoId.greaterThanOrEqual'] =
        rifornimentoIdPeriodGreaterThanOrEqual;
    queryParams[r'rifornimentoId.in'] = rifornimentoIdPeriodIn;
    queryParams[r'rifornimentoId.lessThan'] = rifornimentoIdPeriodLessThan;
    queryParams[r'rifornimentoId.lessThanOrEqual'] =
        rifornimentoIdPeriodLessThanOrEqual;
    queryParams[r'rifornimentoId.notEquals'] = rifornimentoIdPeriodNotEquals;
    queryParams[r'rifornimentoId.notIn'] = rifornimentoIdPeriodNotIn;
    queryParams[r'rifornimentoId.specified'] = rifornimentoIdPeriodSpecified;
    queryParams[r'size'] = size;
    queryParams[r'sort'] = sort;
    queryParams[r'targa.contains'] = targaPeriodContains;
    queryParams[r'targa.doesNotContain'] = targaPeriodDoesNotContain;
    queryParams[r'targa.equals'] = targaPeriodEquals;
    queryParams[r'targa.in'] = targaPeriodIn;
    queryParams[r'targa.notEquals'] = targaPeriodNotEquals;
    queryParams[r'targa.notIn'] = targaPeriodNotIn;
    queryParams[r'targa.specified'] = targaPeriodSpecified;
    queryParams[r'veicolo.equals'] = veicoloPeriodEquals;
    queryParams[r'veicolo.in'] = veicoloPeriodIn;
    queryParams[r'veicolo.notEquals'] = veicoloPeriodNotEquals;
    queryParams[r'veicolo.notIn'] = veicoloPeriodNotIn;
    queryParams[r'veicolo.specified'] = veicoloPeriodSpecified;
    queryParams.removeWhere((key, value) => value == null);
    headerParams.removeWhere((key, value) => value == null);

    final List<String> contentTypes = [];

    return _dio
        .request(
      _path,
      queryParameters: queryParams,
      data: bodyData,
      options: Options(
        method: 'get'.toUpperCase(),
        headers: headerParams,
        extra: {
          'secure': [
            {
              'type': 'http',
              'name': 'benzapp',
            },
          ],
          if (extra != null) ...extra,
        },
        validateStatus: validateStatus,
        contentType:
            contentTypes.isNotEmpty ? contentTypes[0] : 'application/json',
      ),
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    )
        .then((response) {
      const collectionType = BuiltList;
      const type = FullType(collectionType, [FullType(Tessera)]);
      final BuiltList<Tessera> data = _serializers.deserialize(
          response.data is String ? jsonDecode(response.data) : response.data,
          specifiedType: type) as BuiltList<Tessera>;

      return Response<BuiltList<Tessera>>(
        data: data,
        headers: response.headers,
        requestOptions: response.requestOptions,
        redirects: response.redirects,
        statusCode: response.statusCode,
        statusMessage: response.statusMessage,
        extra: response.extra,
      );
    });
  }
}
