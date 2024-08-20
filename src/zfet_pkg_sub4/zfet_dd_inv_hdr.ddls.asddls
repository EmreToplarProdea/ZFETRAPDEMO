@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Data Definition for Invoice Header'
define root view entity ZFET_DD_INV_HDR
  as select from zfet_t_inv_hdr
  composition [1..*] of ZFET_DD_INV_ATT as _Attachments
  association [1] to /DMO/I_Customer      as _Customer on $projection.VendorId = _Customer.CustomerID
{
  key zfet_t_inv_hdr.invoice               as Invoice,
      @EndUserText.label: 'Comments'
      zfet_t_inv_hdr.comments              as Comments,
      @EndUserText.label: 'Vendor ID'
      @Consumption.valueHelpDefinition: [{ entity: {name: '/DMO/I_CUSTOMER', element: 'CustomerID'} }]
      @ObjectModel.text.element: ['CustomerName']
      zfet_t_inv_hdr.vendor_id            as VendorId,
      _Customer.FirstName                as CustomerName,
      @Semantics.user.createdBy: true
      zfet_t_inv_hdr.local_created_by      as LocalCreatedBy,
      @Semantics.user.lastChangedBy: true
      zfet_t_inv_hdr.local_last_changed_by as LocalLastChangedBy,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      zfet_t_inv_hdr.local_last_changed_at as LocalLastChangedAt,
      @Semantics.systemDateTime.lastChangedAt: true
      zfet_t_inv_hdr.last_changed_at       as LastChangedAt,
      _Attachments, // Make association public
      _Customer // Make association public
}
