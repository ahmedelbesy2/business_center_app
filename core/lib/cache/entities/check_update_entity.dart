import 'package:equatable/equatable.dart';

class CheckUpdateEntity extends Equatable {
  bool? isUpdateRequired;
  bool? isUpdate;
  String? supportUrl;
  bool? isOtpOrangeRequired;
  bool? isOtpRequired;
  bool? isReferral;
  bool? isPgw;
  bool? enable3laElSeka ;
  bool? enableScheduledTrip;
  bool? enableBoth;

  CheckUpdateEntity({
    this.isUpdateRequired,
    this.isUpdate,
    this.supportUrl,
    this.isOtpOrangeRequired,
    this.isOtpRequired,
    this.isReferral,
    this.isPgw,
    this.enable3laElSeka,
    this.enableBoth,
    this.enableScheduledTrip
  });

  CheckUpdateEntity copyWith({
    bool? isUpdateRequired,
    bool? isUpdate,
    String? supportUrl,
    bool? isOtpOrangeRequired,
    bool? isOtpRequired,
    bool? isReferral,
    bool? isPgw,
    bool? enable3laElSeka ,
    bool? enableScheduledTrip,
    bool? enableBoth,

  }) =>
      CheckUpdateEntity(
        isUpdateRequired: isUpdateRequired ?? this.isUpdateRequired,
        isUpdate: isUpdate ?? this.isUpdate,
        supportUrl: supportUrl ?? this.supportUrl,
        isOtpOrangeRequired: isOtpOrangeRequired ?? this.isOtpOrangeRequired,
        isOtpRequired: isOtpRequired ?? this.isOtpRequired,
        isReferral: isReferral ?? this.isReferral,
        isPgw: isPgw ?? this.isPgw,
          enable3laElSeka: enable3laElSeka ?? this.enable3laElSeka,
          enableScheduledTrip: enableScheduledTrip ?? this.enableScheduledTrip,
        enableBoth: enableBoth ?? this.enableBoth,

      );

  factory CheckUpdateEntity.fromJson(Map<String, dynamic> json) =>
      CheckUpdateEntity(
        isUpdateRequired: json["isUpdateRequired"],
        isUpdate: json["isUpdate"],
        supportUrl: json["supportUrl"],
        isOtpOrangeRequired: json["isOtpOrangeRequired"],
        isOtpRequired: json["isOtpRequired"],
        isReferral: json["isReferral"],
        isPgw: json["isPgw"],
        enable3laElSeka: json["enable3laElSeka"],
        enableScheduledTrip: json["enableScheduledTrip"],
        enableBoth: json["enableBoth"],
      );

  Map<String, dynamic> toJson() => {
        "isUpdateRequired": isUpdateRequired,
        "isUpdate": isUpdate,
        "supportUrl": supportUrl,
        "isOtpOrangeRequired": isOtpOrangeRequired,
        "isOtpRequired": isOtpRequired,
        "isReferral": isReferral,
        "isPgw": isPgw,
        "enable3laElSeka": enable3laElSeka,
        "enableScheduledTrip": enableScheduledTrip,
        "enableBoth": enableBoth,
      };

  @override
  List<Object?> get props => [
        isUpdateRequired,
        isUpdate,
        supportUrl,
        isOtpOrangeRequired,
        isOtpRequired,
        isReferral,
        isPgw,
    enable3laElSeka,
    enableScheduledTrip,
    enableBoth,
      ];
}
