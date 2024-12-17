import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:u_matter/data/network/base_api_service.dart';
import 'package:u_matter/data/network/network_api_service.dart';
import 'package:u_matter/model/product_response_model.dart';

import '../data/exceptions.dart';
import '../res/app_url.dart';

class HomeRepo {
  BaseApiService _apiService = NetworkApiService();

  Future<Either<AppException, List>> getAllCategories() async {
    try {
      dynamic response = await _apiService
          .getGetApiResponse("${AppUrl.allCategories}",);

      debugPrint("AllCategories response : $response");

      // If the response is empty or unauthorized
      if (response == null || response.toString().isEmpty) {
        throw AppException("Empty or invalid response from the server");
      }

      return Right(response);
      // return response;
    } on AppException catch (appException) {
      return Left(appException);
    } catch (exception) {
      return Left(AppException(exception.toString()));
    }
  }

  Future<Either<AppException, List<ProductResponseModel>>> getAllProducts() async {
    try {
      dynamic response = await _apiService
          .getGetApiResponse("${AppUrl.allProducts}?limit=50",);

      debugPrint("AllProducts response : $response");

      // If the response is empty or unauthorized
      if (response == null || response.toString().isEmpty) {
        throw AppException("Empty or invalid response from the server");
      }

      return Right(List<ProductResponseModel>.from(response!.map((x) => ProductResponseModel.fromJson(x))));
      // return response;
    } on AppException catch (appException) {
      return Left(appException);
    } catch (exception) {
      return Left(AppException(exception.toString()));
    }
  }

  Future<Either<AppException, List<ProductResponseModel>>> getCategoryProducts({required String category}) async {
    try {
      dynamic response = await _apiService
          .getGetApiResponse("${AppUrl.categoryProducts}$category",);

      debugPrint("CategoryProducts response : $response");

      // If the response is empty or unauthorized
      if (response == null || response.toString().isEmpty) {
        throw AppException("Empty or invalid response from the server");
      }

      return Right(List<ProductResponseModel>.from(response!.map((x) => ProductResponseModel.fromJson(x))));
      // return response;
    } on AppException catch (appException) {
      return Left(appException);
    } catch (exception) {
      return Left(AppException(exception.toString()));
    }
  }
  // Future<Either<AppException, AllServicesResponseModel>> getAllServices({
  //   GenderTypeEnum gender = GenderTypeEnum.Male,
  //   String token = '',
  //   int pageNo = 1, /// Default to the first page
  //   int pageSize = 3,
  // }) async {
  //   try {
  //     // /// Fetch the locale parameter
  //     // String locale = await Utils.fetchLanguageCodeParam;
  //    /// Map the enum to the correct value
  //     int genderValue = gender.index; // Male will map to 0, Female to 1
  //     debugPrint("genderValue $genderValue");
  //     dynamic response = await _apiService
  //         .getGetApiResponse("${AppUrl.allServices}?gender=$genderValue&PageNumber=$pageNo&PageSize=$pageSize",
  //         // "page_no=$pageNo&language=$locale",
  //         headers: {
  //       "Authorization": "Bearer $token",
  //     });
  //
  //     debugPrint("AllServices response : $response");
  //
  //     // If the response is empty or unauthorized
  //     if (response == null || response.toString().isEmpty) {
  //       throw AppException("Empty or invalid response from the server");
  //     }
  //
  //     return Right(AllServicesResponseModel.fromJson(response));
  //     // return response;
  //   } on AppException catch (appException) {
  //     return Left(appException);
  //   } catch (exception) {
  //     return Left(AppException(exception.toString()));
  //   }
  // }
  //
  // Future<Either<AppException, GetGalleryResponseModel>> getGallery({
  //   String token = '',
  //   int pageNo = 1, /// Default to the first page
  //   int pageSize = 10,
  // }) async {
  //   try {
  //     dynamic response = await _apiService
  //         .getGetApiResponse("${AppUrl.getGallery}?PageNumber=$pageNo&PageSize=$pageSize",
  //         // "page_no=$pageNo&language=$locale",
  //         headers: {
  //           "Authorization": "Bearer $token",
  //         });
  //
  //     debugPrint("Gallery response : $response");
  //
  //     // If the response is empty or unauthorized
  //     if (response == null || response.toString().isEmpty) {
  //       throw AppException("Empty or invalid response from the server");
  //     }
  //
  //     return Right(GetGalleryResponseModel.fromJson(response));
  //     // return response;
  //   } on AppException catch (appException) {
  //     return Left(appException);
  //   } catch (exception) {
  //     return Left(AppException(exception.toString()));
  //   }
  // }
  //
  // Future<Either<AppException, GetSpecialistResponseModel>> getSpecialist({
  //   String token = '',
  //   int pageNo = 1, /// Default to the first page
  //   int pageSize = 10,
  // }) async {
  //   try {
  //     dynamic response = await _apiService
  //         .getGetApiResponse("${AppUrl.getSpecialist}?PageNumber=$pageNo&PageSize=$pageSize",
  //         // "page_no=$pageNo&language=$locale",
  //         headers: {
  //           "Authorization": "Bearer $token",
  //         });
  //
  //     debugPrint("Specialist Api response : $response");
  //
  //     // If the response is empty or unauthorized
  //     if (response == null || response.toString().isEmpty) {
  //       throw AppException("Empty or invalid response from the server");
  //     }
  //
  //     return Right(GetSpecialistResponseModel.fromJson(response));
  //     // return response;
  //   } on AppException catch (appException) {
  //     return Left(appException);
  //   } catch (exception) {
  //     return Left(AppException(exception.toString()));
  //   }
  // }
  //
  // Future<Either<AppException, String>> viewImageFile({
  //   String fileName = '',
  //
  // }) async {
  //   try {
  //     dynamic response = await _apiService
  //         .getGetApiResponse("${AppUrl.viewImageFile}?FileName=$fileName",
  //         // headers: {
  //         //   "Authorization": "Bearer $token",
  //         // }
  //         );
  //     debugPrint("ViewImageFile response : $response");
  //     return Right(response);
  //     // return response;
  //   } on AppException catch (appException) {
  //     return Left(appException);
  //   } catch (exception) {
  //     return Left(AppException(exception.toString()));
  //   }
  // }
}
