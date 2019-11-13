class ZCX_OOP_CLONENOTSUPPORTED definition
  public
  inheriting from ZCX_oop_RUNTIMEEXCEPTION
  final
  create public .

public section.

  constants ZCX_OOP_CLONENOTSUPPORTED type SOTR_CONC value '00155D334B0D1EE2B8FD3A94F7EE2991'. "#EC NOTEXT

  methods CONSTRUCTOR
    importing
      !TEXTID like TEXTID optional
      !PREVIOUS like PREVIOUS optional
      !MESSAGE type STRING optional .
protected section.
private section.
ENDCLASS.



CLASS ZCX_OOP_CLONENOTSUPPORTED IMPLEMENTATION.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCX_OOP_CLONENOTSUPPORTED->CONSTRUCTOR
* +-------------------------------------------------------------------------------------------------+
* | [--->] TEXTID                         LIKE        TEXTID(optional)
* | [--->] PREVIOUS                       LIKE        PREVIOUS(optional)
* | [--->] MESSAGE                        TYPE        STRING(optional)
* +--------------------------------------------------------------------------------------</SIGNATURE>
method CONSTRUCTOR ##ADT_SUPPRESS_GENERATION.
CALL METHOD SUPER->CONSTRUCTOR
EXPORTING
TEXTID = TEXTID
PREVIOUS = PREVIOUS
MESSAGE = MESSAGE
.
 IF textid IS INITIAL.
   me->textid = ZCX_OOP_CLONENOTSUPPORTED .
 ENDIF.
endmethod.
ENDCLASS.

