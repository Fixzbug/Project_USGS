
*** Variables ***
# iframe
${iframe_fraud_locator}                        //iframe[@id='myiframeid']

# Select request
${sel_fraud_request_type_locator}              //select[@id='ctl00_phContents_ASPxRoundPanel1_D_request_type']

# Request
${lbl_fraud_id_card}                           //font[contains(text(),'ID Card')]
${req_fraud_id_card}                           id=ctl00_phContents_ASPxRoundPanel1_E_id
${lbl_fraud_req_business}                      //font[contains(text(),'Business')]
${sel_req_fraud_business}                      //select[@id='ctl00_phContents_ASPxRoundPanel1_D_biz']
${lbl_fraud_contract_no}                       //font[contains(text(),'Contract')]    # contact no
${req_fraud_contract_no}                       id=ctl00_phContents_ASPxRoundPanel1_E_cont_no

### 09_Negotiation_special_discount_locator ###
# Input - 09 : Negotiation Special discount (Fraud)
${input_09_nsd_num_of_child_locator}           //input[@id="ctl00_phContents_ASPxRoundPanel1_TXT_NumChild"]
${input_09_nsd_last_salary_locator}            //input[@id="ctl00_phContents_ASPxRoundPanel1_TXT_Last_Salary"]
${dropdown_09_nsd_cust_status_locator}         //select[@id="ctl00_phContents_ASPxRoundPanel1_D_status"]
${txt_value_09_nsd_cust_status_locator}        //select[@id="ctl00_phContents_ASPxRoundPanel1_D_CustSts"]/option


# Value - 09 : Negotiation Special discount (Fraud)
${txt_value_09_nsd_request_type_locator}       //select[@id="ctl00_phContents_ASPxRoundPanel1_D_request_type"]/option
${txt_value_09_nsd_request_no_locator}         //input[@id="ctl00_phContents_ASPxRoundPanel1_E_request_no"]
${txt_value_09_nsd_requester_locator}          //input[@id="ctl00_phContents_ASPxRoundPanel1_E_requester"]
${txt_value_09_nsd_request_date_locator}       //input[@id="ctl00_phContents_ASPxRoundPanel1_E_request_date"]
${txt_value_09_nsd_cust_id_locator}            //input[@id="ctl00_phContents_ASPxRoundPanel1_E_id"]
${txt_value_09_nsd_req_status_locator}         //input[@id="ctl00_phContents_ASPxRoundPanel1_E_request_sts"]
${txt_value_09_nsd_contract_no_locator}        //input[@id="ctl00_phContents_ASPxRoundPanel1_E_cont_no"]
${txt_value_09_nsd_status_date_locator}        //input[@id="ctl00_phContents_ASPxRoundPanel1_E_sts_date"]
${txt_value_09_nsd_cust_name_locator}          //input[@id="ctl00_phContents_ASPxRoundPanel1_E_name"]
${txt_value_09_nsd_call_center_locator}        //input[@id="ctl00_phContents_ASPxRoundPanel1_TXT_CALL_CENTER"]
${txt_value_09_nsd_age_locator}                //input[@id="ctl00_phContents_ASPxRoundPanel1_TXT_Age"]
${txt_value_09_nsd_team_locator}               //input[@id="ctl00_phContents_ASPxRoundPanel1_E_team"]
${txt_value_09_nsd_team2_locator}              //input[@id="ctl00_phContents_ASPxRoundPanel1_E_term"]
${txt_value_09_nsd_od_status_locator}          //input[@id="ctl00_phContents_ASPxRoundPanel1_TXT_OD_Sts"]
${txt_value_09_nsd_od_status2_locator}         //input[@id="ctl00_phContents_ASPxRoundPanel1_E_odterm"]
${txt_value_09_nsd_contract_type_locator}      //input[@id="ctl00_phContents_ASPxRoundPanel1_TXT_Cont_type"]
${txt_value_09_nsd_contract_date_locator}      //input[@id="ctl00_phContents_ASPxRoundPanel1_TXT_Cont_date"]
${txt_value_09_nsd_biz_locator}                //select[@id="ctl00_phContents_ASPxRoundPanel1_D_biz"]/option
${txt_value_09_nsd_wo_date_locator}            //input[@id="ctl00_phContents_ASPxRoundPanel1_TXT_WO_Date"]
${txt_value_09_nsd_contract_status_locator}    //select[@id="ctl00_phContents_ASPxRoundPanel1_D_cont_status"]/option
${txt_value_09_nsd_time_of_payment_locator}    //input[@id="ctl00_phContents_ASPxRoundPanel1_TXT_time_payment"]
${txt_value_09_nsd_due_locator}                //input[@id="ctl00_phContents_ASPxRoundPanel1_TXT_Due"]
${txt_value_09_nsd_time_of_penalty_locator}    //input[@id="ctl00_phContents_ASPxRoundPanel1_TXT_time_penal"]
${txt_value_09_nsd_req_time_locator}           //input[@id="ctl00_phContents_ASPxRoundPanel1_E_request_time"]
${txt_value_09_nsd_min_install_locator}        //input[@id="ctl00_phContents_ASPxRoundPanel1_maximum_nego"]
${txt_value_09_nsd_last_req_no_locator}        //a[@id="ctl00_phContents_ASPxRoundPanel1_E_Last_reqNo"]


