interface ZIF_OOP_COLLECTION
  public .


  type-pools ABAP .
  methods ADD
    importing
      !ELEMENT type ref to ZCL_oop_OBJECT
    returning
      value(RETURNING) type ABAP_BOOL .
  methods ADDALL
    importing
      !COLLECTION type ref to ZIF_OOP_COLLECTION
    returning
      value(RETURNING) type ABAP_BOOL .
  methods CLEAR .
  methods CONTAINS
    importing
      !OBJECT type ref to ZCL_oop_OBJECT
    returning
      value(RETURNING) type ABAP_BOOL .
  methods CONTAINSALL
    importing
      !COLLECTION type ref to ZIF_OOP_COLLECTION
    returning
      value(RETURNING) type ABAP_BOOL .
  methods ISEMPTY
    returning
      value(RETURNING) type ABAP_BOOL .
  methods ITERATOR
    returning
      value(RETURNING) type ref to ZIF_oop_ITERATOR .
  methods REMOVE
    importing
      !OBJECT type ref to ZCL_oop_OBJECT
    returning
      value(RETURNING) type ABAP_BOOL .
  methods REMOVEALL
    importing
      !COLLECTION type ref to ZIF_OOP_COLLECTION
    returning
      value(RETURNING) type ABAP_BOOL .
  methods RETAINALL
    importing
      !COLLECTION type ref to ZIF_OOP_COLLECTION
    returning
      value(RETURNING) type ABAP_BOOL .
  methods SIZE
    returning
      value(RETURNING) type I .
  methods TOARRAY
    returning
      value(RETURNING) type Zoop_util_ARRAY .
endinterface.
