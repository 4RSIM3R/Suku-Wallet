import 'dart:convert';

Parser parserFromJson(String str) => Parser.fromJson(json.decode(str));

String parserToJson(Parser data) => json.encode(data.toJson());

class Parser {
    int saldo;

    Parser({
        this.saldo,
    });

    factory Parser.fromJson(Map<String, dynamic> json) => new Parser(
        saldo: json["Saldo"],
    );

    Map<String, dynamic> toJson() => {
        "Saldo": saldo,
    };
}