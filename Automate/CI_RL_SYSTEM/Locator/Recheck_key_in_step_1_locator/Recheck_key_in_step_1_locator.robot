*** Variables ***

# Recheck
${Locator_Company_Title}    xpath=//div[@id="ddlOffTitle_chosen"]
${Locator_Text_Company}    //div[@id="ddlOffTitle_chosen"]//li[contains(text(),'บจก')]
${Locator_Textbox_NameCompany}     id=txtOffname
${Locator_Btn_CheckOffice}    id=btn_CheckOffice
${Locator_btn_Confirm}    //div[@style="float: left"]/button[@onclick="CompanyBlackListAutoReject()"]
${Locator_Title}    id=ddlThaiTitle_chosen
${Locator_Comfirm}    //button[@id="btn_Confirm"]
${Locator_Yes}    //button[@id='btn_Yes'] 
${Locator_Dopa}    id=btn_yes_dopa
${Locator_LaserId}    id=txtLaserID
${Locator_Ncb}    //button[@id='btn_yes_ncb']
${Locator_Senddoc}    id=btn_yes_creditsenddoc
${Locator_Text_ID}    //label[@id="lblIDNo"]
${Locator_Confrim_NameEng}    xpath=//button[@onclick="Confirm_NameEng()"]

# Pending
${btn_Penddin_Locator}    id=btn_Pending
${btn_Addnote_Locator}    id=btn_addNote
${list_Pendding_Locator}    id=dd_pending_chosen
${txt_Note_Locator}    id=txt_noteD
${btn_OK}    id=btn_OK
${txt_ID_Key2}    id=lbl_IDNo

# Loop Dropdown Recheck
${Dropdown_Title_Recheck}    //div[@id="ddlThaiTitle_chosen"]//li[contains(text(),'***replace***')] 

# Loop Drwodown
${Loop_Pedndding}    //div[@id="dd_pending_chosen"]//li[contains(text(),'***replace***')]