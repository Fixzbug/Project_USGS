*** Variables ***

# Inquiry and report
${lbl_menu_sidebar_inquiry_report_locator}          //li[@id='MenuHeader4']
${lbl_sup_menu_sidebar_inquiry_report_locator}      //ul[@class='nav child_menu']//a[text()='Inquiry & Report']

${txt_date_from_locator}                            //input[@id='txtDateFrom']
${txt_date_to_locator}                              //input[@id='txtDateTo']
${txt_contract_number_locator}                      //input[@id='txtContNo']
${txt_result_date_from_locator}                     //input[@id='txtResultDateFrom']
${txt_result_date_to_locator}                       //input[@id='txtResultDateTo']
${sel_request_type_locator}                         //div[@id='dd_reqtpy_code_chosen']
${txt_request_type_locator}                         //div[@id='dd_reqtpy_code_chosen']//input
${sel_request_status_locator}                       //div[@id='dd_reqsts_code_chosen']
${txt_request_status_locator}                       //div[@id='dd_reqsts_code_chosen']//input
${btn_preview_report_locator}                       //button[@id='btnPreviewReport']
${btn_print_preview_locator}                        //button[@id='btnPrintPreview']
${btn_reset_locator}                                //button[@id='btnReset']
${tbl_customer_data_inquiry_report_locator}         //table[@id='dgvCRTracking']//tbody//td
${txt_verify_no_data}                               //td[contains(.,'No data available in table')]


#verify table
${seq_locator}                     //th[contains(.,'Seq.')]
${customer_locator}                //th[contains(.,'Customer')]
${contract_no_locator}             //th[contains(.,'Contract No.')]
${req_no_locator}                  //th[contains(.,'Req. No.')]
${type_locator}                    //th[contains(.,'Type')]
${status_locator}                  //th[contains(.,'Status')]
${pending_code_locator}            //th[contains(.,'Pending Code')]
${req_date_time_locator}           //th[contains(.,'Req. Date-Time')]
${req_by_locator}                  //th[contains(.,'Req. By')]
${result_date_time_locator}        //th[contains(.,'Result Date-Time')]
${result_by_locator}               //th[contains(.,'Result By')]
${req_branch_locator}              //th[contains(.,'Req. Branch')]
${pending_day_locator}             //th[contains(.,'Pending Day')]
${result_by_interview_locator}     //th[contains(.,'Result By Interview')]
${result_by_kessai_locator}        //th[contains(.,'Result By Kessai')]
${old_rcl_locator}                 //th[contains(.,'Old RCL')]
${new_rcl_locator}                 //th[contains(.,'New RCL')]
${old_salary_locator}              //th[contains(.,'Old Salary')]
${new_salary_locator}              //th[contains(.,'New Salary')]
