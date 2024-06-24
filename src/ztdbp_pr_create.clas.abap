CLASS ztdbp_pr_create DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZTDBP_PR_CREATE IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA:
    purchase_requisitions      TYPE TABLE FOR CREATE i_purchaserequisitiontp,
    purchase_requisition       LIKE LINE OF purchase_requisitions,
    purchase_requisition_items TYPE TABLE FOR CREATE i_purchaserequisitiontp\_purchaserequisitionitem,
    purchase_requisition_item  LIKE LINE OF purchase_requisition_items.

    DATA n TYPE i.
    DATA n2 TYPE i.

*    DO 2 TIMES.
    n += 1.
    n2 += 1.

    purchase_requisition = VALUE #(
                                    %cid                    = |My%CID_{ n }|
                                    purchaserequisitiontype = 'NB'
                                    %control = VALUE #(
                                                       purchaserequisitiontype  = cl_abap_behv=>flag_changed
                                                       ) ).
    APPEND purchase_requisition TO purchase_requisitions.

    "purchase requisition item 1
    purchase_requisition_item = VALUE #(
                                      %cid_ref = |My%CID_{ n }|
                                      %target  = VALUE #(  (
                                                    %cid                         = |My%CID_ITEM{ n2 }|
                                                    plant                        = '6310'
                                                    material                     = 'RM019'
                                                    accountassignmentcategory    = 'U'
                                                    requestedquantity            = '7'
                                                    purreqnitemcurrency          = 'TWD'
                                                    purchaserequisitionprice     = 1
                                                    materialgroup                = 'L002'
                                                    purchasinggroup              = '001'
                                                    purchasingorganization       = '6310'
                                      %control = VALUE #(
                                                       plant                         = cl_abap_behv=>flag_changed
                                                       material                      = cl_abap_behv=>flag_changed
                                                       accountassignmentcategory     = cl_abap_behv=>flag_changed
                                                       requestedquantity             = cl_abap_behv=>flag_changed
                                                       purreqnitemcurrency           = cl_abap_behv=>flag_changed
                                                       purchaserequisitionprice      = cl_abap_behv=>flag_changed
                                                       materialgroup                 = cl_abap_behv=>flag_changed
                                                       purchasinggroup               = cl_abap_behv=>flag_changed
                                                       purchasingorganization        = cl_abap_behv=>flag_changed
                                                      ) ) ) ).
    APPEND purchase_requisition_item TO purchase_requisition_items.

*      n2 += 1.
*      "purchase requisition item 2
*      purchase_requisition_item = VALUE #(
*                                        %cid_ref = |My%CID_{ n }|
*                                        %target  = VALUE #(  (
*                                                      %cid                         = |My%CID_ITEM{ n2 }|
*                                                      plant                        = '6310'  "Plant 01 (DE)
*                                                      material                     = '0000000000000RM019'
*                                                      accountassignmentcategory    = 'U'  "unknown
*                                                      requestedquantity            = '7'
*                                                      purreqnitemcurrency          = 'TWD'
*                                                      purchaserequisitionprice     = 15
*                                                      materialgroup                = 'L002'
*                                                      purchasinggroup              = '001'
*                                                      purchasingorganization       = '6310'
*                                        %control = VALUE #(
*                                                         plant                         = cl_abap_behv=>flag_changed
*                                                         material                      = cl_abap_behv=>flag_changed
*                                                         accountassignmentcategory     = cl_abap_behv=>flag_changed
*                                                         requestedquantity             = cl_abap_behv=>flag_changed
*                                                         purreqnitemcurrency           = cl_abap_behv=>flag_changed
*                                                         purchaserequisitionprice      = cl_abap_behv=>flag_changed
*                                                         materialgroup                 = cl_abap_behv=>flag_changed
*                                                         purchasinggroup               = cl_abap_behv=>flag_changed
*                                                         purchasingorganization        = cl_abap_behv=>flag_changed
*                                                        ) ) ) ).
*      APPEND purchase_requisition_item TO purchase_requisition_items.
*    ENDDO.

    "EML deep create statement
    MODIFY ENTITIES OF i_purchaserequisitiontp
    ENTITY purchaserequisition
    CREATE FROM purchase_requisitions
    CREATE BY \_purchaserequisitionitem
    FROM purchase_requisition_items

      REPORTED DATA(reported_create_pr)
      MAPPED DATA(mapped_create_pr)
      FAILED DATA(failed_create_pr)
        .

    IF failed_create_pr IS NOT INITIAL.
      LOOP AT reported_create_pr-purchaserequisitionitem ASSIGNING FIELD-SYMBOL(<ls_pr_reported>).
        DATA(lv_result) = <ls_pr_reported>-%msg->if_message~get_text( ).
        out->write( 'EML PR Item Error' ).
        out->write( lv_result ).
      ENDLOOP.

      LOOP AT reported_create_pr-purchaserequisition ASSIGNING FIELD-SYMBOL(<ls_pr_reported2>).
        DATA(lv_result2) = <ls_pr_reported2>-%msg->if_message~get_text( ).
        out->write( 'EML PR Header Error' ).
        out->write( lv_result2 ).
      ENDLOOP.

    ELSE.
      COMMIT ENTITIES BEGIN
       RESPONSE OF i_purchaserequisitiontp
       FAILED DATA(lt_commit_failed)
       REPORTED DATA(lt_commit_reported).

      IF lt_commit_failed IS NOT INITIAL.
        LOOP AT lt_commit_reported-purchaserequisitionitem ASSIGNING FIELD-SYMBOL(<fs_pr_mapped2>).
          DATA(lv_result3) = <fs_pr_mapped2>-%msg->if_message~get_text( ).
          out->write( 'Commit Error' ).
          out->write( lv_result3 ).
        ENDLOOP.
      ELSE.

        LOOP AT mapped_create_pr-purchaserequisition ASSIGNING FIELD-SYMBOL(<fs_pr_mapped>).
          CONVERT KEY OF i_purchaserequisitiontp FROM <fs_pr_mapped>-%pid TO DATA(ls_pr_key).
          out->write( 'Purchase Requisition:'  && ls_pr_key-purchaserequisition ).
        ENDLOOP.
      ENDIF.

      COMMIT ENTITIES END.
    ENDIF.

  ENDMETHOD.
ENDCLASS.