# Header
${txt_header_09_nsd_negotiation_special_discount_locator}        //span[@id="ctl00_phContents_ASPxRoundPanel1_RPHT"]
${txt_header_09_nsd_negotiation_special_discount_2_locator}      //span[@id="ctl00_phContents_ASPxRoundPanel1_lblHis_head"]
${txt_header_09_nsd_negotiate_detail_locator}                    //span[@id="ctl00_phContents_ASPxRoundPanel1_lblHis_request"]
${txt_header_09_nsd_entry_negotiate_discount_detail_locator}     //span[@id="ctl00_phContents_ASPxRoundPanel1_lblNegoDiscount"]
${txt_header_09_header_locator}                                  //span[@id="ctl00_phContents_ASPxRoundPanel1_RPHT"]

# Title - 09 : Negotiation Special discount (Fraud)
${txt_title_09_nsd_format_locator}              //font[text()="***replace***"]


### Negotiate Detail ###
# Title - Negotiate Detail - 1. Entry negotiate discount detail, 2. Entry detail by Term#, Time# and 3. Entry request detail
${txt_title_09_nd_format_locator}               //font[text()="***replace***"]


# Input - Negotiate Detail - 1. Entry negotiate discount detail
${input_09_nd_totals_term_locator}              //input[@id="ctl00_phContents_ASPxRoundPanel1_E_tot_term"]
${input_09_nd_totals_paid_amt_locator}          //input[@id="ctl00_phContents_ASPxRoundPanel1_E_tot_paid_amt"]
${dropdown_09_nd_f_due_date_locator}            //select[@id="ctl00_phContents_ASPxRoundPanel1_ddlBackw_fduedate"]
${dropdown_09_nd_f_due_date_index_2_locator}    //select[@id="ctl00_phContents_ASPxRoundPanel1_ddlBackw_fduedate"]/option[2]
${input_09_nd_js_start_cal_date_id}             ctl00_phContents_ASPxRoundPanel1_TXT_Start_Cal_date


