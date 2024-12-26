*** Variables ***
# Popup Allocate
${btn_not_ready}    id=ch-not-ready

# Key in step 2
${Locator_Label_ID}    //label[@id="lbl_IDNo"]
${Locator_Key2_Applytype}    id=dd_applyType_chosen
${Locator_Key2_Via}    id=dd_applyVia_chosen
${Locator_Key2_Apllychanel}    id=dd_applyChan_chosen
${Locator_Key2_Activity}    //div[@id="dd_activity_chosen"]
${Locator_Key2_SubApplyChanel}    //div[@id="dd_subChan_chosen"]
${Locator_Key2_Brithday}    id=dd_bd_chosen
${Locator_Key2_Marital}    id=dd_marital_chosen
${Locator_Key2_Child}    id=txt_child
${Locator_Key2_Sex}    id=dd_sex_chosen
${Locator_Key2_HomeY}    id=txt_homeY
${Locator_Key2_HomeM}    id=txt_homeM
${Locator_Key2_Homeperson}    id=txt_homePerson
${Locator_Key2_Hometype}    id=dd_homeType_chosen
${Locator_Key2_Bustype}    id=dd_busType_chosen
${Locator_Key2_SubBustype}    //div[@id="dd_subBusType_chosen"]
${Locator_Key2_OccType}    id=dd_occType_chosen
${Locator_Key2_SubOccType}    id=dd_subOccType_chosen
${Locator_Key2_PosType}    id=dd_posType_chosen
${Locator_Key2_OffPerson}    id=txt_offPerson
${Locator_Key2_WorkYear}    id=txt_workY
${Locator_Key2_WorkMonth}    id=txt_workM
${Locator_Key2_EmpoyeeType}    id=dd_empType_chosen
${Locator_Key2_Saltype}    xpath=//div[@id="dd_salType_chosen"]
${Locator_Key2_CusType}    //div[@id="dd_custType_chosen"]
${Locator_Key2_SalDoc}    id=dd_salDoc_chosen
${Locator_Key2_TextSal}    id=txt_sal
${Locator_Key2_TelType}    //div[@id="dd_telType_chosen"]
${Locator_Key2_TelHome}    id=txt_Htel
${Locator_Key2_MobileTel}    //input[@id="txt_mobile"]
# Home
${Locator_Key2_ZipcodeHome}    id=txt_zipcode_home
${Locator_Key2_SearchHome}    id=btn_search_home
${Locator_Key2_HomeAddress}    id=dd_home_Address_chosen
${Locator_Key2_HomeTambol}    //div[@id="dd_homeTam_chosen"]
${Locator_Key2_HomeAmphuer}    //div[@id="dd_homeAmp_chosen"]
${Locator_Key2_HomeProvince}    //div[@id="dd_homeProv_chosen"]
${Locator_Key2_HomeZipcode}    //div[@id="dd_homeZip_chosen"]
# Office
${Locator_Key2_ZipcodeOffice}    //input[@id="txt_zipcode_off"]
${Locator_Key2_SearchOffice}    id=btn_search_off
${Locator_Key2_OfficeAddress}    //div[@id="dd_off_Address_chosen"]
${Locator_Key2_OfficeTambol}    //div[@id="dd_OffTam_chosen"]
${Locator_Key2_OfficeAmphuer}    //div[@id="dd_OffAmp_chosen"]
${Locator_Key2_OfficeProvince}    //div[@id="dd_OffProv_chosen"]
${Locator_Key2_OfficeZipcode}    //div[@id="dd_OffZip_chosen"]

${Locator_Key2_AgCode}    //div[@id="dd_agCode_chosen"]
${Locator_Key2_SearchBankCode}    //div[@id="dd_Bank_chk_chosen"]
${Locator_Key2_BankCode}    //input[@id="txt_Bank"]
${Locator_Key2_AccNo}    //input[@id="txt_accNo"]
${Locator_Key2_AccTypeRe}    //div[@id="dd_accType_r_chosen"]
${Locator_Key2_SearchBankCodeRe}    //div[@id="dd_Bank_r_chosen"]
${Locator_Key2_AccNoRe}    //input[@id="txt_accNo_r"]
${Locator_Key2_Intro}    //input[@id="txt_intro"]
${Locator_Key2_Delivery}    //div[@id="dd_deliver_chosen"]
${Locator_Key2_CampaingCode1}    //div[@id="dd_campCode1_chosen"]
${Locator_Key2_CampaingCode2}    id=dd_campCode2_chosen
${Locator_Key2_CampaingCode3}    id=dd_campCode3_chosen
#card
${Locator_Key2_Zipcode_Card}    id=txt_zipcode_card
${Locator_Key2_Search_Card}    id=btn_search_card
${Locator_Key2_CardAddress}    id=dd_card_Address_chosen
${Locator_Key2_CardTambol}    //div[@id="dd_cardTam_chosen"]
${Locator_Key2_CardAmphuer}    //div[@id="dd_cardAmp_chosen"]
${Locator_Key2_CardProvince}    //div[@id="dd_cardProv_chosen"]
${Locator_Key2_CardZipcode}    //div[@id="dd_cardZip_chosen"]

