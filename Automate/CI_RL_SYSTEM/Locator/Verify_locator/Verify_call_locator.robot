*** Variables ***
    # Verify TO
${Locator_Tap_Verifycall}    //li[@id='li_verifycust']
${Locator_Verify_Verifycall_Companytype}    id=dd_companyType_chosen
${Locator_Verify_Verifycall_Subtype}    id=dd_subType_chosen
${Locator_Verify_Verifycall_typecus}    id=dd_typeCust_chosen
${Locator_Verify_Verifycall_btn_custtype}    id=btn_CustType
${Locator_Verify_Verifycall_BOL}    id=dd_BOL_chosen
${Locator_Verify_Verifycall_SSO_TO}    xpath=//div[@id="dd_SSO_TO_chosen"]  
${Locator_Verify_Verifycall_TelOffice_TO}    id=txt_telOff_TO
${Locator_Verify_Verifycall_ChkName_TO}    id=dd_chkName_TO_chosen
${Locator_Verify_Verifycall_Address_TO}    id=dd_address_TO_chosen
${Locator_Verify_Verifycall_Status_TO}    id=dd_Statusofstaff_TO_chosen
${Locator_Verify_Verifycall_Contect}    id=dd_Contect_TO_chosen
${Locator_Verify_Verifycall_Informant}    id=dd_Informant_TO_chosen
${Locator_Verify_Verifycall_btn_TO}    id=btn_TO
${Locator_verify_verifycall_introducer_TO}    //div[@id="dd_Introducer_TO_chosen"]
${Locator_verify_verifycall_offTitle_TO}    //div[@id="ddlOffTitle_TO_chosen"]
${Locator_verify_verifycall_recSal_TO}    //div[@id="dd_recSal_TO_chosen"]
${Locator_verify_verifycall_check_bol_TO}    //div[@id="dd_BOL_TO_chosen"]
${Locator_verify_verifycall_EmploymentType_TO}    //div[@id="dd_EmploymentType_TO_chosen"]
${Dropdown_Verifycall_offTitle_TO}    //div[@id="ddlOffTitle_TO_chosen"]//li[contains(text(),'***replace***')]
${Dropdown_Verifycall_recSal_TO}    //div[@id="dd_recSal_TO_chosen"]//li[contains(text(),'***replace***')]
${Dropdown_Verifycall_check_bol_TO}    //div[@id="dd_BOL_TO_chosen"]//li[contains(text(),'***replace***')]
${Dropdown_Verifycall_EmploymentType_TO}    //div[@id="dd_EmploymentType_TO_chosen"]//li[contains(text(),'***replace***')]
${input_Verifycall_sal_TO}    //input[@id="txt_sal_TO"]
${input_Verifycall_telbrn_TO}    //input[@id="txt_telbrn_TO"]
${input_Verifycall_mobOff1_TO}    //input[@id="txt_mobOff_TO_1"]
${input_Verifycall_mobOff2_TO}    //input[@id="txt_mobOff_TO_2"]
${input_Verifycall_mobOff3_TO}    //input[@id="txt_mobOff_TO_3"]
${input_Verifycall_Informant_TO}    //input[@id="txt_Informant_TO"]
${input_Verifycall_cerSpec_TO}    //input[@id="txt_SpecificationName"]
${input_Verifycall_cerPos_TO}     //input[@id="txt_Position"]
${input_Verifycall_cerDepart_TO}    //input[@id="txt_Department"]
${lbl_Verifycall_int_TO}    //div[@id="div_TO"]//label[@id="lb_int_TO"]
${Popup_Verifycall_success}    (//h4[text()="Success"])[1]

    # Verify TH
${Locator_Verify_Verifycall_tel_TH}    //input[@id="txt_tel_TH"]
${Locator_Verify_Verifycall_chkName_TH}    id=dd_chkName_TH_chosen
${Locator_Verify_Verifycall_chkAddr_TH}    id=dd_chkAddr_TH_chosen
${Locator_Verify_Verifycall_telType_TH}    id=dd_telType_TH_chosen
${Locator_Verify_Verifycall_cont_TH}    id=dd_cont_TH_chosen
${Locator_Verify_Verifycall_person_TH}    id=dd_person_TH_chosen
${Locator_Verify_Verifycall_person_txt_TH}    //input[@id="txt_person_TH"]
${Locator_Verify_Verifycall_btn_TH}    id=btn_TH
    
    # Verify TM
${Locator_Verify_Verifycall_person_TM}    id=dd_person_TM_chosen
${Locator_Verify_Verifycall_btn_TM}    id=btn_TM

    # Verify TE
${Locator_Verify_Verifycall_rel_TE}    id=dd_rel_TE_chosen
${Locator_Verify_Verifycall_Name_TE}    id=txt_Name_TE
${Locator_Verify_Verifycall_Surname_TE}    id=txt_SurName_TE
${Locator_Verify_Verifycall_telHome_TE}    id=txt_telHome_TE
${Locator_Verify_Verifycall_Office_TE}    id=txt_Off_TE
${Locator_Verify_Verifycall_mobile1_TE}    id=txt_mob_TE_1
${Locator_Verify_Verifycall_mobile2_TE}    id=txt_mob_TE_2
${Locator_Verify_Verifycall_mobile3_TE}    id=txt_mob_TE_3
${Locator_Verify_Verifycall_flag_N_TE}    id=dd_flag_TE_N
${Locator_Verify_Verifycall_flag_Y_TE}    id=dd_flag_TE_Y
${Locator_Verify_Verifycall_flag_Y_CL_TE}    id=dd_flag_TE_C
${Locator_Verify_Verifycall_flag_Y_Not_Req_TE}    id=dd_flag_TE_R
${Locator_Verify_Verifycall_Save_TE}    id=btn_SaveTE
${Locator_Verify_Verifycall_Confirm_TE}    id=btn_ComfirmTE
${Table_Verifycall_TE}    //table[@id="tb_verify_te"]

  # Verify Call
${Dropdown_Verifycall_Subtype}    //div[@id="dd_subType_chosen"]//li[contains(text(),'***replace***')]
${Dropdown_Verifycall_Companytype}    //div[@id="dd_companyType_chosen"]//li[contains(text(),'***replace***')]
${Dropdown_Verifycall_BOL}    //div[@id="dd_BOL_chosen"]//li[contains(text(),'***replace***')]
${Dropdown_Verifycall_SSO_To}    //div[@id="dd_SSO_TO_chosen"]//li[contains(text(),'***replace***')]
${Dropdown_Verifycall_Name_To}    //div[@id="dd_chkName_TO_chosen"]//li[contains(text(),'***replace***')]
${Dropdown_Verifycall_Address_To}    //div[@id="dd_address_TO_chosen"]//li[contains(text(),'***replace***')]
${Dropdown_Verifycall_Statusofstff_To}    //div[@id="dd_Statusofstaff_TO_chosen"]//li[contains(text(),'***replace***')]
${Dropdown_Verifycall_Contect_To}    //div[@id="dd_Contect_TO_chosen"]//li[contains(text(),'***replace***')]
${Dropdown_Verifycall_Informant_To}    //div[@id="dd_Informant_TO_chosen"]//li[contains(text(),'***replace***')]
${Dropdown_Verifycall_introducer_To}    //div[@id="dd_Introducer_TO_chosen"]//li[contains(text(),'***replace***')]
${Dropdown_Verifycall_Name_TH}    //div[@id="dd_chkName_TH_chosen"]//li[contains(text(),'***replace***')]
${Dropdown_Verifycall_Addrees_TH}    //div[@id="dd_chkAddr_TH_chosen"]//li[contains(text(),'***replace***')]
${Dropdown_Verifycall_Teltype_TH}    //div[@id="dd_telType_TH_chosen"]//li[contains(text(),'***replace***')]
${Dropdown_Verifycall_Cont_TH}    //div[@id="dd_cont_TH_chosen"]//li[contains(text(),'***replace***')]
${Dropdown_Verifycall_Person_TH}    //div[@id="dd_person_TH_chosen"]//li[contains(text(),'***replace***')]
${Dropdown_Verifycall_Person_TM}    //div[@id="dd_person_TM_chosen"]//li[contains(text(),'***replace***')]
${Dropdown_Verifycall_Rel_TE}    //div[@id="dd_rel_TE_chosen"]//li[contains(text(),'***replace***')]

${dropdown_verifycall_to_kessai_locator}    //div[@id='dd_SendToKessai_chosen']//span
${txt_dropdown_verifycall_to_kessai_locator}    //div[@id='dd_SendToKessai_chosen']//li[contains(text(),'***replace***')]

${btn_search_verifycall_locator}    //button[@id='btn_src']
${btn_sel_verifycall_locator}    //a[@class='btn_sel']

# Text VIEW CUSTOMER/VERIFY CALL/JUDGMENT (KESSAI)
${lbl_vcust_vcall_judg_kes}    //label[@id="lbl_HeaderName"]

# Popup success
${popup_kes_verifycall_success}       //div[@class="ui-pnotify "]//div[text()="Save data success"]
${popup_kes_verifycall_success_TO}    //div[@class="ui-pnotify "]//div[text()="TO - Save data success"]
${popup_kes_verifycall_success_TH}    //div[@class="ui-pnotify "]//div[text()="TH - Save data success"]
${popup_kes_verifycall_success_TM}    //div[@class="ui-pnotify "]//div[text()="TM - Save data success"]
${popup_kes_verifycall_success_TE}    //div[@class="ui-pnotify "]//div[text()="TE - Save data success"]