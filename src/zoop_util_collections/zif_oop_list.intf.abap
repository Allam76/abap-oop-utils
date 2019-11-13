interface ZIF_OOP_LIST
  public .


  interfaces ZIF_oop_COLLECTION .

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

  methods ADDAT
    importing
      !INDEX type I
      !ELEMENT type ref to ZCL_oop_OBJECT .
  type-pools ABAP .
  methods ADDALLAT
    importing
      !INDEX type I
      !COLLECTION type ref to ZIF_oop_COLLECTION
    returning
      value(RETURNING) type ABAP_BOOL .
  methods GET
    importing
      !INDEX type I
    returning
      value(RETURNING) type ref to ZCL_oop_OBJECT .
  methods INDEXOF
    importing
      !OBJECT type ref to ZCL_oop_OBJECT
    returning
      value(RETURNING) type I .
  methods LASTINDEXOF
    importing
      !OBJECT type ref to ZCL_oop_OBJECT
    returning
      value(RETURNING) type I .
  methods LISTITERATOR
    returning
      value(RETURNING) type ref to ZIF_OOP_LISTITERATOR .
  methods LISTITERATORAT
    importing
      !INDEX type I
    returning
      value(RETURNING) type ref to ZIF_OOP_LISTITERATOR .
  methods REMOVEAT
    importing
      !INDEX type I
    returning
      value(RETURNING) type ref to ZCL_oop_OBJECT .
  methods SET
    importing
      !INDEX type I
      !ELEMENT type ref to ZCL_oop_OBJECT
    returning
      value(RETURNING) type ref to ZCL_oop_OBJECT .
endinterface.