# Value - OD Screen
${txt_value_fraud_loan_amt_of_customer}             //span[@id="ctl00_phContents_ASPxRoundPanel1_ASPxPageControl1_lblLoanAmt_ofCus"]
${txt_value_fraud_loan_amt_of_new_contract}         //span[@id="ctl00_phContents_ASPxRoundPanel1_ASPxPageControl1_lblLoanAmt_of_NewCus"]
${txt_value_fraud_contract_amount}                  //span[@id="ctl00_phContents_ASPxRoundPanel1_ASPxPageControl1_lblContractAmt_OD"]
${txt_value_fraud_paid_term}                        //span[@id="ctl00_phContents_ASPxRoundPanel1_ASPxPageControl1_lblPaid_TermOD"]
${txt_value_fraud_total_paid_amt_old_contract}      //span[@id="ctl00_phContents_ASPxRoundPanel1_ASPxPageControl1_lblTtalPaid_oldContract"]
${txt_value_fraud_total_paid_amt_new_contract}      //span[@id="ctl00_phContents_ASPxRoundPanel1_ASPxPageControl1_lblTtalPaid_newContract"]
${txt_value_fraud_os_as_of_closing_date}            //span[@id="ctl00_phContents_ASPxRoundPanel1_ASPxPageControl1_lblOS_AsofClose"]
${txt_value_fraud_od_amount}                        //span[@id="ctl00_phContents_ASPxRoundPanel1_ASPxPageControl1_lblOD_Amt_OD"]
${txt_value_fraud_penalty_amount}                   //span[@id="ctl00_phContents_ASPxRoundPanel1_ASPxPageControl1_lblPenalty_OD"]
${txt_value_fraud_closing_syd}                      //span[@id="ctl00_phContents_ASPxRoundPanel1_ASPxPageControl1_lblClosing_SYD"]
${txt_value_fraud_wo_amount}                        //span[@id="ctl00_phContents_ASPxRoundPanel1_ASPxPageControl1_lblWO_Amt_OD"]
${txt_value_fraud_customer_will_pay}                //span[@id="ctl00_phContents_ASPxRoundPanel1_ASPxPageControl1_lblCuswillPay_OD"]
${txt_value_fraud_diff_from_closing}                //span[@id="ctl00_phContents_ASPxRoundPanel1_ASPxPageControl1_lblDiff_Close_OD"]
${txt_value_diff_close_amt_od}                      //span[@id="ctl00_phContents_ASPxRoundPanel1_ASPxPageControl1_lblDiffClose_Amt_OD"]
${txt_value_diff_close_per_od}                      //span[@id="ctl00_phContents_ASPxRoundPanel1_ASPxPageControl1_lblDiffClose_Per_OD"]
${txt_value_fraud_diff_from_wo_od}                  //span[@id="ctl00_phContents_ASPxRoundPanel1_ASPxPageControl1_lblDiff_WO_OD"]
${txt_value_diff_wo_amt_od}                         //span[@id="ctl00_phContents_ASPxRoundPanel1_ASPxPageControl1_lblDiffWO_Amt_OD"]
${txt_value_diff_wo_per_od}                         //span[@id="ctl00_phContents_ASPxRoundPanel1_ASPxPageControl1_lblDiffWO_Per_OD"]
${txt_value_fraud_total_received}                   //span[@id="ctl00_phContents_ASPxRoundPanel1_ASPxPageControl1_lblTtal_Rcv_OD"]
${txt_value_fraud_diff_from_loan_amount}            //span[@id="ctl00_phContents_ASPxRoundPanel1_ASPxPageControl1_lblDiff_LoanAmt_OD"]
${txt_value_fraud_diff_from_os}                     //span[@id="ctl00_phContents_ASPxRoundPanel1_ASPxPageControl1_lblDiff_OS_OD"]
${txt_value_fraud_diff_from_wo}                     //span[@id="ctl00_phContents_ASPxRoundPanel1_ASPxPageControl1_lblDiff_FromWO_OD"]


${value_fraud_loan_amt_of_customer}                 //input[@id="ctl00_phContents_ASPxRoundPanel1_ASPxPageControl1_enumOD_LoanAmtCust"]
${value_fraud_loan_amt_of_new_contract}             //input[@id="ctl00_phContents_ASPxRoundPanel1_ASPxPageControl1_enumOD_LoanAmtNew"]
${value_fraud_contract_amount}                      //input[@id="ctl00_phContents_ASPxRoundPanel1_ASPxPageControl1_enumOD_ContractAmt"]
${value_fraud_paid_term}                            //input[@id="ctl00_phContents_ASPxRoundPanel1_ASPxPageControl1_enumOD_PaidTerm"]
${value_fraud_total_paid_amt_old_contract}          //input[@id="ctl00_phContents_ASPxRoundPanel1_ASPxPageControl1_enumOD_TtalPaidAmt_Old"]
${value_fraud_total_paid_amt_new_contract}          //input[@id="ctl00_phContents_ASPxRoundPanel1_ASPxPageControl1_enumOD_TtalPaidAmt_New"]
${value_fraud_os_as_of_closing_date}                //input[@id="ctl00_phContents_ASPxRoundPanel1_ASPxPageControl1_enumOD_OS_AsOfClose"]
${value_fraud_od_amount}                            //input[@id="ctl00_phContents_ASPxRoundPanel1_ASPxPageControl1_enumOD_ODAmount"]
${value_fraud_penalty_amount}                       //input[@id="ctl00_phContents_ASPxRoundPanel1_ASPxPageControl1_enumOD_Pennalty"]
${value_fraud_closing_syd}                          //input[@id="ctl00_phContents_ASPxRoundPanel1_ASPxPageControl1_enumOD_Close_SYD"]
${value_fraud_wo_amount}                            //input[@id="ctl00_phContents_ASPxRoundPanel1_ASPxPageControl1_enumOD_WO_Amt"]
${value_fraud_customer_will_pay}                    //input[@id="ctl00_phContents_ASPxRoundPanel1_ASPxPageControl1_enumOD_CuswillPay"]
${value_diff_close_amt_od}                          //input[@id="ctl00_phContents_ASPxRoundPanel1_ASPxPageControl1_enumOD_DiffClose_Amt"]
${value_diff_close_per_od}                          //input[@id="ctl00_phContents_ASPxRoundPanel1_ASPxPageControl1_enumOD_DiffClose_Per"]
${value_diff_wo_amt_od}                             //input[@id="ctl00_phContents_ASPxRoundPanel1_ASPxPageControl1_enumOD_DiffWO_Amt"]
${value_diff_wo_per_od}                             //input[@id="ctl00_phContents_ASPxRoundPanel1_ASPxPageControl1_enumOD_DiffWO_Per"]
${value_fraud_total_received}                       //input[@id="ctl00_phContents_ASPxRoundPanel1_ASPxPageControl1_enumOD_Ttal_rcv"]
${value_fraud_diff_from_loan_amount}                //input[@id="ctl00_phContents_ASPxRoundPanel1_ASPxPageControl1_enumOD_DiffLoan_Amt"]
${value_fraud_diff_from_os}                         //input[@id="ctl00_phContents_ASPxRoundPanel1_ASPxPageControl1_enumOD_Diff_OS"]
${value_fraud_diff_from_wo}                         //input[@id="ctl00_phContents_ASPxRoundPanel1_ASPxPageControl1_enumOD_Diff_WO"]


