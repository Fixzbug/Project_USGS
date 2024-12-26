
*** Variables ***
# iframe
${iframe_wo_locator}                              //iframe[@id='myiframeid']

# Select request
${sel_wo_request_type_locator}                    //select[@id='ctl00_phContents_ASPxRoundPanel1_D_request_type']

# Request
${lbl_wo_id_card}                                 //font[contains(text(),'ID Card')]
${req_wo_id_card}                                 id=ctl00_phContents_ASPxRoundPanel1_E_id
${lbl_wo_req_business}                            //font[contains(text(),'Business')]
${sel_req_wo_business}                            //select[@id='ctl00_phContents_ASPxRoundPanel1_D_biz']
${lbl_wo_contract_no}                             //font[contains(text(),'Contract')]    # contact no
${req_wo_contract_no}                             id=ctl00_phContents_ASPxRoundPanel1_E_cont_no


### 06_Negotiation_special_discount_locator ###
# Input - 06 : Negotiation Special discount (WO)
${input_06_nsd_num_of_child_locator}               //input[@id="ctl00_phContents_ASPxRoundPanel1_TXT_NumChild"]
${input_06_nsd_last_salary_locator}                //input[@id="ctl00_phContents_ASPxRoundPanel1_TXT_Last_Salary"]
${dropdown_06_nsd_cust_status_locator}             //select[@id="ctl00_phContents_ASPxRoundPanel1_D_status"]
${txt_value_06_nsd_cust_status_locator}            //select[@id="ctl00_phContents_ASPxRoundPanel1_D_CustSts"]/option


# Value - 06 : Negotiation Special discount (WO)
${txt_value_06_nsd_request_type_locator}           //select[@id="ctl00_phContents_ASPxRoundPanel1_D_request_type"]/option
${txt_value_06_nsd_request_no_locator}             //input[@id="ctl00_phContents_ASPxRoundPanel1_E_request_no"]
${txt_value_06_nsd_requester_locator}              //input[@id="ctl00_phContents_ASPxRoundPanel1_E_requester"]
${txt_value_06_nsd_request_date_locator}           //input[@id="ctl00_phContents_ASPxRoundPanel1_E_request_date"]
${txt_value_06_nsd_cust_id_locator}                //input[@id="ctl00_phContents_ASPxRoundPanel1_E_id"]
${txt_value_06_nsd_req_status_locator}             //input[@id="ctl00_phContents_ASPxRoundPanel1_E_request_sts"]
${txt_value_06_nsd_contract_no_locator}            //input[@id="ctl00_phContents_ASPxRoundPanel1_E_cont_no"]
${txt_value_06_nsd_status_date_locator}            //input[@id="ctl00_phContents_ASPxRoundPanel1_E_sts_date"]
${txt_value_06_nsd_cust_name_locator}              //input[@id="ctl00_phContents_ASPxRoundPanel1_E_name"]
${txt_value_06_nsd_call_center_locator}            //input[@id="ctl00_phContents_ASPxRoundPanel1_TXT_CALL_CENTER"]
${txt_value_06_nsd_age_locator}                    //input[@id="ctl00_phContents_ASPxRoundPanel1_TXT_Age"]
${txt_value_06_nsd_team_locator}                   //input[@id="ctl00_phContents_ASPxRoundPanel1_E_team"]
${txt_value_06_nsd_team2_locator}                  //input[@id="ctl00_phContents_ASPxRoundPanel1_E_term"]
${txt_value_06_nsd_od_status_locator}              //input[@id="ctl00_phContents_ASPxRoundPanel1_TXT_OD_Sts"]
${txt_value_06_nsd_od_status2_locator}             //input[@id="ctl00_phContents_ASPxRoundPanel1_E_odterm"]
${txt_value_06_nsd_contract_type_locator}          //input[@id="ctl00_phContents_ASPxRoundPanel1_TXT_Cont_type"]
${txt_value_06_nsd_contract_date_locator}          //input[@id="ctl00_phContents_ASPxRoundPanel1_TXT_Cont_date"]
${txt_value_06_nsd_biz_locator}                    //select[@id="ctl00_phContents_ASPxRoundPanel1_D_biz"]/option
${txt_value_06_nsd_wo_date_locator}                //input[@id="ctl00_phContents_ASPxRoundPanel1_TXT_WO_Date"]
${txt_value_06_nsd_contract_status_locator}        //select[@id="ctl00_phContents_ASPxRoundPanel1_D_cont_status"]/option
${txt_value_06_nsd_time_of_payment_locator}        //input[@id="ctl00_phContents_ASPxRoundPanel1_TXT_time_payment"]
${txt_value_06_nsd_due_locator}                    //input[@id="ctl00_phContents_ASPxRoundPanel1_TXT_Due"]
${txt_value_06_nsd_time_of_penalty_locator}        //input[@id="ctl00_phContents_ASPxRoundPanel1_TXT_time_penal"]
${txt_value_06_nsd_req_time_locator}               //input[@id="ctl00_phContents_ASPxRoundPanel1_E_request_time"]
${txt_value_06_nsd_min_install_locator}            //input[@id="ctl00_phContents_ASPxRoundPanel1_maximum_nego"]
${txt_value_06_nsd_last_req_no_locator}            //a[@id="ctl00_phContents_ASPxRoundPanel1_E_Last_reqNo"]


