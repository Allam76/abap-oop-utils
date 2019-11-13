class ZCL_OOP_ARRAYLIST definition
  public
  inheriting from ZCL_oop_ABSTRACTLIST
  create public .

public section.

*"* public components of class ZCL_OOP_ARRAYLIST
*"* do not include other source files here!!!
  interfaces IF_SERIALIZABLE_OBJECT .

  methods CONSTRUCTOR
    importing
      !COLLECTION type ref to ZIF_oop_COLLECTION optional .

  methods ZIF_oop_COLLECTION~ADD
    redefinition .
  methods ZIF_oop_COLLECTION~ADDALL
    redefinition .
  methods ZIF_oop_COLLECTION~CLEAR
    redefinition .
  methods ZIF_oop_COLLECTION~CONTAINS
    redefinition .
  methods ZIF_oop_COLLECTION~ISEMPTY
    redefinition .
  methods ZIF_oop_COLLECTION~REMOVE
    redefinition .
  methods ZIF_oop_COLLECTION~SIZE
    redefinition .
  methods ZIF_oop_COLLECTION~TOARRAY
    redefinition .
  methods ZIF_oop_LIST~ADDALLAT
    redefinition .
  methods ZIF_oop_LIST~ADDAT
    redefinition .
  methods ZIF_oop_LIST~GET
    redefinition .
  methods ZIF_oop_LIST~INDEXOF
    redefinition .
  methods ZIF_oop_LIST~LASTINDEXOF
    redefinition .
  methods ZIF_oop_LIST~REMOVEAT
    redefinition .
  methods ZIF_oop_LIST~SET
    redefinition .
  methods CLONE
    redefinition .
protected section.

*"* protected components of class ZCL_OOP_ARRAYLIST
*"* do not include other source files here!!!
  methods REMOVERANGE
    redefinition .
private section.

*"* private components of class ZCL_OOP_ARRAYLIST
*"* do not include other source files here!!!
  data ELEMENTDATA type ZOOP_UTIL_ARRAY .
  data LISTSIZE type I .

  methods RANGECHECK
    importing
      !INDEX type I .
ENDCLASS.



CLASS ZCL_OOP_ARRAYLIST IMPLEMENTATION.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_OOP_ARRAYLIST->ZIF_oop_COLLECTION~ADD
* +-------------------------------------------------------------------------------------------------+
* | [--->] ELEMENT                        TYPE REF TO ZCL_oop_OBJECT
* | [<-()] RETURNING                      TYPE        ABAP_BOOL
* +--------------------------------------------------------------------------------------</SIGNATURE>
method ZIF_oop_COLLECTION~add.
  me->modcount = me->modcount + 1.
  me->listsize = me->listsize + 1.
  append element to me->elementdata.
  returning = abap_true.
endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_OOP_ARRAYLIST->ZIF_oop_COLLECTION~ADDALL
* +-------------------------------------------------------------------------------------------------+
* | [--->] COLLECTION                     TYPE REF TO ZIF_oop_COLLECTION
* | [<-()] RETURNING                      TYPE        ABAP_BOOL
* +--------------------------------------------------------------------------------------</SIGNATURE>
method ZIF_oop_COLLECTION~addall.
  data elementdata_to_add type zoop_util_array.
  elementdata_to_add = collection->toarray( ).
  data elementdata_to_add_size type i.
  describe table elementdata_to_add lines elementdata_to_add_size.
  me->modcount = me->modcount + 1.
  me->listsize = me->listsize + elementdata_to_add_size.
  append lines of elementdata_to_add to me->elementdata.
  if elementdata_to_add_size > 0.
    returning = abap_true.
    return.
  else.
    returning = abap_false.
    return.
  endif.
endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_OOP_ARRAYLIST->ZIF_oop_COLLECTION~CLEAR
* +-------------------------------------------------------------------------------------------------+
* +--------------------------------------------------------------------------------------</SIGNATURE>
method ZIF_oop_COLLECTION~clear.
  me->modcount = me->modcount + 1.
  free me->elementdata.
  me->listsize = 0.
endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_OOP_ARRAYLIST->ZIF_oop_COLLECTION~CONTAINS
* +-------------------------------------------------------------------------------------------------+
* | [--->] OBJECT                         TYPE REF TO ZCL_oop_OBJECT
* | [<-()] RETURNING                      TYPE        ABAP_BOOL
* +--------------------------------------------------------------------------------------</SIGNATURE>
method ZIF_oop_COLLECTION~contains.
  if me->indexof( object ) >= 0.
    returning = abap_true.
    return.
  else.
    returning = abap_false.
    return.
  endif.
endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_OOP_ARRAYLIST->ZIF_oop_COLLECTION~ISEMPTY
* +-------------------------------------------------------------------------------------------------+
* | [<-()] RETURNING                      TYPE        ABAP_BOOL
* +--------------------------------------------------------------------------------------</SIGNATURE>
method ZIF_oop_COLLECTION~isempty.
  if me->listsize = 0.
    returning = abap_true.
    return.
  endif.
  returning = abap_false.
endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_OOP_ARRAYLIST->ZIF_oop_COLLECTION~REMOVE
* +-------------------------------------------------------------------------------------------------+
* | [--->] OBJECT                         TYPE REF TO ZCL_oop_OBJECT
* | [<-()] RETURNING                      TYPE        ABAP_BOOL
* +--------------------------------------------------------------------------------------</SIGNATURE>
method ZIF_oop_COLLECTION~remove.
  " Returns the index of the first match
  if object is not bound.
    loop at me->elementdata transporting no fields where table_line is not bound.
      me->modcount = me->modcount + 1.
      me->listsize = me->listsize - 1.
      delete me->elementdata. " Removes the record at the current loop index
      returning = abap_true.
      return.
    endloop.
  else.
    data i type i value 0.
    while i < me->listsize.
      data tableindex type i.
      tableindex = i + 1.
      data obj type ref to zcl_oop_object.
      read table me->elementdata into obj index tableindex.
      if obj->equals( object ) = abap_true.
        me->modcount = me->modcount + 1.
        me->listsize = me->listsize - 1.
        delete me->elementdata index tableindex.
        returning = abap_true.
        return.
      endif.
      i = i + 1.
    endwhile.
  endif.
  " Return false if the object is not found
  returning = abap_false.
  return.
endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_OOP_ARRAYLIST->ZIF_oop_COLLECTION~SIZE
* +-------------------------------------------------------------------------------------------------+
* | [<-()] RETURNING                      TYPE        I
* +--------------------------------------------------------------------------------------</SIGNATURE>
method ZIF_oop_COLLECTION~size.
  returning = me->listsize.
endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_OOP_ARRAYLIST->ZIF_oop_COLLECTION~TOARRAY
* +-------------------------------------------------------------------------------------------------+
* | [<-()] RETURNING                      TYPE        ZARRAY
* +--------------------------------------------------------------------------------------</SIGNATURE>
method ZIF_oop_COLLECTION~toarray.
  returning = me->elementdata.
endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_OOP_ARRAYLIST->ZIF_oop_LIST~ADDALLAT
* +-------------------------------------------------------------------------------------------------+
* | [--->] INDEX                          TYPE        I
* | [--->] COLLECTION                     TYPE REF TO ZIF_oop_COLLECTION
* | [<-()] RETURNING                      TYPE        ABAP_BOOL
* +--------------------------------------------------------------------------------------</SIGNATURE>
method ZIF_oop_LIST~addallat.
  if index > me->listsize or index < 0.
    raise exception type zcx_oop_indexoutofbounds.
  endif.
  data elementdata_to_add type zoop_util_array.
  elementdata_to_add = collection->toarray( ).
  data elementdata_to_add_size type i.
  describe table elementdata_to_add lines elementdata_to_add_size.
  me->modcount = me->modcount + 1.
  me->listsize = me->listsize + elementdata_to_add_size.
  " The first element in a list has index 0.
  " Internal tables however, start with index 1.
  " So in order to insert at the right index, the number used to insert into the internal table by index, equals the specified index + 1.
  data tableindex type i.
  tableindex = index + 1.
  insert lines of elementdata_to_add into me->elementdata index tableindex.
  if elementdata_to_add_size > 0.
    returning = abap_true.
    return.
  else.
    returning = abap_false.
    return.
  endif.
endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_OOP_ARRAYLIST->ZIF_oop_LIST~ADDAT
* +-------------------------------------------------------------------------------------------------+
* | [--->] INDEX                          TYPE        I
* | [--->] ELEMENT                        TYPE REF TO ZCL_oop_OBJECT
* +--------------------------------------------------------------------------------------</SIGNATURE>
method ZIF_oop_LIST~addat.
  if index > me->listsize or index < 0.
    raise exception type zcx_oop_indexoutofbounds.
  endif.
  me->modcount = me->modcount + 1.
  me->listsize = me->listsize + 1.
  " The first element in a list has index 0.
  " Internal tables however, start with index 1.
  " So in order to insert at the right index, the number used to insert into the internal table by index, equals the specified index + 1.
  data tableindex type i.
  tableindex = index + 1.
  insert element into me->elementdata index tableindex.
endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_OOP_ARRAYLIST->ZIF_oop_LIST~GET
* +-------------------------------------------------------------------------------------------------+
* | [--->] INDEX                          TYPE        I
* | [<-()] RETURNING                      TYPE REF TO ZCL_oop_OBJECT
* +--------------------------------------------------------------------------------------</SIGNATURE>
method ZIF_oop_LIST~get.
  me->rangecheck( index ).
  " The first element in a list has index 0.
  " Internal tables however, start with index 1.
  " So in order to retrieve the correct element, the number used to read the internal table by index, equals the specified index + 1.
  data tableindex type i.
  tableindex = index + 1.
  data element type ref to zcl_oop_object.
  read table me->elementdata into element index tableindex.
  returning = element.
endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_OOP_ARRAYLIST->ZIF_oop_LIST~INDEXOF
* +-------------------------------------------------------------------------------------------------+
* | [--->] OBJECT                         TYPE REF TO ZCL_oop_OBJECT
* | [<-()] RETURNING                      TYPE        I
* +--------------------------------------------------------------------------------------</SIGNATURE>
method ZIF_oop_LIST~indexof.
  " Returns the index of the first match
  if object is not bound.
    loop at me->elementdata transporting no fields where table_line is not bound.
      returning = sy-tabix - 1. " Table index is 1 higher than array index
      clear sy-tabix.
      return.
    endloop.
  else.
    data i type i value 0.
    while i < me->listsize.
      data tableindex type i.
      tableindex = i + 1.
      data obj type ref to zcl_oop_object.
      read table me->elementdata into obj index tableindex.
      if obj->equals( object ) = abap_true.
        returning = i.
        return.
      endif.
      i = i + 1.
    endwhile.
  endif.
  " Return -1 if the object is not found
  returning = -1.
  return.
endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_OOP_ARRAYLIST->ZIF_oop_LIST~LASTINDEXOF
* +-------------------------------------------------------------------------------------------------+
* | [--->] OBJECT                         TYPE REF TO ZCL_oop_OBJECT
* | [<-()] RETURNING                      TYPE        I
* +--------------------------------------------------------------------------------------</SIGNATURE>
method ZIF_oop_LIST~lastindexof.
  " Returns the index of the last match
  if object is not bound.
    data isfound type abap_bool value abap_false.
    loop at me->elementdata transporting no fields where table_line is not bound.
      isfound = abap_true.
      returning = sy-tabix - 1. " Table index is 1 higher than array index
      " Do not exit loop, we want the index of the last match
    endloop.
    if isfound = abap_true.
      clear sy-tabix.
      return.
    endif.
  else.
    data i type i.
    i = me->listsize - 1.
    while i >= 0.
      data tableindex type i.
      tableindex = i + 1.
      data obj type ref to zcl_oop_object.
      read table me->elementdata into obj index tableindex.
      if obj->equals( object ) = abap_true.
        returning = i.
        return.
      endif.
      i = i - 1.
    endwhile.
  endif.
  " Return -1 if the object is not found
  returning = -1.
  return.
endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_OOP_ARRAYLIST->ZIF_oop_LIST~REMOVEAT
* +-------------------------------------------------------------------------------------------------+
* | [--->] INDEX                          TYPE        I
* | [<-()] RETURNING                      TYPE REF TO ZCL_oop_OBJECT
* +--------------------------------------------------------------------------------------</SIGNATURE>
method ZIF_oop_LIST~removeat.
  me->rangecheck( index ).
  me->modcount = me->modcount + 1.
  " The first element in a list has index 0.
  " Internal tables however, start with index 1.
  " So in order to retrieve the correct element, the number used to read the internal table by index, equals the specified index + 1.
  data tableindex type i.
  tableindex = index + 1.
  data element type ref to zcl_oop_object.
  read table me->elementdata into element index tableindex. " Read the element to return it after deleting it
  delete me->elementdata index tableindex. " Delete the element
  me->listsize = me->listsize - 1.
  returning = element.
  return.
endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_OOP_ARRAYLIST->ZIF_oop_LIST~SET
* +-------------------------------------------------------------------------------------------------+
* | [--->] INDEX                          TYPE        I
* | [--->] ELEMENT                        TYPE REF TO ZCL_oop_OBJECT
* | [<-()] RETURNING                      TYPE REF TO ZCL_oop_OBJECT
* +--------------------------------------------------------------------------------------</SIGNATURE>
method ZIF_oop_LIST~set.
  me->rangecheck( index ).
  " The first element in a list has index 0.
  " Internal tables however, start with index 1.
  " So in order to retrieve the correct element, the number used to read the internal table by index, equals the specified index + 1.
  data tableindex type i.
  tableindex = index + 1.
  data oldelement type ref to zcl_oop_object.
  read table me->elementdata into oldelement index tableindex. " Read the element to return it after replacing it
  modify me->elementdata from element index tableindex. " Replace the element
  returning = oldelement.
  return.
endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_OOP_ARRAYLIST->CLONE
* +-------------------------------------------------------------------------------------------------+
* | [<-()] RETURNING                      TYPE REF TO ZCL_oop_OBJECT
* +--------------------------------------------------------------------------------------</SIGNATURE>
method clone.
  data result type ref to ZCL_OOP_ARRAYLIST.
  create object result
    exporting
      collection = me.
  returning = result.
endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_OOP_ARRAYLIST->CONSTRUCTOR
* +-------------------------------------------------------------------------------------------------+
* | [--->] COLLECTION                     TYPE REF TO ZIF_oop_COLLECTION(optional)
* +--------------------------------------------------------------------------------------</SIGNATURE>
method constructor.
  super->constructor( ).
  if collection is bound.
    me->elementdata = collection->toarray( ).
    describe table me->elementdata lines me->listsize.
  endif.
endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Private Method ZCL_OOP_ARRAYLIST->RANGECHECK
* +-------------------------------------------------------------------------------------------------+
* | [--->] INDEX                          TYPE        I
* +--------------------------------------------------------------------------------------</SIGNATURE>
method rangecheck.
  if index >= me->listsize.
    raise exception type zcx_oop_indexoutofbounds.
  endif.
endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Protected Method ZCL_OOP_ARRAYLIST->REMOVERANGE
* +-------------------------------------------------------------------------------------------------+
* | [--->] FROMINDEX                      TYPE        I
* | [--->] TOINDEX                        TYPE        I
* +--------------------------------------------------------------------------------------</SIGNATURE>
method removerange.
  me->rangecheck( fromindex ).
  me->rangecheck( toindex ).
  me->modcount = me->modcount + 1.
  " The first element in a list has index 0.
  " Internal tables however, start with index 1.
  " So in order to retrieve the correct element, the number used to read the internal table by index, equals the specified index + 1.
  data tableindex type i.
  tableindex = fromindex + 1.
  data count type i.
  count = toindex - fromindex.
  do count times.
    delete me->elementdata index tableindex. " Delete the element
    tableindex = tableindex + 1.
  enddo.
  me->listsize = me->listsize - count.
endmethod.
ENDCLASS.

