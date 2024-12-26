*** Variables ***
#Select Branch
${Locator_Select_Branch}    id=ddl_Branch_chosen
${Locator_Text_Branch}   //div[@id="ddl_Branch_chosen"]//li[contains(text(),'***replace***')][1]
${Locator_Button_Ok}    //button[@onclick="OK_BranchOnClick()"]

#KeyInStep1
${Locator_Icon_Keyinstep1}    //a[@href="#"][contains(text(), 'KEY IN STEP 1')]
${Locator_Radio_Virtualcard}    id=rdoVirtualCard
${Locator_Radio_Cardtype_Umay}    id=rdoVCard
${Locator_Radio_Cardtype_Premier}    id=rdoVPremier
${Locator_Field_ID}    id=txtIDNo1
${Locator_Field_Confirm_Id}    id=txtIDNo2
${Locator_Select_Title}    id=ddlThaiTitle_chosen
${Locator_Text_Title1}    //li[@data-option-array-index="1"]
${Locator_Field_Namethai}    id=txtNameThai
${Locator_Field_Surnamethai}    id=txtSurnameThai
${Locator_Field_BirthDate_D}    id=txtBirth_D
${Locator_Field_BirthDate_M}    id=txtBirth_M
${Locator_Field_BirthDate_Y}    id=txtBirth_Y
${Locator_Field_Re_BirthDate_D}    id=txtReBirth_D
${Locator_Field_Re_BirthDate_M}    id=txtReBirth_M
${Locator_Field_Re_BirthDate_Y}    id=txtReBirth_Y
${Locator_ExpireDate_D}    id=txtExpire_D
${Locator_ExpireDate_M}    id=txtExpire_M
${Locator_ExpireDate_Y}    id=txtExpire_Y
${Locator_Field_Mobileno}    id=txtMobileNo
${Locator_Text_Doparesult}    id=DopaResult
${Locator_Select_Applytype}    //div[@id="ddlApplyType_chosen"]
${Locator_Text_Applytype_18}    //div[@id="ddlApplyType_chosen"]//li[@class="active-result"][contains(text(),'18 : SPEEDY TO BOTEN-Taddy')]
${Locator_Select_Applyvia}    id=ddlApplyVia_chosen
${Locator_Text_Applyvia_2}    //div[@id="ddlApplyVia_chosen"]//li[@class="active-result"][contains(text(),'สมัครโดยตรง ที่สาขา')]    
${Locator_Select_Applychannel}    id=ddlApplyChannel_chosen
${Locator_Input_Applychannel}    //div[@id="ddlApplyType_chosen"]//input
${Locator_Text_Applychannel_3}    //div[@id="ddlApplyChannel_chosen"]//li[@class="active-result"][contains(text(),'005 : โทรทัศน์-Taddy')]
${Locator_Select_SubApplyChannel}    //div[@id="ddlSubChan_chosen"]
${Locator_Introducer}    //input[@id="txtintro"]
${Locator_Name_Customer}    id=txtintro_name 
${Locator_Label_Saleagent}    id=dd_saleAG_chosen
${Locator_Text_Saleagent_1}    //div[@id="dd_saleAG_chosen"]//li[@class="active-result"][contains(text(),'SNOOPPY')]
${Locator_Label_Campaign}    id=ddlCamp1_chosen
${campaign_2_locator}    id=ddlCamp2_chosen
${campaign_3_locator}    id=ddlCamp3_chosen
${Locator_Delivery}    id=ddlPremiumDel_chosen
${Locator_Select_Activity}    //div[@id="ddlActivity_chosen"]
${Locator_Select_Specialcase}    //div[@id="ddlSpecialcase_chosen"]
${Locator_Button_Checkdata}    id=btn_CheckData
${Locator_Confirm_Key1}    id=btn_ConfirmStep1
${Locator_Button_Step1}    id=btn_yes_Step1
${Locator_Button_NCB}    id=btn_yes_ncb
${Locator_Button_Senddoc}    id=btn_yes_creditsenddoc
${Locator_Button_Confirm_Senddoc}    id=btn_yes_senddoc
${Locator_textbox_Barcode}    id=txt_Barcode
${Locator_Button_Confime_Barcode}    id=btn_saveBarcode
${Locator_Button_Sendboten}    id=btn_yes_sendboten
${Locator_Text_UmayCard1}    //input[@id="txtUmayPlusCard1"]
${Locator_Text_UmayCard2}    //input[@id="txtUmayPlusCard2"]
${Locator_Text_UmayCard3}    //input[@id="txtUmayPlusCard3"]
${Locator_Text_UmayCard4}    //input[@id="txtUmayPlusCard4"]
${Locator_Text_CardRekey1}    //input[@id="txtReKeyUmayPlus1"]
${Locator_Text_CardRekey2}    //input[@id="txtReKeyUmayPlus2"]
${Locator_Text_CardRekey3}    //input[@id="txtReKeyUmayPlus3"]
${Locator_Text_CardRekey4}    //input[@id="txtReKeyUmayPlus4"]
${Locator_name_eng}    id=pop_name_eng
${Locator_surname_eng}    id=pop_surname_eng
${Locator_confirm_name_eng}    //button[@onclick="Confirm_NameEng()"]
${Scroll_Locator}    //a[@href="#"][contains(text(),'RECEIVE FAX')]
${confirm_sms_locator}    //button[@id='btn_send_sms']
${popup_error_locator}    //div[@class="ui-pnotify-text"]
${btn_clear_locator}    id=btn_Clear
${Specialcase_input_locator}    //div[@id="ddlSpecialcase_chosen"]//input
${Activity_input_locator}    //div[@id="ddlActivity_chosen"]//input
${ApplyChannel_input_locator}    //div[@id="ddlApplyChannel_chosen"]//input
${ApplyType_input_locator}    //div[@id="ddlApplyType_chosen"]//input
${saleagent_input_locator}    //div[@id="dd_saleAG_chosen"]//input
${campaign_1_input_locator}    //div[@id="ddlCamp1_chosen"]//input
${btn_no_send_doc_locator}    //h4[@id='lblModal_SendDocument']/..//following-sibling::div//button[@id='btn_hideByPdpa']
${check_box_option_sms_pending_key1_locator}    //input[@id='optionSMS']
${btn_no_ncb_key1_locator}    //button[@id='btn_no_ncb']
${btn_save_note_pending_key1_locator}    //button[text()='Save Note']
${btn_ok_confirm_save_note_pending_key1_locator}    //button[@id='btn_OK' and contains(text(),'OK')]
${Locator_modal_NCB}    //div[@id='divModal_HaveConsent']
${Locator_modal_Creadit}    id=divModal_CreditModel
${Locator_modal_sendboten}    id=lblModal_SendToStep1

