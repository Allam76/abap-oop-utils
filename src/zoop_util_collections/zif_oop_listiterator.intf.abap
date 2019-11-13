interface ZIF_OOP_LISTITERATOR
  public .


  interfaces ZIF_oop_ITERATOR .

  aliases HASNEXT
    for ZIF_oop_ITERATOR~HASNEXT .
  aliases NEXT
    for ZIF_oop_ITERATOR~NEXT .
  aliases REMOVE
    for ZIF_oop_ITERATOR~REMOVE .

  methods ADD
    importing
      !ELEMENT type ref to ZCL_oop_OBJECT .
  type-pools ABAP .
  methods HASPREVIOUS
    returning
      value(RETURNING) type ABAP_BOOL .
  methods NEXTINDEX
    returning
      value(RETURNING) type I .
  methods PREVIOUS
    returning
      value(RETURNING) type ref to ZCL_oop_OBJECT .
  methods PREVIOUSINDEX
    returning
      value(RETURNING) type I .
  methods SET
    importing
      !ELEMENT type ref to ZCL_oop_OBJECT .
endinterface.
