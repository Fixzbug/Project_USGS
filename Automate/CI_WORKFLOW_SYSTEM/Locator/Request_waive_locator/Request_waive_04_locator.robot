
*** Variables ***

# Menu
${lbl_menu_dropdown_locator}                   //a[contains(.,'Work Process')]
${lbl_menu_dropdown_inquiry_locator}           //a[contains(.,'Inquiry')]
${lbl_sub_menu_req_waive_dropdown_locator}     //a[contains(.,'Request Waive')]
${lbl_sub_menu_inbox_dropdown_locator}         //a[contains(.,'Inbox')]
${lbl_sub_dropdown_inquiry_req_locator}        //a[contains(.,'Inquiry Request')]


# Verify header data blog 1
${txt_req_waive_header_format_1_locator}    //*[contains(text(),"***replace***")]
${txt_req_waive_header_format_2_locator}    //font[text()="***replace***"]
${txt_req_waive_header_format_3_locator}    //td[contains(text(),"***replace***")]
${txt_req_waive_header_business_locator}    //span[@id="ctl00_MainDesktopContent_Label2"]
${txt_req_waive_header_id_card_locator}     //span[@id="ctl00_MainDesktopContent_Label4"]
${txt_req_waive_header_contract_locator}    //span[@id="ctl00_MainDesktopContent_Label6"]
${iframe_req_waive_req_1_locator}           //iframe[@id="ctl00_phContents_ASPxRoundPanel1_iframe_notes"]
${iframe_req_waive_req_2_locator}           //iframe[@id="myiframeid"]


# Verify header data blog 2
${txt_req_waive_header_by_mail_locator}    //td[@id="ctl00_phContents_ASPxRoundPanel1_P_SendByPage_AT1T"]


# Verify value blog 1
${txt_req_waive_value_req_type_locator}           //select[@id="ctl00_phContents_ASPxRoundPanel1_D_request_type"]/option
${txt_req_waive_value_req_no_locator}             //input[@id="ctl00_phContents_ASPxRoundPanel1_E_request_no"]
${txt_req_waive_value_cust_id_locator}            //input[@id="ctl00_phContents_ASPxRoundPanel1_E_id"]
${txt_req_waive_value_req_date_locator}           //input[@id="ctl00_phContents_ASPxRoundPanel1_E_request_date"]
${txt_req_waive_value_cust_name_locator}          //input[@id="ctl00_phContents_ASPxRoundPanel1_E_name"]
${txt_req_waive_value_requester_locator}          //input[@id="ctl00_phContents_ASPxRoundPanel1_E_requester"]
${txt_req_waive_value_business_locator}           //select[@id="ctl00_phContents_ASPxRoundPanel1_D_biz"]/option
${txt_req_waive_value_team_locator}               //input[@id="ctl00_phContents_ASPxRoundPanel1_E_term"]
${txt_req_waive_value_contract_no_locator}        //input[@id="ctl00_phContents_ASPxRoundPanel1_E_cont_no"]
${txt_req_waive_value_od_status_locator}          //input[@id="ctl00_phContents_ASPxRoundPanel1_E_odterm"]
${txt_req_waive_value_call_center_locator}        //input[@id="ctl00_phContents_ASPxRoundPanel1_txtCallCenter"]
${txt_req_waive_value_req_time_locator}           //input[@id="ctl00_phContents_ASPxRoundPanel1_E_request_time"]
${txt_req_waive_value_send_by_locator}            //select[@id="ctl00_phContents_ASPxRoundPanel1_D_SendBy"]/option
${txt_req_waive_value_req_amount_locator}         //input[@id="ctl00_phContents_ASPxRoundPanel1_txtReqAmount"]
${txt_req_waive_value_call_center_ext_locator}    //input[@id="ctl00_phContents_ASPxRoundPanel1_txtExtNo"]


# Request Waive - Step selete dropdown
${ifrmae_req_waive_locator}    //iframe[@id="myiframeid"]
${dropdown_req_waive_select_req_type_locator}	//select[@id="ctl00_phContents_ASPxRoundPanel1_D_request_type"]
${select_req_waive_req_type_locator}	//option[text()="***replace***"]
${dropdown_req_waive_req_type_locator}     //select[@id="ctl00_phContents_ASPxRoundPanel1_D_request_type"]


