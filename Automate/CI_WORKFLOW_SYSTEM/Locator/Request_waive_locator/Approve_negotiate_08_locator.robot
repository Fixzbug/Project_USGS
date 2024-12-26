
*** Variables ***
# Inquiry
${dropdown_08_inbox_req_type_locator}      //select[@id="ctl00_phContents_ASPxRoundPanel1_D_request_type"]
${txt_08_inbox_requester_locator}          //input[@id="ctl00_phContents_ASPxRoundPanel1_E_requester"]
${txt_08_inbox_request_no_locator}         //input[@id="ctl00_phContents_ASPxRoundPanel1_E_request_no"]
${txt_08_inbox_cust_id_locator}            //input[@id="ctl00_phContents_ASPxRoundPanel1_E_id"]
${txt_08_inbox_contract_locator}           //input[@id="ctl00_phContents_ASPxRoundPanel1_E_contract"]
${btn_08_inbox_search_locator}             //input[@id="ctl00_btnSearch"]


# Inquiry - title table
${txt_title_table_08_inbox_format_locator}                 //table[@id="ctl00_phContents_ASPxRoundPanel1_GD_DataView"]//th[@scope="col" and text()="***replace***"]
${txt_title_table_req_type_08_inbox_format_locator}        //table[@id="ctl00_phContents_ASPxRoundPanel1_GD_DataView"]//th[@scope="col" and text()="Request Type"][1]
${txt_title_table_req_type2_08_inbox_format_locator}       //table[@id="ctl00_phContents_ASPxRoundPanel1_GD_DataView"]//th[@scope="col" and text()="Request Type"][2]
${txt_herf_table_action_08_inbox_locator}                  //table[@id="ctl00_phContents_ASPxRoundPanel1_GD_DataView"]//a[text()="Action"]
${txt_herf_table_view_08_inbox_locator}                    //table[@id="ctl00_phContents_ASPxRoundPanel1_GD_DataView"]//a[text()="View"]


# Inquiry - value
${txt_value_table_req_type_08_inbox_format_locator}        //table[@id="ctl00_phContents_ASPxRoundPanel1_GD_DataView"]//td[contains(text(), "***replace***")]
${txt_value_table_08_inbox_format_locator}                 //table[@id="ctl00_phContents_ASPxRoundPanel1_GD_DataView"]//td[text()="***replace***"]
${txt_value_table_action_08_inbox_format_locator}          //table[@id="ctl00_phContents_ASPxRoundPanel1_GD_DataView"]//a[text()="***replace***"]
${txt_value_sender_inquiry_locator}                        //table//tr[@id="ctl00_phContents_ASPxRoundPanel1_GD_DataView_DXDataRow0"]/td[2]
${txt_value_appr_user_08_inbox_locator}                    //table//tr[@id="ctl00_phContents_ASPxRoundPanel1_GD_DataView_DXDataRow0"]/td[14]


### Approve Negotiate ###
# Head
${txt_head_approve_negotiate_locator}    //span[@id="ctl00_phContents_ASPxRoundPanel1_RPHT"] 


# Verify Title
${txt_title_approve_negotiate_req_type_locator}        //td[@align and contains(text(), "Request Type")]
${txt_title_approve_negotiate_req_no_locator}          //td[@align and contains(text(), "Request No.")]
${txt_title_approve_negotiate_requester_locator}       //td[@align and contains(text(), "Requester")]
${txt_title_approve_negotiate_req_date_locator}        //td[@align and contains(text(), "Request Date")]
${txt_title_approve_negotiate_cust_id_locator}         //td[@align and contains(text(), "Customer ID")]
${txt_title_approve_negotiate_req_status_locator}      //td[@align and contains(text(), "Request Status")]
${txt_title_approve_negotiate_cont_no_locator}         //td[@align and contains(text(), "Contract No")]
${txt_title_approve_negotiate_status_date_locator}     //td[@align and contains(text(), "Status Date")]
${txt_title_approve_negotiate_cust_name_locator}       //td[@align and contains(text(), "Customer Name")]
${txt_title_approve_negotiate_call_center_locator}     //td[@align and contains(text(), "Call Center")]
${txt_title_approve_negotiate_num_of_child_locator}    //td[@align and contains(text(), "Number of child")]
${txt_title_approve_negotiate_team_locator}            //td[@align and contains(text(), "Team")]
${txt_title_approve_negotiate_age_locator}             //td[@align and contains(text(), "Age")]
${txt_title_approve_negotiate_od_status_locator}       //td[@align and contains(text(), "OD Status")]
${txt_title_approve_negotiate_last_salary_locator}     //td[@align and contains(text(), "Last Salary")]
${txt_title_approve_negotiate_cont_type_locator}       //td[@align and contains(text(), "Contract Type")]
${txt_title_approve_negotiate_cust_status_locator}     //td[@align and contains(text(), "Customer Status")]
${txt_title_approve_negotiate_cont_date_locator}       //td[@align and contains(text(), "Contract Date")]
${txt_title_approve_negotiate_biz_locator}             //td[@align and contains(text(), "Business")]
${txt_title_approve_negotiate_wo_date_locator}         //td[@align and contains(text(), "WO Date")]
${txt_title_approve_negotiate_cont_status_locator}     //td[@align and contains(text(), "Contract Status")]
${txt_title_approve_negotiate_time_payment_locator}    //td[@align and contains(text(), "Time of payment")]
${txt_title_approve_negotiate_due_locator}             //td[@align and contains(text(), "Due")]
${txt_title_approve_negotiate_time_penalty_locator}    //td[@align and contains(text(), "Times of penalty")]
${txt_title_approve_negotiate_req_time_locator}        //td[@align and contains(text(), "Request times")]
${txt_title_approve_negotiate_last_req_no_locator}     //td[@align and contains(text(), "Last request No")]


