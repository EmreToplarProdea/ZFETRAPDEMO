@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Student Header Interface'
define root view entity ZFET_DD_STD_HDR as select from zfet_t_std_hdr
composition[1..*] of ZFET_DD_STD_ATT as _Attachments
{
    @EndUserText.label: 'Student ID'
        key zfet_t_std_hdr.id as Id,
        @EndUserText.label: 'First Name'
        zfet_t_std_hdr.firstname as Firstname,
        @EndUserText.label: 'Last Name'
        zfet_t_std_hdr.lastname as Lastname,
        @EndUserText.label: 'Age'
        zfet_t_std_hdr.age as Age,
        @EndUserText.label: 'Course'
        zfet_t_std_hdr.course as Course,
        @EndUserText.label: 'Course Duration'
        zfet_t_std_hdr.courseduration as Courseduration,
        @EndUserText.label: 'Status'
        zfet_t_std_hdr.status as Status, 
        @EndUserText.label: 'Gender'
        zfet_t_std_hdr.gender as Gender, 
        @EndUserText.label: 'DOB'
        
        zfet_t_std_hdr.dob as Dob,
        zfet_t_std_hdr.lastchangedat as Lastchangedat,
        zfet_t_std_hdr.locallastchangedat as Locallastchangedat,
        
    _Attachments // Make association public
}
