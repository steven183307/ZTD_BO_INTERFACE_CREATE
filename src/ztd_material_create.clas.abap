CLASS ztd_material_create DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZTD_MATERIAL_CREATE IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    "產品基本資料
    DATA create_product TYPE TABLE FOR CREATE I_ProductTP_2.
    "產品描述
    DATA create_productdescription TYPE STRUCTURE FOR CREATE  I_ProductTP_2\_ProductDescription.
    DATA create_productdescription2 TYPE TABLE FOR CREATE  I_ProductTP_2\_ProductDescription.
    "產品銷售
    DATA create_ProductSales TYPE STRUCTURE FOR CREATE I_ProductTP_2\_ProductSales.
    DATA create_ProductSales2 TYPE TABLE FOR CREATE I_ProductTP_2\_ProductSales.
    "產品採購
    DATA create_ProductProcurement TYPE STRUCTURE FOR CREATE I_ProductTP_2\_ProductProcurement.
    DATA create_ProductProcurement2 TYPE TABLE FOR CREATE I_ProductTP_2\_ProductProcurement.
    "品質管理
    DATA create_QualityManagement TYPE STRUCTURE FOR CREATE I_ProductTP_2\_ProductQualityManagement.
    DATA create_QualityManagement2 TYPE TABLE FOR CREATE I_ProductTP_2\_ProductQualityManagement.
    "_ProductPlant
    DATA create_productPlant TYPE STRUCTURE FOR CREATE I_ProductTP_2\_ProductPlant.
    DATA create_productPlant2 TYPE TABLE FOR CREATE I_ProductTP_2\_ProductPlant.

    "Product Plant Costing 
    DATA create_ProductPlantCosting TYPE STRUCTURE FOR CREATE I_ProductPlantTP_2\_ProductPlantCosting.
    DATA create_ProductPlantCosting2 TYPE TABLE FOR CREATE I_ProductPlantTP_2\_ProductPlantCosting.

    "ProductPlantSupplyPlanning
    DATA create_PlantSupplyPlanning TYPE STRUCTURE FOR CREATE  I_ProductPlantTP_2\_ProductPlantSupplyPlanning.
    DATA create_PlantSupplyPlanning2 TYPE TABLE FOR CREATE  I_ProductPlantTP_2\_ProductPlantSupplyPlanning.

    "Plant儲存地點
    DATA create_PlantStorage TYPE STRUCTURE FOR CREATE I_ProductPlantTP_2\_ProductPlantStorage.
    DATA create_PlantStorage2 TYPE TABLE FOR CREATE I_ProductPlantTP_2\_ProductPlantStorage.

    "ProductPlantStorageLocation
    DATA create_ProductStorageLocation TYPE STRUCTURE FOR CREATE I_ProductPlantTP_2\_ProductPlantStorageLocation .
    DATA create_ProductStorageLocation2 TYPE TABLE FOR CREATE I_ProductPlantTP_2\_ProductPlantStorageLocation .

    "ProductPlantMRP
    DATA create_ProductPlantMRP TYPE STRUCTURE FOR CREATE I_ProductPlantTP_2\_ProductPlantMRP.
    DATA create_ProductPlantMRP2 TYPE TABLE FOR CREATE I_ProductPlantTP_2\_ProductPlantMRP.

    "_ProductSalesDelivery
    DATA create_salesDelivery TYPE STRUCTURE FOR CREATE I_ProductTP_2\_ProductSalesDelivery.
    DATA create_salesDelivery2 TYPE TABLE FOR CREATE I_ProductTP_2\_ProductSalesDelivery.

    "_ProdSalesDeliverySalesTax
    DATA create_salesDeliveryTax TYPE STRUCTURE FOR CREATE  I_ProductSalesDeliveryTP_2\_prodsalesdeliverysalestax.
    DATA create_salesDeliveryTax2 TYPE TABLE FOR CREATE  I_ProductSalesDeliveryTP_2\_prodsalesdeliverysalestax.

    "_ProductUnitOfMeasure
    DATA create_ProductUnitOfMeasure TYPE STRUCTURE FOR CREATE I_ProductTP_2\_ProductUnitOfMeasure.
    DATA create_ProductUnitOfMeasure2 TYPE TABLE FOR CREATE I_ProductTP_2\_ProductUnitOfMeasure.

    "_ProductValuation
    DATA create_ProductValuation  TYPE STRUCTURE FOR CREATE I_ProductTP_2\_ProductValuation.
    DATA create_ProductValuation2  TYPE TABLE FOR CREATE I_ProductTP_2\_ProductValuation.

    "_ProductStorage
    DATA create_ProductStorage TYPE STRUCTURE FOR CREATE I_ProductTP_2\_ProductStorage.
    DATA create_ProductStorage2 TYPE TABLE FOR CREATE I_ProductTP_2\_ProductStorage.

    "_ProductEWMWarehouse
    DATA create_ProductEWMWarehouse TYPE STRUCTURE FOR CREATE I_ProductTP_2\_ProductEWMWarehouse.
    DATA create_ProductEWMWarehouse2 TYPE TABLE FOR CREATE I_ProductTP_2\_ProductEWMWarehouse.
    "Base Unit of Measure-item
    DATA create_unit_item TYPE STRUCTURE FOR CREATE I_ProductUnitOfMeasureTP_2\_ProductUnitOfMeasureEAN.
    DATA create_unit_item2 TYPE TABLE FOR CREATE I_ProductUnitOfMeasureTP_2\_ProductUnitOfMeasureEAN.


    DATA product2 TYPE I_ProductTP_2-Product.

    product2 = 'MATERIAL1212C'.

    "產品基本資料
    create_product = VALUE #( (
    %cid = '01'
    Product =  product2
    ProductType = 'HALB'
    IndustrySector = 'M'
    GrossWeight = '0.500'
    WeightUnit = 'KG'
    ProductGroup = 'L003'
    BaseUnit = 'ST'
    ItemCategoryGroup = 'NORM'
    NetWeight = '0.450'
    Division = '00'
    ProductDocumentPageCount = '000'

    %control-Product = cl_abap_behv=>flag_changed
    %control-ProductType = cl_abap_behv=>flag_changed
    %control-IndustrySector = cl_abap_behv=>flag_changed
    %control-GrossWeight = cl_abap_behv=>flag_changed
    %control-WeightUnit = cl_abap_behv=>flag_changed
    %control-ProductGroup = cl_abap_behv=>flag_changed
    %control-BaseUnit = cl_abap_behv=>flag_changed
    %control-ItemCategoryGroup = cl_abap_behv=>flag_changed
    %control-NetWeight = cl_abap_behv=>flag_changed
    %control-Division = cl_abap_behv=>flag_changed
    %control-ProductDocumentPageCount = cl_abap_behv=>flag_changed

      ) ).
    "產品描述
    create_productdescription  = VALUE #( %cid_ref = '01'
                                     Product = product2
                                    %target = VALUE #( (  %cid = '04'
                                                          Product = product2
                                                          Language = 'W'
                                                          ProductDescription = 'TEST'
                                                           %control = VALUE #(
                                                           Language =  cl_abap_behv=>flag_changed
                                                           ProductDescription =  cl_abap_behv=>flag_changed
                                                           ) ) ) ).
    APPEND create_productdescription  TO create_productdescription2 .
    "產品銷售
    create_ProductSales = VALUE #( %cid_ref = '01'
                                     Product = product2
                                     %target = VALUE #( (  %cid = '11'
                                                           Product = product2
                                                           TransportationGroup = '0001'
                                                           PackagingProductType = 'SP01'
                                                           "ProductStackingFactor = '0'
                                                           "SalesStatus = '01'
                                                           "SalesStatusValidityDate = '20231231'  "SalesStatus有填情況下必填
                                                           %control = VALUE #(

                                                            TransportationGroup = cl_abap_behv=>flag_changed
                                                            PackagingProductType = cl_abap_behv=>flag_changed
                                                            "SalesStatus = cl_abap_behv=>flag_changed
                                                            "ProductStackingFactor = cl_abap_behv=>flag_changed
                                                            "SalesStatusValidityDate = cl_abap_behv=>flag_changed
                                                             )
                                     ) ) ).
    APPEND create_ProductSales TO create_ProductSales2.
