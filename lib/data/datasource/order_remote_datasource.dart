import 'package:dartz/dartz.dart';
import 'package:flutter_fic_ecommerce_elektronik/data/datasource/auth_local_datasource.dart';
import 'package:http/http.dart' as http;

import '../../common/global_variables.dart';
import '../models/order_request_model.dart';
import '../models/responses/order_response_model.dart';

class OrderRemoteDatasource {
  Future<Either<String, OrderResponseModel>> order(
      OrderRequestModel model) async {
    final tokenJwt = await AuthLocalDatasource().getToken();
    print(model.toRawJson());

    final response = await http.post(
      Uri.parse('${GlobalVariables.baseUrl}/api/orders'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiaWF0IjoxNjkyMDY1NjU3LCJleHAiOjE2OTQ2NTc2NTd9.9YKZZpYhBlO8QeetxVLKWIVVC0Ms4UdKY9L3EX7bEZk'
      },
      body: model.toRawJson(),
    );
    if (response.statusCode == 200) {
      return Right(OrderResponseModel.fromJson(response.body));
    } else {
      return const Left('server error');
    }
  }
}
