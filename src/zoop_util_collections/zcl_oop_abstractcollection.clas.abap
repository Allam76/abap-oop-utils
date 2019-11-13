class ZCL_OOP_ABSTRACTCOLLECTION definition
  public
  inheriting from ZCL_OOP_OBJECT
  abstract
  create public .

public section.

*"* public components of class ZCL_OOP_ABSTRACTCOLLECTION
*"* do not include other source files here!!!
  interfaces ZIF_OOP_COLLECTION
      abstract methods ITERATOR
                       SIZE .

  aliases ADD
    for ZIF_oop_COLLECTION~ADD .
  aliases ADDALL
    for ZIF_oop_COLLECTION~ADDALL .
  aliases CLEAR
    for ZIF_oop_COLLECTION~CLEAR .
  aliases CONTAINS
    for ZIF_oop_COLLECTION~CONTAINS .
  aliases CONTAINSALL
    for ZIF_oop_COLLECTION~CONTAINSALL .
  aliases ISEMPTY
    for ZIF_oop_COLLECTION~ISEMPTY .
  aliases ITERATOR
    for ZIF_oop_COLLECTION~ITERATOR .
  aliases REMOVE
    for ZIF_oop_COLLECTION~REMOVE .
  aliases REMOVEALL
    for ZIF_oop_COLLECTION~REMOVEALL .
  aliases RETAINALL
    for ZIF_oop_COLLECTION~RETAINALL .
  aliases SIZE
    for ZIF_oop_COLLECTION~SIZE .
  aliases TOARRAY
    for ZIF_oop_COLLECTION~TOARRAY .
protected section.
*"* protected components of class ZCL_OOP_ABSTRACTCOLLECTION
*"* do not include other source files here!!!
private section.
*"* private components of class ZCL_OOP_ABSTRACTCOLLECTION
*"* do not include other source files here!!!
ENDCLASS.



CLASS ZCL_OOP_ABSTRACTCOLLECTION IMPLEMENTATION.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_OOP_ABSTRACTCOLLECTION->ZIF_oop_COLLECTION~ADD
* +-------------------------------------------------------------------------------------------------+
* | [--->] ELEMENT                        TYPE REF TO zcl_oop_object
* | [<-()] RETURNING                      TYPE        ABAP_BOOL
* +--------------------------------------------------------------------------------------</SIGNATURE>
method ZIF_oop_COLLECTION~add.
*  raise exception type zcx_oop_unsupportedoperation.
endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_OOP_ABSTRACTCOLLECTION->ZIF_oop_COLLECTION~ADDALL
* +-------------------------------------------------------------------------------------------------+
* | [--->] COLLECTION                     TYPE REF TO ZIF_oop_COLLECTION
* | [<-()] RETURNING                      TYPE        ABAP_BOOL
* +--------------------------------------------------------------------------------------</SIGNATURE>
method ZIF_oop_COLLECTION~addall.
  data modified type abap_bool.
  modified = abap_false.
  data iterator type ref to zif_oop_iterator.
  iterator = collection->iterator( ).
  while iterator->hasnext( ) = abap_true.
    data next type ref to zcl_oop_object.
    next = iterator->next( ).
    if me->add( next ) = abap_true.
      modified = abap_true.
    endif.
  endwhile.
  returning = modified.
endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_OOP_ABSTRACTCOLLECTION->ZIF_oop_COLLECTION~CLEAR
* +-------------------------------------------------------------------------------------------------+
* +--------------------------------------------------------------------------------------</SIGNATURE>
method ZIF_oop_COLLECTION~clear.
  data iterator type ref to zif_oop_iterator.
  iterator = me->iterator( ).
  while iterator->hasnext( ) = abap_true.
    iterator->next( ).
    iterator->remove( ).
  endwhile.
endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_OOP_ABSTRACTCOLLECTION->ZIF_oop_COLLECTION~CONTAINS
* +-------------------------------------------------------------------------------------------------+
* | [--->] OBJECT                         TYPE REF TO zcl_oop_object
* | [<-()] RETURNING                      TYPE        ABAP_BOOL
* +--------------------------------------------------------------------------------------</SIGNATURE>
method ZIF_oop_COLLECTION~contains.
  data iterator type ref to zif_oop_iterator.
  iterator = me->iterator( ).
  if object is not bound.
    while iterator->hasnext( ) = abap_true.
      if object = iterator->next( ).
        returning = abap_true.
        return.
      endif.
    endwhile.
  else.
    while iterator->hasnext( ) = abap_true.
      data obj type ref to zcl_oop_object.
      obj = iterator->next( ).
      if obj->equals( object ) = abap_true.
        returning = abap_true.
        return.
      endif.
    endwhile.
  endif.
  " Return false if the object is not found
  returning = abap_false.
  return.
endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_OOP_ABSTRACTCOLLECTION->ZIF_oop_COLLECTION~CONTAINSALL
* +-------------------------------------------------------------------------------------------------+
* | [--->] COLLECTION                     TYPE REF TO ZIF_oop_COLLECTION
* | [<-()] RETURNING                      TYPE        ABAP_BOOL
* +--------------------------------------------------------------------------------------</SIGNATURE>
method ZIF_oop_COLLECTION~containsall.
  data iterator type ref to zif_oop_iterator.
  iterator = collection->iterator( ).
  while iterator->hasnext( ) = abap_true.
    data next type ref to zcl_oop_object.
    next = iterator->next( ).
    if me->contains( next ) = abap_false.
      returning = abap_false.
      return.
    endif.
  endwhile.
  returning = abap_true.
endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_OOP_ABSTRACTCOLLECTION->ZIF_oop_COLLECTION~ISEMPTY
* +-------------------------------------------------------------------------------------------------+
* | [<-()] RETURNING                      TYPE        ABAP_BOOL
* +--------------------------------------------------------------------------------------</SIGNATURE>
method ZIF_oop_COLLECTION~isempty.
  if me->size( ) = 0.
    returning = abap_true.
    return.
  endif.
  returning = abap_false.
endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_OOP_ABSTRACTCOLLECTION->ZIF_oop_COLLECTION~REMOVE
* +-------------------------------------------------------------------------------------------------+
* | [--->] OBJECT                         TYPE REF TO zcl_oop_object
* | [<-()] RETURNING                      TYPE        ABAP_BOOL
* +--------------------------------------------------------------------------------------</SIGNATURE>
method ZIF_oop_COLLECTION~remove.
  data iterator type ref to zif_oop_iterator.
  iterator = me->iterator( ).
  if object is not bound.
    while iterator->hasnext( ) = abap_true.
      if object = iterator->next( ).
        iterator->remove( ).
        returning = abap_true.
        return.
      endif.
    endwhile.
  else.
    while iterator->hasnext( ) = abap_true.
      data obj type ref to zcl_oop_object.
      obj = iterator->next( ).
      if obj->equals( object ) = abap_true.
        iterator->remove( ).
        returning = abap_true.
        return.
      endif.
    endwhile.
  endif.
  " Return false if the object is not found
  returning = abap_false.
  return.
endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_OOP_ABSTRACTCOLLECTION->ZIF_oop_COLLECTION~REMOVEALL
* +-------------------------------------------------------------------------------------------------+
* | [--->] COLLECTION                     TYPE REF TO ZIF_oop_COLLECTION
* | [<-()] RETURNING                      TYPE        ABAP_BOOL
* +--------------------------------------------------------------------------------------</SIGNATURE>
method ZIF_oop_COLLECTION~removeall.
  data modified type abap_bool.
  modified = abap_false.
  data iterator type ref to zif_oop_iterator.
  iterator = me->iterator( ).
  while iterator->hasnext( ) = abap_true.
    data next type ref to zcl_oop_object.
    next = iterator->next( ).
    if collection->contains( next ) = abap_true.
      iterator->remove( ).
      modified = abap_true.
    endif.
  endwhile.
  returning = modified.
endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_OOP_ABSTRACTCOLLECTION->ZIF_oop_COLLECTION~RETAINALL
* +-------------------------------------------------------------------------------------------------+
* | [--->] COLLECTION                     TYPE REF TO ZIF_oop_COLLECTION
* | [<-()] RETURNING                      TYPE        ABAP_BOOL
* +--------------------------------------------------------------------------------------</SIGNATURE>
method ZIF_oop_COLLECTION~retainall.
  data modified type abap_bool.
  modified = abap_false.
  data iterator type ref to zif_oop_iterator.
  iterator = me->iterator( ).
  while iterator->hasnext( ) = abap_true.
    data next type ref to zcl_oop_object.
    next = iterator->next( ).
    if collection->contains( next ) = abap_false.
      iterator->remove( ).
      modified = abap_true.
    endif.
  endwhile.
  returning = modified.
endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_OOP_ABSTRACTCOLLECTION->ZIF_oop_COLLECTION~TOARRAY
* +-------------------------------------------------------------------------------------------------+
* | [<-()] RETURNING                      TYPE        ZARRAY
* +--------------------------------------------------------------------------------------</SIGNATURE>
method ZIF_oop_COLLECTION~toarray.
  data array type zoop_util_array.
  data iterator type ref to zif_oop_iterator.
  iterator = me->iterator( ).
  while iterator->hasnext( ) = abap_true.
    data next type ref to zcl_oop_object.
    next = iterator->next( ).
    append next to array.
  endwhile.
  returning = array.
endmethod.
ENDCLASS.

