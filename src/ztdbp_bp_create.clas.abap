CLASS ztdbp_bp_create DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZTDBP_BP_CREATE IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA: lt_create_partner TYPE TABLE FOR CREATE i_businesspartnertp_3,
          ls_create_partner TYPE STRUCTURE FOR CREATE i_businesspartnertp_3,

          lt_create_address TYPE TABLE FOR CREATE i_businesspartnertp_3\_businesspartneraddress,
          ls_create_address TYPE STRUCTURE FOR CREATE i_businesspartnertp_3\_businesspartneraddress,

          lt_create_email   TYPE TABLE FOR CREATE i_businesspartnertp_3\_BPAddrIndependentEmail,
          ls_create_email   TYPE STRUCTURE FOR CREATE i_businesspartnertp_3\_BPAddrIndependentEmail,

          lt_create_mobile  TYPE TABLE FOR CREATE i_businesspartnertp_3\_BPAddrIndependentMobile,
          ls_create_mobile  TYPE STRUCTURE FOR CREATE i_businesspartnertp_3\_BPAddrIndependentMobile.

    ls_create_partner = VALUE #( %cid                    = 'bp1'
                                 BusinessPartner         = 'ZNEBPADT7'
                                 businesspartnercategory = '2'
                                 FirstName               = 'Neil'
                                 lastname                = 'Lee'
                                 FullName                = 'Neil Lee'
                                 Language                = 'ZF'
                                 OrganizationBPName1     = 'ZNEBPADT7'

                                 %control = VALUE #( BusinessPartner         = cl_abap_behv=>flag_changed
                                                     businesspartnercategory = cl_abap_behv=>flag_changed
                                                     FirstName               = cl_abap_behv=>flag_changed
                                                     lastname                = cl_abap_behv=>flag_changed
                                                     FullName                = cl_abap_behv=>flag_changed
                                                     Language                = cl_abap_behv=>flag_changed
                                                     OrganizationBPName1     = cl_abap_behv=>flag_changed
                                                    ) ).
    APPEND ls_create_partner TO lt_create_partner.

    ls_create_address = VALUE #(
                                      %cid_ref = 'bp1'
                                      %target  = VALUE #(  ( %cid      = 'bp1_1'
                                                             country   = 'TW'
                                                             cityname  = 'TW_CITY'
                                      %control = VALUE #( country      = cl_abap_behv=>flag_changed
                                                          cityname     = cl_abap_behv=>flag_changed
                                                      ) ) ) ).
    APPEND ls_create_address TO lt_create_address.

    ls_create_email = VALUE #(
                                      %cid_ref = 'bp1'
                                      %target  = VALUE #(  ( %cid      = 'bpe_1'
                                                             IsDefaultEmailAddress = 'X'
                                                             EmailAddress          = 'neillee@soetek.com'
                                      %control = VALUE #( IsDefaultEmailAddress = cl_abap_behv=>flag_changed
                                                          EmailAddress          = cl_abap_behv=>flag_changed
                                                      ) ) ) ).
    APPEND ls_create_email TO lt_create_email.

*===============================================================================================================
    ls_create_email = VALUE #(
                                      %cid_ref = 'bp1'
                                      %target  = VALUE #(  ( %cid      = 'bpe_11'
                                                             IsDefaultEmailAddress = 'X'
                                                             EmailAddress          = 'neillee2@soetek.com'
                                      %control = VALUE #( IsDefaultEmailAddress = cl_abap_behv=>flag_changed
                                                          EmailAddress          = cl_abap_behv=>flag_changed
                                                      ) ) ) ).
    APPEND ls_create_email TO lt_create_email.

*===============================================================================================================

    ls_create_mobile = VALUE #(
                                      %cid_ref = 'bp1'
                                      %target  = VALUE #(  ( %cid      = 'bpm_1'
                                                             MobilePhoneCountry   = 'TW'
                                                             IsDefaultPhoneNumber = 'X'
                                                             MobilePhoneNumber    = '0905379057'
                                      %control = VALUE #( MobilePhoneCountry   = cl_abap_behv=>flag_changed
                                                          IsDefaultPhoneNumber = cl_abap_behv=>flag_changed
                                                          MobilePhoneNumber    = cl_abap_behv=>flag_changed
                                                      ) ) ) ).
    APPEND ls_create_mobile TO lt_create_mobile.

*=============================================================================================================

    ls_create_mobile = VALUE #(
                                      %cid_ref = 'bp1'
                                      %target  = VALUE #(  ( %cid      = 'bpm_11'
                                                             MobilePhoneCountry   = 'TW'
                                                             IsDefaultPhoneNumber = 'X'
                                                             MobilePhoneNumber    = '0900000000'
                                      %control = VALUE #( MobilePhoneCountry   = cl_abap_behv=>flag_changed
                                                          IsDefaultPhoneNumber = cl_abap_behv=>flag_changed
                                                          MobilePhoneNumber    = cl_abap_behv=>flag_changed
                                                      ) ) ) ).
    APPEND ls_create_mobile TO lt_create_mobile.

