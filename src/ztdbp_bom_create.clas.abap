CLASS ztdbp_bom_create DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZTDBP_BOM_CREATE IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA:
      lt_create_BOM_header TYPE TABLE FOR CREATE I_BillOfMaterialTP_2,
      ls_create_BOM_header TYPE STRUCTURE FOR CREATE I_BillOfMaterialTP_2,

      lt_create_BOM_item   TYPE TABLE FOR CREATE I_BillOfMaterialTP_2\_BillOfMaterialItem,
      ls_create_BOM_item   TYPE STRUCTURE FOR CREATE I_BillOfMaterialTP_2\_BillOfMaterialItem.

    ls_create_BOM_header = VALUE #(
     %cid                         = 'BOM1'
     Material                     = 'SG35'
     BillOfMaterialCategory       = 'M'
     BillOFMaterialVariant        = '01'
     Plant                        = ''
     BillOfMaterialVariantUsage   = '1'
     ProductDescription           = 'SEMI35–Assembly Unit 1(2T)'
     bomheaderinternalchangecount = '00000001'
     billofmaterialstatus         = '01'
     bomheaderbaseunit            = 'ST'
     bomheaderquantityinbaseunit  = '100'
     plantname                    = 'TW Plant'

           %control = VALUE #( Material                     = cl_abap_behv=>flag_changed
                               BillOfMaterialCategory       = cl_abap_behv=>flag_changed
                               BillOFMaterialVariant        = cl_abap_behv=>flag_changed
                               Plant                        = cl_abap_behv=>flag_changed
                               BillOfMaterialVariantUsage   = cl_abap_behv=>flag_changed
                               ProductDescription           = cl_abap_behv=>flag_changed
                               bomheaderinternalchangecount = cl_abap_behv=>flag_changed
                               billofmaterialstatus         = cl_abap_behv=>flag_changed
                               bomheaderbaseunit            = cl_abap_behv=>flag_changed
                               bomheaderquantityinbaseunit  = cl_abap_behv=>flag_changed
                               plantname                    = cl_abap_behv=>flag_changed
                               ) ).
    APPEND ls_create_BOM_header TO lt_create_BOM_header.

    ls_create_BOM_item = VALUE #(
                                  %cid_ref = 'BOM1'
                                  BillOfMaterial               = space
                                  BillOfMaterialCategory       = 'M'
                                  BillOfMaterialVariant        = '01'
                                  BillOfMaterialVersion        = ''
                                  Material                     = 'SG35'
                                  Plant                        = ''

                                  %target = VALUE #( (   %cid = 'BOMITEM01'
                                                         billofmaterialcomponent    = 'RM35'
                                                         billofmaterialitemcategory = 'L'
                                                         billofmaterialitemnumber   = '0010'
                                                         billofmaterialitemunit     = 'ST'
                                                         billofmaterialitemquantity = '100'
                                                         identifierbomitem          = 'NE000001'
                                                         componentdescription       = 'RAW35 – Assembly Component 1(2T)'
                                                         isproductionrelevant       = 'X'

                                  %control = VALUE #( billofmaterialcomponent    = cl_abap_behv=>flag_changed
                                                      billofmaterialitemcategory = cl_abap_behv=>flag_changed
                                                      billofmaterialitemnumber   = cl_abap_behv=>flag_changed
                                                      billofmaterialitemunit     = cl_abap_behv=>flag_changed
                                                      billofmaterialitemquantity = cl_abap_behv=>flag_changed
                                                      identifierbomitem          = cl_abap_behv=>flag_changed
                                                      componentdescription       = cl_abap_behv=>flag_changed
                                                      isproductionrelevant       = cl_abap_behv=>flag_changed
                                ) ) ) ).
    APPEND ls_create_BOM_item TO lt_create_BOM_item.

    MODIFY ENTITIES OF i_billofmaterialtp_2
    ENTITY BillOfMaterial
    CREATE FROM lt_create_BOM_header

    CREATE BY \_BillOfMaterialItem
    FROM lt_create_BOM_item

    MAPPED DATA(mapped_bom_headers)
    REPORTED DATA(reported_bom_headers)
    FAILED DATA(failed_bom_headers).

    IF failed_bom_headers IS NOT INITIAL.
      LOOP AT reported_bom_headers-billofmaterialitem ASSIGNING FIELD-SYMBOL(<ls_bom_reported>).
        DATA(lv_result) = <ls_bom_reported>-%msg->if_message~get_text( ).
        out->write( 'EML BOM Item Error' ).
        out->write( lv_result ).
      ENDLOOP.

      LOOP AT reported_bom_headers-billofmaterial ASSIGNING FIELD-SYMBOL(<ls_bom_reported2>).
        DATA(lv_result2) = <ls_bom_reported2>-%msg->if_message~get_text( ).
        out->write( 'EML BOM Header Error' ).
        out->write( lv_result2 ).
      ENDLOOP.

    ELSE.
      COMMIT ENTITIES BEGIN
       RESPONSE OF i_billofmaterialtp_2
       FAILED DATA(lt_commit_failed)
       REPORTED DATA(lt_commit_reported).

      IF lt_commit_failed IS NOT INITIAL.
        LOOP AT lt_commit_reported-billofmaterialitem ASSIGNING FIELD-SYMBOL(<fs_bom_mapped2>).
          DATA(lv_result3) = <fs_bom_mapped2>-%msg->if_message~get_text( ).
          out->write( 'Commit Error' ).
          out->write( lv_result3 ).
        ENDLOOP.
      ELSE.
        LOOP AT mapped_bom_headers-billofmaterial ASSIGNING FIELD-SYMBOL(<fs_bom_mapped>).
*          CONVERT KEY OF i_billofmaterialtp_2 FROM <fs_bom_mapped>-%pid TO DATA(ls_bom_key).
          out->write( 'BOM:'  && <fs_bom_mapped>-BillOfMaterial ).
        ENDLOOP.
      ENDIF.

      COMMIT ENTITIES END.
    ENDIF.

  ENDMETHOD.
ENDCLASS.
