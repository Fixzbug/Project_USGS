
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
${btn_req_waive_approve_locator}    //input[@id="ctl00_btnApprove"]


# Request Waive - Step input id, business and contract no
${txt_req_waive_request_locator}           //span[@id="ctl00_phContents_ASPxRoundPanel1_RPHT" and text()="Request"]
${input_req_waive_id_card_locator}         //input[@id="ctl00_phContents_ASPxRoundPanel1_E_id"]
${input_req_waive_contract_no_locator}     //input[@id="ctl00_phContents_ASPxRoundPanel1_E_cont_no"]
${dropodown_req_waive_business_locator}    //select[@id="ctl00_phContents_ASPxRoundPanel1_D_biz"]
${dropdown_req_waive_biz_locator}          //select[@id="ctl00_phContents_ASPxRoundPanel1_D_biz"]
${select_req_waive_business_locator}       //option[text()="***replace***"]
${dropodown_req_waive_send_by_locator}     //select[@id="ctl00_phContents_ASPxRoundPanel1_D_SendBy"]
${select_req_waive_send_by_locator}        //option[text()="***replace***"]


### 10_Negotiation_special_discount_locator ###
# Input - 10 : Negotiation Special discount (Nor-OD)
${input_10_nsd_num_of_child_locator}       //input[@id="ctl00_phContents_ASPxRoundPanel1_TXT_NumChild"]
${input_10_nsd_last_salary_locator}        //input[@id="ctl00_phContents_ASPxRoundPanel1_TXT_Last_Salary"]
${dropdown_10_nsd_cust_status_locator}     //select[@id="ctl00_phContents_ASPxRoundPanel1_D_status"]
${txt_value_10_nsd_cust_status_locator}    //select[@id="ctl00_phContents_ASPxRoundPanel1_D_CustSts"]/option
# ${select_10_nsd_cust_status_locator}    //select[@id="ctl00_phContents_ASPxRoundPanel1_D_status"]
# ${txt_data_10_nsd_format_locator}       //select[@id="ctl00_phContents_ASPxRoundPanel1_D_status"]/option[text()="***replace***"]


# Value - 10 : Negotiation Special discount (Nor-OD)
${txt_value_10_nsd_request_type_locator}       //select[@id="ctl00_phContents_ASPxRoundPanel1_D_request_type"]/option
${txt_value_10_nsd_request_no_locator}         //input[@id="ctl00_phContents_ASPxRoundPanel1_E_request_no"]
${txt_value_10_nsd_requester_locator}          //input[@id="ctl00_phContents_ASPxRoundPanel1_E_requester"]
${txt_value_10_nsd_request_date_locator}       //input[@id="ctl00_phContents_ASPxRoundPanel1_E_request_date"]
${txt_value_10_nsd_cust_id_locator}            //input[@id="ctl00_phContents_ASPxRoundPanel1_E_id"]
${txt_value_10_nsd_req_status_locator}         //input[@id="ctl00_phContents_ASPxRoundPanel1_E_request_sts"]
${txt_value_10_nsd_contract_no_locator}        //input[@id="ctl00_phContents_ASPxRoundPanel1_E_cont_no"]
${txt_value_10_nsd_status_date_locator}        //input[@id="ctl00_phContents_ASPxRoundPanel1_E_sts_date"]
${txt_value_10_nsd_cust_name_locator}          //input[@id="ctl00_phContents_ASPxRoundPanel1_E_name"]
${txt_value_10_nsd_call_center_locator}        //input[@id="ctl00_phContents_ASPxRoundPanel1_TXT_CALL_CENTER"]
${txt_value_10_nsd_age_locator}                //input[@id="ctl00_phContents_ASPxRoundPanel1_TXT_Age"]
${txt_value_10_nsd_team_locator}               //input[@id="ctl00_phContents_ASPxRoundPanel1_E_team"]
${txt_value_10_nsd_team2_locator}              //input[@id="ctl00_phContents_ASPxRoundPanel1_E_term"]
${txt_value_10_nsd_od_status_locator}          //input[@id="ctl00_phContents_ASPxRoundPanel1_TXT_OD_Sts"]
${txt_value_10_nsd_od_status2_locator}         //input[@id="ctl00_phContents_ASPxRoundPanel1_E_odterm"]
${txt_value_10_nsd_contract_type_locator}      //input[@id="ctl00_phContents_ASPxRoundPanel1_TXT_Cont_type"]
${txt_value_10_nsd_contract_date_locator}      //input[@id="ctl00_phContents_ASPxRoundPanel1_TXT_Cont_date"]
${txt_value_10_nsd_biz_locator}                //select[@id="ctl00_phContents_ASPxRoundPanel1_D_biz"]/option
${txt_value_10_nsd_wo_date_locator}            //input[@id="ctl00_phContents_ASPxRoundPanel1_TXT_WO_Date"]
${txt_value_10_nsd_contract_status_locator}    //select[@id="ctl00_phContents_ASPxRoundPanel1_D_cont_status"]/option
${txt_value_10_nsd_time_of_payment_locator}    //input[@id="ctl00_phContents_ASPxRoundPanel1_TXT_time_payment"]
${txt_value_10_nsd_due_locator}                //input[@id="ctl00_phContents_ASPxRoundPanel1_TXT_Due"]
${txt_value_10_nsd_time_of_penalty_locator}    //input[@id="ctl00_phContents_ASPxRoundPanel1_TXT_time_penal"]
${txt_value_10_nsd_req_time_locator}           //input[@id="ctl00_phContents_ASPxRoundPanel1_E_request_time"]
${txt_value_10_nsd_min_install_locator}        //input[@id="ctl00_phContents_ASPxRoundPanel1_maximum_nego"]
${txt_value_10_nsd_last_req_no_locator}        //a[@id="ctl00_phContents_ASPxRoundPanel1_E_Last_reqNo"]