# 1. Negotiate discount detail
${txt_title_approve_negotiate_total_term_locator}         //td[@align and contains(text(), "Total term")]
${txt_title_approve_negotiate_total_paid_amut_locator}    //td[@align and contains(text(), "Total paid amount")]
${txt_title_approve_negotiate_first_due_date_locator}     //td[@align and contains(text(), "First due date")]
${txt_title_approve_negotiate_start_cal_date_locator}     //td[@align and contains(text(), "Start Cal. date")]


# 3. Request detail
${txt_title_approve_negotiate_last_cont_3_party_locator}    //td[@align and contains(text(), "Last contact third party")]
${txt_title_approve_negotiate_last_cont_cust_locator}       //td[@align and contains(text(), "Last contact customer")]
${txt_title_approve_negotiate_have_job_locator}             //td[@align and contains(text(), "Have job")]
${txt_title_approve_negotiate_who_req_locator}              //td[@align and contains(text(), "Who request")]
${txt_title_approve_negotiate_disc_campaign_locator}        //td[@align and contains(text(), "Discount campaign")]
${txt_title_approve_negotiate_who_paid_locator}             //td[@align and contains(text(), "Who paid")]
${txt_title_approve_negotiate_source_fund_locator}          //td[@align and contains(text(), "Source of Fund")]
${txt_title_approve_negotiate_reason_locator}               //table[@id="Table1"]/tbody/tr[32]/td[1]    # Reason
${txt_title_approve_negotiate_reason_note_locator}          //td[@align and contains(text(), "Reason Note")]
${txt_title_approve_negotiate_send_to_locator}              //span[@id="ctl00_phContents_ASPxRoundPanel1_L_send_to"]
${txt_title_approve_negotiate_rej_reason_locator}           //td[@align and contains(text(), "Reject Reason")]
${txt_title_approve_negotiate_rej_note_locator}             //table[@id="Table1"]/tbody/tr[39]/td[1]    # Reject Note
${txt_title_approve_negotiate_note_locator}                 //table[@id="Table1"]/tbody/tr[41]/td[1]    # Note


# Verify Vaule
${input_value_approve_negotiate_totals_term_locator}              //input[@id="ctl00_phContents_ASPxRoundPanel1_E_tot_term"]
${input_value_approve_negotiate_totals_paid_amt_locator}          //input[@id="ctl00_phContents_ASPxRoundPanel1_E_tot_paid_amt"]
${input_value_approve_negotiate_first_due_locator}                //input[@id="ctl00_phContents_ASPxRoundPanel1_E_first_due"]
${input_value_approve_negotiate_start_cal_date_locator}           //input[@id="ctl00_phContents_ASPxRoundPanel1_TXT_Start_Cal_date"]
${input_value_approve_negotiate_have_job_check_y_locator}         //input[@id="ctl00_phContents_ASPxRoundPanel1_rdbtlHaveJob_0" and @checked="checked"]
${input_value_approve_negotiate_have_job_check_n_locator}         //input[@id="ctl00_phContents_ASPxRoundPanel1_rdbtlHaveJob_1" and @checked="checked"]
${dropdown_value_approve_negotiate_send_to_locator}               //select[@id="ctl00_phContents_ASPxRoundPanel1_D_send_to"]