# Button - Negotiate Detail - 1. Entry negotiate discount detail
${btn_09_nd_submit_locator}                        //input[@id="ctl00_phContents_ASPxRoundPanel1_B_submit"]
${btn_09_nd_help_locator}                          //input[@id="ctl00_phContents_ASPxRoundPanel1_B_help"]
${btn_09_nd_clear_locator}                         //input[@id="ctl00_phContents_ASPxRoundPanel1_B_clear"]


# Title - 1.1 Payment History
${txt_title_09_nd_1_1_format_locator}              //table[@id="OD_Screen"]//span[contains(text(),"***replace***")]


# Input - Negotiate Detail - 2. Entry detail by Term#, Time#
${input_09_nd_start_term_locator}                   //input[@id="ctl00_phContents_ASPxRoundPanel1_E_term_no"]
${input_09_nd_end_term_locator}                     //input[@id="ctl00_phContents_ASPxRoundPanel1_E_term_end"]
${input_09_nd_js_paid_date_id}                      ctl00_phContents_ASPxRoundPanel1_txtPaid_date
${input_09_nd_paid_amt_locator}                     //input[@id="ctl00_phContents_ASPxRoundPanel1_E_paid_amt"]


# Button - Negotiate Detail - 2. Entry detail by Term#, Time#
${btn_09_nd_2_add_locator}                          //input[@id="ctl00_phContents_ASPxRoundPanel1_B_add"]
${btn_09_nd_2_cancel_locator}                       //input[@id="ctl00_phContents_ASPxRoundPanel1_B_Cancel"]


# Title - Negotiate Detail - 2. Entry detail by Term#, Time#
${txt_title_09_nd_2_format_locator}                //table[@id="ctl00_phContents_ASPxRoundPanel1_GD_DataView"]//th[text()="***replace***"]


# Value Table 2. Entry detail by Term#, Time#
${txt_value_09_nd_2_total_team_locator}           //tr[@style="background-color:#CCCC99;font-weight:bold;"]/td[@align="right"][1]
${txt_value_09_nd_2_total_paid_amount_locator}    //tr[@style="background-color:#CCCC99;font-weight:bold;"]/td[@align="right"][2]


# Input - Negotiate Detail - 3. Entry request detail
# 3.1 Entry other debt
${input_09_nd_other_debt_locator}                 //input[@id="ctl00_phContents_ASPxRoundPanel1_txtOther_Dept"]
${input_09_nd_amt_locator}                        //input[@id="ctl00_phContents_ASPxRoundPanel1_enumOthDep_Amt"]


# Button - Negotiate Detail - 3.1 Entry other debt
${btn_09_nd_3_1_add_locator}                      //input[@id="ctl00_phContents_ASPxRoundPanel1_B_add_debt"]
${btn_09_nd_3_1_cancel_locator}                   //input[@id="ctl00_phContents_ASPxRoundPanel1_B_Cancel_debt"]


