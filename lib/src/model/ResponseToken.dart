class ResponseToken{
  ResponseToken({access_token}){}

  late String access_token;
  late String token_type;
  late int expires_in;
  late String scope;
  late String jti;


  factory ResponseToken.fromJson(Map<String, dynamic> json) => ResponseToken(
    access_token: json["access_token"],
  );

  Map<String, dynamic> toJson() => {
    "access_token": access_token,

  };






}