*    "產品採購
*    create_ProductProcurement  = VALUE #( "%cid_ref = '01'
*                                    %key-Product = product2
*                                    %target = VALUE #( (  %cid = '12'
*                                                          Product = product2
*                                                          VarblPurOrdUnitStatus = '1'
*                                                          %control = VALUE #(
*
*                                                           VarblPurOrdUnitStatus = cl_abap_behv=>flag_changed
*                                                             )
*                                    ) ) ).
*    APPEND create_ProductProcurement TO create_ProductProcurement2.
    "品質管理
    create_QualityManagement  = VALUE #( %cid_ref = '01'
                                    Product = product2
                                    %target = VALUE #( (  %cid = '13'
                                                          Product = product2
                                                          QltyMgmtInProcmtIsActive = 'X'
                                                          %control = VALUE #(
                                                          QltyMgmtInProcmtIsActive = cl_abap_behv=>flag_changed )
                                    ) ) ).
    APPEND create_QualityManagement TO create_QualityManagement2.
    "_ProductPlant
    create_productplant = VALUE #( %cid_ref = '01'
                                    Product = product2
                                   %target = VALUE #( (  %cid = '02'
                                                         Product = product2
                                                         Plant = '6310'
                                                         PeriodType = 'M'
                                                         ProfitCenter = 'YB111'
                                                         BaseUnit = 'ST'

                                                      %control = VALUE #(