# Header
${txt_header_06_nsd_negotiation_special_discount_locator}        //span[@id="ctl00_phContents_ASPxRoundPanel1_RPHT"]
${txt_header_06_nsd_negotiation_special_discount_2_locator}      //span[@id="ctl00_phContents_ASPxRoundPanel1_lblHis_head"]
${txt_header_06_nsd_negotiate_detail_locator}                    //span[@id="ctl00_phContents_ASPxRoundPanel1_lblHis_request"]
${txt_header_06_nsd_entry_negotiate_discount_detail_locator}     //span[@id="ctl00_phContents_ASPxRoundPanel1_lblNegoDiscount"]
${txt_header_06_header_locator}                                  //span[@id="ctl00_phContents_ASPxRoundPanel1_RPHT"]

# Title - 06 : Negotiation Special discount (WO)
${txt_title_06_nsd_format_locator}                    //font[text()="***replace***"]


### Negotiate Detail ###
# Title - Negotiate Detail - 1. Entry negotiate discount detail, 2. Entry detail by Term#, Time# and 3. Entry request detail
${txt_title_06_nd_format_locator}                     //font[text()="***replace***"]


# Input - Negotiate Detail - 1. Entry negotiate discount detail
${input_06_nd_totals_term_locator}                  //input[@id="ctl00_phContents_ASPxRoundPanel1_E_tot_term"]
${input_06_nd_totals_paid_amt_locator}              //input[@id="ctl00_phContents_ASPxRoundPanel1_E_tot_paid_amt"]
${dropdown_06_nd_f_due_date_locator}                //select[@id="ctl00_phContents_ASPxRoundPanel1_ddlBackw_fduedate"]
${dropdown_06_nd_f_due_date_index_2_locator}        //select[@id="ctl00_phContents_ASPxRoundPanel1_ddlBackw_fduedate"]/option[2]    # add new 2 to 3
${dropdown_06_nd_f_due_date_index_3_locator}        //select[@id="ctl00_phContents_ASPxRoundPanel1_ddlBackw_fduedate"]/option[3]    # add new 2 to 3
${input_06_nd_js_start_cal_date_id}                 ctl00_phContents_ASPxRoundPanel1_TXT_Start_Cal_date


