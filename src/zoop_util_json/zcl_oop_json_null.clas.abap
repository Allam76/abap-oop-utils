class ZCL_OOP_JSON_NULL definition
  public
  inheriting from ZCL_oop_OBJECT
  final
  create public .

public section.

*"* public components of class ZCL_OOP_JSON_NULL
*"* do not include other source files here!!!
  interfaces ZIF_oop_JSON_VALUE .
protected section.
*"* protected components of class ZCL_OOP_JSON_NULL
*"* do not include other source files here!!!
private section.
*"* private components of class ZCL_OOP_JSON_NULL
*"* do not include other source files here!!!
ENDCLASS.



CLASS ZCL_OOP_JSON_NULL IMPLEMENTATION.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_OOP_JSON_NULL->ZIF_oop_JSON_VALUE~GET_TYPE
* +-------------------------------------------------------------------------------------------------+
* | [<-()] RETURNING                      TYPE        I
* +--------------------------------------------------------------------------------------</SIGNATURE>
method ZIF_oop_JSON_VALUE~get_type.
  returning = ZCL_oop_JSON_TYPES=>type_null.
endmethod.
ENDCLASS.

