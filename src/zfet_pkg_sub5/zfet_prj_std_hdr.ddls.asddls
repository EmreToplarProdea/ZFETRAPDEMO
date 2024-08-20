@EndUserText.label: 'Header Projection for Student'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define root view entity ZFET_PRJ_STD_HDR 
provider contract transactional_query
as projection on ZFET_DD_STD_HDR
{
    @UI.facet: [{

      id: 'StudentData',
      purpose: #STANDARD,
      label: 'Student Data',
      type: #IDENTIFICATION_REFERENCE,
      position: 10
       },{

       id: 'Upload',
      purpose: #STANDARD,
      label: 'Upload Attachments',
      type: #LINEITEM_REFERENCE,
      position: 20,
      targetElement: '_Attachments'
       }]

      @UI: {

      selectionField: [{ position: 10 }],
      lineItem: [{ position: 10 }],
      identification: [{ position: 10 }]
      }

  key Id,
      @UI: {
      lineItem: [{ position: 20 }],
      identification: [{ position: 20 }]
      }
      Firstname,
      @UI: {
      lineItem: [{ position: 30 }],
      identification: [{ position: 30 }]
      }
      Lastname,
      @UI: {
      lineItem: [{ position: 40 }],
      identification: [{ position: 40 }]
      }
      Age,
      @UI: {
      lineItem: [{ position: 50 }],
      identification: [{ position: 50 }]
      }
      Course,
      @UI: {
      lineItem: [{ position: 60 }],
      identification: [{ position: 60 }]
      }
      Courseduration,
      @UI: {
      lineItem: [{ position: 70 }],
      identification: [{ position: 70 }]
      }
      Status,
      @UI: {
      lineItem: [{ position: 80 }],
      identification: [{ position: 80 }]
      }
      Gender,
      @UI: {
      lineItem: [{ position: 90 }],
      identification: [{ position: 90 }]
      }
      Dob,
      Lastchangedat,
      Locallastchangedat,
      /* Associations */
      _Attachments : redirected to composition child zfet_prj_std_att
}
