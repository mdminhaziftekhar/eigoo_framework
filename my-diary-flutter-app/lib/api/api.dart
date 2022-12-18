import "package:http/http.dart" as http;
import 'package:my_diary/api/extensions.dart';
import 'package:pocketbase/pocketbase.dart';

class Api {
  bool _initialized = false;
  bool _debugEnable = false;
  late PocketBase _rest;

  static Api get instance {
    assert(
      _instance._initialized,
      'You must initialize the appbasecamp instance before calling Api.instance',
    );
    return _instance;
  }

  Api();

  Future<Api> initialize({
    required String apiRestUrl,
    required String apiRestPort,
    required bool debug,
  }) async {
    assert(
      !_instance._initialized,
      'This instance is already initialized',
    );

    _instance._debugEnable = debug;

    '***** Api debug mode ${_instance._debugEnable}'.log;
    '***** Api init completed $_instance'.log;
    String apiUrl = '$apiRestUrl:$apiRestPort';
    _instance._rest = PocketBase(apiUrl);

    _instance._initialized = true;
    return _instance;
  }

  PocketBase get rest => _instance._rest;

  Api._();
  static final Api _instance = Api._();

  Future<RecordModel> getOne({
    required String collectionIdOrName,
    required String recordId,
    String? expand,
    Map<String, dynamic> query = const {},
    Map<String, String> headers = const {},
  }) async {
    final response = await _instance._rest
        .collection(collectionIdOrName)
        .getOne(recordId, expand: expand, query: query, headers: headers);

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
    final resultList = await _instance._rest
        .collection(collectionIdOrName)
        .getList(
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
    final records = await _instance._rest
        .collection(collectionIdOrName)
        .getFullList(
            batch: 200,
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
    final record = await _instance._rest
        .collection(collectionIdOrName)
        .getFirstListItem(filter,
            expand: expand, query: query, headers: headers);

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
    final record = await _instance._rest.collection(collectionIdOrName).create(
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
    final record = await _instance._rest.collection(collectionIdOrName).update(
        recordId,
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
    await _instance._rest.collection(collectionIdOrName).delete(recordId,body: body,query: query,headers: headers);
   
  }

   Future<void> subscribe({
    required String collectionIdOrName,
    
   
  }) async {
    _instance._rest.collection(collectionIdOrName).subscribe('*', (e) {
   
});

   
   
  }
}
