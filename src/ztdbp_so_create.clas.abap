CLASS ztdbp_so_create DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZTDBP_SO_CREATE IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

*************************************************************************************
    "Create Sales Order with Item and price element
*************************************************************************************

    DATA:
      create_so_headers       TYPE TABLE FOR CREATE i_salesordertp,
      create_so_header        LIKE LINE OF create_so_headers,
      create_so_items         TYPE TABLE FOR CREATE i_salesordertp\_item,
      create_so_item          LIKE LINE OF create_so_items,
      create_so_item_price_es TYPE TABLE FOR CREATE i_salesorderitemtp\_itempricingelement,
      create_so_item_price_e  LIKE LINE OF create_so_item_price_es.

    DATA cid TYPE abp_behv_cid.
    DATA(n) = 0.
    DATA(n2) = 0.

    n += 1.
    n2 += 1.
    cid = |SO_{ n }|.

    CLEAR create_so_header.
    create_so_header = VALUE #(
                %cid                    = 'SO1'
                salesordertype          = 'TA'
                soldtoparty             = '0063100002'
                salesorganization       = '6310'
                distributionchannel     = '10'
                organizationdivision    = '00'
                salesoffice             = '630'
                salesgroup              = ''
                salesdistrict           = ''
                purchaseorderbycustomer = 'Neil_Test_0816'
                requesteddeliverydate   = '20230816'
                customergroup           = '01'
                %control = VALUE #(
                                    salesordertype          = cl_abap_behv=>flag_changed
                                    soldtoparty             = cl_abap_behv=>flag_changed
                                    salesorganization       = cl_abap_behv=>flag_changed
                                    distributionchannel     = cl_abap_behv=>flag_changed
                                    organizationdivision    = cl_abap_behv=>flag_changed
                                    salesoffice             = cl_abap_behv=>flag_changed
                                    salesgroup              = cl_abap_behv=>flag_changed
                                    salesdistrict           = cl_abap_behv=>flag_changed
                                    purchaseorderbycustomer = cl_abap_behv=>flag_changed
                                    requesteddeliverydate   = cl_abap_behv=>flag_changed
                                    customergroup           = cl_abap_behv=>flag_changed
                                                           ) ).
    APPEND create_so_header TO create_so_headers.

    CLEAR create_so_item.
    create_so_item = VALUE #(  %cid_ref = 'SO1'
                                 %target = VALUE #( ( %cid = |SO_ITEM{ n2 }|
                                                             product = 'RM019'
                                              salesorderitemcategory = 'TAN'
                                                        productgroup = 'L002'
                                               requesteddeliverydate = '20230816'
                                                   requestedquantity = '1.000'

                                                         pricingdate = '20230816'
                                                 billingdocumentdate = '20230816'
                                                               plant = '6310'
                                                       shippingpoint = '6310'
                                                customerpaymentterms = '0004'
                                                        profitcenter = 'YB111'

                                  %control = VALUE #(
                                                      product = cl_abap_behv=>flag_changed
                                       salesorderitemcategory = cl_abap_behv=>flag_changed
                                                 productgroup = cl_abap_behv=>flag_changed
                                        requesteddeliverydate = cl_abap_behv=>flag_changed
                                            requestedquantity = cl_abap_behv=>flag_changed

                                                  pricingdate = cl_abap_behv=>flag_changed
                                          billingdocumentdate = cl_abap_behv=>flag_changed
                                                        plant = cl_abap_behv=>flag_changed
                                                shippingpoint = cl_abap_behv=>flag_changed
                                         customerpaymentterms = cl_abap_behv=>flag_changed
                                                      ) ) )  ).
    APPEND create_so_item TO create_so_items.

    CLEAR create_so_item_price_e.
    create_so_item_price_e = VALUE #(  %cid_ref = |SO_ITEM{ n2 }|
                                 %target = VALUE #( ( %cid = 'SO_ITEM_PE1'
                                                       conditiontype = 'PPR0'
                                                 conditionrateamount = '550'
                                                   conditioncurrency = 'TWD'
                                                     conditionamount = '22'

                                  %control = VALUE #(
                                                       conditiontype = cl_abap_behv=>flag_changed
                                                 conditionrateamount = cl_abap_behv=>flag_changed
                                                   conditioncurrency = cl_abap_behv=>flag_changed
                                                     conditionamount = cl_abap_behv=>flag_changed
                                                      ) ) )  ).
    APPEND create_so_item_price_e TO create_so_item_price_es.