# Value - WO Screen
${txt_value_wo_loan_amt_of_customer}                  //span[@id="ctl00_phContents_ASPxRoundPanel1_ASPxPageControl1_lblLoanAmt_WO_ofCus"]
${txt_value_wo_loan_amt_of_new_contract}              //span[@id="ctl00_phContents_ASPxRoundPanel1_ASPxPageControl1_lblLoanAmt_WO_ofNew"]
${txt_value_wo_contract_amount}                       //span[@id="ctl00_phContents_ASPxRoundPanel1_ASPxPageControl1_lblContractAmt_WO"]
${txt_value_wo_paid_term}                             //span[@id="ctl00_phContents_ASPxRoundPanel1_ASPxPageControl1_lblPaid_TermWO"]
${txt_value_wo_receive_bf_wo_old_cont}                //span[@id="ctl00_phContents_ASPxRoundPanel1_ASPxPageControl1_lblRcvBfWO_Old"]
${txt_value_wo_receive_bf_wo_new_cont}                //span[@id="ctl00_phContents_ASPxRoundPanel1_ASPxPageControl1_lblRcvBfWO_New"]
${txt_value_wo_os_balance}                            //span[@id="ctl00_phContents_ASPxRoundPanel1_ASPxPageControl1_lblOS_Bal_WO"]
${txt_value_wo_other}                                 //span[@id="ctl00_phContents_ASPxRoundPanel1_ASPxPageControl1_lblOther_WO"]
${txt_value_wo_wo_balance_as_of_closing}              //span[@id="ctl00_phContents_ASPxRoundPanel1_ASPxPageControl1_lblWO_BAL_WO"]
${txt_value_wo_new_wo_balance}                        //span[@id="ctl00_phContents_ASPxRoundPanel1_ASPxPageControl1_lblNew_WOBal"]
${txt_value_wo_customer_will_pay}                     //span[@id="ctl00_phContents_ASPxRoundPanel1_ASPxPageControl1_lblCuswillPay_WO"]
${txt_value_wo_receive_after_wo}                      //span[@id="ctl00_phContents_ASPxRoundPanel1_ASPxPageControl1_lblRcvAfterWO_WO"]
${txt_value_wo_diff_amount}                           //span[@id="ctl00_phContents_ASPxRoundPanel1_ASPxPageControl1_lblDiffAmount_WO"]
${txt_value_wo_oa_com}                                //span[@id="ctl00_phContents_ASPxRoundPanel1_ASPxPageControl1_lblOA_Com_WO"]
${txt_value_wo_totals_received}                       //span[@id="ctl00_phContents_ASPxRoundPanel1_ASPxPageControl1_lblTotal_Rcv_WO"]
${txt_value_wo_diff_from_loan_amount}                 //span[@id="ctl00_phContents_ASPxRoundPanel1_ASPxPageControl1_lblDiff_LoanAmt_WO"]
${txt_value_wo_percent_discount}                      //span[@id="ctl00_phContents_ASPxRoundPanel1_ASPxPageControl1_lblPer_Discount_WO"]
${txt_value_wo_after_wo_percent_discount}             //span[@id="ctl00_phContents_ASPxRoundPanel1_ASPxPageControl1_lblAFWO_Per_WO"]
${txt_value_wo_net_receive_only_oa}                   //span[@id="ctl00_phContents_ASPxRoundPanel1_ASPxPageControl1_lblNetRcv_OA_WO"]
        
${value_wo_loan_amt_of_customer}                      //input[@id="ctl00_phContents_ASPxRoundPanel1_ASPxPageControl1_enumWO_LoanAmt_Old"]
${value_wo_loan_amt_of_new_contract}                  //input[@id="ctl00_phContents_ASPxRoundPanel1_ASPxPageControl1_enumWO_LoanAmt_New"]
${value_wo_contract_amount}                           //input[@id="ctl00_phContents_ASPxRoundPanel1_ASPxPageControl1_enumWO_ContractAmt"]
${value_wo_paid_term}                                 //input[@id="ctl00_phContents_ASPxRoundPanel1_ASPxPageControl1_enumWO_PaidTerm"]
${value_wo_receive_bf_wo_old_cont}                    //input[@id="ctl00_phContents_ASPxRoundPanel1_ASPxPageControl1_enumRcvBfWO_Old"]
${value_wo_receive_bf_wo_new_cont}                    //input[@id="ctl00_phContents_ASPxRoundPanel1_ASPxPageControl1_enumRcvBfWO_New"]
${value_wo_os_balance}                                //input[@id="ctl00_phContents_ASPxRoundPanel1_ASPxPageControl1_enumWO_OS_Bal"]
${value_wo_other}                                     //input[@id="ctl00_phContents_ASPxRoundPanel1_ASPxPageControl1_enumOther"]
${value_wo_wo_balance_as_of_closing}                  //input[@id="ctl00_phContents_ASPxRoundPanel1_ASPxPageControl1_enumWO_WO_Bal"]
${value_wo_new_wo_balance}                            //input[@id="ctl00_phContents_ASPxRoundPanel1_ASPxPageControl1_enumNewWO_Bal"]
${value_wo_customer_will_pay}                         //input[@id="ctl00_phContents_ASPxRoundPanel1_ASPxPageControl1_enumWO_Cuswill_Paid"]
${value_wo_receive_after_wo}                          //input[@id="ctl00_phContents_ASPxRoundPanel1_ASPxPageControl1_enumWO_RcvAfWO"]
${value_wo_diff_amount}                               //input[@id="ctl00_phContents_ASPxRoundPanel1_ASPxPageControl1_enumWO_DiffAmt"]
${value_wo_oa_com}                                    //input[@id="ctl00_phContents_ASPxRoundPanel1_ASPxPageControl1_enumWO_OACom"]
${value_wo_totals_received}                           //input[@id="ctl00_phContents_ASPxRoundPanel1_ASPxPageControl1_enumWO_Totals_Rcv"]
${value_wo_diff_from_loan_amount}                     //input[@id="ctl00_phContents_ASPxRoundPanel1_ASPxPageControl1_enumWO_Diff_LoanAmt"]
${value_wo_percent_discount}                          //input[@id="ctl00_phContents_ASPxRoundPanel1_ASPxPageControl1_enumWO_Discount_Per"]
${value_wo_after_wo_percent_discount}                 //input[@id="ctl00_phContents_ASPxRoundPanel1_ASPxPageControl1_enumWO_AfWO_DisPer"]
${value_wo_net_receive_only_oa}                       //input[@id="ctl00_phContents_ASPxRoundPanel1_ASPxPageControl1_enumWO_Net_Rcv"]


