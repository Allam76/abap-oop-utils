class ZCL_OOP_JSON_PAIR definition
  public
  inheriting from ZCL_oop_OBJECT
  final
  create public .

public section.

*"* public components of class ZCL_OOP_JSON_PAIR
*"* do not include other source files here!!!
  data NAME type ref to ZCL_oop_JSON_STRING read-only .
  data VALUE type ref to ZIF_oop_JSON_VALUE read-only .

  methods CONSTRUCTOR
    importing
      !NAME type ref to ZCL_oop_JSON_STRING
      !VALUE type ref to ZIF_oop_JSON_VALUE .
protected section.
*"* protected components of class ZCL_OOP_JSON_PAIR
*"* do not include other source files here!!!
private section.
*"* private components of class ZCL_OOP_JSON_PAIR
*"* do not include other source files here!!!
ENDCLASS.



CLASS ZCL_OOP_JSON_PAIR IMPLEMENTATION.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_OOP_JSON_PAIR->CONSTRUCTOR
* +-------------------------------------------------------------------------------------------------+
* | [--->] NAME                           TYPE REF TO ZCL_oop_JSON_STRING
* | [--->] VALUE                          TYPE REF TO ZIF_oop_JSON_VALUE
* +--------------------------------------------------------------------------------------</SIGNATURE>
method constructor.
  super->constructor( ).
  me->name = name.
  me->value = value.
endmethod.
ENDCLASS.

