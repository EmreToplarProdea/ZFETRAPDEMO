@EndUserText.label: 'Attachment Projection for Student'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define view entity zfet_prj_std_att 
as projection on ZFET_DD_STD_ATT
{
    @UI.facet: [{
      id: 'StudentData',
      purpose: #STANDARD,
      label: 'Attachment Information',
      type: #IDENTIFICATION_REFERENCE,
      position: 10
       }]

      @UI: {
      lineItem: [{ position: 10 }],
      identification: [{ position: 10 }]
      }
  key AttachId,
      @UI: {
      lineItem: [{ position: 20 }],
      identification: [{ position: 20 }]
      }
      Id,
      @UI: {
      lineItem: [{ position: 30 }],
      identification: [{ position: 30 }]
      }
      Comments,
      @UI: {
      lineItem: [{ position: 40 }],
      identification: [{ position: 40 }]
      }
      Attachment,
      Mimetype,
      Filename,
      LastChangedat,
      /* Associations */
      _Student : redirected to parent ZFET_PRJ_STD_HDR
}
