### 	Flutter Template	

**Included Features** 

- Facebook Login

  ```dart
  final String fbToken=await FacebookSignInRepository().logInWithFacebook();
  ```

- Google Login

  ```dart
  final GoogleLogin login=await GoogleSignInWithFirebaseRepository().signInWithGoogle();
  ```

  

- Biometric Authentication(in Utils.dart)

- Simple Bloc Delegate(flutter bloc version 4.0.1) //commented

- Simple Bloc Observer(flutter bloc version 6.0.1)

- Material Theme Colours by Google

- Font Styles

- Language Change

- Network Call 

  In your repository, you have to use ApiResult<T>  in return Future like that.

  ```dart
  static Future<ApiResult<AddCartResponse>> postAddToCart(
        AddCartRequest request) async {
      var token = await Utils.getToken();
      try {
        final response = await apiService.postAddCart(token, request);
        return ApiResult.success(data: response);
      } catch (e) {
        return ApiResult.failure(error: NetworkExceptions.getDioException(e));
      }
    }
  ```

  and In bloc,you gonna add like this as follows..

  ```dart
   final cartList = await CartRepository.checkout(itemId);
        yield* cartList.when(success: (CheckOutResponse checkOutResponse) async* {
          yield CartState.loaded(checkOutResponse);
          
        }, failure: (NetworkExceptions error) async* {
          yield CartState.error(error);
        });
  ```

- Router(Auto Route)

- VS code Snippets

  Copy this->Then in VS code Ctrl+Shift+P or F1->Configure User Snippets->choose Dart and paste this
  
  Some of them are taken from [ResoCoder](https://resocoder.com/2020/02/11/freezed-data-class-union-in-one-dart-package/) and I added some.
  
  ```dart
  "Part statement": {
  		"prefix": "pts",
  		"body": [
  			"part '${TM_FILENAME_BASE}.g.dart';",
  		],
  		"description": "Creates a filled-in part statement"
  	},
  	"Part 'Freezed' statement": {
  		"prefix": "ptf",
  		"body": [
  			"part '${TM_FILENAME_BASE}.freezed.dart';",
  		],
  		"description": "Creates a filled-in freezed part statement"
  	},
  	"Freezed With Bloc Event": {
  		"prefix": "fAblocE",
  		"body": [
  			"@freezed",
  			"abstract class ${1:DataClassEvent} with _$${1:DatatClassEvent}{",
  			"   const factory ${1:DataClassEvent}.fetch(${3:Model} model)=${1:DataClassEvent}FetchEvent;",
  			"}",
  		],
  		"description": "Freezed With Bloc Event API"
  	},
  	"Freezed With Bloc State": {
  		"prefix": "fAblocS",
  		"body": [
  			"@freezed",
  			"abstract class ${1:DataClassState} with _$${1:DataClassState}{",
  			"   const factory ${1:DataClassState}.initial()=${1:DataClassState}Initial;",
  			"   const factory ${1:DataClassState}.loading()=${1:DataClassState}Loading;",
  			"   const factory ${1:DataClassState}.loaded(${2:Model} model)=${1:DataClassState}Loaded;",
  			"   const factory ${1:DataClassState}.error(${3:Exception exception})=${1:DataClassState}Error;",
  			"}",
  		],
  		"description": "Freezed With Bloc State API"
  	},
  	"Freezed with Bloc file": {
  		"prefix": "fAbloc",
  		"body": [
  			"if(event is ${1:DataClassEvent}FetchEvent){",
  			"   yield ${2:DataClassState}.loading();",
  			"   try{",
  			"       //The response will be api response from server",
  			"       yield ${2:DataClassState}.loaded(${3:response});",
  			"   }on Exception catch(e){",
  			"   yield ${2:DataClassState}.error(e);",
  			"   }",
  			"}",
  		],
  		"description": "Freezed Inside Bloc"
  	},
  	"Freezed Data Class": {
  		"prefix": "fdataclass",
  		"body": [
  			"@freezed",
  			"abstract class ${1:DataClass} with _$${1:DataClass}{",
  			"  const factory ${1:DataClass}(${2}) = _${1:DataClass};",
  			"}"
  		],
  		"description": "Freezed Data Class"
  	},
  	"Freezed Union": {
  		"prefix": "funion",
  		"body": [
  			"@freezed",
  			"abstract class ${1:Union} with _$${1:Union}{",
  			"  const factory ${1:Union}.${2}(${4}) = ${3};",
  			"}"
  		],
  		"description": "Freezed Union"
  	},
  	"Freezed Union Case": {
  		"prefix": "funioncase",
  		"body": [
  			"const factory ${1:Union}.${2}(${4}) = ${3};"
  		],
  		"description": "Freezed Union Case"
  	},
  	"From JSON": {
  		"prefix": "fromJson",
  		"body": [
  			"factory ${1}.fromJson(Map<String, dynamic> json) => _$${1}FromJson(json);"
  		],
  		"description": "From JSON"
  	},
  	"To JSON": {
  		"prefix": "toJson",
  		"body": [
  			"Map<String, dynamic> toJson() => _$${1}ToJson(this);"
		],
  		"description": "To JSON"
  	},
  	"Json Model": {
  		"prefix": "jmodel",
  		"body": [
  			"import 'package:json_annotation/json_annotation.dart';",
  			"",
  			"part '${TM_FILENAME_BASE}.g.dart';",
  			"",
  			"@JsonSerializable()",
  			"class ${1:DataClass}{",
  			"   @JsonKey(name:'')",
  			"   final value value;",
  			"",
  			"   const ${1:DataClass}();",
  			"",
  			"   factory ${1}.fromJson(Map<String, dynamic> json) => _$${1}FromJson(json);",
  			"",
  			"   Map<String, dynamic> toJson() => _$${1}ToJson(this);",
  			"}"
  		],
  		"description": "Json Model class"
  	}
  ```
  
  
  
  
  