*=============================================================================================================

    ls_create_partner = VALUE #( %cid                    = 'bp2'
                                 BusinessPartner         = 'ZNEBPADT8'
                                 businesspartnercategory = '2'
                                 FirstName               = 'Neil'
                                 lastname                = 'Lee'
                                 FullName                = 'Neil Lee'
                                 Language                = 'ZF'
                                 OrganizationBPName1     = 'ZNEBPADT8'

                                 %control = VALUE #( BusinessPartner         = cl_abap_behv=>flag_changed
                                                     businesspartnercategory = cl_abap_behv=>flag_changed
                                                     FirstName               = cl_abap_behv=>flag_changed
                                                     lastname                = cl_abap_behv=>flag_changed
                                                     FullName                = cl_abap_behv=>flag_changed
                                                     Language                = cl_abap_behv=>flag_changed
                                                     OrganizationBPName1     = cl_abap_behv=>flag_changed
                                                    ) ).
    APPEND ls_create_partner TO lt_create_partner.

    ls_create_address = VALUE #(
                                      %cid_ref = 'bp2'
                                      %target  = VALUE #(  ( %cid      = 'bp1_2'
                                                             country   = 'TW'
                                                             cityname  = 'TW_CITY'
                                      %control = VALUE #( country      = cl_abap_behv=>flag_changed
                                                          cityname     = cl_abap_behv=>flag_changed
                                                      ) ) ) ).
    APPEND ls_create_address TO lt_create_address.

    ls_create_email = VALUE #(
                                      %cid_ref = 'bp2'
                                      %target  = VALUE #(  ( %cid      = 'bpe_2'
                                                             IsDefaultEmailAddress = 'X'
                                                             EmailAddress          = 'neillee@soetek.com'
                                      %control = VALUE #( IsDefaultEmailAddress = cl_abap_behv=>flag_changed
                                                          EmailAddress          = cl_abap_behv=>flag_changed
                                                      ) ) ) ).
    APPEND ls_create_email TO lt_create_email.
*=============================================================================================================
    ls_create_email = VALUE #(
                                      %cid_ref = 'bp2'
                                      %target  = VALUE #(  ( %cid      = 'bpe_22'
                                                             IsDefaultEmailAddress = 'X'
                                                             EmailAddress          = 'neillee5@soetek.com'
                                      %control = VALUE #( IsDefaultEmailAddress = cl_abap_behv=>flag_changed
                                                          EmailAddress          = cl_abap_behv=>flag_changed
                                                      ) ) ) ).
    APPEND ls_create_email TO lt_create_email.
*=============================================================================================================

    ls_create_mobile = VALUE #(
                                      %cid_ref = 'bp2'
                                      %target  = VALUE #(  ( %cid      = 'bpm_2'
                                                             MobilePhoneCountry   = 'TW'
                                                             IsDefaultPhoneNumber = 'X'
                                                             MobilePhoneNumber    = '0905379057'
                                      %control = VALUE #( MobilePhoneCountry   = cl_abap_behv=>flag_changed
                                                          IsDefaultPhoneNumber = cl_abap_behv=>flag_changed
                                                          MobilePhoneNumber    = cl_abap_behv=>flag_changed
                                                      ) ) ) ).
    APPEND ls_create_mobile TO lt_create_mobile.
*=============================================================================================================
    ls_create_mobile = VALUE #(
                                      %cid_ref = 'bp2'
                                      %target  = VALUE #(  ( %cid      = 'bpm_22'
                                                             MobilePhoneCountry   = 'TW'
                                                             IsDefaultPhoneNumber = 'X'
                                                             MobilePhoneNumber    = '0900000001'
                                      %control = VALUE #( MobilePhoneCountry   = cl_abap_behv=>flag_changed
                                                          IsDefaultPhoneNumber = cl_abap_behv=>flag_changed
                                                          MobilePhoneNumber    = cl_abap_behv=>flag_changed
                                                      ) ) ) ).
    APPEND ls_create_mobile TO lt_create_mobile.
*=============================================================================================================



    MODIFY ENTITIES OF i_businesspartnertp_3
     ENTITY businesspartner
     CREATE FROM lt_create_partner

     CREATE BY \_businesspartneraddress
     FROM lt_create_address

     CREATE BY \_BPAddrIndependentEmail
     FROM lt_create_email

     CREATE BY \_BPAddrIndependentMobile
     FROM lt_create_mobile

      MAPPED DATA(supplier_mapped)
      REPORTED DATA(supplier_reported)
      FAILED DATA(supplier_failed).

    IF supplier_failed IS NOT INITIAL.

      "Reported不會有Error Msg
*      LOOP AT supplier_reported-businesspartner  ASSIGNING FIELD-SYMBOL(<ls_sup_reported>).
*        DATA(lv_result) = <ls_sup_reported>-%msg->if_message~get_text( ).
*        out->write( 'EML BP Error1' ).
*        out->write( lv_result ).
*      ENDLOOP.
*      LOOP AT supplier_reported-businesspartnerrole ASSIGNING FIELD-SYMBOL(<ls_sup_reported2>).
*        DATA(lv_result2) = <ls_sup_reported2>-%msg->if_message~get_text( ).
*        out->write( 'EML Supplier-Role Error' ).
*        out->write( lv_result2 ).
*      ENDLOOP.

      out->write( 'failed IS NOT INITIAL' ).
    ELSE.
      COMMIT ENTITIES
     RESPONSE OF i_businesspartnertp_3
     FAILED DATA(failed_commit)
     REPORTED DATA(reported_commit).


      IF failed_commit IS NOT INITIAL.
        out->write( 'failed_commit Error' ).
        LOOP AT reported_commit-businesspartner ASSIGNING FIELD-SYMBOL(<fs_po_mapped2>).
          DATA(lv_result3) = <fs_po_mapped2>-%msg->if_message~get_text( ).
          out->write( 'Commit Error' ).
          out->write( lv_result3 ).
        ENDLOOP.

      ELSE.
        LOOP AT supplier_mapped-businesspartner ASSIGNING FIELD-SYMBOL(<fs_po_mapped>).
*          CONVERT KEY OF i_businesspartnertp_3 FROM <fs_po_mapped>-%pid TO DATA(ls_po_key).
          out->write( 'Business Partner:'  && <fs_po_mapped>-BusinessPartner ).

        ENDLOOP.
*        out->write( 'SUCCESS' ).
      ENDIF.

    ENDIF.

  ENDMETHOD.
ENDCLASS.
