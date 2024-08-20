@EndUserText.label: 'Projection for Invoice Header'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@UI.headerInfo: {
    typeName: 'Invoice',
    typeNamePlural: 'Invoices',
    title: {value: 'Invoice'},
    description: {value: 'Comments'}
    }
define root view entity ZFET_PRJ_INV_HDR
  as projection on ZFET_DD_INV_HDR
{

      @UI.facet: [{
      id: 'InvoiceData',
      purpose: #STANDARD,
      label: 'Invoice Data',
      type: #IDENTIFICATION_REFERENCE,
      position: 10
      }, {
      id: 'Upload',
      label: 'Upload your attachments',
      position: 20,
      purpose: #STANDARD,
      type: #LINEITEM_REFERENCE,
      targetElement: '_Attachments'
      }]
      
      @UI: {
         selectionField: [{position: 10}],
         lineItem: [{position: 10}],
         identification: [{position: 10}]
      }

  key Invoice,
      @UI: {
              identification: [{position: 20}]
           }
      Comments,
      @UI: {
              selectionField: [{position: 30}],
              lineItem: [{position: 30}],
              identification: [{position: 30}]
           }
      VendorId,
      CustomerName,
      @UI: {
              identification: [{position: 40}]
           }
      LocalCreatedBy,
      @UI: {
              identification: [{position: 50}]
           }
      LocalLastChangedBy,
      LocalLastChangedAt,
      LastChangedAt,
      /* Associations */
      _Attachments : redirected to composition child ZFET_PRJ_INV_ATT,
      _Customer
}
