// Copyright (C) 2020 covid19cuba
// Use of this source code is governed by a GNU GPL 3 license that can be
// found in the LICENSE file.

import 'package:json_annotation/json_annotation.dart';

part 'jt_new_model.g.dart';

@JsonSerializable()
class JTNewModel {
  String id;
  String link;
  String title;
  String author;
  List<int> published;
  List<int> updated;
  String summary;
  String abstract;

  JTNewModel();

  DateTime getUpdated() {
    return getDate(updated);
  }

  DateTime getPublished() {
    return getDate(published);
  }

  static DateTime getDate(List<int> list) {
    var year = list[0];
    var month = list[1];
    var day = list[2];
    var hour = list[3];
    var minutes = list[4];
    var seconds = list[5];
    return DateTime(year, month, day, hour, minutes, seconds);
  }

  factory JTNewModel.fromJson(Map<String, dynamic> json) =>
      _$JTNewModelFromJson(json);

  Map<String, dynamic> toJson() => _$JTNewModelToJson(this);
}
