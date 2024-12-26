*** Variables ***

# Verfify JUDMENT
${Locator_Verify_Judment_Tab}    id=JudgmentForm-tab
${Locator_Verify_Judment_BD_D}    id=txt_birthDt_D
${Locator_Verify_Judment_BD_M}    id=txt_birthDt_M
${Locator_Verify_Judment_BD_Y}    id=txt_birthDt_Y
${Locator_Verify_Judment_BD}    id=dd_bd_chosen
${Locator_Verify_Judment_salDate}    id=dd_salDate_chosen
${Locator_Verify_Judment_accType}    xpath=//input[@id="txt_accType"]
${Locator_Verify_Judment_Vendorcode}    //div[@id="ddVenderCode_chosen"]
${Locator_Verify_Judment_accType_Dropdown}    id=dd_accType_r_chosen
${Locator_Verify_Judment_VerifyJud}    id=btn_VerifyJudg
${Locator_Verify_Judment_CalculateJud}    //button[@id='btn_CalculateJudg']
${Locator_Verify_Judment_ResultJudment}    //div[@id='dd_Result_Judgment_chosen']
${Locator_Verify_Judment_ConfirmJud}    //button[@id="btn_ConfirmJudg"]
${Locator_Verify_Judment_ConfirmJudgment}    //button[@id="btn_VerifyJudg"]
${Locator_Verify_Judment_CalJudgment}    //button[@id="btn_CalculateJudg"]
${Locator_Verify_Judment_ConmfirmJud_Y}    id=btn_pop_ConfirmJudg_Y
${Locator_Verify_Judment_ConmfirmJud_after_Y}    //button[@id="btn_Confirm_Approve"]

# Judment
${Dropdown_Judment_Bd}    //div[@id="dd_bd_chosen"]//li[contains(text(),'***replace***')]
${Dropdown_Judment_Saldate}    //div[@id="dd_salDate_chosen"]//li[text()='***replace***']
${Dropdown_Judment_Acctype}    //div[@id="dd_accType_r_chosen"]//li[contains(text(),'***replace***')]
${Dropdown_Judment_Result_Judment}    //div[@id="dd_Result_Judgment_chosen"]//li[contains(text(),'***replace***')]
${Dropdown_Judment_Doc}    //div[@id="dd_doc_chosen"]//li[contains(text(),'***replace***')]
${Dropdown_Judment_Vendorcode}    //div[@id="ddVenderCode_chosen"]//li[contains(text(),'***replace***')]
${Dropdown_Judment_BuildIn}    //div[@id="dd_build_in_chosen"]//li[contains(text(),'***replace***')]
${Dropdown_Judment_RecType}    //div[@id="dd_recType_chosen"]//li[contains(text(),'***replace***')]
${Dropdown_Judment_FirstloanType}    //div[@id="dd_firstLoanType_chosen"]//li[contains(text(),'***replace***')]
${Dropdown_Judment_PayType}    //div[@id="dd_payType_chosen"]//li[contains(text(),'***replace***')]

# JUDGMENT ITEM
${lbl_kes_judgment_item}    //div[@id="div_justmentform"]//h2
${icon_load_judgment}       //div[@id="pleaseWaitDialog" and @style="display: none;"]

# Alert-msg-error
${alert_judgment_bd_d}        //label[@id="lbl_msg_05"]
${alert_judgment_bd}          //label[@id="lbl_msg_06"]
${alert_judgment_SalDoc}      //label[@id="lbl_msg_33"]
${alert_judgment_Sal}         //label[@id="lbl_msg_20"]
${alert_judgment_Issue}       //label[@id="lbl_msg_35"]


# After click button Yes
${Locator_Judgment_App_DocDelivery}         //div[@id="dd_doc_chosen"]
${Dropdown_Judgment_App_DocDelivery}        //div[@id="dd_doc_chosen"]//li[contains(text(),'***replace***')]
${Locator_Judgment_Addr_NameTH}             //input[@id="txt_name_th_in"]
${Locator_Judgment_Addr_SurnameTH}          //input[@id="txt_Lname_th_in"]
${Locator_Judgment_Addr_NameEN}             //input[@id="txt_name_en_in"]
${Locator_Judgment_Addr_SurnameEN}          //input[@id="txt_Lname_en_in"]
${Locator_Judgment_Addr_Nickname}           //input[@id="txt_nickname_in"]
${Locator_Judgment_Addr_Email}              //input[@id="txt_mail_in"]
${Locator_Judgment_Addr_Village}            //input[@id="txt_vil_in"]
${Locator_Judgment_Addr_Building}           //div[@id="dd_build_in_chosen"]
${Dropdown_Judgment_Addr_Building}          //div[@id="dd_build_in_chosen"]//li[contains(text(),'***replace***')]
${Locator_Judgment_Addr_Building_txt}       //input[@id="txt_build_in"]
${Locator_Judgment_Addr_AdressNo}           //input[@id="txt_addrNo_in"]
${Locator_Judgment_Addr_Room}               //input[@id="txt_room_in"]
${Locator_Judgment_Addr_Floor}              //input[@id="txt_floor_in"]
${Locator_Judgment_Addr_Moo}                //input[@id="txt_moo_in"]
${Locator_Judgment_Addr_Soi}                //input[@id="txt_soi_in"]
${Locator_Judgment_Addr_Road}               //input[@id="txt_road_in"]
${Locator_Judgment_Fin_PaymentType}         //div[@id="dd_payType_chosen"]
${Dropdown_Judgment_Fin_PaymentType}        //div[@id="dd_payType_chosen"]//li[contains(text(),'***replace***')]
${Locator_Judgment_Fin_DebitBank}           //div[@id="ddl_bankCode_chosen"]
${Dropdown_Judgment_Fin_DebitBank}          //div[@id="ddl_bankCode_chosen"]//li[contains(text(),'***replace***')]
${Locator_Judgment_Fin_AccountType}         //div[@id="dd_accType_chosen"]
${Dropdown_Judgment_Fin_AccountType}        //div[@id="dd_accType_chosen"]//li[contains(text(),'***replace***')]
${Locator_Judgment_Fin_ReceiveType}         //div[@id="dd_recType_chosen"]
${Dropdown_Judgment_Fin_ReceiveType}        //div[@id="dd_recType_chosen"]//li[contains(text(),'***replace***')]
${Locator_Judgment_Fin_CashFrom}            //input[@id="txt_cash"]
${Locator_Judgment_Fin_AccountType2}        //div[@id="dd_accType_rec_chosen"]
${Dropdown_Judgment_Fin_AccountType2}       //div[@id="dd_accType_rec_chosen"]//li[contains(text(),'***replace***')]
${Locator_Judgment_Fin_TransferMoney}       //div[@id="dd_firstLoanType_chosen"]
${Dropdown_Judgment_Fin_TransferMoney}      //div[@id="dd_firstLoanType_chosen"]//li[contains(text(),'***replace***')]
${Locator_Judgment_Fin_TransferType}        //div[@id="dd_firstLoanTransferType_chosen"]
${Dropdown_Judgment_Fin_TransferType}       //div[@id="dd_firstLoanTransferType_chosen"]//li[contains(text(),'***replace***')]
${Locator_Judgment_Fin_Amount}              //input[@id="txt_firstLoanAmount"]
${Locator_Verify_Judment_Approve_Y}         //button[@id="btn_popup_Approve_Y"]
${Locator_Verify_Judment_Popup_Success}     (//h4[@class="ui-pnotify-title" and text()="Success"])[1]
