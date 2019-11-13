class ZCL_OOP_LOGGER_FACTORY definition
  public
  inheriting from ZCL_oop_OBJECT
  final
  create private .

public section.

*"* public components of class ZCL_OOP_LOGGER_FACTORY
*"* do not include other source files here!!!
  class-methods CREATE_CUSTOM_LOG
    importing
      !OBJECT type BALOBJ_D
      !SUBOBJECT type BALSUBOBJ
    returning
      value(RETURNING) type ref to ZCL_oop_LOGGER .
  class-methods GET_EXISTING_LOG
    importing
      !LOG_NUMBER type BALOGNR
    returning
      value(RETURNING) type ref to ZCL_oop_LOGGER .
  class-methods GET_SESSION_LOG
    importing
      !OBJECT type BALOBJ_D optional
      !SUBOBJECT type BALSUBOBJ optional
    returning
      value(RETURNING) type ref to ZCL_oop_LOGGER .
protected section.
*"* protected components of class ZCL_OOP_LOGGER_FACTORY
*"* do not include other source files here!!!
private section.

*"* private components of class ZCL_OOP_LOGGER_FACTORY
*"* do not include other source files here!!!
  class-data LOGGER type ref to ZCL_oop_LOGGER .
ENDCLASS.



CLASS ZCL_OOP_LOGGER_FACTORY IMPLEMENTATION.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Static Public Method ZCL_OOP_LOGGER_FACTORY=>CREATE_CUSTOM_LOG
* +-------------------------------------------------------------------------------------------------+
* | [--->] OBJECT                         TYPE        BALOBJ_D
* | [--->] SUBOBJECT                      TYPE        BALSUBOBJ
* | [<-()] RETURNING                      TYPE REF TO ZCL_oop_LOGGER
* +--------------------------------------------------------------------------------------</SIGNATURE>
method create_custom_log.
  data custom_logger type ref to ZCL_oop_LOGGER.
  create object custom_logger
    exporting
      log_object    = object
      log_subobject = subobject.
  returning = custom_logger.
endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Static Public Method ZCL_OOP_LOGGER_FACTORY=>GET_EXISTING_LOG
* +-------------------------------------------------------------------------------------------------+
* | [--->] LOG_NUMBER                     TYPE        BALOGNR
* | [<-()] RETURNING                      TYPE REF TO ZCL_oop_LOGGER
* +--------------------------------------------------------------------------------------</SIGNATURE>
method get_existing_log.
  data logging_repository type ref to ZCL_oop_LOGGING_REPO_HTTP.
  create object logging_repository.
  returning = logging_repository->find_by_id( log_number ).
endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Static Public Method ZCL_OOP_LOGGER_FACTORY=>GET_SESSION_LOG
* +-------------------------------------------------------------------------------------------------+
* | [--->] OBJECT                         TYPE        BALOBJ_D(optional)
* | [--->] SUBOBJECT                      TYPE        BALSUBOBJ(optional)
* | [<-()] RETURNING                      TYPE REF TO ZCL_oop_LOGGER
* +--------------------------------------------------------------------------------------</SIGNATURE>
method get_session_log.
  if ZCL_OOP_LOGGER_FACTORY=>logger is not bound.
    ZCL_OOP_LOGGER_FACTORY=>logger = ZCL_OOP_LOGGER_FACTORY=>create_custom_log( object = object subobject = subobject ).
  endif.
  returning = ZCL_OOP_LOGGER_FACTORY=>logger.
endmethod.
ENDCLASS.

