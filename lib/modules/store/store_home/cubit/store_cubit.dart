import 'package:aroundus_app/repositories/product_repository/models/brand.dart';
import 'package:aroundus_app/repositories/product_repository/models/product.dart';
import 'package:aroundus_app/repositories/store_repository/store_repository.dart';
import 'package:aroundus_app/support/networks/api_result.dart';
import 'package:aroundus_app/support/networks/network_exceptions.dart';
import 'package:aroundus_app/support/networks/page_response.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'store_state.dart';

class StoreCubit extends Cubit<StoreState> {
  StoreCubit(this._storeRepository) : super(const StoreState());

  final StoreRepository _storeRepository;

  Future<void> initMenu(Collection collection) async {
    emit(state.copyWith(selectedMenu: collection));
  }

  Future<void> selectedCollection(Collection selected) async {
    emit(state.copyWith(selectedMenu: selected));
  }

  Future<void> getCollections() async {
    ApiResult<List> apiResult = await _storeRepository.getCollection();

    apiResult.when(success: (List? listResponse) {
      emit(state.copyWith(
          collections: listResponse!.map((e) => Menu.fromJson(e)).toList()));
    }, failure: (NetworkExceptions? error) {
      emit(state.copyWith(error: error));
    });
  }

  Future<void> getProductsByCollection(
      Collection collection, String sort, int page) async {
    ApiResult<PageResponse> apiResult =
        await _storeRepository.getProductsByCollection(collection, sort, page);

    apiResult.when(success: (PageResponse? pageResponse) {
      List<Product> newProducts = [];

      if (pageResponse!.count != null) {
        newProducts = pageResponse.results!.map((e) {
          return Product(
            Id: e["Id"],
            name: e["name"],
            rating: e["rating"],
            originalPrice: e["originalPrice"],
            discountPrice: e["discountPrice"],
            discountRate: e["discountRate"],
            brand: Brand(name: e["brand"]),
            thumbnail: e["thumbnail"],
          );
        }).toList();
      }

      emit(
        state.copyWith(
          products: page == 1 ? newProducts : state.products! + newProducts,
          next: pageResponse.next,
          previous: pageResponse.previous,
          count: pageResponse.count,
          page: state.page! + 1,
          maxIndex: pageResponse.next == null ? true : false,
        ),
      );
    }, failure: (NetworkExceptions? error) {
      emit(state.copyWith(error: error));
    });
  }

  Future<void> getSubCollection() async {
    ApiResult<List> apiResult =
        await _storeRepository.getSubCollection(state.selectedMenu!);

    apiResult.when(success: (List? listResponse) {
      emit(state.copyWith(
          subCollections: [Collection(state.selectedMenu!.Id, "전체보기")] +
              listResponse!.map((e) => Collection.fromJson(e)).toList()));
    }, failure: (NetworkExceptions? error) {
      emit(state.copyWith(error: error));
    });
  }
}