${Locator_Key2_Label}    //label[@class="col-md-offset-2 col-sm-offset-2 col-xs-offset-0 col-md-2 col-sm-2 col-xs-12"]/input
${Locator_Key2_Relationship_N}    //input[@name="rdoRelation" and @value="N"]
${Locator_Key2_Relationship_Y}    //input[@name="rdoRelation" and @value="Y"]
${Locator_Key2_Relationship_Y_Name}    //input[@id="txtRelateName"]
${Locator_Key2_Relationship_Y_Sur}    //input[@id="txtRelateName"]
${Locator_Key2_Relationship_Y_Rel}    //div[@id="ddlRelation_chosen"]
${Locator_Key2_Relationship_Y_Pos}    //input[@id="txtRelatePosition"]
${Locator_Key2_Txt_tt_loan}    id=txt_tt_loan
${Locator_Key2_txt_RcOfficeTel}    id=txt_RCOffTel1
${Locator_Key2_btn_VerifyJudg}    id=btn_VerifyJudg
${Locator_Key2_btn_Calculate}    id=btn_CalculateJudg
${Locator_Key2_btn_ConfirmJudg}    id=btn_ConfirmJudg
${Locator_Key2_btn_Yes_ConfirmJudg}    id=btn_pop_ConfirmJudg_Y
${Locator_Key2_btn_SendSMS}    id=btn_pop_mobile
${Locator_Key2_btn_Gotomain}    xpath=//button[@id="btn_GoToMain"]
${Locator_Key2_WorkProcess}    id=header_work_process
${Locator_Key2_btn_SendSMS_company_blacklist}    //button[@id='btn_pop_mobile']


# Loop Check Office 
${Locator_Company_Title}    xpath=//div[@id="ddlOffTitle_chosen"]
${Dropdown_Title_Office}    //div[@id="ddlOffTitle_chosen"]//li[contains(text(),'***replace***')]
# Loop Dropdown Key In Step 2
${Dropdown_ApplyType}    //div[@id="dd_applyType_chosen"]//li[contains(text(),'***replace***')]
${Dropdown_ApplyVia}    //div[@id="dd_applyVia_chosen"]//li[contains(text(),'***replace***')]
${Dropdown_ApplyChannel}    //div[@id="dd_applyChan_chosen"]//li[contains(text(),'***replace***')]
${Dropdown_Activity}    //div[@id="dd_activity_chosen"]//li[contains(text(),'***replace***')]
${Dropdown_SubApplyChanel}    //div[@id="dd_subChan_chosen"]//li[contains(text(),'***replace***')]
${Dropdown_Birthday}    //div[@id="dd_bd_chosen"]//li[contains(text(),'***replace***')]
${Dropdown_Marital}    //div[@id="dd_marital_chosen"]//li[contains(text(),'***replace***')] 
${Dropdown_Sex}    //div[@id="dd_sex_chosen"]//li[contains(text(),'***replace***')]
${Dropdown_HomeType}    //div[@id="dd_homeType_chosen"]//li[contains(text(),'***replace***')]
${Dropdown_BusType}    //div[@id="dd_busType_chosen"]//li[contains(text(),'***replace***')]
${Dropdown_SubBusType}    //div[@id="dd_subBusType_chosen"]//li[contains(text(),'***replace***')]
${Dropdown_OccType}    //div[@id="dd_occType_chosen"]//li[contains(text(),'***replace***')] 
${Dropdown_SubOccType}     //div[@id="dd_subOccType_chosen"]//li[contains(text(),'***replace***')] 
${Dropdown_PosType}     //div[@id="dd_posType_chosen"]//li[contains(text(),'***replace***')]
${Dropdown_EmpType}    //div[@id="dd_empType_chosen"]//li[contains(text(),'***replace***')]
${Dropdown_SalType}       //div[@id="dd_salType_chosen"]//li[contains(text(),'***replace***')]
${Dropdown_CusType}    //div[@id="dd_custType_chosen"]//li[contains(text(),'***replace***')]
${Dopdown_salDoc}        //div[@id="dd_salDoc_chosen"]//li[contains(text(),'***replace***')]
${Dopdown_TelType}        //div[@id="dd_telType_chosen"]//li[contains(text(),'***replace***')]
# Home
${Drowdown_Home_Address}     //div[@id="dd_home_Address_chosen"]//li[contains(text(),'***replace***')]
${Drowdown_Home_Tambol}     //div[@id="dd_homeTam_chosen"]//li[contains(text(),'***replace***')]
${Drowdown_Home_Amphuer}    //div[@id="dd_homeAmp_chosen"]//li[contains(text(),'***replace***')]
${Drowdown_Home_Province}    //div[@id="dd_homeProv_chosen"]//li[contains(text(),'***replace***')]
${Drowdown_Home_Zipcode}    //div[@id="dd_homeZip_chosen"]//li[contains(text(),'***replace***')]
# Office
${Drowdown_Office_Address}    //div[@id="dd_off_Address_chosen"]//li[contains(text(),'***replace***')]
${Drowdown_Office_Tambol}    //div[@id="dd_OffTam_chosen"]//li[contains(text(),'***replace***')]
${Drowdown_Office_Amphuer}    //div[@id="dd_OffAmp_chosen"]//li[contains(text(),'***replace***')]
${Drowdown_Office_Province}    //div[@id="dd_OffProv_chosen"]//li[contains(text(),'***replace***')]
${Drowdown_Office_Zipcode}    //div[@id="dd_OffZip_chosen"]//li[contains(text(),'***replace***')]

