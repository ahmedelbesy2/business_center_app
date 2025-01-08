

class GetInformationEntity {
  final String? accessToken;
  final bool? active;
  final int? branchCode;
  final bool? correctCredentials;
  final bool? loggedIn;
  final int? masterCustomerId;
  final String? pwd;
  final String? usLoginId;
  final String? usName;
  final int? userId;
  final bool? viewFinancials;


  GetInformationEntity({
    this.accessToken,
    this.active,
    this.branchCode,
    this.correctCredentials,
    this.loggedIn,
    this.masterCustomerId,
    this.pwd,
    this.usLoginId,
    this.usName,
    this.userId,
    this.viewFinancials,
  });

  GetInformationEntity copyWith({
    String? accessToken,
    bool? active,
    int? branchCode,
    bool? correctCredentials,
    bool? loggedIn,
    int? masterCustomerId,
    String? pwd,
    String? usLoginId,
    String? usName,
    int? userId,
    bool? viewFinancials,
  }) =>
      GetInformationEntity(
        accessToken: accessToken ?? this.accessToken,
        active: active ?? this.active,
        branchCode: branchCode ?? this.branchCode,
        correctCredentials: correctCredentials ?? this.correctCredentials,
        loggedIn: loggedIn ?? this.loggedIn,
        masterCustomerId: masterCustomerId ?? this.masterCustomerId,
        pwd: pwd ?? this.pwd,
        usLoginId: usLoginId ?? this.usLoginId,
        usName: usName ?? this.usName,
        userId: userId ?? this.userId,
        viewFinancials: viewFinancials ?? this.viewFinancials,
      );

  factory GetInformationEntity.fromJson(Map<String, dynamic> json) => GetInformationEntity(
    accessToken: json["accessToken"],
    active: json["active"],
    branchCode: json["branchCode"],
    correctCredentials: json["correctCredentials"],
    loggedIn: json["loggedIn"],
    masterCustomerId: json["masterCustomerId"],
    pwd: json["pwd"],
    usLoginId: json["usLoginId"],
    usName: json["usName"],
    userId: json["userId"],
    viewFinancials: json["viewFinancials"],
  );

  Map<String, dynamic> toJson() => {
    "accessToken": accessToken,
    "active": active,
    "branchCode": branchCode,
    "correctCredentials": correctCredentials,
    "loggedIn": loggedIn,
    "masterCustomerId": masterCustomerId,
    "pwd": pwd,
    "usLoginId": usLoginId,
    "usName": usName,
    "userId": userId,
    "viewFinancials": viewFinancials,
  };
}

