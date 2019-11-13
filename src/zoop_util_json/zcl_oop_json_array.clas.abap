class ZCL_OOP_JSON_ARRAY definition
  public
  inheriting from ZCL_oop_OBJECT
  final
  create public .

public section.
*"* public components of class ZCL_OOP_JSON_ARRAY
*"* do not include other source files here!!!
  type-pools ABAP .

  interfaces ZIF_oop_JSON_VALUE .

  aliases GET_TYPE
    for ZIF_oop_JSON_VALUE~GET_TYPE .

  methods CONSTRUCTOR .
  methods ADD
    importing
      !VALUE type ref to ZIF_oop_JSON_VALUE
    returning
      value(RETURNING) type ABAP_BOOL .
  methods CLEAR .
  methods GET
    importing
      !INDEX type I
    returning
      value(RETURNING) type ref to ZIF_oop_JSON_VALUE .
  methods ITERATOR
    returning
      value(RETURNING) type ref to ZIF_oop_ITERATOR .
  methods REMOVE
    importing
      !VALUE type ref to ZIF_oop_JSON_VALUE
    returning
      value(RETURNING) type ABAP_BOOL .
  methods SET
    importing
      !INDEX type I
      !VALUE type ref to ZIF_oop_JSON_VALUE
    returning
      value(RETURNING) type ref to ZIF_oop_JSON_VALUE .
  methods SIZE
    returning
      value(RETURNING) type I .
protected section.
*"* protected components of class ZCL_OOP_JSON_ARRAY
*"* do not include other source files here!!!
private section.

*"* private components of class ZCL_OOP_JSON_ARRAY
*"* do not include other source files here!!!
  data VALUES type ref to ZCL_oop_ARRAYLIST .
ENDCLASS.



CLASS ZCL_OOP_JSON_ARRAY IMPLEMENTATION.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_OOP_JSON_ARRAY->ZIF_oop_JSON_VALUE~GET_TYPE
* +-------------------------------------------------------------------------------------------------+
* | [<-()] RETURNING                      TYPE        I
* +--------------------------------------------------------------------------------------</SIGNATURE>
method ZIF_oop_JSON_VALUE~get_type.
  returning = ZCL_oop_JSON_TYPES=>type_array.
endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_OOP_JSON_ARRAY->ADD
* +-------------------------------------------------------------------------------------------------+
* | [--->] VALUE                          TYPE REF TO ZIF_oop_JSON_VALUE
* | [<-()] RETURNING                      TYPE        ABAP_BOOL
* +--------------------------------------------------------------------------------------</SIGNATURE>
method add.
  data object type ref to ZCL_oop_OBJECT.
  object ?= value.
  returning = me->values->add( object ).
endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_OOP_JSON_ARRAY->CLEAR
* +-------------------------------------------------------------------------------------------------+
* +--------------------------------------------------------------------------------------</SIGNATURE>
method clear.
  me->values->clear( ).
endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_OOP_JSON_ARRAY->CONSTRUCTOR
* +-------------------------------------------------------------------------------------------------+
* +--------------------------------------------------------------------------------------</SIGNATURE>
method constructor.
  super->constructor( ).
  " Init values list
  create object me->values.
endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_OOP_JSON_ARRAY->GET
* +-------------------------------------------------------------------------------------------------+
* | [--->] INDEX                          TYPE        I
* | [<-()] RETURNING                      TYPE REF TO ZIF_oop_JSON_VALUE
* +--------------------------------------------------------------------------------------</SIGNATURE>
method get.
  returning ?= me->values->get( index ).
endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_OOP_JSON_ARRAY->ITERATOR
* +-------------------------------------------------------------------------------------------------+
* | [<-()] RETURNING                      TYPE REF TO ZIF_oop_ITERATOR
* +--------------------------------------------------------------------------------------</SIGNATURE>
method iterator.
  returning = me->values->iterator( ).
endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_OOP_JSON_ARRAY->REMOVE
* +-------------------------------------------------------------------------------------------------+
* | [--->] VALUE                          TYPE REF TO ZIF_oop_JSON_VALUE
* | [<-()] RETURNING                      TYPE        ABAP_BOOL
* +--------------------------------------------------------------------------------------</SIGNATURE>
method remove.
  data object type ref to ZCL_oop_OBJECT.
  object ?= value.
  returning = me->values->remove( object ).
endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_OOP_JSON_ARRAY->SET
* +-------------------------------------------------------------------------------------------------+
* | [--->] INDEX                          TYPE        I
* | [--->] VALUE                          TYPE REF TO ZIF_oop_JSON_VALUE
* | [<-()] RETURNING                      TYPE REF TO ZIF_oop_JSON_VALUE
* +--------------------------------------------------------------------------------------</SIGNATURE>
method set.
  data object type ref to ZCL_oop_OBJECT.
  object ?= value.
  returning ?= me->values->set( index = index element = object ).
endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_OOP_JSON_ARRAY->SIZE
* +-------------------------------------------------------------------------------------------------+
* | [<-()] RETURNING                      TYPE        I
* +--------------------------------------------------------------------------------------</SIGNATURE>
method size.
  returning = me->values->size( ).
endmethod.
ENDCLASS.