# Title - Negotiate Detail - 3.1 Entry other debt
${txt_title_09_nd_3_1_format_locator}            //table[@id="ctl00_phContents_ASPxRoundPanel1_GD_DataDebt"]//th[text()="***replace***"]


# Value Table 3.1 Entry other debt
${txt_value_09_nd_3_1_total_amount_locator}      //table[@id="ctl00_phContents_ASPxRoundPanel1_GD_DataDebt"]//tr[@style="background-color:#CCCC99;font-weight:bold;"]/td[@align]


# Input - Negotiate Detail - 3.2 Entry other ...
${input_09_nd_js_last_cont_3_party_id}         ctl00_phContents_ASPxRoundPanel1_txtContactdate_3Party
${input_09_nd_js_last_cont_3_party_locator}    //input[@id="ctl00_phContents_ASPxRoundPanel1_txtContactdate_3Party"]
${input_09_nd_js_last_cont_cust_id}            ctl00_phContents_ASPxRoundPanel1_txtContactdate_Customer
${input_09_nd_js_last_cont_cust_locator}       //input[@id="ctl00_phContents_ASPxRoundPanel1_txtContactdate_Customer"]
${input_09_nd_have_job_yes_locator}            //input[@id="ctl00_phContents_ASPxRoundPanel1_rdbtlHaveJob_0"]
${input_09_nd_have_job_no_locator}             //input[@id="ctl00_phContents_ASPxRoundPanel1_rdbtlHaveJob_1"]
${select_09_nd_who_req_locator}                //select[@id="ctl00_phContents_ASPxRoundPanel1_ddlCus_request"]
${txt_09_nd_who_req_locator}                   //select[@id="ctl00_phContents_ASPxRoundPanel1_ddlCus_request"]/option
${txt_data_09_nd_who_req_locator}              //select[@id="ctl00_phContents_ASPxRoundPanel1_ddlCus_request"]/option[text()="***replace***"]
${select_09_nd_discount_camp_locator}          //select[@id="ctl00_phContents_ASPxRoundPanel1_ddlDiscount_camp"]
${txt_data_09_nd_discount_camp_locator}        //select[@id="ctl00_phContents_ASPxRoundPanel1_ddlDiscount_camp"]/option[text()="***replace***"]
${select_09_nd_who_paid_locator}               //select[@id="ctl00_phContents_ASPxRoundPanel1_ddlWho_Paid"]
${txt_data_09_nd_who_paid_locator}             //select[@id="ctl00_phContents_ASPxRoundPanel1_ddlWho_Paid"]/option[text()="***replace***"]
${select_09_nd_source_fund_locator}            //select[@id="ctl00_phContents_ASPxRoundPanel1_ddlSource_Fund"]
${txt_data_09_nd_source_fund__locator}         //select[@id="ctl00_phContents_ASPxRoundPanel1_ddlSource_Fund"]/option[text()="***replace***"]
${select_09_nd_reason_locator}                 //select[@id="ctl00_phContents_ASPxRoundPanel1_D_reason"]
${txt_data_09_nd_reason_locator}               //select[@id="ctl00_phContents_ASPxRoundPanel1_D_reason"]/option[text()="***replace***"]
${input_09_nd_reason_note_locator}             //input[@id="ctl00_phContents_ASPxRoundPanel1_E_reason_note"]
${select_09_nd_send_to_locator}                //select[@id="ctl00_phContents_ASPxRoundPanel1_D_send_to"]
${txt_data_09_nd_send_to_locator}              //select[@id="ctl00_phContents_ASPxRoundPanel1_D_send_to"]/option[text()="***replace***"]
${input_09_nd_note_locator}                    //textarea[@id="ctl00_phContents_ASPxRoundPanel1_E_note"]


# Do you want to Approve?
${btn_09_nsd_ok_locator}                       //input[@id="ctl00_btnOK_ConfirmApprove"]
${txt_red_value_09_nsd_request_no_locator}     //input[@id="ctl00_phContents_ASPxRoundPanel1_E_request_no" and @value]
${txt_value_09_nsd_sign_out_locator}           //a[@id="ctl00_lbtnSignOut"]

# Error msg
${txt_msg_09_error}                           //span[@id="ctl00_phContents_ASPxRoundPanel1_lblMsg"]

# Btn Back
${btn_09_back}                                //input[@id="ctl00_btnGotoList"]