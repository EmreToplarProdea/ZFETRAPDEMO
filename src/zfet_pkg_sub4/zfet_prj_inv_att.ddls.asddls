@EndUserText.label: 'Projection for Invoice Attachment'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@UI.headerInfo: {
    typeName: 'Attachment',
    typeNamePlural: 'Attachments',
    title: {value: 'Filename'}
    }
define view entity ZFET_PRJ_INV_ATT
  as projection on ZFET_DD_INV_ATT
{
      @UI.facet: [{
       id: 'AttachmentData',
       purpose: #STANDARD,
       label: 'Attachment Info',
       type: #IDENTIFICATION_REFERENCE,
       position: 10
       }]

      @UI: {
         lineItem: [{position: 10}],
         identification: [{position: 10}]
      }
  key AttachId,
      @UI: {
          lineItem: [{position: 20}],
          identification: [{position: 20}]
       }
      Invoice,
      @UI: {
      lineItem: [{position: 30}],
      identification: [{position: 30}]
      }
      Comments,
      @UI: {
      lineItem: [{position: 40}],
      identification: [{position: 40}]
      }
      Attachment,
      @UI: {
      lineItem: [{position: 50}],
      identification: [{position: 50}]
      }
      Mimetype,
      @UI: {
      lineItem: [{position: 60}],
      identification: [{position: 60}]
      }
      Filename,
      /* Associations */
      _Invoice : redirected to parent ZFET_PRJ_INV_HDR
}