${Dropdown_Off_Addres}       //div[@id="dd_off_Address_chosen"]//li[contains(text(),'***replace***')]
${Dropdown_AgCode}    //div[@id="dd_agCode_chosen"]//li[contains(text(),'***replace***')] 
${Dropdown_SearchBankCode}    //div[@id="dd_Bank_chk_chosen"]//li[contains(text(),'***replace***')]
${Dropdown_AccTypeRe}    //div[@id="dd_accType_r_chosen"]//li[contains(text(),'***replace***')]
${Dropdown_SearchBankCodeRe}    //div[@id="dd_Bank_r_chosen"]//li[contains(text(),'***replace***')]
${Dropdown_Deliver}        //div[@id="dd_deliver_chosen"]//li[contains(text(),'***replace***')]
${Dropdown_CampCode}       //div[@id="dd_campCode1_chosen"]//li[contains(text(),'***replace***')]
${Dropdown_CampCode2}    //div[@id="dd_campCode2_chosen"]//li[contains(text(),'***replace***')]
${Dropdown_CampCode3}    //div[@id="dd_campCode3_chosen"]//li[contains(text(),'***replace***')]
# Card
${Dropdown_Card_Address}       //div[@id="dd_card_Address_chosen"]//li[contains(text(),'***replace***')]
${Dropdown_Card_Tambol}    //div[@id="dd_cardTam_chosen"]///li[contains(text(),'***replace***')]
${Dropdown_Card_Amphuer}    //div[@id="dd_cardAmp_chosen"]///li[contains(text(),'***replace***')]
${Dropdown_Card_Province}    //div[@id="dd_cardProv_chosen"]///li[contains(text(),'***replace***')]
${Dropdown_Card_Zipcode}    //div[@id="dd_cardZip_chosen"]///li[contains(text(),'***replace***')]

${Dropdown_Relationship_Y_Rel}    //div[@id="ddlRelation_chosen"]//li[contains(text(),'***replace***')]

# Popup Allocate Verify Title
${Loop_title_popup_allocate}    //div[@class="col-md-3"]
# Loob Verify Title
${Loob_Verify_Title_Recheck}    //form[@class="form-horizontal form-label-left"]//label[@class="control-label col-md-2 col-sm-2 col-xs-12"]
# Loop Verify Title Key 2
${Loob_Verify_Main_Title_Key2}    //div[@class="col-md-12 col-sm-12 col-xs-12"]//h2
${Loop_Verify_Title_Key2}    //label[@class="control-label col-md-2 col-sm-2 col-xs-12"]
${Loop_Verify_Title_Key2_Orther}    //label[@class="control-label col-md-3 col-sm-3 col-xs-12"]