# Button - Negotiate Detail - 1. Entry negotiate discount detail
${btn_06_nd_submit_locator}                            //input[@id="ctl00_phContents_ASPxRoundPanel1_B_submit"]
${btn_06_nd_help_locator}                              //input[@id="ctl00_phContents_ASPxRoundPanel1_B_help"]
${btn_06_nd_clear_locator}                             //input[@id="ctl00_phContents_ASPxRoundPanel1_B_clear"]


# Title - 1.1 Payment History
${txt_title_06_nd_1_1_format_locator}                   //table[@id="OD_Screen"]//span[contains(text(),"***replace***")]


# Input - Negotiate Detail - 2. Entry detail by Term#, Time#
${input_06_nd_start_term_locator}                       //input[@id="ctl00_phContents_ASPxRoundPanel1_E_term_no"]
${input_06_nd_end_term_locator}                         //input[@id="ctl00_phContents_ASPxRoundPanel1_E_term_end"]
${input_06_nd_js_paid_date_id}                          ctl00_phContents_ASPxRoundPanel1_txtPaid_date
${input_06_nd_paid_amt_locator}                         //input[@id="ctl00_phContents_ASPxRoundPanel1_E_paid_amt"]


# Button - Negotiate Detail - 2. Entry detail by Term#, Time#
${btn_06_nd_2_add_locator}                              //input[@id="ctl00_phContents_ASPxRoundPanel1_B_add"]
${btn_06_nd_2_cancel_locator}                           //input[@id="ctl00_phContents_ASPxRoundPanel1_B_Cancel"]


# Title - Negotiate Detail - 2. Entry detail by Term#, Time#
${txt_title_06_nd_2_format_locator}                    //table[@id="ctl00_phContents_ASPxRoundPanel1_GD_DataView"]//th[text()="***replace***"]


# Value Table 2. Entry detail by Term#, Time#
${txt_value_06_nd_2_total_team_locator}                 //tr[@style="background-color:#CCCC99;font-weight:bold;"]/td[@align="right"][1]
${txt_value_06_nd_2_total_paid_amount_locator}          //tr[@style="background-color:#CCCC99;font-weight:bold;"]/td[@align="right"][2]


# Input - Negotiate Detail - 3. Entry request detail
# 3.1 Entry other debt
${input_06_nd_other_debt_locator}                      //input[@id="ctl00_phContents_ASPxRoundPanel1_txtOther_Dept"]
${input_06_nd_amt_locator}                             //input[@id="ctl00_phContents_ASPxRoundPanel1_enumOthDep_Amt"]


# Button - Negotiate Detail - 3.1 Entry other debt
${btn_06_nd_3_1_add_locator}                          //input[@id="ctl00_phContents_ASPxRoundPanel1_B_add_debt"]
${btn_06_nd_3_1_cancel_locator}                       //input[@id="ctl00_phContents_ASPxRoundPanel1_B_Cancel_debt"]


