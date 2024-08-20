@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Data Definition for Invoice Attachments'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZFET_DD_INV_ATT
  as select from zfet_t_inv_att
  association to parent ZFET_DD_INV_HDR as _Invoice on $projection.Invoice = _Invoice.Invoice
{
  key attach_id  as AttachId,
      @EndUserText.label: 'Invoice'
      invoice    as Invoice,
      @EndUserText.label: 'Comments'
      comments   as Comments,
      @EndUserText.label: 'Attachment'
      @Semantics.largeObject: {
          mimeType: 'Mimetype',
          fileName: 'Filename',
          contentDispositionPreference: #INLINE
      }
      attachment as Attachment,
      @EndUserText.label: 'Type of Document'
      mimetype   as Mimetype,
      @EndUserText.label: 'File Type'
      filename   as Filename,
      _Invoice.LastChangedAt as LastChangedAt,
      _Invoice
}