*                                                      Product = cl_abap_behv=>flag_changed
                                                       Plant = cl_abap_behv=>flag_changed
                                                       BaseUnit = cl_abap_behv=>flag_changed
                                                       PeriodType = cl_abap_behv=>flag_changed
                                                       ProfitCenter = cl_abap_behv=>flag_changed
                                                     ) ) ) ).
    APPEND create_productplant TO create_productplant2 .

    "Product Plant Costing
    create_productplantcosting = VALUE #(
                                          %cid_ref = '02'
                                         Product = product2
                                          Plant = '6310'
                                          %target = VALUE #( (
                                                            %cid = '03'
                                                            Product = product2
                                                            Plant = '6310'
                                                            CostingLotSize = 100
                                                            VarianceKey = '000001'
                                                            BaseUnit = 'ST'
                                                             TaskListGroup = '49999991'
                                                             TaskListGroupCounter = 1
                                                             %control = VALUE #(
                                                                    TaskListGroup = cl_abap_behv=>flag_changed
                                                                    TaskListGroupCounter = cl_abap_behv=>flag_changed
                                                                    CostingLotSize = cl_abap_behv=>flag_changed
                                                                    VarianceKey = cl_abap_behv=>flag_changed
                                                                    BaseUnit = cl_abap_behv=>flag_changed )
                                                            ) ) ).

    APPEND create_productplantcosting TO create_productplantcosting2.

    "ProductPlantSupplyPlanning
    create_PlantSupplyPlanning   = VALUE #( %cid_ref = '02'
                                    Product = product2
                                    Plant = '6310'
                                   %target = VALUE #( ( %cid = '05'
                                                       Product = product2
                                                       Plant = '6310'
                                                       MRPType = 'ND'
                                                       MRPResponsible = '001'
                                                       LotSizingProcedure = 'EX'
                                                       PlannedDeliveryDurationInDays = '10'
                                                       SafetySupplyDurationInDays = '00'
                                                       TotalReplenishmentLeadTime = '2'
                                                       ProcurementType = 'E'
                                                       ProcurementSubType = '50'
                                                       AvailabilityCheckType = 'SR'
                                                       ProdInhProdnDurationInWorkDays = '1'
                                                       DependentRequirementsType = '2'
                                                       BackwardCnsmpnPeriodInWorkDays = '100'
                                                       FwdConsumptionPeriodInWorkDays = '100'
                                                       ProdRqmtsConsumptionMode = '2'
                                                       SchedulingFloatProfile = '001'
                                                       ProductionInvtryManagedLoc = '631B'
                                                       Currency = 'TWD'
                                                       BaseUnit = 'ST'
                                                      %control = VALUE #(
                                                        MRPType  = cl_abap_behv=>flag_changed
                                                        MRPResponsible = cl_abap_behv=>flag_changed
                                                        LotSizingProcedure = cl_abap_behv=>flag_changed
                                                        PlannedDeliveryDurationInDays = cl_abap_behv=>flag_changed
                                                        SafetySupplyDurationInDays = cl_abap_behv=>flag_changed
                                                        TotalReplenishmentLeadTime = cl_abap_behv=>flag_changed
                                                        ProcurementType = cl_abap_behv=>flag_changed
                                                        ProcurementSubType = cl_abap_behv=>flag_changed
                                                        AvailabilityCheckType = cl_abap_behv=>flag_changed
                                                        ProdInhProdnDurationInWorkDays = cl_abap_behv=>flag_changed
                                                        DependentRequirementsType = cl_abap_behv=>flag_changed
                                                        BackwardCnsmpnPeriodInWorkDays = cl_abap_behv=>flag_changed
                                                        FwdConsumptionPeriodInWorkDays = cl_abap_behv=>flag_changed
                                                        ProdRqmtsConsumptionMode = cl_abap_behv=>flag_changed
                                                        SchedulingFloatProfile = cl_abap_behv=>flag_changed
                                                        ProductionInvtryManagedLoc = cl_abap_behv=>flag_changed
                                                        Currency = cl_abap_behv=>flag_changed
                                                        BaseUnit = cl_abap_behv=>flag_changed
                                                        ) ) ) ).
    APPEND create_PlantSupplyPlanning  TO create_PlantSupplyPlanning2.

    "ProductPlantStorageLocation
    create_ProductStorageLocation  = VALUE #( %cid_ref = '02'
                                         Product = product2
                                          Plant = '6310'

                                    %target = VALUE #( (  %cid = '17'
                                                          Product = product2
                                                          Plant = '6310'
                                                          StorageLocation = '631B'
                                                          %control = VALUE #(
                                                                    StorageLocation = cl_abap_behv=>flag_changed
                                                      ) ) ) ).
    APPEND create_ProductStorageLocation TO create_ProductStorageLocation2.

    "ProductPlantMRP

    "_ProductSalesDelivery
    create_salesdelivery = VALUE #( %cid_ref = '01'
                                    Product = product2
                                    %target = VALUE #( (  %cid = '07'
                                                          Product = product2
                                                          ProductSalesOrg = '6310'
                                                          ProductDistributionChnl = '10'
                                                          ItemCategoryGroup = 'NORM'
                                                          AccountDetnProductGroup = '02'
                                                          LogisticsStatisticsGroup = '1'
                                                          BaseUnit = 'ST'
                                                          %control = VALUE #(
                                                          ProductSalesOrg = cl_abap_behv=>flag_changed
                                                          ProductDistributionChnl = cl_abap_behv=>flag_changed
                                                          ItemCategoryGroup  = cl_abap_behv=>flag_changed
                                                          AccountDetnProductGroup = cl_abap_behv=>flag_changed
                                                          LogisticsStatisticsGroup = cl_abap_behv=>flag_changed
                                                          BaseUnit = cl_abap_behv=>flag_changed
                                                           )
                                    )                   ) ).
    APPEND create_salesdelivery TO create_salesdelivery2.

    "_ProdSalesDeliverySalesTax
    create_salesDeliveryTax  = VALUE #( %cid_ref = '07'
                                        Product = product2
                                        ProductSalesOrg = '6310'
                                        ProductDistributionChnl = '10'
                                        %target = VALUE #( (  %cid = '08'
                                                              Product = product2
                                                              ProductSalesOrg = '6310'
                                                              ProductDistributionChnl = '10'
                                                              Country = 'TW'
                                                              ProductSalesTaxCategory = 'TTX1'
                                                              ProductTaxClassification = '1'
                                                              %control = VALUE #(
                                                          ProductSalesTaxCategory = cl_abap_behv=>flag_changed
                                                          ProductTaxClassification  = cl_abap_behv=>flag_changed
                                                          Country = cl_abap_behv=>flag_changed
                                        ) ) ) ).
    APPEND create_salesDeliveryTax TO create_salesDeliveryTax2.

    "_ProductUnitOfMeasure
    create_ProductUnitOfMeasure =  VALUE #( %cid_ref = '01'
                                       Product = product2
                                       %target = VALUE #( (  %cid = '14'
                                                             Product = product2
                                                             AlternativeUnit = 'ST'
                                                             QuantityDenominator = '1'
                                                             QuantityNumerator = '1'
                                                             GrossWeight = '0.500'
                                                             WeightUnit = 'KG'
                                                             BaseUnit = 'ST'
                                                             %control = VALUE #(
                                                              AlternativeUnit = cl_abap_behv=>flag_changed
                                                             QuantityDenominator = cl_abap_behv=>flag_changed
                                                             QuantityNumerator = cl_abap_behv=>flag_changed
                                                             GrossWeight = cl_abap_behv=>flag_changed
                                                             WeightUnit = cl_abap_behv=>flag_changed
                                                             BaseUnit = cl_abap_behv=>flag_changed )

                                       ) ) ).
    APPEND create_ProductUnitOfMeasure TO create_ProductUnitOfMeasure2.

    "_ProductValuation
    create_ProductValuation = VALUE #( %cid_ref = '01'
                                    Product = product2
                                    %target = VALUE #( (  %cid = '15'
                                                          Product = product2
                                                          ValuationArea = '6310'
                                                          ValuationClass = '7900'
                                                          PriceDeterminationControl = '2'
                                                          StandardPrice = '95.00'
                                                          ProductPriceUnitQuantity = '1'
                                                          InventoryValuationProcedure = 'S'
                                                          Currency = 'TWD'
                                                          BaseUnit = 'ST'
                                                          %control = VALUE #(
                                                          ValuationArea = cl_abap_behv=>flag_changed
                                                          ValuationClass = cl_abap_behv=>flag_changed
                                                          PriceDeterminationControl = cl_abap_behv=>flag_changed
                                                          StandardPrice = cl_abap_behv=>flag_changed
                                                          ProductPriceUnitQuantity = cl_abap_behv=>flag_changed
                                                          InventoryValuationProcedure = cl_abap_behv=>flag_changed
                                                          Currency = cl_abap_behv=>flag_changed
                                                          BaseUnit = cl_abap_behv=>flag_changed )

                                    ) ) ).
    APPEND create_ProductValuation TO create_ProductValuation2.

    "_ProductStorage
    create_ProductStorage    = VALUE #( %cid_ref = '01'
                                    Product = product2
                                    %target = VALUE #( (  %cid = '16'
                                                          Product = product2
                                    ) ) ).
    APPEND create_ProductStorage TO create_ProductStorage2.
    "_ProductEWMWarehouse
    create_PlantStorage  = VALUE #( %cid_ref = '02'
                                         Product = product2
                                          Plant = '6310'

                                    %target = VALUE #( (  %cid = '18'
                                                          Product = product2
                                                          Plant = '6310'
                                                          MaximumStoragePeriod = 10
                                                          ProdMaximumStoragePeriodUnit = 'TAG'
                                                          %control = VALUE #(
                                                                    MaximumStoragePeriod = cl_abap_behv=>flag_changed
                                                                    ProdMaximumStoragePeriodUnit = cl_abap_behv=>flag_changed
                                                      ) ) ) ).
    APPEND create_PlantStorage TO create_PlantStorage2.

    "Base Unit of Measure-item(EAN)
    create_unit_item = VALUE #(
        %cid_ref = '14'
        %key-Product = product2
        %key-AlternativeUnit = 'ST'
        %target = VALUE #( (
                     %cid = 'uomean'
                     Product = product2
                     AlternativeUnit = 'ST'
                     ConsecutiveNumber = '00001'
                     InternationalArticleNumberCat = 'E5'
                     IsMainGlobalTradeItemNumber = 'X'
                     ) )
                    ).
    APPEND create_unit_item TO create_unit_item2.


    MODIFY ENTITIES OF I_ProductTP_2
    ENTITY Product
    CREATE FROM create_product

    CREATE BY \_ProductDescription
    FROM create_productdescription2

    CREATE BY \_ProductSales
    FROM  create_productsales2

    CREATE BY \_ProductProcurement
    FROM create_ProductProcurement2

    CREATE BY \_ProductQualityManagement
    FROM create_QualityManagement2

    CREATE BY \_ProductPlant
    FROM create_productplant2

    CREATE BY \_ProductSalesDelivery
    FROM create_salesdelivery2

    CREATE BY \_ProductUnitOfMeasure
    FROM create_ProductUnitOfMeasure2

    CREATE BY \_ProductValuation
    FROM create_ProductValuation2

    CREATE BY \_ProductStorage
    FROM create_ProductStorage2

    ENTITY ProductPlant
    CREATE BY \_ProductPlantCosting
    FROM create_productplantcosting2

    CREATE BY \_ProductPlantSupplyPlanning
    FROM create_PlantSupplyPlanning2

    CREATE BY \_ProductPlantStorageLocation
    FROM create_productstoragelocation2

    CREATE BY \_ProductPlantStorage
    FROM create_plantstorage2

    ENTITY ProductSalesDelivery
    CREATE BY \_ProdSalesDeliverySalesTax
    FROM create_salesDeliveryTax2

     ENTITY ProductUnitOfMeasure
     CREATE BY \_ProductUnitOfMeasureEAN
     FROM create_unit_item2

     MAPPED DATA(mapped)
     REPORTED DATA(reported)
     FAILED DATA(failed).

    IF failed IS NOT INITIAL.
      "產品基本資料
      LOOP AT reported-product  ASSIGNING FIELD-SYMBOL(<ls_product>).
        DATA(lv_product) = <ls_product>-%msg->if_message~get_text( ).
        out->write( 'Product Error' ).
        out->write( lv_product ).
      ENDLOOP.
      "產品描述
      LOOP AT reported-productdescription  ASSIGNING FIELD-SYMBOL(<ls_description>).
        DATA(lv_description) = <ls_description>-%msg->if_message~get_text( ).
        out->write( 'Description Error' ).
        out->write( lv_description ).
      ENDLOOP.
      "產品銷售
      LOOP AT reported-productsales  ASSIGNING FIELD-SYMBOL(<ls_sales>).
        DATA(lv_sales) = <ls_sales>-%msg->if_message~get_text( ).
        out->write( 'Sales Error' ).
        out->write( lv_sales ).
      ENDLOOP.
      "產品採購
      LOOP AT reported-ProductProcurement  ASSIGNING FIELD-SYMBOL(<ls_ProductProcurement>).
        DATA(lv_ProductProcurement) = <ls_ProductProcurement>-%msg->if_message~get_text( ).
        out->write( 'ProductProcurement Error' ).
        out->write( lv_ProductProcurement ).
      ENDLOOP.
      "品質管理
      LOOP AT reported-ProductQualityManagement  ASSIGNING FIELD-SYMBOL(<ls_QualityManagement>).
        DATA(lv_QualityManagement) = <ls_QualityManagement>-%msg->if_message~get_text( ).
        out->write( 'QualityManagement Error' ).
        out->write( lv_QualityManagement ).
      ENDLOOP.
      "_ProductPlant
      LOOP AT reported-productplant ASSIGNING FIELD-SYMBOL(<ls_plant>).
        DATA(lv_plant) = <ls_plant>-%msg->if_message~get_text( ).
        out->write( 'Plant Error' ).
        out->write( lv_plant ).
      ENDLOOP.

      "Product Plant Costing
      LOOP AT reported-productplantcosting  ASSIGNING FIELD-SYMBOL(<ls_plantcosting>).
        DATA(lv_plantcosting) = <ls_plantcosting>-%msg->if_message~get_text( ).
        out->write( 'Plantcosting Error' ).
        out->write( lv_plantcosting ) .
      ENDLOOP.

      "ProductPlantSupplyPlanning
      LOOP AT reported-productplantsupplyplanning ASSIGNING FIELD-SYMBOL(<ls_plantsupplyplanning>).
        DATA(lv_plantsupplyplanning) = <ls_plantsupplyplanning>-%msg->if_message~get_text( ).
        out->write( 'Plantsupplyplanning Error' ).
        out->write( lv_plantsupplyplanning ) .
      ENDLOOP.

      "ProductPlantStorageLocation
      LOOP AT reported-ProductPlantStorageLocation  ASSIGNING FIELD-SYMBOL(<ls_StorageLocation>).
        DATA(lv_StorageLocation) = <ls_StorageLocation>-%msg->if_message~get_text( ).
        out->write( 'PlantStorageLocation Error' ).
        out->write( lv_StorageLocation ) .
      ENDLOOP.
      "ProductPlantMRP

      "_ProductSalesDelivery
      LOOP AT reported-productsalesdelivery  ASSIGNING FIELD-SYMBOL(<ls_salesdelivery>).
        DATA(lv_salesdelivery) = <ls_salesdelivery>-%msg->if_message~get_text( ).
        out->write( 'Salesdelivery Error' ).
        out->write( lv_salesdelivery ) .
      ENDLOOP.
      "_ProdSalesDeliverySalesTax
      LOOP AT reported-productsalesdeliverysalestax  ASSIGNING FIELD-SYMBOL(<ls_salesdeliverysalestax>).
        DATA(lv_salesdeliverysalestax) = <ls_salesdeliverysalestax>-%msg->if_message~get_text( ).
        out->write( 'Salesdeliverysalestax Error' ).
        out->write( lv_salesdeliverysalestax ) .
      ENDLOOP.

      "_ProductUnitOfMeasure
      LOOP AT reported-ProductUnitOfMeasure ASSIGNING FIELD-SYMBOL(<ls_UnitOfMeasure>).
        DATA(lv_UnitOfMeasure) = <ls_UnitOfMeasure>-%msg->if_message~get_text( ).
        out->write( 'UnitOfMeasure Error' ).
        out->write( lv_UnitOfMeasure ) .
      ENDLOOP.

      "_ProductValuation
      LOOP AT reported-ProductValuation  ASSIGNING FIELD-SYMBOL(<ls_Valuation>).
        DATA(lv_Valuation) = <ls_Valuation>-%msg->if_message~get_text( ).
        out->write( 'Valuation Error' ).
        out->write( lv_Valuation ) .
      ENDLOOP.

      "_ProductStorage
      LOOP AT reported-ProductStorage  ASSIGNING FIELD-SYMBOL(<ls_Storage>).
        DATA(lv_Storage) = <ls_Storage>-%msg->if_message~get_text( ).
        out->write( 'Storage Error' ).
        out->write( lv_Storage ) .
      ENDLOOP.
      "Product Plant Storage
      LOOP AT reported-productplantstorage  ASSIGNING FIELD-SYMBOL(<ls_plantstorage>).
        DATA(lv_plantstorage) = <ls_plantstorage>-%msg->if_message~get_text( ).
        out->write( 'Plantstorage  Error' ).
        out->write( lv_plantstorage  ) .
      ENDLOOP.

      "Base Unit of Measure-item
      LOOP AT reported-productunitofmeasureean ASSIGNING FIELD-SYMBOL(<lt_proudct3>).
        DATA(lv_result3) = <lt_proudct3>-%msg->if_message~get_text( ).
        out->write( 'product1 error' ).
        out->write( lv_result3 ).
      ENDLOOP.

      "_ProductEWMWarehouse
      out->write( 'failed_data Error' ).
    ELSE.

      COMMIT ENTITIES
         RESPONSE OF I_ProductTP_2
             FAILED DATA(failed_commit)
             REPORTED DATA(reported_commit).
      IF failed_commit IS NOT INITIAL.
        "產品基本資料
        LOOP AT reported_commit-product  ASSIGNING FIELD-SYMBOL(<ls_product_f>).
          DATA(lv_product_f) = <ls_product_f>-%msg->if_message~get_text( ).
          out->write( 'Commit Product Error' ).
          out->write( lv_product_f ).
        ENDLOOP.
        "產品描述
        LOOP AT reported_commit-productdescription  ASSIGNING FIELD-SYMBOL(<ls_description_f>).
          DATA(lv_description_f) = <ls_description_f>-%msg->if_message~get_text( ).
          out->write( 'Commit Description Error' ).
          out->write( lv_description_f ).
        ENDLOOP.
        "產品銷售
        LOOP AT reported_commit-productsales  ASSIGNING FIELD-SYMBOL(<ls_sales_f>).
          DATA(lv_sales_f) = <ls_sales_f>-%msg->if_message~get_text( ).
          out->write( 'Commit Sales Error' ).
          out->write( lv_sales_f ).
        ENDLOOP.
        "產品採購
        LOOP AT reported_commit-ProductProcurement ASSIGNING FIELD-SYMBOL(<ls_ProductProcurement_f>).
          DATA(lv_ProductProcurement_f) = <ls_ProductProcurement_f>-%msg->if_message~get_text( ).
          out->write( 'Commit ProductProcurement Error' ).
          out->write( lv_ProductProcurement_f ).
        ENDLOOP.
        "品質管理
        LOOP AT reported_commit-ProductQualityManagement ASSIGNING FIELD-SYMBOL(<ls_QualityManagement_f>).
          DATA(lv_QualityManagement_f) = <ls_QualityManagement_f>-%msg->if_message~get_text( ).
          out->write( 'Commit QualityManagement Error' ).
          out->write( lv_QualityManagement_f ).
        ENDLOOP.
        "_ProductPlant
        LOOP AT reported_commit-productplant  ASSIGNING FIELD-SYMBOL(<ls_plant_f>).
          DATA(lv_plant_f) = <ls_plant_f>-%msg->if_message~get_text( ).
          out->write( 'Commit Plant Error' ).
          out->write( lv_plant_f ).
        ENDLOOP.

        "Product Plant Costing
        LOOP AT reported_commit-productplantcosting  ASSIGNING FIELD-SYMBOL(<ls_plantcosting_f>).
          DATA(lv_plantcosting_f) = <ls_plantcosting_f>-%msg->if_message~get_text( ).
          out->write( 'Commit Plantcosting Error' ).
          out->write( lv_plantcosting_f ).
        ENDLOOP.

        "ProductPlantSupplyPlanning
        LOOP AT reported_commit-productplantsupplyplanning  ASSIGNING FIELD-SYMBOL(<ls_supplyplanning_f>).
          DATA(lv_supplyplanning_f) = <ls_supplyplanning_f>-%msg->if_message~get_text( ).
          out->write( 'Commit supplyplanning Error' ).
          out->write( lv_supplyplanning_f ).
        ENDLOOP.

        "ProductPlantStorageLocation
        LOOP AT reported_commit-productplantstoragelocation  ASSIGNING FIELD-SYMBOL(<ls_storagelocation_f>).
          DATA(lv_storagelocation_f) = <ls_supplyplanning_f>-%msg->if_message~get_text( ).
          out->write( 'Commit storagelocation Error' ).
          out->write( lv_storagelocation_f ).
        ENDLOOP.
        "ProductPlantMRP

        "_ProductSalesDelivery
        LOOP AT reported_commit-productsalesdelivery  ASSIGNING FIELD-SYMBOL(<ls_salesdelivery_f>).
          DATA(lv_salesdelivery_f) = <ls_salesdelivery_f>-%msg->if_message~get_text( ).
          out->write( 'Commit Salesdelivery Error' ).
          out->write( lv_Salesdelivery_f ).
        ENDLOOP.
        "_ProdSalesDeliverySalesTax
        LOOP AT reported_commit-productsalesdeliverysalestax  ASSIGNING FIELD-SYMBOL(<ls_deliverysalestax_f>).
          DATA(lv_deliverysalestax_f) = <ls_deliverysalestax_f>-%msg->if_message~get_text( ).
          out->write( 'Commit deliverysalestax  Error' ).
          out->write( lv_deliverysalestax_f ).
        ENDLOOP.

        "_ProductUnitOfMeasure
        LOOP AT reported_commit-ProductUnitOfMeasure  ASSIGNING FIELD-SYMBOL(<ls_UnitOfMeasure_f>).
          DATA(lv_UnitOfMeasure_f) = <ls_UnitOfMeasure_f>-%msg->if_message~get_text( ).
          out->write( 'Commit UnitOfMeasure Error' ).
          out->write( lv_UnitOfMeasure_f ).
        ENDLOOP.

        "_ProductValuation
        LOOP AT reported_commit-ProductValuation  ASSIGNING FIELD-SYMBOL(<ls_Valuation_f>).
          DATA(lv_Valuation_f) = <ls_plant_f>-%msg->if_message~get_text( ).
          out->write( 'Commit Valuation Error' ).
          out->write( lv_Valuation_f ).
        ENDLOOP.

        "_ProductStorage
        LOOP AT reported_commit-ProductStorage  ASSIGNING FIELD-SYMBOL(<ls_Storage_f>).
          DATA(lv_Storage_f) = <ls_Storage_f>-%msg->if_message~get_text( ).
          out->write( 'Commit Storage Error' ).
          out->write( lv_Storage_f ).
        ENDLOOP.
        "Product Plant Storage
        LOOP AT reported_commit-productplantstorage   ASSIGNING FIELD-SYMBOL(<ls_plantstorage_f>).
          DATA(lv_plantstorage_f) = <ls_plantstorage_f>-%msg->if_message~get_text( ).
          out->write( 'Commit plantstorage Error' ).
          out->write( lv_plantstorage_f ).
        ENDLOOP.
        "Base Unit of Measure-item
        LOOP AT reported-productunitofmeasureean ASSIGNING FIELD-SYMBOL(<lt_unitofmeasureean>).
          DATA(lv_unitofmeasureean) = <lt_unitofmeasureean>-%msg->if_message~get_text( ).
          out->write( 'unitofmeasureean error' ).
          out->write( lv_unitofmeasureean ).
        ENDLOOP.

        "_ProductEWMWarehouse
        out->write( 'failed_commit Error' ).
      ELSE.
        out->write( 'SUCCESS' ).
      ENDIF.
*            COMMIT ENTITIES END.
    ENDIF.
  ENDMETHOD.
ENDCLASS.