# Header
${txt_header_10_nsd_negotiation_special_discount_locator}        //span[@id="ctl00_phContents_ASPxRoundPanel1_RPHT"]
${txt_header_10_nsd_negotiation_special_discount_2_locator}      //span[@id="ctl00_phContents_ASPxRoundPanel1_lblHis_head"]
${txt_header_10_nsd_negotiate_detail_locator}                    //span[@id="ctl00_phContents_ASPxRoundPanel1_lblHis_request"]
${txt_header_10_nsd_entry_negotiate_discount_detail_locator}     //span[@id="ctl00_phContents_ASPxRoundPanel1_lblNegoDiscount"]
${txt_header_10_header_locator}                                  //span[@id="ctl00_phContents_ASPxRoundPanel1_RPHT" and text()="***replace***"]

# Title - 10 : Negotiation Special discount (Nor-OD)
${txt_title_10_nsd_format_locator}    //font[text()="***replace***"]


### Negotiate Detail ###
# Title - Negotiate Detail - 1. Entry negotiate discount detail, 2. Entry detail by Term#, Time# and 3. Entry request detail
${txt_title_10_nd_format_locator}     //font[text()="***replace***"]


# Input - Negotiate Detail - 1. Entry negotiate discount detail
${input_10_nd_totals_term_locator}              //input[@id="ctl00_phContents_ASPxRoundPanel1_E_tot_term"]
${input_10_nd_totals_paid_amt_locator}          //input[@id="ctl00_phContents_ASPxRoundPanel1_E_tot_paid_amt"]
${dropdown_10_nd_f_due_date_locator}            //select[@id="ctl00_phContents_ASPxRoundPanel1_ddlBackw_fduedate"]
${dropdown_10_nd_f_due_date_index_2_locator}    //select[@id="ctl00_phContents_ASPxRoundPanel1_ddlBackw_fduedate"]/option[2]
${input_10_nd_js_start_cal_date_id}             ctl00_phContents_ASPxRoundPanel1_TXT_Start_Cal_date



# Value - OD Screen - 1.1 Payment History
${txt_value_odscreen_ph_loan_amt_cust_locator}          //input[@id="ctl00_phContents_ASPxRoundPanel1_ASPxPageControl1_enumOD_LoanAmtCust" and @value]
${txt_value_odscreen_ph_loan_amt_new_cont_locator}      //input[@id="ctl00_phContents_ASPxRoundPanel1_ASPxPageControl1_enumOD_LoanAmtNew"]
${txt_value_odscreen_ph_cont_amt_locator}               //input[@id="ctl00_phContents_ASPxRoundPanel1_ASPxPageControl1_enumOD_ContractAmt"]
${txt_value_odscreen_ph_paid_term_locator}              //input[@id="ctl00_phContents_ASPxRoundPanel1_ASPxPageControl1_enumOD_PaidTerm"]
${txt_value_odscreen_ph_total_paid_amt_old_locator}     //input[@id="ctl00_phContents_ASPxRoundPanel1_ASPxPageControl1_enumOD_TtalPaidAmt_Old"]
${txt_value_odscreen_ph_total_paid_amt_new_locator}     //input[@id="ctl00_phContents_ASPxRoundPanel1_ASPxPageControl1_enumOD_TtalPaidAmt_New"]
${txt_value_odscreen_ph_os_closing_data_locator}        //input[@id="ctl00_phContents_ASPxRoundPanel1_ASPxPageControl1_enumOD_OS_AsOfClose"]
${txt_value_odscreen_ph_os_amt_locator}                 //input[@id="ctl00_phContents_ASPxRoundPanel1_ASPxPageControl1_enumOD_ODAmount"]
${txt_value_odscreen_ph_penaly_amt_locator}             //input[@id="ctl00_phContents_ASPxRoundPanel1_ASPxPageControl1_enumOD_Pennalty"]
${txt_value_odscreen_ph_closing_syd_locator}            //input[@id="ctl00_phContents_ASPxRoundPanel1_ASPxPageControl1_enumOD_Close_SYD"]
${txt_value_odscreen_ph_wo_amt_locator}                 //input[@id="ctl00_phContents_ASPxRoundPanel1_ASPxPageControl1_enumOD_WO_Amt"]


