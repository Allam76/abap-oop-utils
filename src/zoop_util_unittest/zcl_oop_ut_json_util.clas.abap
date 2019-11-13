class ZCL_OOP_UT_JSON_UTIL definition
  public
  abstract
  create public
  for testing
  duration short
  risk level harmless .

public section.
*"* public components of class ZCL_OOP_UT_JSON_UTIL
*"* do not include other source files here!!!
protected section.

*"* protected components of class ZCL_OOP_UT_JSON_UTIL
*"* do not include other source files here!!!
  methods TEST
  for testing .
private section.

*"* private components of class ZCL_OOP_UT_JSON_UTIL
*"* do not include other source files here!!!
  methods SETUP .
ENDCLASS.



CLASS ZCL_OOP_UT_JSON_UTIL IMPLEMENTATION.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Private Method ZCL_OOP_UT_JSON_UTIL->SETUP
* +-------------------------------------------------------------------------------------------------+
* +--------------------------------------------------------------------------------------</SIGNATURE>
method setup.
endmethod.                    "setup


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Protected Method ZCL_OOP_UT_JSON_UTIL->TEST
* +-------------------------------------------------------------------------------------------------+
* +--------------------------------------------------------------------------------------</SIGNATURE>
method test.
  data array type ref to ZCL_oop_JSON_ARRAY.
  create object array.
  data object type ref to ZCL_oop_JSON_OBJECT.
  create object object.

  data pair_with_array type ref to ZCL_oop_JSON_PAIR.
  data pair_with_bool type ref to ZCL_oop_JSON_PAIR.
  data pair_with_null type ref to ZCL_oop_JSON_PAIR.
  data pair_with_number type ref to ZCL_oop_JSON_PAIR.
  data pair_with_object type ref to ZCL_oop_JSON_PAIR.
  data pair_with_string type ref to ZCL_oop_JSON_PAIR.

  pair_with_array = ZCL_oop_JSON_UTIL=>new_pair_with_array( name = `array` value = array ).
  pair_with_bool = ZCL_oop_JSON_UTIL=>new_pair_with_bool( name = `bool` value = abap_true ).
  pair_with_null = ZCL_oop_JSON_UTIL=>new_pair_with_null( name = `null`).
  pair_with_number = ZCL_oop_JSON_UTIL=>new_pair_with_number( name = `number` value = `10.45` ).
  pair_with_object = ZCL_oop_JSON_UTIL=>new_pair_with_object( name = `object` value = object ).
  pair_with_string = ZCL_oop_JSON_UTIL=>new_pair_with_string( name = `string` value = `Hello, World!` ).

  data object_with_array_pair type ref to ZCL_oop_JSON_OBJECT.
  data object_with_bool_pair type ref to ZCL_oop_JSON_OBJECT.
  data object_with_null_pair type ref to ZCL_oop_JSON_OBJECT.
  data object_with_number_pair type ref to ZCL_oop_JSON_OBJECT.
  data object_with_object_pair type ref to ZCL_oop_JSON_OBJECT.
  data object_with_string_pair type ref to ZCL_oop_JSON_OBJECT.

  object_with_array_pair = ZCL_oop_JSON_UTIL=>new_object_with_array_pair( name = `obj_array` value = array ).
  object_with_bool_pair = ZCL_oop_JSON_UTIL=>new_object_with_bool_pair( name = `obj_bool` value = abap_true ).
  object_with_null_pair = ZCL_oop_JSON_UTIL=>new_object_with_null_pair( name = `obj_null` ).
  object_with_number_pair = ZCL_oop_JSON_UTIL=>new_object_with_number_pair( name = `obj_number` value = `10.45` ).
  object_with_object_pair = ZCL_oop_JSON_UTIL=>new_object_with_object_pair( name = `obj_object` value = object ).
  object_with_string_pair = ZCL_oop_JSON_UTIL=>new_object_with_string_pair( name = `obj_string` value = `Hello, World!` ).

  data root_object type ref to ZCL_oop_JSON_OBJECT.
  data root_array type ref to ZCL_oop_JSON_ARRAY.
  data root_pair type ref to ZCL_oop_JSON_PAIR.
  create object root_object.
  create object root_array.
  root_object->add( pair_with_array ).
  root_object->add( pair_with_bool ).
  root_object->add( pair_with_null ).
  root_object->add( pair_with_number ).
  root_object->add( pair_with_object ).
  root_object->add( pair_with_string ).
  root_array->add( object_with_array_pair ).
  root_array->add( object_with_bool_pair ).
  root_array->add( object_with_null_pair ).
  root_array->add( object_with_number_pair ).
  root_array->add( object_with_object_pair ).
  root_array->add( object_with_string_pair ).
  root_pair = ZCL_oop_JSON_UTIL=>new_pair_with_array( name = `root_array` value = root_array ).
  root_object->add( root_pair ).

  data parser type ref to ZCL_oop_JSON_PARSER.
  create object parser.
  data json_string type string.
  json_string = parser->serialize( root_object ).
  data json_string_valid type string.
  json_string_valid = `{ "array" : [  ], "bool" : true, "null" : null, "number" : 1.0449999999999999E+01, "object" : {  }, "string" : "Hello, World!", `.
  concatenate json_string_valid `"root_array" : [ { "obj_array" : [  ] }, { "obj_bool" : true }, { "obj_null" : null }, ` into json_string_valid.
  concatenate json_string_valid `{ "obj_number" : 1.0449999999999999E+01 }, { "obj_object" : {  } }, { "obj_string" : "Hello, World!" } ] }` into json_string_valid.

  cl_aunit_assert=>assert_equals( act = json_string exp = json_string_valid ).
endmethod.
ENDCLASS.

