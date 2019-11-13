class ZCX_OOP_URI_TOO_LONG definition
  public
  inheriting from ZCX_oop_STATICEXCEPTION
  final
  create public .

public section.

  constants ZCX_OOP_URI_TOO_LONG type SOTR_CONC value '00155D334B0D1EE2B9826796ABECE991'. "#EC NOTEXT

  methods CONSTRUCTOR
    importing
      !TEXTID like TEXTID optional
      !PREVIOUS like PREVIOUS optional
      !MESSAGE type STRING optional .
protected section.
private section.
ENDCLASS.



CLASS ZCX_OOP_URI_TOO_LONG IMPLEMENTATION.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCX_OOP_URI_TOO_LONG->CONSTRUCTOR
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
   me->textid = ZCX_OOP_URI_TOO_LONG .
 ENDIF.
endmethod.
ENDCLASS.

