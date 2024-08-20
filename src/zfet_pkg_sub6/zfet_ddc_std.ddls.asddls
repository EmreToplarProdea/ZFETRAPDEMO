@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'DD Consumption for Student DD'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define root view entity ZFET_DDC_STD 
as projection on ZFET_DD_STD as Student
{
@EndUserText.label: 'Student ID'
    key Id,
    @EndUserText.label: 'First Name'
    Firstname,
    @EndUserText.label: 'Last Name'
    Lastname,
    @EndUserText.label: 'Age'
    Age,
    @EndUserText.label: 'Course'
    Course,
    @EndUserText.label: 'Course Duration'
    Courseduration,
    @EndUserText.label: 'Status'
    Status,
    @EndUserText.label: 'Gender'
    Gender,
    @EndUserText.label: 'Date of Birth'
    Dob
}