# Title - Negotiate Detail - 3.1 Entry other debt
${txt_title_06_nd_3_1_format_locator}                //table[@id="ctl00_phContents_ASPxRoundPanel1_GD_DataDebt"]//th[text()="***replace***"]


# Value Table 3.1 Entry other debt
${txt_value_06_nd_3_1_total_amount_locator}          //table[@id="ctl00_phContents_ASPxRoundPanel1_GD_DataDebt"]//tr[@style="background-color:#CCCC99;font-weight:bold;"]/td[@align]


# Input - Negotiate Detail - 3.2 Entry other ...
${input_06_nd_js_last_cont_3_party_id}                ctl00_phContents_ASPxRoundPanel1_txtContactdate_3Party
${input_06_nd_js_last_cont_3_party_locator}           //input[@id="ctl00_phContents_ASPxRoundPanel1_txtContactdate_3Party"]
${input_06_nd_js_last_cont_cust_id}                   ctl00_phContents_ASPxRoundPanel1_txtContactdate_Customer
${input_06_nd_js_last_cont_cust_locator}              //input[@id="ctl00_phContents_ASPxRoundPanel1_txtContactdate_Customer"]
${input_06_nd_have_job_yes_locator}                   //input[@id="ctl00_phContents_ASPxRoundPanel1_rdbtlHaveJob_0"]
${input_06_nd_have_job_no_locator}                    //input[@id="ctl00_phContents_ASPxRoundPanel1_rdbtlHaveJob_1"]
${select_06_nd_who_req_locator}                       //select[@id="ctl00_phContents_ASPxRoundPanel1_ddlCus_request"]
${txt_06_nd_who_req_locator}                          //select[@id="ctl00_phContents_ASPxRoundPanel1_ddlCus_request"]/option
${txt_data_06_nd_who_req_locator}                     //select[@id="ctl00_phContents_ASPxRoundPanel1_ddlCus_request"]/option[text()="***replace***"]
${select_06_nd_discount_camp_locator}                 //select[@id="ctl00_phContents_ASPxRoundPanel1_ddlDiscount_camp"]
${txt_data_06_nd_discount_camp_locator}               //select[@id="ctl00_phContents_ASPxRoundPanel1_ddlDiscount_camp"]/option[text()="***replace***"]
${select_06_nd_who_paid_locator}                      //select[@id="ctl00_phContents_ASPxRoundPanel1_ddlWho_Paid"]
${txt_data_06_nd_who_paid_locator}                    //select[@id="ctl00_phContents_ASPxRoundPanel1_ddlWho_Paid"]/option[text()="***replace***"]
${select_06_nd_source_fund_locator}                   //select[@id="ctl00_phContents_ASPxRoundPanel1_ddlSource_Fund"]
${txt_data_06_nd_source_fund__locator}                //select[@id="ctl00_phContents_ASPxRoundPanel1_ddlSource_Fund"]/option[text()="***replace***"]
${select_06_nd_reason_locator}                        //select[@id="ctl00_phContents_ASPxRoundPanel1_D_reason"]
${txt_data_06_nd_reason_locator}                      //select[@id="ctl00_phContents_ASPxRoundPanel1_D_reason"]/option[text()="***replace***"]
${input_06_nd_reason_note_locator}                    //input[@id="ctl00_phContents_ASPxRoundPanel1_E_reason_note"]
${select_06_nd_send_to_locator}                       //select[@id="ctl00_phContents_ASPxRoundPanel1_D_send_to"]
${txt_data_06_nd_send_to_locator}                     //select[@id="ctl00_phContents_ASPxRoundPanel1_D_send_to"]/option[text()="***replace***"]
${input_06_nd_note_locator}                           //textarea[@id="ctl00_phContents_ASPxRoundPanel1_E_note"]


# Do you want to Approve?
${btn_06_nsd_ok_locator}                               //input[@id="ctl00_btnOK_ConfirmApprove"]
${txt_red_value_06_nsd_request_no_locator}             //input[@id="ctl00_phContents_ASPxRoundPanel1_E_request_no" and @value]
${txt_value_06_nsd_sign_out_locator}                   //a[@id="ctl00_lbtnSignOut"]

# Error msg
${txt_msg_06_error}                                   //span[@id="ctl00_phContents_ASPxRoundPanel1_lblMsg"]

# Btn Back
${btn_06_back}                                        //input[@id="ctl00_btnGotoList"]