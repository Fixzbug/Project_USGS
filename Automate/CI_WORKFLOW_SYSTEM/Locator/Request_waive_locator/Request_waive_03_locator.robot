
*** Variables ***
# iframe
${iframe_loss_locator}                  //iframe[@id='myiframeid']

# Select request
${sel_loss_request_type_locator}        //select[@id='ctl00_phContents_ASPxRoundPanel1_D_request_type']

# Request
${lbl_loss_id_card}                     //font[contains(text(),'ID Card')]
${req_loss_id_card}                     id=ctl00_phContents_ASPxRoundPanel1_E_id
${lbl_loss_req_business}                //font[contains(text(),'Business')]
${sel_req_loss_business}                //select[@id='ctl00_phContents_ASPxRoundPanel1_D_biz']
${lbl_loss_contract_no}                 //font[contains(text(),'Contract')]    # contact no
${req_loss_contract_no}                 id=ctl00_phContents_ASPxRoundPanel1_E_cont_no

# Request Verify
${test_loop}                            //font[contains(text(),'***relace***')]
${txt_replace}                          //*[contains(text(),'***replace***')]
${lbl_verify_header}                    //span[contains(text(),'***relace***')]
${lbl_loss_request_type}                //td[contains(text(),'Request') and contains(text(),'Type')]
${lbl_loss_customer_id}                 //td[contains(text(),'Customer') and contains(text(),'ID')]
${lbl_loss_customer_name}               //font[contains(text(),'Customer Name')]
${lbl_loss_business}                    //font[contains(text(),'Business')]
${lbl_loss_request_no}                  //font[contains(text(),'Request') and contains(text(),'No.')]
${lbl_loss_request_date}                //font[contains(text(),'Request') and contains(text(),'Date')]
${lbl_loss_requester}                   //font[contains(text(),'Requester')]
${lbl_loss_team}                        //font[contains(text(),'Team')]
${lbl_loss_od_status}                   //font[contains(text(),'OD') and contains(text(),'Status')]
${lbl_loss_total_os_balance}            //font[contains(text(),'Total') and contains(text(),'O/S Balance')]
${lbl_loss_closing_Amount}              //font[contains(text(),'Closing') and contains(text(),'Amount')]

${txt_loss_request_type}                id=ctl00_phContents_ASPxRoundPanel1_D_request_type
${txt_loss_customer_id}                 id=ctl00_phContents_ASPxRoundPanel1_E_id
${txt_loss_customer_name}               id=ctl00_phContents_ASPxRoundPanel1_E_name
${txt_loss_business}                    id=ctl00_phContents_ASPxRoundPanel1_D_biz
${txt_loss_request_no}                  id=ctl00_phContents_ASPxRoundPanel1_E_request_no    # Request No  
${txt_loss_contract_no}                 id=ctl00_phContents_ASPxRoundPanel1_E_cont_no   
${txt_loss_request_date}                id=ctl00_phContents_ASPxRoundPanel1_E_request_date
${txt_loss_requester}                   id=ctl00_phContents_ASPxRoundPanel1_E_requester
${txt_loss_team}                        id=ctl00_phContents_ASPxRoundPanel1_E_term
${txt_loss_od_status}                   id=ctl00_phContents_ASPxRoundPanel1_E_odterm
${txt_loss_total_os_balance}            id=ctl00_phContents_ASPxRoundPanel1_E_tot_os_bal
${txt_loss_closing_Amount}              id=ctl00_phContents_ASPxRoundPanel1_E_cls_amt

# Request page 2 input 
${lbl_req_loss_waive_amount}            //font[contains(text(),'Waive') and contains(text(),'Amount')]
${req_loss_waive_amount}                id=ctl00_phContents_ASPxRoundPanel1_E_waive_amt
${lbl_req_loss_reason}                  //font[contains(text(),'Reason')]
${sel_req_loss_reason}                  //select[@id='ctl00_phContents_ASPxRoundPanel1_D_reason']
${lbl_req_loss_send_to}                 //font[contains(text(),'Send') and contains(text(),'To')]
${sel_req_loss_send_to}                 //select[@id='ctl00_phContents_ASPxRoundPanel1_D_send_to']
${lbl_req_loss_reason_note}             //font[contains(text(),'Reason') and contains(text(),'Note')]
${req_loss_reason_note}                 id=ctl00_phContents_ASPxRoundPanel1_E_reason_note
${lbl_req_loss_note}                    //font[contains(text(),'Note')]
${req_loss_note}                        //textarea[@id='ctl00_phContents_ASPxRoundPanel1_E_note']


