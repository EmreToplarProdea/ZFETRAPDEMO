@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Attachment DD'
define view entity ZFET_DD_STD_ATT as select from zfet_t_std_att
association to parent ZFET_DD_STD_HDR as _Student
    on $projection.Id = _Student.Id
{
    
    key zfet_t_std_att.attach_id as AttachId,

       zfet_t_std_att.id as Id,
       @EndUserText.label: 'Comments'
       zfet_t_std_att.comments as Comments,
       
       @EndUserText.label: 'Attachments'
       @Semantics.largeObject:{
           mimeType: 'Mimetype',
           fileName: 'Filename',
           contentDispositionPreference: #INLINE
       }
            
            
       zfet_t_std_att.attachment  as Attachment,
       @EndUserText.label: 'File Type'
       zfet_t_std_att.mimetype as Mimetype,
       @EndUserText.label: 'File Name'
       zfet_t_std_att.filename as Filename,
            
       _Student.Lastchangedat as LastChangedat,
       _Student // Make association public
}