# Request Waive - button approve
${btn_req_waive_approve_locator}             //input[@id="ctl00_btnApprove"]
${select_04_nd_reason_locator}               //select[@id="ctl00_phContents_ASPxRoundPanel1_D_reason"]
${txt_data_04_nd_reason_locator}             //select[@id="ctl00_phContents_ASPxRoundPanel1_D_reason"]/option[text()="***replace***"]
${input_04_nd_reason_note_locator}           //input[@id="ctl00_phContents_ASPxRoundPanel1_E_reason_note"]
${select_04_nd_send_to_locator}              //select[@id="ctl00_phContents_ASPxRoundPanel1_D_send_to"]
${txt_data_04_nd_send_to_locator}            //select[@id="ctl00_phContents_ASPxRoundPanel1_D_send_to"]/option[text()="***replace***"]
${input_04_nd_note_locator}                  //textarea[@id="ctl00_phContents_ASPxRoundPanel1_E_note"]


# Request Waive - Step input id, business and contract no
${txt_req_waive_request_locator}           //span[@id="ctl00_phContents_ASPxRoundPanel1_RPHT" and text()="Request"]
${input_req_waive_id_card_locator}         //input[@id="ctl00_phContents_ASPxRoundPanel1_E_id"]
${input_req_waive_contract_no_locator}     //input[@id="ctl00_phContents_ASPxRoundPanel1_E_cont_no"]
${dropodown_req_waive_business_locator}    //select[@id="ctl00_phContents_ASPxRoundPanel1_D_biz"]
${dropdown_req_waive_biz_locator}          //select[@id="ctl00_phContents_ASPxRoundPanel1_D_biz"]
${select_req_waive_business_locator}       //option[text()="***replace***"]
${dropodown_req_waive_send_by_locator}     //select[@id="ctl00_phContents_ASPxRoundPanel1_D_SendBy"]
${select_req_waive_send_by_locator}        //option[text()="***replace***"]


### 04 : Negotiation Special discount (LG) locator ###
# Input - 04 : Negotiation Special discount (LG)
${input_04_nsd_qaive_amt_locator}       //input[@id="ctl00_phContents_ASPxRoundPanel1_E_waive_amt"]


# Value - 04 : Negotiation Special discount (LG)
${txt_value_04_nsd_request_type_locator}       //select[@id="ctl00_phContents_ASPxRoundPanel1_D_request_type"]/option
${txt_value_04_nsd_request_no_locator}         //input[@id="ctl00_phContents_ASPxRoundPanel1_E_request_no"]
${txt_value_04_nsd_requester_locator}          //input[@id="ctl00_phContents_ASPxRoundPanel1_E_requester"]
${txt_value_04_nsd_request_date_locator}       //input[@id="ctl00_phContents_ASPxRoundPanel1_E_request_date"]
${txt_value_04_nsd_cust_id_locator}            //input[@id="ctl00_phContents_ASPxRoundPanel1_E_id"]
${txt_value_04_nsd_req_status_locator}         //input[@id="ctl00_phContents_ASPxRoundPanel1_E_request_sts"]
${txt_value_04_nsd_contract_no_locator}        //input[@id="ctl00_phContents_ASPxRoundPanel1_E_cont_no"]
${txt_value_04_nsd_status_date_locator}        //input[@id="ctl00_phContents_ASPxRoundPanel1_E_sts_date"]
${txt_value_04_nsd_cust_name_locator}          //input[@id="ctl00_phContents_ASPxRoundPanel1_E_name"]
${txt_value_04_nsd_call_center_locator}        //input[@id="ctl00_phContents_ASPxRoundPanel1_TXT_CALL_CENTER"]
${txt_value_04_nsd_age_locator}                //input[@id="ctl00_phContents_ASPxRoundPanel1_TXT_Age"]
${txt_value_04_nsd_team_locator}               //input[@id="ctl00_phContents_ASPxRoundPanel1_E_term"]
${txt_value_04_nsd_od_status_locator}          //input[@id="ctl00_phContents_ASPxRoundPanel1_TXT_OD_Sts"]
${txt_value_04_nsd_od_status2_locator}         //input[@id="ctl00_phContents_ASPxRoundPanel1_E_odterm"]
${txt_value_04_nsd_contract_type_locator}      //input[@id="ctl00_phContents_ASPxRoundPanel1_TXT_Cont_type"]
${txt_value_04_nsd_contract_date_locator}      //input[@id="ctl00_phContents_ASPxRoundPanel1_TXT_Cont_date"]
${txt_value_04_nsd_biz_locator}                //select[@id="ctl00_phContents_ASPxRoundPanel1_D_biz"]/option
${txt_value_04_nsd_wo_date_locator}            //input[@id="ctl00_phContents_ASPxRoundPanel1_TXT_WO_Date"]
${txt_value_04_nsd_contract_status_locator}    //select[@id="ctl00_phContents_ASPxRoundPanel1_D_cont_status"]/option
${txt_value_04_nsd_time_of_payment_locator}    //input[@id="ctl00_phContents_ASPxRoundPanel1_TXT_time_payment"]
${txt_value_04_nsd_due_locator}                //input[@id="ctl00_phContents_ASPxRoundPanel1_TXT_Due"]
${txt_value_04_nsd_time_of_penalty_locator}    //input[@id="ctl00_phContents_ASPxRoundPanel1_TXT_time_penal"]
${txt_value_04_nsd_req_time_locator}           //input[@id="ctl00_phContents_ASPxRoundPanel1_E_request_time"]
${txt_value_04_nsd_min_install_locator}        //input[@id="ctl00_phContents_ASPxRoundPanel1_maximum_nego"]
${txt_value_04_nsd_ttl_waive_wo_locator}       //input[@id="ctl00_phContents_ASPxRoundPanel1_E_tot_wo_bal"]
${txt_value_04_nsd_last_req_no_locator}        //a[@id="ctl00_phContents_ASPxRoundPanel1_E_Last_reqNo"]