*    CLEAR create_so_item_price_e.
*    create_so_item_price_e = VALUE #(  %cid_ref = |SO_ITEM{ n2 }|
*                                   %target = VALUE #( ( %cid = 'SO_ITEM_PE2'
*                                                         conditiontype = 'TTX1'
*                                                   conditionrateamount = '0'
*                                                     conditioncurrency = 'TWD'
*                                                       conditionamount = '1.10'
*
*                                    %control = VALUE #(
*                                                         conditiontype = cl_abap_behv=>flag_changed
*                                                   conditionrateamount = cl_abap_behv=>flag_changed
*                                                     conditioncurrency = cl_abap_behv=>flag_changed
*                                                       conditionamount = cl_abap_behv=>flag_changed
*                                                        ) ) )  ).
*    APPEND create_so_item_price_e TO create_so_item_price_es.


    MODIFY ENTITIES OF i_salesordertp
    ENTITY salesorder
    CREATE FROM create_so_headers
*    SET FIELDS WITH VALUE #(
*    ( %cid                   = cid
*      salesordertype         = 'TA'
*      soldtoparty            = 'AC0001'
*      salesorganization      = '2000'
*      distributionchannel    = '11'
*      organizationdivision   = 'EP'
*      salesoffice            = 'D000'
*      salesgroup             = 'D01'
*      salesdistrict          = 'T01'
*      purchaseorderbycustomer = 'Neil_Test_Class2'
*      requesteddeliverydate  = '20230707'
*      customergroup          = 'BE'
*        OVERALLSDPROCESSSTATUS = 'C'
*        OVERALLDELIVERYSTATUS  = 'C'
*       ) )

    CREATE BY \_item
    FROM create_so_items

    ENTITY salesorderitem
    CREATE BY \_itempricingelement
    FROM create_so_item_price_es

      MAPPED DATA(mapped_so_headers)
    REPORTED DATA(reported_so_headers)
      FAILED DATA(failed_so_headers).

    IF failed_so_headers IS NOT INITIAL.

      LOOP AT reported_so_headers-salesorder ASSIGNING FIELD-SYMBOL(<ls_so_reported_1>).
        DATA(lv_result1) = <ls_so_reported_1>-%msg->if_message~get_text( ).
        out->write( 'EML SO Header Error' ).
        out->write( lv_result1 ).
      ENDLOOP.

      LOOP AT reported_so_headers-salesorderitem ASSIGNING FIELD-SYMBOL(<ls_so_reported_2>).
        DATA(lv_result2) = <ls_so_reported_2>-%msg->if_message~get_text( ).
        out->write( 'EML SO Item Error' ).
        out->write( lv_result2 ).
      ENDLOOP.

      LOOP AT reported_so_headers-salesorderitempricingelement ASSIGNING FIELD-SYMBOL(<ls_so_reported_3>).
        DATA(lv_result3) = <ls_so_reported_3>-%msg->if_message~get_text( ).
        out->write( 'EML SO Item Price Ele Error' ).
        out->write( lv_result3 ).
      ENDLOOP.

    ELSE.

      COMMIT ENTITIES BEGIN
       RESPONSE OF i_salesordertp
       FAILED DATA(lt_commit_failed)
       REPORTED DATA(lt_commit_reported).

      IF lt_commit_failed IS NOT INITIAL.
        LOOP AT lt_commit_reported-salesorder ASSIGNING FIELD-SYMBOL(<fs_po_mapped1>).
          DATA(lv_result4) = <fs_po_mapped1>-%msg->if_message~get_text( ).
          out->write( 'Commit Error' ).
          out->write( lv_result4 ).
        ENDLOOP.
      ELSE.

        LOOP AT mapped_so_headers-salesorder ASSIGNING FIELD-SYMBOL(<fs_so_mapped2>).
          CONVERT KEY OF i_salesordertp FROM <fs_so_mapped2>-%pid TO DATA(ls_so_key).
          out->write( 'Sales Order:'  && ls_so_key-salesorder ).
        ENDLOOP.

      ENDIF.

      COMMIT ENTITIES END.

    ENDIF.
  ENDMETHOD.
ENDCLASS.