# Value - OD Screen - 1.2 Discount Detail
${txt_value_odscreen_ph_cust_will_pay_locator}         //input[@id="ctl00_phContents_ASPxRoundPanel1_ASPxPageControl1_enumOD_CuswillPay"]
${txt_value_odscreen_ph_diff_closing_amt_locator}      //input[@id="ctl00_phContents_ASPxRoundPanel1_ASPxPageControl1_enumOD_DiffClose_Amt"]
${txt_value_odscreen_ph_diff_closing_per_locator}      //input[@id="ctl00_phContents_ASPxRoundPanel1_ASPxPageControl1_enumOD_DiffClose_Per"]
${txt_value_odscreen_ph_diff_wo_od_amt_locator}        //input[@id="ctl00_phContents_ASPxRoundPanel1_ASPxPageControl1_enumOD_DiffWO_Amt"]
${txt_value_odscreen_ph_diff_wo_od_per_locator}        //input[@id="ctl00_phContents_ASPxRoundPanel1_ASPxPageControl1_enumOD_DiffWO_Per"]


# Value - OD Screen - 1.3 Profit detail (Auto cal.)
${txt_value_odscreen_ph_total_received_locator}        //input[@id="ctl00_phContents_ASPxRoundPanel1_ASPxPageControl1_enumOD_Ttal_rcv"]
${txt_value_odscreen_ph_diff_loan_amt_locator}         //input[@id="ctl00_phContents_ASPxRoundPanel1_ASPxPageControl1_enumOD_DiffLoan_Amt"]
${txt_value_odscreen_ph_diff_os_locator}               //input[@id="ctl00_phContents_ASPxRoundPanel1_ASPxPageControl1_enumOD_Diff_OS"]
${txt_value_odscreen_ph_diff_wo_locator}               //input[@id="ctl00_phContents_ASPxRoundPanel1_ASPxPageControl1_enumOD_Diff_WO"]


# Button - Negotiate Detail - 1. Entry negotiate discount detail
${btn_10_nd_submit_locator}        //input[@id="ctl00_phContents_ASPxRoundPanel1_B_submit"]
${btn_10_nd_help_locator}          //input[@id="ctl00_phContents_ASPxRoundPanel1_B_help"]
${btn_10_nd_clear_locator}         //input[@id="ctl00_phContents_ASPxRoundPanel1_B_clear"]


# Title - 1.1 Payment History
${txt_title_10_nd_1_1_format_locator}    //table[@id="OD_Screen"]//span[contains(text(),"***replace***")]


# Input - Negotiate Detail - 2. Entry detail by Term#, Time#
${input_10_nd_start_term_locator}       //input[@id="ctl00_phContents_ASPxRoundPanel1_E_term_no"]
${input_10_nd_end_term_locator}         //input[@id="ctl00_phContents_ASPxRoundPanel1_E_term_end"]
${input_10_nd_js_paid_date_id}          ctl00_phContents_ASPxRoundPanel1_txtPaid_date
${input_10_nd_paid_amt_locator}         //input[@id="ctl00_phContents_ASPxRoundPanel1_E_paid_amt"]


# Button - Negotiate Detail - 2. Entry detail by Term#, Time#
${btn_10_nd_2_add_locator}            //input[@id="ctl00_phContents_ASPxRoundPanel1_B_add"]
${btn_10_nd_2_cancel_locator}         //input[@id="ctl00_phContents_ASPxRoundPanel1_B_Cancel"]


# Title - Negotiate Detail - 2. Entry detail by Term#, Time#
${txt_title_10_nd_2_format_locator}    //table[@id="ctl00_phContents_ASPxRoundPanel1_GD_DataView"]//th[text()="***replace***"]


# Value Table 2. Entry detail by Term#, Time#
${txt_value_10_nd_2_total_team_locator}           //tr[@style="background-color:#CCCC99;font-weight:bold;"]/td[@align="right"][1]
${txt_value_10_nd_2_total_paid_amount_locator}    //tr[@style="background-color:#CCCC99;font-weight:bold;"]/td[@align="right"][2]


# Input - Negotiate Detail - 3. Entry request detail
# 3.1 Entry other debt
${input_10_nd_other_debt_locator}     //input[@id="ctl00_phContents_ASPxRoundPanel1_txtOther_Dept"]
${input_10_nd_amt_locator}            //input[@id="ctl00_phContents_ASPxRoundPanel1_enumOthDep_Amt"]


