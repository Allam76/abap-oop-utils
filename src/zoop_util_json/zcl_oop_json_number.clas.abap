class ZCL_OOP_JSON_NUMBER definition
  public
  inheriting from ZCL_oop_OBJECT
  final
  create public .

public section.

*"* public components of class ZCL_OOP_JSON_NUMBER
*"* do not include other source files here!!!
  interfaces ZIF_oop_JSON_VALUE .

  aliases GET_TYPE
    for ZIF_oop_JSON_VALUE~GET_TYPE .

  data VALUE type F read-only .

  methods CONSTRUCTOR
    importing
      !VALUE type F .
protected section.
*"* protected components of class ZCL_OOP_JSON_NUMBER
*"* do not include other source files here!!!
private section.
*"* private components of class ZCL_OOP_JSON_NUMBER
*"* do not include other source files here!!!
ENDCLASS.



CLASS ZCL_OOP_JSON_NUMBER IMPLEMENTATION.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_OOP_JSON_NUMBER->ZIF_oop_JSON_VALUE~GET_TYPE
* +-------------------------------------------------------------------------------------------------+
* | [<-()] RETURNING                      TYPE        I
* +--------------------------------------------------------------------------------------</SIGNATURE>
method ZIF_oop_JSON_VALUE~get_type.
  returning = ZCL_oop_JSON_TYPES=>type_number.
endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_OOP_JSON_NUMBER->CONSTRUCTOR
* +-------------------------------------------------------------------------------------------------+
* | [--->] VALUE                          TYPE        F
* +--------------------------------------------------------------------------------------</SIGNATURE>
method constructor.
  super->constructor( ).
  me->value = value.
endmethod.
ENDCLASS.