# Dropdown Loop # ใช้สำหรับ Replace แก้ไข Xpath

${Cardtype_Locator}    //div[@id="divVirtualCard"]//input[@value="***replace***"]
${Title}    //div[@id="ddlThaiTitle_chosen"]//li[contains(text(),'***replace***')][1]
${Applytype}    //div[@id="ddlApplyType_chosen"]//li[contains(text(),'***replace***')]
${Applyvia}    //div[@id="ddlApplyVia_chosen"]//li[contains(text(),'***replace***')] 
${Applychannel}    //div[@id="ddlApplyChannel_chosen"]//li[contains(text(),'***replace***')]
${SubApplyChannel}    //div[@id="ddlSubChan_chosen"]//li[contains(text(),'***replace***')]
${Saleagent}    //div[@id="dd_saleAG_chosen"]//li[contains(text(),'***replace***')]
${Campaign}    //div[@id="ddlCamp1_chosen"]//li[contains(text(),'***replace***')]
${Campaign2}    //div[@id="ddlCamp2_chosen"]//li[contains(text(),'***replace***')]
${Campaign3}    //div[@id="ddlCamp3_chosen"]//li[contains(text(),'***replace***')]
${Delivery}    //div[@id="ddlPremiumDel_chosen"]//li[contains(text(),'***replace***')]
${Activity}    //div[@id="ddlActivity_chosen"]//li[contains(text(),'***replace***')]
${Specialcase}    //div[@id="ddlSpecialcase_chosen"]//li[contains(text(),'***replace***')]
${title_index_locator}    //div[@id="ddlThaiTitle_chosen"]//li[@data-option-array-index="***replace***"]
${special_Case_index_locator}    //div[@id="ddlSpecialcase_chosen"]//li[@data-option-array-index="***replace***"]
${activity_index_locator}    //div[@id="ddlActivity_chosen"]//li[@data-option-array-index="***replace***"]
${applychannel_index_locator}    //div[@id="ddlApplyChannel_chosen"]//li[@data-option-array-index="***replace***"]
${ApplyType_index_locator}    //div[@id="ddlApplyType_chosen"]//li[@data-option-array-index="***replace***"]
${ApplyVia_index_locator}    //div[@id="ddlApplyVia_chosen"]//li[@data-option-array-index="***replace***"]
${saleagent_index_locator}    //div[@id="dd_saleAG_chosen"]//li[@data-option-array-index="***replace***"]
${capmaign_1_index_locator}    //div[@id="ddlCamp1_chosen"]//li[@data-option-array-index="***replace***"]
${dropdown_via_locator}    //*[@id="ddlApplyVia_chosen"]/a/span
${input_dropdown_via_locator}    //*[@id="ddlApplyVia_chosen"]//input
${lbl_app_no_key_1_locator}    //label[@id='txt_AppNo_Pop']