# Button - Negotiate Detail - 3.1 Entry other debt
${btn_10_nd_3_1_add_locator}          //input[@id="ctl00_phContents_ASPxRoundPanel1_B_add_debt"]
${btn_10_nd_3_1_cancel_locator}       //input[@id="ctl00_phContents_ASPxRoundPanel1_B_Cancel_debt"]


# Title - Negotiate Detail - 3.1 Entry other debt
${txt_title_10_nd_3_1_format_locator}    //table[@id="ctl00_phContents_ASPxRoundPanel1_GD_DataDebt"]//th[text()="***replace***"]


# Value Table 3.1 Entry other debt
${txt_value_10_nd_3_1_total_amount_locator}           //table[@id="ctl00_phContents_ASPxRoundPanel1_GD_DataDebt"]//tr[@style="background-color:#CCCC99;font-weight:bold;"]/td[@align]


# Input - Negotiate Detail - 3.2 Entry other ...
${input_10_nd_js_last_cont_3_party_id}         ctl00_phContents_ASPxRoundPanel1_txtContactdate_3Party
${input_10_nd_js_last_cont_3_party_locator}    //input[@id="ctl00_phContents_ASPxRoundPanel1_txtContactdate_3Party"]
${input_10_nd_js_last_cont_cust_id}            ctl00_phContents_ASPxRoundPanel1_txtContactdate_Customer
${input_10_nd_js_last_cont_cust_locator}       //input[@id="ctl00_phContents_ASPxRoundPanel1_txtContactdate_Customer"]
${input_10_nd_have_job_yes_locator}            //input[@id="ctl00_phContents_ASPxRoundPanel1_rdbtlHaveJob_0"]
${input_10_nd_have_job_no_locator}             //input[@id="ctl00_phContents_ASPxRoundPanel1_rdbtlHaveJob_1"]
${select_10_nd_who_req_locator}                //select[@id="ctl00_phContents_ASPxRoundPanel1_ddlCus_request"]
${txt_10_nd_who_req_locator}                   //select[@id="ctl00_phContents_ASPxRoundPanel1_ddlCus_request"]/option
${txt_data_10_nd_who_req_locator}              //select[@id="ctl00_phContents_ASPxRoundPanel1_ddlCus_request"]/option[text()="***replace***"]
${select_10_nd_discount_camp_locator}          //select[@id="ctl00_phContents_ASPxRoundPanel1_ddlDiscount_camp"]
${txt_data_10_nd_discount_camp_locator}        //select[@id="ctl00_phContents_ASPxRoundPanel1_ddlDiscount_camp"]/option[text()="***replace***"]
${select_10_nd_who_paid_locator}               //select[@id="ctl00_phContents_ASPxRoundPanel1_ddlWho_Paid"]
${txt_data_10_nd_who_paid_locator}             //select[@id="ctl00_phContents_ASPxRoundPanel1_ddlWho_Paid"]/option[text()="***replace***"]
${select_10_nd_source_fund_locator}            //select[@id="ctl00_phContents_ASPxRoundPanel1_ddlSource_Fund"]
${txt_data_10_nd_source_fund__locator}         //select[@id="ctl00_phContents_ASPxRoundPanel1_ddlSource_Fund"]/option[text()="***replace***"]
${select_10_nd_reason_locator}                 //select[@id="ctl00_phContents_ASPxRoundPanel1_D_reason"]
${txt_data_10_nd_reason_locator}               //select[@id="ctl00_phContents_ASPxRoundPanel1_D_reason"]/option[text()="***replace***"]
${input_10_nd_reason_note_locator}             //input[@id="ctl00_phContents_ASPxRoundPanel1_E_reason_note"]
${select_10_nd_send_to_locator}                //select[@id="ctl00_phContents_ASPxRoundPanel1_D_send_to"]
${txt_data_10_nd_send_to_locator}              //select[@id="ctl00_phContents_ASPxRoundPanel1_D_send_to"]/option[text()="***replace***"]
${input_10_nd_note_locator}                    //textarea[@id="ctl00_phContents_ASPxRoundPanel1_E_note"]


# Do you want to Approve?
${btn_10_nsd_ok_locator}                           //input[@id="ctl00_btnOK_ConfirmApprove"]
${txt_red_value_10_nsd_request_no_locator}         //input[@id="ctl00_phContents_ASPxRoundPanel1_E_request_no" and @value]
${txt_value_10_nsd_sign_out_locator}               //a[@id="ctl00_lbtnSignOut"]

# Error msg
${txt_msg_10_error}                           //span[@id="ctl00_phContents_ASPxRoundPanel1_lblMsg"]

# Btn Back
${btn_10_back}    //input[@id="ctl00_btnGotoList"]