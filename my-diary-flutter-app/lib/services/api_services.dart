// ignore_for_file: public_member_api_docs, sort_constructors_first
import "package:http/http.dart" as http;
import 'package:my_diary/api/api.dart';
import 'package:pocketbase/pocketbase.dart';

class ApiService {
  final Api _api;
  ApiService(
    this._api,
  );

  Future<RecordModel> getOne({
    required String collectionIdOrName,
    required String recordId,
    String? expand,
    Map<String, dynamic> query = const {},
    Map<String, String> headers = const {},
  }) async {
    final response = await _api.getOne(
        collectionIdOrName: collectionIdOrName,
        recordId: recordId,
        expand: expand,
        query: query,
        headers: headers);

    return response;
  }

  Future<ResultList<RecordModel>> getList({
    required String collectionIdOrName,
    required int page,
    required int perPage,
    String? expand,
    String? sort,
    String? filter,
    Map<String, dynamic> query = const {},
    Map<String, String> headers = const {},
  }) async {
    final resultList = await _api.getList(
        collectionIdOrName: collectionIdOrName,
        page: page,
        perPage: perPage,
        filter: filter,
        sort: sort,
        expand: expand,
        query: query,
        headers: headers);

    return resultList;
  }

  Future<List<RecordModel>> getFullList({
    required String collectionIdOrName,
    String? expand,
    String? sort,
    String? filter,
    Map<String, dynamic> query = const {},
    Map<String, String> headers = const {},
  }) async {
    final records = await _api.getFullList(
        collectionIdOrName: collectionIdOrName,
        filter: filter,
        sort: sort,
        expand: expand,
        query: query,
        headers: headers);

    return records;
  }

  Future<RecordModel> getFirstListItem({
    required String collectionIdOrName,
    String? expand,
    required String filter,
    Map<String, dynamic> query = const {},
    Map<String, String> headers = const {},
  }) async {
    // or fetch only the first record that matches the specified filter
    final record = await _api.getFirstListItem(
        collectionIdOrName: collectionIdOrName,
        filter: filter,
        expand: expand,
        query: query,
        headers: headers);

    return record;
  }

  Future<RecordModel> create({
    required String collectionIdOrName,
    Map<String, dynamic> body = const {},
    Map<String, dynamic> query = const {},
    List<http.MultipartFile> files = const [],
    Map<String, String> headers = const {},
    String? expand,
  }) async {
    final record = await _api.create(
        collectionIdOrName: collectionIdOrName,
        body: body,
        query: query,
        files: files,
        headers: headers,
        expand: expand);

    return record;
  }

  Future<RecordModel> update({
    required String collectionIdOrName,
    required String recordId,
    Map<String, dynamic> body = const {},
    Map<String, dynamic> query = const {},
    List<http.MultipartFile> files = const [],
    Map<String, String> headers = const {},
    String? expand,
  }) async {
    final record = await _api.update(
        collectionIdOrName: collectionIdOrName,
        recordId: recordId,
        body: body,
        query: query,
        files: files,
        headers: headers,
        expand: expand);

    return record;
  }

  Future<void> delete({
    required String collectionIdOrName,
    required String recordId,
    Map<String, dynamic> body = const {},
    Map<String, dynamic> query = const {},
    List<http.MultipartFile> files = const [],
    Map<String, String> headers = const {},
    String? expand,
  }) async {
    await _api.delete(
        collectionIdOrName: collectionIdOrName,
        recordId: recordId,
        body: body,
        query: query,
        headers: headers);
  }
}