# Header
${txt_header_04_nsd_negotiation_special_discount_locator}        //span[@id="ctl00_phContents_ASPxRoundPanel1_RPHT"]
${txt_header_04_nsd_negotiation_special_discount_2_locator}      //span[@id="ctl00_phContents_ASPxRoundPanel1_lblHis_head"]
${txt_header_04_nsd_negotiate_detail_locator}                    //span[@id="ctl00_phContents_ASPxRoundPanel1_lblHis_request"]
${txt_header_04_nsd_entry_negotiate_discount_detail_locator}     //span[@id="ctl00_phContents_ASPxRoundPanel1_lblNegoDiscount"]
${txt_header_04_header_locator}                                  //span[@id="ctl00_phContents_ASPxRoundPanel1_RPHT" and text()="***replace***"]


# Title - 04 : Negotiation Special discount (LG)
${txt_title_04_nsd_format_locator}            //*[text()="***replace***"]
${txt_title_04_nsd_req_type_locator}          //*[contains(text(), "Request") and contains(text(), "Type")]
${txt_title_04_nsd_req_no_locator}            //*[contains(text(), "Request") and contains(text(), "No.")]
${txt_title_04_nsd_req_date_locator}          //*[contains(text(), "Request") and contains(text(), "Date")]
${txt_title_04_nsd_cont_no_locator}           //*[contains(text(), "Contract") and contains(text(), "No")]
${txt_title_04_nsd_od_status_locator}         //*[contains(text(), "OD") and contains(text(), "Status")]
${txt_title_04_nsd_total_wo_bal_locator}      //*[contains(text(), "Total") and contains(text(), "W/O Balance")]
${txt_title_04_nsd_req_time_locator}          //*[contains(text(), "Request") and contains(text(), "Times")]
${txt_title_04_nsd_waive_amt_locator}         //*[contains(text(), "Waive") and contains(text(), "Amount")]
${txt_title_04_nsd_reason_note_locator}       //*[contains(text(), "Reason") and contains(text(), "Note")]
${txt_title_04_nsd_send_to_locator}           //*[contains(text(), "Send") and contains(text(), "To")]



# Do you want to Approve?
${btn_04_nsd_ok_locator}                           //input[@id="ctl00_btnOK_ConfirmApprove"]
${txt_red_value_04_nsd_request_no_locator}         //input[@id="ctl00_phContents_ASPxRoundPanel1_E_request_no" and @value]
${txt_value_04_nsd_sign_out_locator}               //a[@id="ctl00_lbtnSignOut"]

# Error msg
${txt_msg_04_error}                         //span[@id="ctl00_phContents_lblMsg"]

# Btn Back
${btn_04_back}    //input[@id="ctl00_btnGotoList"]