class ZCX_OOP_INDEXOUTOFBOUNDS definition
  public
  inheriting from ZCX_oop_RUNTIMEEXCEPTION
  create public .

public section.

  constants ZCX_OOP_INDEXOUTOFBOUNDS type SOTR_CONC value '00155D334B0D1EE2B8FD3C3528670991'. "#EC NOTEXT

  methods CONSTRUCTOR
    importing
      !TEXTID like TEXTID optional
      !PREVIOUS like PREVIOUS optional
      !MESSAGE type STRING optional .
protected section.
private section.
ENDCLASS.



CLASS ZCX_OOP_INDEXOUTOFBOUNDS IMPLEMENTATION.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCX_OOP_INDEXOUTOFBOUNDS->CONSTRUCTOR
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
   me->textid = ZCX_OOP_INDEXOUTOFBOUNDS .
 ENDIF.
endmethod.
ENDCLASS.