${title_input}    //div[@id="ddlThaiTitle_chosen"]//input
# Loop Verify Key 1 
# Branch
${Loop_Verify_Title_Branch}    //div[@class="main_container"]//label/../label[not(@id="lbl_LocalName" or @id="lbl_Branch")]
# Key In 1 
${Loop_Verify_Title_Keyinstep1}    //div[@class="row form-group"]//label[@class="control-label col-md-2 col-sm-2 col-xs-12"]
${Loop_Verify_Title_Keyinstep1_Virual}    //div[@class="row form-group"]/../div[not(contains(@style,'display: none;'))]//label[@class="control-label col-md-2 col-sm-2 col-xs-12"]
# Manage App Title
${Loop_Verify_Title_Manageapp}    //div[@id="div_tb_show"]//th[@class="tab1"]
# ErrorMessage
${Lopp_Verify_Error_Keyinstep1}    //div[@class="alert-msg alert-msg-error col-md-5 col-sm-5 col-xs-12"]
# Menu & Text 
${Loop_Verify_MenuMain_Keyinstep1}    //div[@id="sidebar-menu"]//a
# Button Select Bracnh
${Loop_Verify_Btn}    //button[@type="button"]
# Set virtuadcard_No
${txt_virtuadcard_No1_locator}    //input[@id='txtVirtuadCardNo1']
${txt_virtuadcard_No2_locator}    //input[@id='txtVirtuadCardNo2']
${txt_virtuadcard_No3_locator}    //input[@id='txtVirtuadCardNo3']
${txt_virtuadcard_No4_locator}    //input[@id='txtVirtuadCardNo4']
#ApplicationDate
${lbl_application_date_locator}    //label[@id='lblApplicationDate']

# Crate List 
@{Title_Branch}
...    User
...    Tab	
...    Branch 	
...    User main	
...    Title Page	
...    Title Dropdown

@{Btn_Branch}
...    Button

@{Title_Keyinstep_1_UmayCard}    
...    Umay+	
...    Re Key Umay+		
...    ID No	
...    Title_Thai	
...    Name_Thai	
...    Surname_Thai	
...    Birth Date	
...    Expire Date	
...    Mobile No	
...    Dopa Result	
...    Apply Type	
...    Apply Via	
...    Apply Channel		
...    Special Case

@{Title_Keyinstep_1_Virual}    
...    Card Type	
...    ID No	
...    Title Thai	
...    Name Thai	
...    SurnameThai	
...    Birth Date	
...    Expire Date	
...    Mobile No	
...    Dopa Result	
...    Apply Type	
...    Apply Via	
...    Apply Channel	
...    Sub Apply Channel	
...    Activity Code	
...    Special Case


@{Title_Menu_Keyinstep_1}
...    RL_Screen	
...    BRANCH	
...    HOME INQUIRY	
...    INTERVIEW	
...    EDIT BARCODE	
...    FOLLOW UP (SEND APP TO BOTEN)	
...    INQUIRY APPLICATION	
...    INQUIRY MERGE BARCODE	
...    KEY IN STEP 1	
...    MANAGE APPLICATION ONLINE	
...    PENDING AT BOTEN	
...    PENDING PROCESS	
...    REPORT CONSENT CREDIT MODEL	
...    RESEND BUREAU	
...    UPDATE CONSENT CREDIT MODEL	
...    VIEW RECEIVE CASE	
...    REQUEST (INCOMPLETE DOCUMENT)


${error_message_id_locator}    id=lbl_msg_03
${error_message_title_locator}    id=lbl_msg_04
${error_message_surname_locator}    id=lbl_msg_05
${error_message_lastname_locator}    id=lbl_msg_06
${error_message_birthday_locator}    id=lbl_msg_07
${error_message_expire_date_locator}    id=lbl_msg_08
${error_message_apply_type_locator}    id=lbl_msg_10
${error_message_apply_via_locator}    id=lbl_msg_11
${error_message_apply_channal_locator}    id=lbl_msg_12

# Validate
${validate_field_umay_plus_card_locator}    id=lbl_msg_01
${validate_field_dopa_result_locator}    //label[@id="DopaResult"]
${validate_field_introducer_locator}    //label[@id="lbl_msg_13"]    # PLEASE, SELECT SUB APPLY CHANNEL
${validate_field_introducer_name_locator}    //input[@id='txtintro_name']

# dropdown premium
${dropdown_premiumdelivery_for_click_locator}    //div[@id="ddlPremiumDel_chosen"]
${replace_data_premiumdelivery_locator}    //div[@id="ddlPremiumDel_chosen"]//span[contains(text(),'***replace***')]

# popup re save when error
${alert_this_card_is_use}    //label[@id='lbl_msg_01' and contains(text(),'THIS CARD IN USE…!!')]
${alert_dopa_result}    //label[@id='DopaResult' and contains(text(),'A : สถานะปกติทำรายการต่อได้')]
${popup_save_locator}    //button[@id='btn_hideByPdpa']
${popup_btn_save_locator}    id=btn_hideByPdpa
${popup_csn_error}    //div[@class='ui-pnotify-text' and contains(text(),'Digit of CSN Invalid')]
${popup_timeout_error}    //div[@class='ui-pnotify-text' and contains(text(),'One or more errors occurred. (API:)')]
${popup_barcode_error}    //div[@class="ui-pnotify-text" and contains(text(),'Barcode used by App No.')]
${popup_new_customer}    //div[@class="ui-pnotify-text" and contains(text(),'New Customer')]
${popup_select_branch}    //div[@class="ui-pnotify-text" and contains(text(),'Please Select Branch.')]
${popup_pending_application}    //div[@class="ui-pnotify-text" and contains(text(),'HAVE PENDING APPLICATION')]
