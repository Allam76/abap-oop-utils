class ZCL_OOP_ABSTRACTLIST definition
  public
  inheriting from ZCL_oop_ABSTRACTCOLLECTION
  abstract
  create public .

public section.

*"* public components of class ZCL_OOP_ABSTRACTLIST
*"* do not include other source files here!!!
  interfaces ZIF_oop_LIST
      abstract methods GET .

  aliases ADDALLAT
    for ZIF_oop_LIST~ADDALLAT .
  aliases ADDAT
    for ZIF_oop_LIST~ADDAT .
  aliases GET
    for ZIF_oop_LIST~GET .
  aliases INDEXOF
    for ZIF_oop_LIST~INDEXOF .
  aliases LASTINDEXOF
    for ZIF_oop_LIST~LASTINDEXOF .
  aliases LISTITERATOR
    for ZIF_oop_LIST~LISTITERATOR .
  aliases LISTITERATORAT
    for ZIF_oop_LIST~LISTITERATORAT .
  aliases REMOVEAT
    for ZIF_oop_LIST~REMOVEAT .
  aliases SET
    for ZIF_oop_LIST~SET .

  methods ZIF_oop_COLLECTION~ADD
    redefinition .
  methods ZIF_oop_COLLECTION~CLEAR
    redefinition .
  methods ZIF_oop_COLLECTION~ITERATOR
    redefinition .
  methods EQUALS
    redefinition .
protected section.

*"* protected components of class ZCL_OOP_ABSTRACTLIST
*"* do not include other source files here!!!
  data MODCOUNT type I value 0. "#EC NOTEXT . " .

  methods REMOVERANGE
    importing
      !FROMINDEX type I
      !TOINDEX type I .
private section.
*"* private components of class ZCL_OOP_ABSTRACTLIST
*"* do not include other source files here!!!
ENDCLASS.



CLASS ZCL_OOP_ABSTRACTLIST IMPLEMENTATION.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_OOP_ABSTRACTLIST->ZIF_oop_COLLECTION~ADD
* +-------------------------------------------------------------------------------------------------+
* | [--->] ELEMENT                        TYPE REF TO zcl_oop_object
* | [<-()] RETURNING                      TYPE        ABAP_BOOL
* +--------------------------------------------------------------------------------------</SIGNATURE>
method ZIF_oop_COLLECTION~add.
  data index type i.
  index = me->size( ).
  me->addat( index = index element = element ).
endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_OOP_ABSTRACTLIST->ZIF_oop_COLLECTION~CLEAR
* +-------------------------------------------------------------------------------------------------+
* +--------------------------------------------------------------------------------------</SIGNATURE>
method ZIF_oop_COLLECTION~clear.
  data size type i.
  size = me->size( ).
  me->removerange( fromindex = 0 toindex = size ).
endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_OOP_ABSTRACTLIST->ZIF_oop_COLLECTION~ITERATOR
* +-------------------------------------------------------------------------------------------------+
* | [<-()] RETURNING                      TYPE REF TO ZIF_oop_ITERATOR
* +--------------------------------------------------------------------------------------</SIGNATURE>
method ZIF_oop_COLLECTION~iterator.
  data iterator type ref to lcl_iterator.
  create object iterator
    exporting
      enclosinglist = me.
  returning = iterator.
endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_OOP_ABSTRACTLIST->ZIF_oop_LIST~ADDALLAT
* +-------------------------------------------------------------------------------------------------+
* | [--->] INDEX                          TYPE        I
* | [--->] COLLECTION                     TYPE REF TO ZIF_oop_COLLECTION
* | [<-()] RETURNING                      TYPE        ABAP_BOOL
* +--------------------------------------------------------------------------------------</SIGNATURE>
method ZIF_oop_LIST~addallat.
  data newindex type i.
  newindex = index.
  data modified type abap_bool.
  modified = abap_false.
  data iterator type ref to zif_oop_iterator.
  iterator = collection->iterator( ).
  while iterator->hasnext( ) = abap_true.
    data next type ref to zcl_oop_object.
    next = iterator->next( ).
    me->addat( index = newindex element = next ).
    newindex = newindex + 1.
    modified = abap_true.
  endwhile.
  returning = modified.
endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_OOP_ABSTRACTLIST->ZIF_oop_LIST~ADDAT
* +-------------------------------------------------------------------------------------------------+
* | [--->] INDEX                          TYPE        I
* | [--->] ELEMENT                        TYPE REF TO zcl_oop_object
* +--------------------------------------------------------------------------------------</SIGNATURE>
method ZIF_oop_LIST~addat.
  raise exception type zcx_oop_unsupportedoperation.
endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_OOP_ABSTRACTLIST->ZIF_oop_LIST~INDEXOF
* +-------------------------------------------------------------------------------------------------+
* | [--->] OBJECT                         TYPE REF TO zcl_oop_object
* | [<-()] RETURNING                      TYPE        I
* +--------------------------------------------------------------------------------------</SIGNATURE>
method ZIF_oop_LIST~indexof.
  " Returns the index of the first match
  data listiterator type ref to ZIF_oop_LISTiterator.
  listiterator = me->listiterator( ).
  if object is not bound.
    while listiterator->hasnext( ) = abap_true.
      if object = listiterator->next( ).
        returning = listiterator->previousindex( ).
        return.
      endif.
    endwhile.
  else.
    while listiterator->hasnext( ) = abap_true.
      data obj type ref to zcl_oop_object.
      obj = listiterator->next( ).
      if obj->equals( object ) = abap_true.
        returning = listiterator->previousindex( ).
        return.
      endif.
    endwhile.
  endif.
  " Return -1 if the object is not found
  returning = -1.
  return.
endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_OOP_ABSTRACTLIST->ZIF_oop_LIST~LASTINDEXOF
* +-------------------------------------------------------------------------------------------------+
* | [--->] OBJECT                         TYPE REF TO zcl_oop_object
* | [<-()] RETURNING                      TYPE        I
* +--------------------------------------------------------------------------------------</SIGNATURE>
method ZIF_oop_LIST~lastindexof.
  " Returns the index of the first match
  data index type i.
  index = me->size( ).
  data listiterator type ref to ZIF_oop_LISTiterator.
  listiterator = me->listiteratorat( index ).
  if object is not bound.
    while listiterator->hasprevious( ) = abap_true.
      if object = listiterator->previous( ).
        returning = listiterator->nextindex( ).
        return.
      endif.
    endwhile.
  else.
    while listiterator->hasprevious( ) = abap_true.
      data obj type ref to zcl_oop_object.
      obj = listiterator->previous( ).
      if obj->equals( object ) = abap_true.
        returning = listiterator->nextindex( ).
        return.
      endif.
    endwhile.
  endif.
  " Return -1 if the object is not found
  returning = -1.
  return.
endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_OOP_ABSTRACTLIST->ZIF_oop_LIST~LISTITERATOR
* +-------------------------------------------------------------------------------------------------+
* | [<-()] RETURNING                      TYPE REF TO ZIF_oop_LISTITERATOR
* +--------------------------------------------------------------------------------------</SIGNATURE>
method ZIF_oop_LIST~listiterator.
  returning = me->listiteratorat( 0 ).
endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_OOP_ABSTRACTLIST->ZIF_oop_LIST~LISTITERATORAT
* +-------------------------------------------------------------------------------------------------+
* | [--->] INDEX                          TYPE        I
* | [<-()] RETURNING                      TYPE REF TO ZIF_oop_LISTITERATOR
* +--------------------------------------------------------------------------------------</SIGNATURE>
method ZIF_oop_LIST~listiteratorat.
  if index < 0 or index > me->size( ).
    raise exception type zcx_oop_indexoutofbounds.
  endif.
  data listiterator type ref to lcl_listiterator.
  create object listiterator
    exporting
      enclosinglist = me
      index         = index.
  returning = listiterator.
endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_OOP_ABSTRACTLIST->ZIF_oop_LIST~REMOVEAT
* +-------------------------------------------------------------------------------------------------+
* | [--->] INDEX                          TYPE        I
* | [<-()] RETURNING                      TYPE REF TO zcl_oop_object
* +--------------------------------------------------------------------------------------</SIGNATURE>
method ZIF_oop_LIST~removeat.
  raise exception type zcx_oop_unsupportedoperation.
endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_OOP_ABSTRACTLIST->ZIF_oop_LIST~SET
* +-------------------------------------------------------------------------------------------------+
* | [--->] INDEX                          TYPE        I
* | [--->] ELEMENT                        TYPE REF TO zcl_oop_object
* | [<-()] RETURNING                      TYPE REF TO zcl_oop_object
* +--------------------------------------------------------------------------------------</SIGNATURE>
method ZIF_oop_LIST~set.
  raise exception type zcx_oop_unsupportedoperation.
endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_OOP_ABSTRACTLIST->EQUALS
* +-------------------------------------------------------------------------------------------------+
* | [--->] OBJ                            TYPE REF TO zcl_oop_object
* | [<-()] RETURNING                      TYPE        ABAP_BOOL
* +--------------------------------------------------------------------------------------</SIGNATURE>
method equals.
  if me = obj.
    returning = abap_true.
    return.
  endif.
  data otherlist type ref to ZIF_oop_LIST.
  try.
      otherlist ?= obj.
    catch cx_sy_move_cast_error.
      returning = abap_false.
      return.
  endtry.
  " Compare each element in both lists until one of the lists (or both) have no more elements
  data it_thislist type ref to ZIF_oop_LISTiterator.
  data it_otherlist type ref to ZIF_oop_LISTiterator.
  it_thislist = me->listiterator( ).
  it_otherlist = otherlist->listiterator( ).
  while ( it_thislist->hasnext( ) = abap_true ) and ( it_otherlist->hasnext( ) = abap_true ).
    data obj_thislist type ref to zcl_oop_object.
    data obj_otherlist type ref to zcl_oop_object.
    obj_thislist = it_thislist->next( ).
    obj_otherlist = it_otherlist->next( ).
    if obj_thislist is not bound.
      if obj_otherlist is bound.
        " obj_thislist is null, but obj_otherlist is not null
        returning = abap_false.
        return.
      endif.
    else.
      if obj_otherlist is not bound.
        " obj_thislist is not null, but obj_otherlist is null
        returning = abap_false.
        return.
      endif.
      " both are not null, compare using equals method
      if obj_thislist->equals( obj_otherlist ) = abap_false.
        returning = abap_false.
        return.
      endif.
    endif.
  endwhile.
  " If one of the lists still has remaining elements at this point, then they are not equal
  if ( it_thislist->hasnext( ) = abap_true ) or ( it_otherlist->hasnext( ) = abap_true ).
    returning = abap_false.
    return.
  endif.
  " Lists are equal
  returning = abap_true.
endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Protected Method ZCL_OOP_ABSTRACTLIST->REMOVERANGE
* +-------------------------------------------------------------------------------------------------+
* | [--->] FROMINDEX                      TYPE        I
* | [--->] TOINDEX                        TYPE        I
* +--------------------------------------------------------------------------------------</SIGNATURE>
method removerange.
  data listiterator type ref to ZIF_oop_LISTiterator.
  listiterator = me->listiteratorat( fromindex ).
  data count type i.
  count = toindex - fromindex.
  if count > 0.
    do count times.
      listiterator->next( ).
      listiterator->remove( ).
    enddo.
  endif.
endmethod.
ENDCLASS.

