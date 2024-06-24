CLASS ztdbp_po_create DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZTDBP_PO_CREATE IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA:
      create_po_headers TYPE TABLE FOR CREATE i_purchaseordertp_2,
      create_po_header  TYPE STRUCTURE FOR CREATE i_purchaseordertp_2,
      create_po_items   TYPE TABLE FOR CREATE i_purchaseordertp_2\_purchaseorderitem,
      create_po_item    TYPE STRUCTURE FOR CREATE i_purchaseordertp_2\_purchaseorderitem.

    DATA cid TYPE abp_behv_cid.
    DATA(n) = 0.
    DATA(n2) = 0.

*    DO 2 TIMES.
    n += 1.
    n2 += 1.
    cid = |PO_{ n }|.

*      clear po_header.
    create_po_header = VALUE #(
          %cid                    = cid
           purchaseordertype      = 'NB'
           companycode            = '6310'
           purchasingorganization = '6310'
           purchasinggroup        = '001'
*           supplier               = '0063300002'
           supplier               = '0063300001'
           %control = VALUE #( purchaseordertype      = cl_abap_behv=>flag_changed
                               companycode            = cl_abap_behv=>flag_changed
                               purchasingorganization = cl_abap_behv=>flag_changed
                               purchasinggroup        = cl_abap_behv=>flag_changed
                               supplier               = cl_abap_behv=>flag_changed
                               )
                               ).

    APPEND create_po_header TO create_po_headers.

*      CLEAR purchase_order_item.
    create_po_item = VALUE #(
                                    %cid_ref = cid
                                 %target = VALUE #( ( %cid = |PO_ITEM{ n2 }|
*                                                      material = 'RM019'
                                                      material = 'RM013'
                                                      plant = 6310
                                                      orderquantity = 30
                                                      purchaseorderitem = '00010'
                                                      netpriceamount = '1'

                                  %control = VALUE #( material          = cl_abap_behv=>flag_changed
                                                      plant             = cl_abap_behv=>flag_changed
                                                      orderquantity     = cl_abap_behv=>flag_changed
                                                      purchaseorderitem = cl_abap_behv=>flag_changed
                                                      netpriceamount    = cl_abap_behv=>flag_changed
                                                      )
                                                      ) )  ).
    APPEND create_po_item TO create_po_items.
*    ENDDO.

    MODIFY ENTITIES OF i_purchaseordertp_2
    ENTITY purchaseorder
    CREATE
*    fields (
*             purchaseordertype
*             companycode
*             purchasingorganization
*             purchasinggroup
*             supplier
*     )
    FROM
*    with
    create_po_headers
*    SET FIELDS WITH VALUE #(
*    ( %cid                   = cid
*      purchaseordertype      = 'NB'
*      companycode            = '2000'
*      purchasingorganization = '2000'
*      purchasinggroup        = '001'
*      supplier               = '0000100003' ) )

    CREATE BY \_purchaseorderitem
*    FIELDS (
*               material
*               plant
*               orderquantity
**               purchaseorderitem
*               netpriceamount
*    )
    FROM
*    with
    create_po_items

    MAPPED DATA(mapped_po_headers)
    REPORTED DATA(reported_po_headers)
    FAILED DATA(failed_po_headers).

    IF failed_po_headers IS NOT INITIAL.
      LOOP AT reported_po_headers-purchaseorderitem ASSIGNING FIELD-SYMBOL(<ls_po_reported>).
        DATA(lv_result) = <ls_po_reported>-%msg->if_message~get_text( ).
        out->write( 'EML PO Item Error' ).
        out->write( lv_result ).
      ENDLOOP.

      LOOP AT reported_po_headers-purchaseorder ASSIGNING FIELD-SYMBOL(<ls_po_reported2>).
        DATA(lv_result2) = <ls_po_reported2>-%msg->if_message~get_text( ).
        out->write( 'EML PO Header Error' ).
        out->write( lv_result2 ).
      ENDLOOP.

    ELSE.
      COMMIT ENTITIES BEGIN
       RESPONSE OF i_purchaseordertp_2
       FAILED DATA(lt_commit_failed)
       REPORTED DATA(lt_commit_reported).

      IF lt_commit_failed IS NOT INITIAL.
        LOOP AT lt_commit_reported-purchaseorderitem ASSIGNING FIELD-SYMBOL(<fs_po_mapped2>).
          DATA(lv_result3) = <fs_po_mapped2>-%msg->if_message~get_text( ).
          out->write( 'Commit Error' ).
          out->write( lv_result3 ).
        ENDLOOP.
      ELSE.
        LOOP AT mapped_po_headers-purchaseorder ASSIGNING FIELD-SYMBOL(<fs_po_mapped>).
          CONVERT KEY OF i_purchaseordertp_2 FROM <fs_po_mapped>-%pid TO DATA(ls_po_key).
          out->write( 'Purchase Order:'  && ls_po_key-PurchaseOrder ).
        ENDLOOP.
      ENDIF.

      COMMIT ENTITIES END.
    ENDIF.

  ENDMETHOD.
ENDCLASS.
