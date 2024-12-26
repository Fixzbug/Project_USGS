*** Variables ***
# Select request type 
${sel_wo_ibs_request_type}        //select[@id='ctl00_phContents_ASPxRoundPanel1_D_request_type']
${lbl_wo_ibs_request_type}        //font[contains(text(),'Request Type')]
${lbl_wo_ibs_request_no}          //font[contains(text(),'Request No.')]
${lbl_wo_ibs_customer_id}         //font[contains(text(),'Customer ID')]
${lbl_wo_ibs_requester}           //font[contains(text(),'Requester')]
${lbl_wo_ibs_contract}            //font[contains(text(),'Contract')]

# Input data page inbox
${txt_wo_ib_request_no}           id=ctl00_phContents_ASPxRoundPanel1_E_request_no
${txt_wo_ib_requester}            id=ctl00_phContents_ASPxRoundPanel1_E_requester
${txt_wo_ib_customer_id}          id=ctl00_phContents_ASPxRoundPanel1_E_id
${txt_wo_ib_contract}             id=ctl00_phContents_ASPxRoundPanel1_E_contract

# Verify with replace
${txt_wo_th_replace}              //th[@scope="col" and contains(text(),'***replace***')]
${txt_wo_td_replace}              //td[contains(text(),'***replace***')]

# Click link
${action_wo_locator}              //a[contains(text(),'Action')]

# Approve Request Penalty
${lbl_wo_ib_request_type}         //td[contains(text(),'Request') and contains(text(),'Type')]
${lbl_wo_ib_customer_id}          //td[contains(text(),'Customer') and contains(text(),'ID')]
${lbl_wo_ib_customer_name}        //font[contains(text(),'Customer Name')]
${lbl_wo_ib_business}             //font[contains(text(),'Business')]
${lbl_wo_ib_contract_no}          //font[contains(text(),'Contract No')]
${lbl_wo_ib_request_no}           //font[contains(text(),'Request No.')]
${lbl_wo_ib_request_status}       //font[contains(text(),'Request Status')]
${lbl_wo_ib_status_date}          //font[contains(text(),'Status Date')]
${lbl_wo_ib_request_date}         //font[contains(text(),'Request Date')]
${lbl_wo_ib_requester}            //font[contains(text(),'Requester')]
${lbl_wo_ib_team}                 //font[contains(text(),'Team')]
${lbl_wo_ib_od_status}            //font[contains(text(),'OD Status')]
${lbl_wo_ib_total_os_balance}     //font[contains(text(),'Total O/S Balance')]
${lbl_wo_ib_closing_Amount}       //font[contains(text(),'Closing Amount')]
${lbl_wo_ib_waive_amount}         //font[contains(text(),'Waive Amount')]
${lbl_wo_ib_reason}               //font[contains(text(),'Reason')]
${lbl_wo_ib_reason_note}          //font[contains(text(),'Reason Note')]
${lbl_wo_ib_sendto}               //span[contains(text(),'Send To')]
${lbl_wo_ib_note}                 //font[contains(text(),'Note')]

${txt_wo_ib_request_type}         id=ctl00_phContents_ASPxRoundPanel1_D_request_type
${txt_wo_ib_customer_id}          id=ctl00_phContents_ASPxRoundPanel1_E_id
${txt_wo_ib_customer_name}        id=ctl00_phContents_ASPxRoundPanel1_E_name
${txt_wo_ib_business}             id=ctl00_phContents_ASPxRoundPanel1_D_biz
${txt_wo_ib_contract_no}          id=ctl00_phContents_ASPxRoundPanel1_E_cont_no
${txt_wo_ib_request_no}           id=ctl00_phContents_ASPxRoundPanel1_E_request_no 
${txt_wo_ib_request_status}       id=ctl00_phContents_ASPxRoundPanel1_E_request_sts
${txt_wo_ib_status_date}          id=ctl00_phContents_ASPxRoundPanel1_E_sts_date
${txt_wo_ib_request_date}         id=ctl00_phContents_ASPxRoundPanel1_E_request_date
${txt_wo_ib_requester}            id=ctl00_phContents_ASPxRoundPanel1_E_requester
${txt_wo_ib_team}                 id=ctl00_phContents_ASPxRoundPanel1_E_term
${txt_wo_ib_od_status}            id=ctl00_phContents_ASPxRoundPanel1_E_odterm
${txt_wo_ib_total_os_balance}     id=ctl00_phContents_ASPxRoundPanel1_E_tot_os_bal
${txt_wo_ib_closing_Amount}       id=ctl00_phContents_ASPxRoundPanel1_E_cls_amt
${txt_wo_ib_waive_amount}         id=ctl00_phContents_ASPxRoundPanel1_E_waive_amt
${txt_wo_ib_reason}               id=ctl00_phContents_ASPxRoundPanel1_D_reason
${txt_wo_ib_reason_note}          id=ctl00_phContents_ASPxRoundPanel1_E_reason_note
${txt_wo_ib_note}                 id=ctl00_phContents_ASPxRoundPanel1_E_note
${txt_wo_ib_sendto}               id=ctl00_phContents_ASPxRoundPanel1_D_send_to