# Verify View Customer
${Btn_Verify_Key2}    //ul[@class="nav navbar-left panel_toolbox"]//button[@class="btn btn-primary btn-sm"]/../button[not(contains(@style,'display: none;'))]
${Tab_Verify_Key2}    //a[@role="tab"]
${TabCustomer_Verify_Key2}    //td[@nowrap="wrap"]//label[@class="control-label"]/../../../tr[not(contains(@style,'display: none'))]//label[@class="control-label"]
${TitleMain_Verify_Key2}    //table[@id="tableViewCustomer"]//th
${TitleTable_Verify_Key2}    //table[@id="tableViewCustomer"]//tr[@role="row"]

# Verify Verify Call
${title_tabel_main_verify_call_key_2}    //div[@id="div_custType"]//div[@class="x_title"]
${TableInputText_Verifycall_Key2}    //div[@id="div_Group_1"]//div[@class="form-group"]
# Create list เรียก Excel Key2
@{List_index_excel_checkoffice}
...    Application_No	
...    Application_Date	
...    Result_Bureau	
...    ID_No	
...    Name	
...    Category	
...    Card_Type

@{List_index_excel_Verify_key2}
...    OFFICE	
...    JUDGMENT_ITEM	
...    ID_CARD_ADDRESS	
...    RELATIONSHIP

@{List_index_excel_Verify_key2_title}
...    Application_No	
...    Application_Date	
...    Result_Bureau
...    ID_No	
...    Name	
...    Category	
...    Card_Type	
...    Apply_Via	
...    Apply_Chanel	
...    Sub_Apply_Channel	
...    Age	
...    Brithday	
...    Status	
...    Children	
...    Sex	
...    Period_of_residence	
...    Number_of_people	
...    Housing	
...    Business_type	
...    Sub_business_type	
...    Occupation	
...    Sub_Occupation	
...    Position	
...    Number_of_employees	
...    Year_of_work	
...    Employment_type	
...    Receiving_salary	
...    Customer_type	
...    Documents_for_calculation	
...    Salary	
...    Auto_Salary_Adjust	
...    Home_number	
...    Phone_number	
...    Post_Code_Home	
...    Post_Code_Office	
...    Salary_date	
...    Sale_Agent_Code	
...    Sale_Agent_Code_Mobile	
...    Account_Information	
...    Search_Bank_code	
...    Bank_code	
...    Account_No.	
...    Bank_code	
...    Account_No.	
...    Introducer_ID_No.	
...    Vendor_Code	
...    Premium_Delivery	
...    Campaign_Code	
...    Post_Code_CARD	
...    Name_orther	
...    Lastname_orther	
...    Relation_orther
...    Position_orther	
...    Issuer

@{List_index_excel_key2_title_orther}
...    Office_Title	
...    Office_Name	
...    Tambol_1	
...    Province_1	
...    Tambol_2	
...    Province_2
...    Account_Type	
...    Bank_branch	
...    Account_Information_Recheck	
...    Account_Type	
...    Bank_branch		
...    Tambol_3
...    Province_3
...    HOME_Telephone	
...    OFFICE_Telephone	
...    Mobile

${menu_key2_locator}    //a[contains(@onclick,"KEY IN STEP 2'")]

${txt_id_key2_locator}    //input[@id='txt_s_ID']
${btn_search_key2_locator}    //button[@id='btn_srcPD']
${btn_btn_sel_key2_locator}    //a[@class='btn_sel']
${btn_cancel_key2_locator}    //button[@id='btn_cancel_addnote']

#Popup condition
${lbl_condition_key_2_locator}    //div[text()='***replace***']    
${lbl_condition_recheck_key_2_locator}    //label[text()='***replace***']

${txt_branch_appno}      //label[@id="lblApplication"] 
${popup_success_key2}    (//h4[@class="ui-pnotify-title" and text()="Success"])[1]

# Popup pending
${btn_pending_key2}    //button[@id="btn_Pending"]
${dropdown_pending_key2}    //div[@id="dd_pending_chosen"]
${input_dropdown_pending_key2}    //div[@id="dd_pending_chosen"]//input
${lbl_note_pending_key2}    //textarea[@id="txt_noteD"]
${btn_addnote_pending_key2}    //button[@id="btn_addNote"]
${btn_ok_pending_key2}    //button[@id="btn_OK"]
${popup_error_pending_key2}    (//h4[@class="ui-pnotify-title"])[1]
${popup_error_already_pending}    //div[@class="ui-pnotify-text" and contains(text(),'Already Pending')]