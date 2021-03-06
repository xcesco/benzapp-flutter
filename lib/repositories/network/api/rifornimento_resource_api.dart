import 'dart:async';
import 'dart:convert';

import 'package:benzapp_flutter/repositories/network/model/rifornimento.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:dio/dio.dart';

class RifornimentoResourceApi {
    final Dio _dio;
    Serializers _serializers;

    RifornimentoResourceApi(this._dio, this._serializers);

    /// getAllRifornimentos
    ///
    /// 
    Future<Response<BuiltList<Rifornimento>>> getAllRifornimentosUsingGET({ 
        DateTime? dataPeriodEquals,
        DateTime? dataPeriodGreaterThan,
        DateTime? dataPeriodGreaterThanOrEqual,
        int? dataPeriodInLeftSquareBracket0RightSquareBracketPeriodDayOfMonth,
        String? dataPeriodInLeftSquareBracket0RightSquareBracketPeriodDayOfWeek,
        int? dataPeriodInLeftSquareBracket0RightSquareBracketPeriodDayOfYear,
        int? dataPeriodInLeftSquareBracket0RightSquareBracketPeriodHour,
        int? dataPeriodInLeftSquareBracket0RightSquareBracketPeriodMinute,
        String? dataPeriodInLeftSquareBracket0RightSquareBracketPeriodMonth,
        int? dataPeriodInLeftSquareBracket0RightSquareBracketPeriodMonthValue,
        int? dataPeriodInLeftSquareBracket0RightSquareBracketPeriodNano,
        String? dataPeriodInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodId,
        bool? dataPeriodInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodFixedOffset,
        int? dataPeriodInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodDayOfMonthIndicator,
        String? dataPeriodInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodDayOfWeek,
        int? dataPeriodInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodLocalTimePeriodHour,
        int? dataPeriodInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodLocalTimePeriodMinute,
        int? dataPeriodInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodLocalTimePeriodNano,
        int? dataPeriodInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodLocalTimePeriodSecond,
        bool? dataPeriodInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodMidnightEndOfDay,
        String? dataPeriodInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodMonth,
        String? dataPeriodInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodTimeDefinition,
        DateTime? dataPeriodInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodDateTimeAfter,
        DateTime? dataPeriodInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodDateTimeBefore,
        int? dataPeriodInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodDurationPeriodNano,
        bool? dataPeriodInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodDurationPeriodNegative,
        int? dataPeriodInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodDurationPeriodSeconds,
        bool? dataPeriodInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodDurationPeriodUnitsLeftSquareBracket0RightSquareBracketPeriodDateBased,
        bool? dataPeriodInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodDurationPeriodUnitsLeftSquareBracket0RightSquareBracketPeriodDurationEstimated,
        bool? dataPeriodInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodDurationPeriodUnitsLeftSquareBracket0RightSquareBracketPeriodTimeBased,
        bool? dataPeriodInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodDurationPeriodZero,
        bool? dataPeriodInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodGap,
        DateTime? dataPeriodInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodInstant,
        bool? dataPeriodInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodOverlap,
        int? dataPeriodInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodTotalSeconds,
        int? dataPeriodInLeftSquareBracket0RightSquareBracketPeriodSecond,
        int? dataPeriodInLeftSquareBracket0RightSquareBracketPeriodYear,
        String? dataPeriodInLeftSquareBracket0RightSquareBracketPeriodZonePeriodId,
        bool? dataPeriodInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodFixedOffset,
        int? dataPeriodInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodDayOfMonthIndicator,
        String? dataPeriodInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodDayOfWeek,
        int? dataPeriodInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodLocalTimePeriodHour,
        int? dataPeriodInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodLocalTimePeriodMinute,
        int? dataPeriodInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodLocalTimePeriodNano,
        int? dataPeriodInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodLocalTimePeriodSecond,
        bool? dataPeriodInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodMidnightEndOfDay,
        String? dataPeriodInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodMonth,
        String? dataPeriodInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodOffsetAfterPeriodId,
        int? dataPeriodInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodOffsetAfterPeriodTotalSeconds,
        String? dataPeriodInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodOffsetBeforePeriodId,
        int? dataPeriodInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodOffsetBeforePeriodTotalSeconds,
        String? dataPeriodInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodStandardOffsetPeriodId,
        int? dataPeriodInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodStandardOffsetPeriodTotalSeconds,
        String? dataPeriodInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodTimeDefinition,
        DateTime? dataPeriodInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodDateTimeAfter,
        DateTime? dataPeriodInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodDateTimeBefore,
        int? dataPeriodInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodDurationPeriodNano,
        bool? dataPeriodInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodDurationPeriodNegative,
        int? dataPeriodInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodDurationPeriodSeconds,
        bool? dataPeriodInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodDurationPeriodUnitsLeftSquareBracket0RightSquareBracketPeriodDateBased,
        bool? dataPeriodInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodDurationPeriodUnitsLeftSquareBracket0RightSquareBracketPeriodDurationEstimated,
        bool? dataPeriodInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodDurationPeriodUnitsLeftSquareBracket0RightSquareBracketPeriodTimeBased,
        bool? dataPeriodInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodDurationPeriodZero,
        bool? dataPeriodInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodGap,
        DateTime? dataPeriodInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodInstant,
        String? dataPeriodInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodOffsetAfterPeriodId,
        int? dataPeriodInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodOffsetAfterPeriodTotalSeconds,
        String? dataPeriodInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodOffsetBeforePeriodId,
        int? dataPeriodInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodOffsetBeforePeriodTotalSeconds,
        bool? dataPeriodInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodOverlap,
        DateTime? dataPeriodLessThan,
        DateTime? dataPeriodLessThanOrEqual,
        DateTime? dataPeriodNotEquals,
        int? dataPeriodNotInLeftSquareBracket0RightSquareBracketPeriodDayOfMonth,
        String? dataPeriodNotInLeftSquareBracket0RightSquareBracketPeriodDayOfWeek,
        int? dataPeriodNotInLeftSquareBracket0RightSquareBracketPeriodDayOfYear,
        int? dataPeriodNotInLeftSquareBracket0RightSquareBracketPeriodHour,
        int? dataPeriodNotInLeftSquareBracket0RightSquareBracketPeriodMinute,
        String? dataPeriodNotInLeftSquareBracket0RightSquareBracketPeriodMonth,
        int? dataPeriodNotInLeftSquareBracket0RightSquareBracketPeriodMonthValue,
        int? dataPeriodNotInLeftSquareBracket0RightSquareBracketPeriodNano,
        String? dataPeriodNotInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodId,
        bool? dataPeriodNotInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodFixedOffset,
        int? dataPeriodNotInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodDayOfMonthIndicator,
        String? dataPeriodNotInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodDayOfWeek,
        int? dataPeriodNotInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodLocalTimePeriodHour,
        int? dataPeriodNotInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodLocalTimePeriodMinute,
        int? dataPeriodNotInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodLocalTimePeriodNano,
        int? dataPeriodNotInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodLocalTimePeriodSecond,
        bool? dataPeriodNotInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodMidnightEndOfDay,
        String? dataPeriodNotInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodMonth,
        String? dataPeriodNotInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodTimeDefinition,
        DateTime? dataPeriodNotInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodDateTimeAfter,
        DateTime? dataPeriodNotInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodDateTimeBefore,
        int? dataPeriodNotInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodDurationPeriodNano,
        bool? dataPeriodNotInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodDurationPeriodNegative,
        int? dataPeriodNotInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodDurationPeriodSeconds,
        bool? dataPeriodNotInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodDurationPeriodUnitsLeftSquareBracket0RightSquareBracketPeriodDateBased,
        bool? dataPeriodNotInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodDurationPeriodUnitsLeftSquareBracket0RightSquareBracketPeriodDurationEstimated,
        bool? dataPeriodNotInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodDurationPeriodUnitsLeftSquareBracket0RightSquareBracketPeriodTimeBased,
        bool? dataPeriodNotInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodDurationPeriodZero,
        bool? dataPeriodNotInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodGap,
        DateTime? dataPeriodNotInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodInstant,
        bool? dataPeriodNotInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodOverlap,
        int? dataPeriodNotInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodTotalSeconds,
        int? dataPeriodNotInLeftSquareBracket0RightSquareBracketPeriodSecond,
        int? dataPeriodNotInLeftSquareBracket0RightSquareBracketPeriodYear,
        String? dataPeriodNotInLeftSquareBracket0RightSquareBracketPeriodZonePeriodId,
        bool? dataPeriodNotInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodFixedOffset,
        int? dataPeriodNotInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodDayOfMonthIndicator,
        String? dataPeriodNotInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodDayOfWeek,
        int? dataPeriodNotInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodLocalTimePeriodHour,
        int? dataPeriodNotInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodLocalTimePeriodMinute,
        int? dataPeriodNotInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodLocalTimePeriodNano,
        int? dataPeriodNotInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodLocalTimePeriodSecond,
        bool? dataPeriodNotInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodMidnightEndOfDay,
        String? dataPeriodNotInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodMonth,
        String? dataPeriodNotInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodOffsetAfterPeriodId,
        int? dataPeriodNotInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodOffsetAfterPeriodTotalSeconds,
        String? dataPeriodNotInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodOffsetBeforePeriodId,
        int? dataPeriodNotInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodOffsetBeforePeriodTotalSeconds,
        String? dataPeriodNotInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodStandardOffsetPeriodId,
        int? dataPeriodNotInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodStandardOffsetPeriodTotalSeconds,
        String? dataPeriodNotInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodTimeDefinition,
        DateTime? dataPeriodNotInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodDateTimeAfter,
        DateTime? dataPeriodNotInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodDateTimeBefore,
        int? dataPeriodNotInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodDurationPeriodNano,
        bool? dataPeriodNotInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodDurationPeriodNegative,
        int? dataPeriodNotInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodDurationPeriodSeconds,
        bool? dataPeriodNotInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodDurationPeriodUnitsLeftSquareBracket0RightSquareBracketPeriodDateBased,
        bool? dataPeriodNotInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodDurationPeriodUnitsLeftSquareBracket0RightSquareBracketPeriodDurationEstimated,
        bool? dataPeriodNotInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodDurationPeriodUnitsLeftSquareBracket0RightSquareBracketPeriodTimeBased,
        bool? dataPeriodNotInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodDurationPeriodZero,
        bool? dataPeriodNotInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodGap,
        DateTime? dataPeriodNotInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodInstant,
        String? dataPeriodNotInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodOffsetAfterPeriodId,
        int? dataPeriodNotInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodOffsetAfterPeriodTotalSeconds,
        String? dataPeriodNotInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodOffsetBeforePeriodId,
        int? dataPeriodNotInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodOffsetBeforePeriodTotalSeconds,
        bool? dataPeriodNotInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodOverlap,
        bool? dataPeriodSpecified,
        int? gestoreIdPeriodEquals,
        int? gestoreIdPeriodGreaterThan,
        int? gestoreIdPeriodGreaterThanOrEqual,
        BuiltList<int>? gestoreIdPeriodIn,
        int? gestoreIdPeriodLessThan,
        int? gestoreIdPeriodLessThanOrEqual,
        int? gestoreIdPeriodNotEquals,
        BuiltList<int>? gestoreIdPeriodNotIn,
        bool? gestoreIdPeriodSpecified,
        int? idPeriodEquals,
        int? idPeriodGreaterThan,
        int? idPeriodGreaterThanOrEqual,
        BuiltList<int>? idPeriodIn,
        int? idPeriodLessThan,
        int? idPeriodLessThanOrEqual,
        int? idPeriodNotEquals,
        BuiltList<int>? idPeriodNotIn,
        bool? idPeriodSpecified,
        double? litriErogatiPeriodEquals,
        double? litriErogatiPeriodGreaterThan,
        double? litriErogatiPeriodGreaterThanOrEqual,
        BuiltList<num>? litriErogatiPeriodIn,
        double? litriErogatiPeriodLessThan,
        double? litriErogatiPeriodLessThanOrEqual,
        double? litriErogatiPeriodNotEquals,
        BuiltList<num>? litriErogatiPeriodNotIn,
        bool? litriErogatiPeriodSpecified,
        int? page,
        double? prezzoAlLitroPeriodEquals,
        double? prezzoAlLitroPeriodGreaterThan,
        double? prezzoAlLitroPeriodGreaterThanOrEqual,
        BuiltList<num>? prezzoAlLitroPeriodIn,
        double? prezzoAlLitroPeriodLessThan,
        double? prezzoAlLitroPeriodLessThanOrEqual,
        double? prezzoAlLitroPeriodNotEquals,
        BuiltList<num>? prezzoAlLitroPeriodNotIn,
        bool? prezzoAlLitroPeriodSpecified,
        double? scontoPeriodEquals,
        double? scontoPeriodGreaterThan,
        double? scontoPeriodGreaterThanOrEqual,
        BuiltList<num>? scontoPeriodIn,
        double? scontoPeriodLessThan,
        double? scontoPeriodLessThanOrEqual,
        double? scontoPeriodNotEquals,
        BuiltList<num>? scontoPeriodNotIn,
        bool? scontoPeriodSpecified,
        int? size,
        BuiltList<String>? sort,
        int? tesseraIdPeriodEquals,
        int? tesseraIdPeriodGreaterThan,
        int? tesseraIdPeriodGreaterThanOrEqual,
        BuiltList<int>? tesseraIdPeriodIn,
        int? tesseraIdPeriodLessThan,
        int? tesseraIdPeriodLessThanOrEqual,
        int? tesseraIdPeriodNotEquals,
        BuiltList<int>? tesseraIdPeriodNotIn,
        bool? tesseraIdPeriodSpecified,
        String? tipoCarburantePeriodEquals,
        BuiltList<String>? tipoCarburantePeriodIn,
        String? tipoCarburantePeriodNotEquals,
        BuiltList<String>? tipoCarburantePeriodNotIn,
        bool? tipoCarburantePeriodSpecified,
        CancelToken? cancelToken,
        Map<String, dynamic>? headers,
        Map<String, dynamic>? extra,
        ValidateStatus? validateStatus,
        ProgressCallback? onSendProgress,
        ProgressCallback? onReceiveProgress,
    }) async {
        const String _path = '/api/rifornimentos';

        final Map<String, dynamic> queryParams = {};
        final Map<String, dynamic> headerParams = {
            if (headers != null) ...headers,
        };
        dynamic bodyData;

        queryParams[r'data.equals'] = dataPeriodEquals;
        queryParams[r'data.greaterThan'] = dataPeriodGreaterThan;
        queryParams[r'data.greaterThanOrEqual'] = dataPeriodGreaterThanOrEqual;
        queryParams[r'data.in[0].dayOfMonth'] = dataPeriodInLeftSquareBracket0RightSquareBracketPeriodDayOfMonth;
        queryParams[r'data.in[0].dayOfWeek'] = dataPeriodInLeftSquareBracket0RightSquareBracketPeriodDayOfWeek;
        queryParams[r'data.in[0].dayOfYear'] = dataPeriodInLeftSquareBracket0RightSquareBracketPeriodDayOfYear;
        queryParams[r'data.in[0].hour'] = dataPeriodInLeftSquareBracket0RightSquareBracketPeriodHour;
        queryParams[r'data.in[0].minute'] = dataPeriodInLeftSquareBracket0RightSquareBracketPeriodMinute;
        queryParams[r'data.in[0].month'] = dataPeriodInLeftSquareBracket0RightSquareBracketPeriodMonth;
        queryParams[r'data.in[0].monthValue'] = dataPeriodInLeftSquareBracket0RightSquareBracketPeriodMonthValue;
        queryParams[r'data.in[0].nano'] = dataPeriodInLeftSquareBracket0RightSquareBracketPeriodNano;
        queryParams[r'data.in[0].offset.id'] = dataPeriodInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodId;
        queryParams[r'data.in[0].offset.rules.fixedOffset'] = dataPeriodInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodFixedOffset;
        queryParams[r'data.in[0].offset.rules.transitionRules[0].dayOfMonthIndicator'] = dataPeriodInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodDayOfMonthIndicator;
        queryParams[r'data.in[0].offset.rules.transitionRules[0].dayOfWeek'] = dataPeriodInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodDayOfWeek;
        queryParams[r'data.in[0].offset.rules.transitionRules[0].localTime.hour'] = dataPeriodInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodLocalTimePeriodHour;
        queryParams[r'data.in[0].offset.rules.transitionRules[0].localTime.minute'] = dataPeriodInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodLocalTimePeriodMinute;
        queryParams[r'data.in[0].offset.rules.transitionRules[0].localTime.nano'] = dataPeriodInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodLocalTimePeriodNano;
        queryParams[r'data.in[0].offset.rules.transitionRules[0].localTime.second'] = dataPeriodInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodLocalTimePeriodSecond;
        queryParams[r'data.in[0].offset.rules.transitionRules[0].midnightEndOfDay'] = dataPeriodInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodMidnightEndOfDay;
        queryParams[r'data.in[0].offset.rules.transitionRules[0].month'] = dataPeriodInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodMonth;
        queryParams[r'data.in[0].offset.rules.transitionRules[0].timeDefinition'] = dataPeriodInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodTimeDefinition;
        queryParams[r'data.in[0].offset.rules.transitions[0].dateTimeAfter'] = dataPeriodInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodDateTimeAfter;
        queryParams[r'data.in[0].offset.rules.transitions[0].dateTimeBefore'] = dataPeriodInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodDateTimeBefore;
        queryParams[r'data.in[0].offset.rules.transitions[0].duration.nano'] = dataPeriodInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodDurationPeriodNano;
        queryParams[r'data.in[0].offset.rules.transitions[0].duration.negative'] = dataPeriodInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodDurationPeriodNegative;
        queryParams[r'data.in[0].offset.rules.transitions[0].duration.seconds'] = dataPeriodInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodDurationPeriodSeconds;
        queryParams[r'data.in[0].offset.rules.transitions[0].duration.units[0].dateBased'] = dataPeriodInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodDurationPeriodUnitsLeftSquareBracket0RightSquareBracketPeriodDateBased;
        queryParams[r'data.in[0].offset.rules.transitions[0].duration.units[0].durationEstimated'] = dataPeriodInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodDurationPeriodUnitsLeftSquareBracket0RightSquareBracketPeriodDurationEstimated;
        queryParams[r'data.in[0].offset.rules.transitions[0].duration.units[0].timeBased'] = dataPeriodInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodDurationPeriodUnitsLeftSquareBracket0RightSquareBracketPeriodTimeBased;
        queryParams[r'data.in[0].offset.rules.transitions[0].duration.zero'] = dataPeriodInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodDurationPeriodZero;
        queryParams[r'data.in[0].offset.rules.transitions[0].gap'] = dataPeriodInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodGap;
        queryParams[r'data.in[0].offset.rules.transitions[0].instant'] = dataPeriodInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodInstant;
        queryParams[r'data.in[0].offset.rules.transitions[0].overlap'] = dataPeriodInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodOverlap;
        queryParams[r'data.in[0].offset.totalSeconds'] = dataPeriodInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodTotalSeconds;
        queryParams[r'data.in[0].second'] = dataPeriodInLeftSquareBracket0RightSquareBracketPeriodSecond;
        queryParams[r'data.in[0].year'] = dataPeriodInLeftSquareBracket0RightSquareBracketPeriodYear;
        queryParams[r'data.in[0].zone.id'] = dataPeriodInLeftSquareBracket0RightSquareBracketPeriodZonePeriodId;
        queryParams[r'data.in[0].zone.rules.fixedOffset'] = dataPeriodInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodFixedOffset;
        queryParams[r'data.in[0].zone.rules.transitionRules[0].dayOfMonthIndicator'] = dataPeriodInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodDayOfMonthIndicator;
        queryParams[r'data.in[0].zone.rules.transitionRules[0].dayOfWeek'] = dataPeriodInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodDayOfWeek;
        queryParams[r'data.in[0].zone.rules.transitionRules[0].localTime.hour'] = dataPeriodInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodLocalTimePeriodHour;
        queryParams[r'data.in[0].zone.rules.transitionRules[0].localTime.minute'] = dataPeriodInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodLocalTimePeriodMinute;
        queryParams[r'data.in[0].zone.rules.transitionRules[0].localTime.nano'] = dataPeriodInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodLocalTimePeriodNano;
        queryParams[r'data.in[0].zone.rules.transitionRules[0].localTime.second'] = dataPeriodInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodLocalTimePeriodSecond;
        queryParams[r'data.in[0].zone.rules.transitionRules[0].midnightEndOfDay'] = dataPeriodInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodMidnightEndOfDay;
        queryParams[r'data.in[0].zone.rules.transitionRules[0].month'] = dataPeriodInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodMonth;
        queryParams[r'data.in[0].zone.rules.transitionRules[0].offsetAfter.id'] = dataPeriodInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodOffsetAfterPeriodId;
        queryParams[r'data.in[0].zone.rules.transitionRules[0].offsetAfter.totalSeconds'] = dataPeriodInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodOffsetAfterPeriodTotalSeconds;
        queryParams[r'data.in[0].zone.rules.transitionRules[0].offsetBefore.id'] = dataPeriodInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodOffsetBeforePeriodId;
        queryParams[r'data.in[0].zone.rules.transitionRules[0].offsetBefore.totalSeconds'] = dataPeriodInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodOffsetBeforePeriodTotalSeconds;
        queryParams[r'data.in[0].zone.rules.transitionRules[0].standardOffset.id'] = dataPeriodInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodStandardOffsetPeriodId;
        queryParams[r'data.in[0].zone.rules.transitionRules[0].standardOffset.totalSeconds'] = dataPeriodInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodStandardOffsetPeriodTotalSeconds;
        queryParams[r'data.in[0].zone.rules.transitionRules[0].timeDefinition'] = dataPeriodInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodTimeDefinition;
        queryParams[r'data.in[0].zone.rules.transitions[0].dateTimeAfter'] = dataPeriodInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodDateTimeAfter;
        queryParams[r'data.in[0].zone.rules.transitions[0].dateTimeBefore'] = dataPeriodInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodDateTimeBefore;
        queryParams[r'data.in[0].zone.rules.transitions[0].duration.nano'] = dataPeriodInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodDurationPeriodNano;
        queryParams[r'data.in[0].zone.rules.transitions[0].duration.negative'] = dataPeriodInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodDurationPeriodNegative;
        queryParams[r'data.in[0].zone.rules.transitions[0].duration.seconds'] = dataPeriodInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodDurationPeriodSeconds;
        queryParams[r'data.in[0].zone.rules.transitions[0].duration.units[0].dateBased'] = dataPeriodInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodDurationPeriodUnitsLeftSquareBracket0RightSquareBracketPeriodDateBased;
        queryParams[r'data.in[0].zone.rules.transitions[0].duration.units[0].durationEstimated'] = dataPeriodInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodDurationPeriodUnitsLeftSquareBracket0RightSquareBracketPeriodDurationEstimated;
        queryParams[r'data.in[0].zone.rules.transitions[0].duration.units[0].timeBased'] = dataPeriodInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodDurationPeriodUnitsLeftSquareBracket0RightSquareBracketPeriodTimeBased;
        queryParams[r'data.in[0].zone.rules.transitions[0].duration.zero'] = dataPeriodInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodDurationPeriodZero;
        queryParams[r'data.in[0].zone.rules.transitions[0].gap'] = dataPeriodInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodGap;
        queryParams[r'data.in[0].zone.rules.transitions[0].instant'] = dataPeriodInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodInstant;
        queryParams[r'data.in[0].zone.rules.transitions[0].offsetAfter.id'] = dataPeriodInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodOffsetAfterPeriodId;
        queryParams[r'data.in[0].zone.rules.transitions[0].offsetAfter.totalSeconds'] = dataPeriodInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodOffsetAfterPeriodTotalSeconds;
        queryParams[r'data.in[0].zone.rules.transitions[0].offsetBefore.id'] = dataPeriodInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodOffsetBeforePeriodId;
        queryParams[r'data.in[0].zone.rules.transitions[0].offsetBefore.totalSeconds'] = dataPeriodInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodOffsetBeforePeriodTotalSeconds;
        queryParams[r'data.in[0].zone.rules.transitions[0].overlap'] = dataPeriodInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodOverlap;
        queryParams[r'data.lessThan'] = dataPeriodLessThan;
        queryParams[r'data.lessThanOrEqual'] = dataPeriodLessThanOrEqual;
        queryParams[r'data.notEquals'] = dataPeriodNotEquals;
        queryParams[r'data.notIn[0].dayOfMonth'] = dataPeriodNotInLeftSquareBracket0RightSquareBracketPeriodDayOfMonth;
        queryParams[r'data.notIn[0].dayOfWeek'] = dataPeriodNotInLeftSquareBracket0RightSquareBracketPeriodDayOfWeek;
        queryParams[r'data.notIn[0].dayOfYear'] = dataPeriodNotInLeftSquareBracket0RightSquareBracketPeriodDayOfYear;
        queryParams[r'data.notIn[0].hour'] = dataPeriodNotInLeftSquareBracket0RightSquareBracketPeriodHour;
        queryParams[r'data.notIn[0].minute'] = dataPeriodNotInLeftSquareBracket0RightSquareBracketPeriodMinute;
        queryParams[r'data.notIn[0].month'] = dataPeriodNotInLeftSquareBracket0RightSquareBracketPeriodMonth;
        queryParams[r'data.notIn[0].monthValue'] = dataPeriodNotInLeftSquareBracket0RightSquareBracketPeriodMonthValue;
        queryParams[r'data.notIn[0].nano'] = dataPeriodNotInLeftSquareBracket0RightSquareBracketPeriodNano;
        queryParams[r'data.notIn[0].offset.id'] = dataPeriodNotInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodId;
        queryParams[r'data.notIn[0].offset.rules.fixedOffset'] = dataPeriodNotInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodFixedOffset;
        queryParams[r'data.notIn[0].offset.rules.transitionRules[0].dayOfMonthIndicator'] = dataPeriodNotInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodDayOfMonthIndicator;
        queryParams[r'data.notIn[0].offset.rules.transitionRules[0].dayOfWeek'] = dataPeriodNotInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodDayOfWeek;
        queryParams[r'data.notIn[0].offset.rules.transitionRules[0].localTime.hour'] = dataPeriodNotInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodLocalTimePeriodHour;
        queryParams[r'data.notIn[0].offset.rules.transitionRules[0].localTime.minute'] = dataPeriodNotInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodLocalTimePeriodMinute;
        queryParams[r'data.notIn[0].offset.rules.transitionRules[0].localTime.nano'] = dataPeriodNotInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodLocalTimePeriodNano;
        queryParams[r'data.notIn[0].offset.rules.transitionRules[0].localTime.second'] = dataPeriodNotInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodLocalTimePeriodSecond;
        queryParams[r'data.notIn[0].offset.rules.transitionRules[0].midnightEndOfDay'] = dataPeriodNotInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodMidnightEndOfDay;
        queryParams[r'data.notIn[0].offset.rules.transitionRules[0].month'] = dataPeriodNotInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodMonth;
        queryParams[r'data.notIn[0].offset.rules.transitionRules[0].timeDefinition'] = dataPeriodNotInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodTimeDefinition;
        queryParams[r'data.notIn[0].offset.rules.transitions[0].dateTimeAfter'] = dataPeriodNotInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodDateTimeAfter;
        queryParams[r'data.notIn[0].offset.rules.transitions[0].dateTimeBefore'] = dataPeriodNotInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodDateTimeBefore;
        queryParams[r'data.notIn[0].offset.rules.transitions[0].duration.nano'] = dataPeriodNotInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodDurationPeriodNano;
        queryParams[r'data.notIn[0].offset.rules.transitions[0].duration.negative'] = dataPeriodNotInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodDurationPeriodNegative;
        queryParams[r'data.notIn[0].offset.rules.transitions[0].duration.seconds'] = dataPeriodNotInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodDurationPeriodSeconds;
        queryParams[r'data.notIn[0].offset.rules.transitions[0].duration.units[0].dateBased'] = dataPeriodNotInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodDurationPeriodUnitsLeftSquareBracket0RightSquareBracketPeriodDateBased;
        queryParams[r'data.notIn[0].offset.rules.transitions[0].duration.units[0].durationEstimated'] = dataPeriodNotInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodDurationPeriodUnitsLeftSquareBracket0RightSquareBracketPeriodDurationEstimated;
        queryParams[r'data.notIn[0].offset.rules.transitions[0].duration.units[0].timeBased'] = dataPeriodNotInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodDurationPeriodUnitsLeftSquareBracket0RightSquareBracketPeriodTimeBased;
        queryParams[r'data.notIn[0].offset.rules.transitions[0].duration.zero'] = dataPeriodNotInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodDurationPeriodZero;
        queryParams[r'data.notIn[0].offset.rules.transitions[0].gap'] = dataPeriodNotInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodGap;
        queryParams[r'data.notIn[0].offset.rules.transitions[0].instant'] = dataPeriodNotInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodInstant;
        queryParams[r'data.notIn[0].offset.rules.transitions[0].overlap'] = dataPeriodNotInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodOverlap;
        queryParams[r'data.notIn[0].offset.totalSeconds'] = dataPeriodNotInLeftSquareBracket0RightSquareBracketPeriodOffsetPeriodTotalSeconds;
        queryParams[r'data.notIn[0].second'] = dataPeriodNotInLeftSquareBracket0RightSquareBracketPeriodSecond;
        queryParams[r'data.notIn[0].year'] = dataPeriodNotInLeftSquareBracket0RightSquareBracketPeriodYear;
        queryParams[r'data.notIn[0].zone.id'] = dataPeriodNotInLeftSquareBracket0RightSquareBracketPeriodZonePeriodId;
        queryParams[r'data.notIn[0].zone.rules.fixedOffset'] = dataPeriodNotInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodFixedOffset;
        queryParams[r'data.notIn[0].zone.rules.transitionRules[0].dayOfMonthIndicator'] = dataPeriodNotInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodDayOfMonthIndicator;
        queryParams[r'data.notIn[0].zone.rules.transitionRules[0].dayOfWeek'] = dataPeriodNotInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodDayOfWeek;
        queryParams[r'data.notIn[0].zone.rules.transitionRules[0].localTime.hour'] = dataPeriodNotInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodLocalTimePeriodHour;
        queryParams[r'data.notIn[0].zone.rules.transitionRules[0].localTime.minute'] = dataPeriodNotInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodLocalTimePeriodMinute;
        queryParams[r'data.notIn[0].zone.rules.transitionRules[0].localTime.nano'] = dataPeriodNotInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodLocalTimePeriodNano;
        queryParams[r'data.notIn[0].zone.rules.transitionRules[0].localTime.second'] = dataPeriodNotInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodLocalTimePeriodSecond;
        queryParams[r'data.notIn[0].zone.rules.transitionRules[0].midnightEndOfDay'] = dataPeriodNotInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodMidnightEndOfDay;
        queryParams[r'data.notIn[0].zone.rules.transitionRules[0].month'] = dataPeriodNotInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodMonth;
        queryParams[r'data.notIn[0].zone.rules.transitionRules[0].offsetAfter.id'] = dataPeriodNotInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodOffsetAfterPeriodId;
        queryParams[r'data.notIn[0].zone.rules.transitionRules[0].offsetAfter.totalSeconds'] = dataPeriodNotInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodOffsetAfterPeriodTotalSeconds;
        queryParams[r'data.notIn[0].zone.rules.transitionRules[0].offsetBefore.id'] = dataPeriodNotInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodOffsetBeforePeriodId;
        queryParams[r'data.notIn[0].zone.rules.transitionRules[0].offsetBefore.totalSeconds'] = dataPeriodNotInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodOffsetBeforePeriodTotalSeconds;
        queryParams[r'data.notIn[0].zone.rules.transitionRules[0].standardOffset.id'] = dataPeriodNotInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodStandardOffsetPeriodId;
        queryParams[r'data.notIn[0].zone.rules.transitionRules[0].standardOffset.totalSeconds'] = dataPeriodNotInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodStandardOffsetPeriodTotalSeconds;
        queryParams[r'data.notIn[0].zone.rules.transitionRules[0].timeDefinition'] = dataPeriodNotInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionRulesLeftSquareBracket0RightSquareBracketPeriodTimeDefinition;
        queryParams[r'data.notIn[0].zone.rules.transitions[0].dateTimeAfter'] = dataPeriodNotInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodDateTimeAfter;
        queryParams[r'data.notIn[0].zone.rules.transitions[0].dateTimeBefore'] = dataPeriodNotInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodDateTimeBefore;
        queryParams[r'data.notIn[0].zone.rules.transitions[0].duration.nano'] = dataPeriodNotInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodDurationPeriodNano;
        queryParams[r'data.notIn[0].zone.rules.transitions[0].duration.negative'] = dataPeriodNotInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodDurationPeriodNegative;
        queryParams[r'data.notIn[0].zone.rules.transitions[0].duration.seconds'] = dataPeriodNotInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodDurationPeriodSeconds;
        queryParams[r'data.notIn[0].zone.rules.transitions[0].duration.units[0].dateBased'] = dataPeriodNotInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodDurationPeriodUnitsLeftSquareBracket0RightSquareBracketPeriodDateBased;
        queryParams[r'data.notIn[0].zone.rules.transitions[0].duration.units[0].durationEstimated'] = dataPeriodNotInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodDurationPeriodUnitsLeftSquareBracket0RightSquareBracketPeriodDurationEstimated;
        queryParams[r'data.notIn[0].zone.rules.transitions[0].duration.units[0].timeBased'] = dataPeriodNotInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodDurationPeriodUnitsLeftSquareBracket0RightSquareBracketPeriodTimeBased;
        queryParams[r'data.notIn[0].zone.rules.transitions[0].duration.zero'] = dataPeriodNotInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodDurationPeriodZero;
        queryParams[r'data.notIn[0].zone.rules.transitions[0].gap'] = dataPeriodNotInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodGap;
        queryParams[r'data.notIn[0].zone.rules.transitions[0].instant'] = dataPeriodNotInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodInstant;
        queryParams[r'data.notIn[0].zone.rules.transitions[0].offsetAfter.id'] = dataPeriodNotInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodOffsetAfterPeriodId;
        queryParams[r'data.notIn[0].zone.rules.transitions[0].offsetAfter.totalSeconds'] = dataPeriodNotInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodOffsetAfterPeriodTotalSeconds;
        queryParams[r'data.notIn[0].zone.rules.transitions[0].offsetBefore.id'] = dataPeriodNotInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodOffsetBeforePeriodId;
        queryParams[r'data.notIn[0].zone.rules.transitions[0].offsetBefore.totalSeconds'] = dataPeriodNotInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodOffsetBeforePeriodTotalSeconds;
        queryParams[r'data.notIn[0].zone.rules.transitions[0].overlap'] = dataPeriodNotInLeftSquareBracket0RightSquareBracketPeriodZonePeriodRulesPeriodTransitionsLeftSquareBracket0RightSquareBracketPeriodOverlap;
        queryParams[r'data.specified'] = dataPeriodSpecified;
        queryParams[r'gestoreId.equals'] = gestoreIdPeriodEquals;
        queryParams[r'gestoreId.greaterThan'] = gestoreIdPeriodGreaterThan;
        queryParams[r'gestoreId.greaterThanOrEqual'] = gestoreIdPeriodGreaterThanOrEqual;
        queryParams[r'gestoreId.in'] = gestoreIdPeriodIn;
        queryParams[r'gestoreId.lessThan'] = gestoreIdPeriodLessThan;
        queryParams[r'gestoreId.lessThanOrEqual'] = gestoreIdPeriodLessThanOrEqual;
        queryParams[r'gestoreId.notEquals'] = gestoreIdPeriodNotEquals;
        queryParams[r'gestoreId.notIn'] = gestoreIdPeriodNotIn;
        queryParams[r'gestoreId.specified'] = gestoreIdPeriodSpecified;
        queryParams[r'id.equals'] = idPeriodEquals;
        queryParams[r'id.greaterThan'] = idPeriodGreaterThan;
        queryParams[r'id.greaterThanOrEqual'] = idPeriodGreaterThanOrEqual;
        queryParams[r'id.in'] = idPeriodIn;
        queryParams[r'id.lessThan'] = idPeriodLessThan;
        queryParams[r'id.lessThanOrEqual'] = idPeriodLessThanOrEqual;
        queryParams[r'id.notEquals'] = idPeriodNotEquals;
        queryParams[r'id.notIn'] = idPeriodNotIn;
        queryParams[r'id.specified'] = idPeriodSpecified;
        queryParams[r'litriErogati.equals'] = litriErogatiPeriodEquals;
        queryParams[r'litriErogati.greaterThan'] = litriErogatiPeriodGreaterThan;
        queryParams[r'litriErogati.greaterThanOrEqual'] = litriErogatiPeriodGreaterThanOrEqual;
        queryParams[r'litriErogati.in'] = litriErogatiPeriodIn;
        queryParams[r'litriErogati.lessThan'] = litriErogatiPeriodLessThan;
        queryParams[r'litriErogati.lessThanOrEqual'] = litriErogatiPeriodLessThanOrEqual;
        queryParams[r'litriErogati.notEquals'] = litriErogatiPeriodNotEquals;
        queryParams[r'litriErogati.notIn'] = litriErogatiPeriodNotIn;
        queryParams[r'litriErogati.specified'] = litriErogatiPeriodSpecified;
        queryParams[r'page'] = page;
        queryParams[r'prezzoAlLitro.equals'] = prezzoAlLitroPeriodEquals;
        queryParams[r'prezzoAlLitro.greaterThan'] = prezzoAlLitroPeriodGreaterThan;
        queryParams[r'prezzoAlLitro.greaterThanOrEqual'] = prezzoAlLitroPeriodGreaterThanOrEqual;
        queryParams[r'prezzoAlLitro.in'] = prezzoAlLitroPeriodIn;
        queryParams[r'prezzoAlLitro.lessThan'] = prezzoAlLitroPeriodLessThan;
        queryParams[r'prezzoAlLitro.lessThanOrEqual'] = prezzoAlLitroPeriodLessThanOrEqual;
        queryParams[r'prezzoAlLitro.notEquals'] = prezzoAlLitroPeriodNotEquals;
        queryParams[r'prezzoAlLitro.notIn'] = prezzoAlLitroPeriodNotIn;
        queryParams[r'prezzoAlLitro.specified'] = prezzoAlLitroPeriodSpecified;
        queryParams[r'sconto.equals'] = scontoPeriodEquals;
        queryParams[r'sconto.greaterThan'] = scontoPeriodGreaterThan;
        queryParams[r'sconto.greaterThanOrEqual'] = scontoPeriodGreaterThanOrEqual;
        queryParams[r'sconto.in'] = scontoPeriodIn;
        queryParams[r'sconto.lessThan'] = scontoPeriodLessThan;
        queryParams[r'sconto.lessThanOrEqual'] = scontoPeriodLessThanOrEqual;
        queryParams[r'sconto.notEquals'] = scontoPeriodNotEquals;
        queryParams[r'sconto.notIn'] = scontoPeriodNotIn;
        queryParams[r'sconto.specified'] = scontoPeriodSpecified;
        queryParams[r'size'] = size;
        queryParams[r'sort'] = sort;
        queryParams[r'tesseraId.equals'] = tesseraIdPeriodEquals;
        queryParams[r'tesseraId.greaterThan'] = tesseraIdPeriodGreaterThan;
        queryParams[r'tesseraId.greaterThanOrEqual'] = tesseraIdPeriodGreaterThanOrEqual;
        queryParams[r'tesseraId.in'] = tesseraIdPeriodIn;
        queryParams[r'tesseraId.lessThan'] = tesseraIdPeriodLessThan;
        queryParams[r'tesseraId.lessThanOrEqual'] = tesseraIdPeriodLessThanOrEqual;
        queryParams[r'tesseraId.notEquals'] = tesseraIdPeriodNotEquals;
        queryParams[r'tesseraId.notIn'] = tesseraIdPeriodNotIn;
        queryParams[r'tesseraId.specified'] = tesseraIdPeriodSpecified;
        queryParams[r'tipoCarburante.equals'] = tipoCarburantePeriodEquals;
        queryParams[r'tipoCarburante.in'] = tipoCarburantePeriodIn;
        queryParams[r'tipoCarburante.notEquals'] = tipoCarburantePeriodNotEquals;
        queryParams[r'tipoCarburante.notIn'] = tipoCarburantePeriodNotIn;
        queryParams[r'tipoCarburante.specified'] = tipoCarburantePeriodSpecified;
        queryParams.removeWhere((key, value) => value == null);
        headerParams.removeWhere((key, value) => value == null);

        final List<String> contentTypes = [];

        return _dio.request(
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
                contentType: contentTypes.isNotEmpty ? contentTypes[0] : 'application/json',
            ),
            cancelToken: cancelToken,
            onSendProgress: onSendProgress,
            onReceiveProgress: onReceiveProgress,
        ).then((response) {
            const collectionType = BuiltList;
            const type = FullType(collectionType, [FullType(Rifornimento)]);
            final BuiltList<Rifornimento> data = _serializers.deserialize(response.data is String ? jsonDecode(response.data) : response.data, specifiedType: type) as BuiltList<Rifornimento>;

            return Response<BuiltList<Rifornimento>>(
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
