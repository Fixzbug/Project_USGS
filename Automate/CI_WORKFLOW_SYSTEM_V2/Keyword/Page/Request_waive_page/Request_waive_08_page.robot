*** Settings ***
Resource    ${CURDIR}/../../../Import/Path_import.robot    # robotcode: ignore

*** Variables ***

# group data all
${group_data}
${keys_group_data}
${result_excel} 
${nextcase}

# request no
${result_request_no}

# write data
${Rows}
${point}
${count}

# date
${date_start_cal_date}
${date_paid_date}
# ${nextcase}    True

*** Keywords ***

SET FORMAT DATA TYPE 08 - WRITE
    [Arguments]    ${row}    ${start_at_case}    ${end_at_case}
    ${countrow}    BuiltIn.Set Variable If    ${end_at_case} <= ${data_count_row}    ${end_at_case}    ${data_count_row}
    
    ${count}    BuiltIn.Evaluate    0    # set count error start at zero
    BuiltIn.Set Global Variable    ${count} 

    FOR  ${index}  IN RANGE    ${start_at_case}    ${countrow} + 1  
        ${result_excel}    JSONLibrary.Get Value From Json    ${data_from_excel_by_sheet}    $[?(@.TC == '${row}_${index}')]
        ${group_data}    BuiltIn.Set Variable   ${result_excel}[0]
        BuiltIn.Set Global Variable    ${group_data}

        ${Request_No}    BuiltIn.Set Variable    '${group_data}[${keys_group_data_label}[5]]'    #'${group_data}[Request No.]'     # get case   สำหรับเช็ค  
        ${State}    BuiltIn.Set Variable    '${group_data}[${keys_group_data_label}[106]]'         #'${group_data}[State]'           # get case   สำหรับเช็ค 


        IF  ${Request_No} == 'none' and ${State} == 'none'                                   # none, none -> make
                            
            ${Rows}    BuiltIn.Evaluate    ${index} + 2                                      # +2 because add title at row 2 
            BuiltIn.Set Global Variable    ${Rows}   
            BuiltIn.Log    ----------------------------------------    WARN 
            BuiltIn.Log    CONATRACT->ROW->${Rows}:${row}_${index}    WARN
            BuiltIn.Log    ----------------------------------------    WARN
        
            # input Contract no, ID card, business click approve
            Request_waive_08_feature.SET FEATURE - INPUT REQUEST - PAGE REQUEST WAIVE [08 : NEGOTIATION SPECIAL DISCOUNT (LG)]    # input idcard,biz,contract    [capture]

            ${status_error}    BuiltIn.Run Keyword And Return Status    Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${txt_error}    5s
            IF  '${status_error}' == 'True'
                ${error_msg}    SeleniumLibrary.Get Text    ${txt_error}    
                ${nextcase}    BuiltIn.Set Variable    False
                BuiltIn.Set Global Variable    ${nextcase}   
                Common_feature.SET - DATA TO EXCEL    ${Excel_name}    ${type_08}    ${Rows}    6    FAIL
                Common_feature.SET - DATA TO EXCEL    ${Excel_name}    ${type_08}    ${Rows}    107    FAIL
                BuiltIn.fail    !!!!!!!!!!!!! ${error_msg} !!!!!!!!!!!!! 
                Common_keyword.CLOSE ALL BROWSERS TEARDOWN 
            ELSE

                # Write data cc, age, team, cont type, cont date, wo date, cont status,  due, time penalty, req time, last req no, min install
                BuiltIn.Run Keyword And Ignore Error    SeleniumLibrary.Wait Until Element Is Visible    ${txt_value_08_nsd_call_center_locator}    30s

                # Get data
                ${value_call_center}        SeleniumLibrary.Get Value     ${txt_value_08_nsd_call_center_locator}
                ${value_age}                SeleniumLibrary.Get Value     ${txt_value_08_nsd_age_locator}
                ${value_team}               SeleniumLibrary.Get Value     ${txt_value_08_nsd_team_locator}
                ${value_od_status}          SeleniumLibrary.Get Value     ${txt_value_08_nsd_od_status_locator}
                ${value_contract_type}      SeleniumLibrary.Get Value     ${txt_value_08_nsd_contract_type_locator}
                ${value_contract_date}      SeleniumLibrary.Get Value     ${txt_value_08_nsd_contract_date_locator}
                ${value_wo_date}            SeleniumLibrary.Get Value     ${txt_value_08_nsd_wo_date_locator}
                ${value_contract_status}    SeleniumLibrary.Get Text      ${txt_value_08_nsd_contract_status_locator}
                ${value_time_of_payment}    SeleniumLibrary.Get Value     ${txt_value_08_nsd_time_of_payment_locator}
                ${value_due}                SeleniumLibrary.Get Value     ${txt_value_08_nsd_due_locator}
                ${value_time_of_penalty}    SeleniumLibrary.Get Value     ${txt_value_08_nsd_time_of_penalty_locator}
                ${value_req_time}           SeleniumLibrary.Get Value     ${txt_value_08_nsd_req_time_locator}
                ${value_last_req_no}        SeleniumLibrary.Get Text      ${txt_value_08_nsd_last_req_no_locator}
                ${value_min_install}        SeleniumLibrary.Get Value     ${txt_value_08_nsd_min_install_locator}


                # If the data is empty change the data to be none
                ${value_call_center}            BuiltIn.Set Variable If      '${value_call_center}' == '${EMPTY}'              none        ${value_call_center}
                ${value_age}                    BuiltIn.Set Variable If      '${value_age}' == '${EMPTY}'                      none        ${value_age}
                ${value_team}                   BuiltIn.Set Variable If      '${value_team}' == '${EMPTY}'                     none        ${value_team}
                ${value_od_status}              BuiltIn.Set Variable If      '${value_od_status}' == '${EMPTY}'                none        ${value_od_status}
                ${value_contract_type}          BuiltIn.Set Variable If      '${value_contract_type}' == '${EMPTY}'            none        ${value_contract_type}
                ${value_contract_date}          BuiltIn.Set Variable If      '${value_contract_date}' == '${EMPTY}'            none        ${value_contract_date}
                ${value_wo_date}                BuiltIn.Set Variable If      '${value_wo_date}' == '${EMPTY}'                  none        ${value_wo_date}
                ${value_contract_status}        BuiltIn.Set Variable If      '${value_contract_status}' == '${EMPTY}'          none        ${value_contract_status}
                ${value_time_of_payment}        BuiltIn.Set Variable If      '${value_time_of_payment}' == '${EMPTY}'          none        ${value_time_of_payment}
                ${value_due}                    BuiltIn.Set Variable If      '${value_due}' == '${EMPTY}'                      none        ${value_due}
                ${value_time_of_penalty}        BuiltIn.Set Variable If      '${value_time_of_penalty}' == '${EMPTY}'          none        ${value_time_of_penalty}
                ${value_req_time}               BuiltIn.Set Variable If      '${value_req_time}' == '${EMPTY}'                 none        ${value_req_time}
                ${value_last_req_no}            BuiltIn.Set Variable If      '${value_last_req_no}' == '${EMPTY}'              none        ${value_last_req_no}
                ${value_min_install}            BuiltIn.Set Variable If      '${value_min_install}' == '${EMPTY}'              none        ${value_min_install}
            

                BuiltIn.Log    Call Center: ${value_call_center}             WARN
                BuiltIn.Log    Age: ${value_age}                             WARN
                BuiltIn.Log    Team: ${value_team}                           WARN
                BuiltIn.Log    OD Status: ${value_od_status}                 WARN
                BuiltIn.Log    Contract Type: ${value_contract_type}         WARN
                BuiltIn.Log    Contract Date: ${value_contract_date}         WARN
                BuiltIn.Log    WO Date: ${value_wo_date}                     WARN
                BuiltIn.Log    Contract Status: ${value_contract_status}     WARN
                BuiltIn.Log    Time of payment: ${value_time_of_payment}     WARN
                BuiltIn.Log    Due: ${value_due}                             WARN
                BuiltIn.Log    Times of penalty: ${value_time_of_penalty}    WARN
                BuiltIn.Log    Request times: ${value_req_time}              WARN
                BuiltIn.Log    Last request No: ${value_last_req_no}         WARN
                BuiltIn.Log    Minimum/Install: ${value_min_install}         WARN


                # Write data if get text not equal none
                IF  '${value_call_center}' != 'none'
                    Common_feature.SET - DATA TO EXCEL    ${Excel_name}    ${type_08}    ${Rows}    10    ${value_call_center}            # Call Center
                    Common_feature.SET - DATA TO EXCEL    ${Excel_name}    ${type_08}    ${Rows}    11    ${value_age}                    # Age
                    Common_feature.SET - DATA TO EXCEL    ${Excel_name}    ${type_08}    ${Rows}    12    ${value_team}                   # Team
                    Common_feature.SET - DATA TO EXCEL    ${Excel_name}    ${type_08}    ${Rows}    15    ${value_od_status}              # OD Status
                    Common_feature.SET - DATA TO EXCEL    ${Excel_name}    ${type_08}    ${Rows}    17    ${value_contract_type}          # Contract Type
                    Common_feature.SET - DATA TO EXCEL    ${Excel_name}    ${type_08}    ${Rows}    19    ${value_contract_date}          # Contract Date
                    Common_feature.SET - DATA TO EXCEL    ${Excel_name}    ${type_08}    ${Rows}    20    ${value_wo_date}                # WO Date
                    Common_feature.SET - DATA TO EXCEL    ${Excel_name}    ${type_08}    ${Rows}    21    ${value_contract_status}        # Contract Status
                    Common_feature.SET - DATA TO EXCEL    ${Excel_name}    ${type_08}    ${Rows}    22    ${value_time_of_payment}        # Time of payment
                    Common_feature.SET - DATA TO EXCEL    ${Excel_name}    ${type_08}    ${Rows}    23    ${value_due}                    # Due
                    Common_feature.SET - DATA TO EXCEL    ${Excel_name}    ${type_08}    ${Rows}    24    ${value_time_of_penalty}        # Times of penalty
                    Common_feature.SET - DATA TO EXCEL    ${Excel_name}    ${type_08}    ${Rows}    25    ${value_req_time}               # Request times
                    Common_feature.SET - DATA TO EXCEL    ${Excel_name}    ${type_08}    ${Rows}    26    ${value_last_req_no}            # Last request No
                    Common_feature.SET - DATA TO EXCEL    ${Excel_name}    ${type_08}    ${Rows}    27    ${value_min_install}            # Minimum/Install
                    ${nextcase}    BuiltIn.Set Variable    True
                    BuiltIn.Set Global Variable    ${nextcase}
                ELSE
                    ${nextcase}    BuiltIn.Set Variable    False
                    BuiltIn.Set Global Variable    ${nextcase}
                    Common_feature.SET - DATA TO EXCEL    ${Excel_name}    ${type_08}    ${Rows}    6    FAIL
                    Common_feature.SET - DATA TO EXCEL    ${Excel_name}    ${type_08}    ${Rows}    107    FAIL
                    BuiltIn.fail    !!!!!!!!!!!!! error some get value !!!!!!!!!!!!! 
                    Common_keyword.CLOSE ALL BROWSERS TEARDOWN 
                END
            END

            BuiltIn.Exit For Loop
         
        END

    END
    
SET FORMAT DATA TYPE 08 - USING
    [Arguments]    ${row}    ${start_at_case}    ${end_at_case}    ${user_level}
    ${countrow}    BuiltIn.Set Variable If    ${end_at_case} <= ${data_count_row}    ${end_at_case}    ${data_count_row}
    
    ${count}    BuiltIn.Evaluate    0    # set count error start at zero
    BuiltIn.Set Global Variable    ${count} 

    FOR    ${index}    IN RANGE    ${start_at_case}    ${countrow} + 1  
        ${result_excel}    JSONLibrary.Get Value From Json    ${data_from_excel_by_sheet}    $[?(@.TC == '${row}_${index}')]
        ${group_data}    BuiltIn.Set Variable   ${result_excel}[0]
        BuiltIn.Set Global Variable    ${group_data}

        ${Request_No}    BuiltIn.Set Variable    '${group_data}[${keys_group_data_label}[5]]'    #'${group_data}[Request No.]'     # get case   สำหรับเช็ค  
        ${State}    BuiltIn.Set Variable    '${group_data}[${keys_group_data_label}[106]]'         #'${group_data}[State]'           # get case   สำหรับเช็ค 

        # IF  '${point}' == '0' and '${count}' == '3'    # case point = 0 mean error and counter fail 3 time just Break
        #     BuiltIn.Exit For Loop
        # ELSE IF  '${point}' == '1' and '${count}' == '1'    # case point = 1 mean pass and counter fix 1 time just Break
        #     BuiltIn.Exit For Loop
        # END

        IF  '${point}' == '0'    # case point = 0 mean error and counter fail 1 time just Break
            BuiltIn.Exit For Loop
        ELSE IF  '${point}' == '1' and '${count}' == '1'    # case point = 1 mean pass and counter fix 1 time just Break
            BuiltIn.Exit For Loop
        END

        IF  ${Request_No} == 'none' and ${State} == 'none' and '${count}' <= '3'             # none, none -> make
                            
            ${Rows}    BuiltIn.Evaluate    ${index} + 2                                      # +2 because add title at row 2 
            BuiltIn.Set Global Variable    ${Rows}   
            BuiltIn.Log    ----------------------------------------    WARN 
            BuiltIn.Log    CONATRACT ->ROW->${Rows}:${row}_${index}    WARN
            BuiltIn.Log    ----------------------------------------    WARN

            # input Contract no, ID card, business click approve
            Request_waive_08_feature.SET FEATURE - INPUT REQUEST - PAGE REQUEST WAIVE [08 : NEGOTIATION SPECIAL DISCOUNT (LG)]    # input idcard,biz,contract    [capture]

            Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${txt_ib_request_date}    50s
            ${request_date}    SeleniumLibrary.Get Value    ${txt_ib_request_date}
            BuiltIn.Log    >Request Date From Web>${request_date}    WARN

            ${date_current}    Common_keyword.GET DATE IN FORMATTED DATE TIME

            IF  '${request_date}' == '${date_current}'
                # ถ้าวันที่ ปัจุบันบนเครื่อง jenkins ตรงกับ request date ให้เอาวันที่ ${date_current} ไปเล่น
                ${date_start_cal_date}    BuiltIn.Set Variable    ${date_current}
                BuiltIn.Set Global Variable    ${date_start_cal_date}    

                # ${date_paid_date}    Common_keyword.GET DATE IN FORMATTED DATE TIME PLUS    # + 1 สำหรับเล่นวันถัดไป
                # BuiltIn.Set Global Variable    ${date_paid_date}    

                ${date_paid_date}    BuiltIn.Set Variable    ${date_current}    # ใช้วันปัจุบันบนเครื่องเลย
                BuiltIn.Set Global Variable    ${date_paid_date}

            ELSE IF  '${request_date}' != '${date_current}'
                # ถ้าวันที่ ปัจุบันบนเครื่อง jenkins ไม่ตรงกับ request date ให้เอาวันที่ ${request_date} ไปเล่น
                ${date_start_cal_date}    BuiltIn.Set Variable    ${request_date}
                BuiltIn.Set Global Variable    ${date_start_cal_date}    

                # ${date_paid_date}    Common_keyword.CONVERT GET DATE IN FORMATTED DATE TIME PLUS    ${request_date}     # + 1 สำหรับเล่นวันถัดไป
                # BuiltIn.Set Global Variable    ${date_paid_date} 

                ${date_paid_date}    BuiltIn.Set Variable    ${request_date}    # ใช้วันปัจุบันบนเว็บเลย
                BuiltIn.Set Global Variable    ${date_paid_date}

            ELSE
                BuiltIn.fail    !!!!!!!!!!!!! ERROR DATE !!!!!!!!!!!!!  
            END

            # 08 : Negotiation Special Discount (LG) - page
            Request_waive_08_feature.SET FEATURE - INPUT DATA - PAGE REQUEST WAIVE [08 : NEGOTIATION SPECIAL DISCOUNT (LG)]    # input num child,last salary,cust status
            # Request_waive_08_feature.VERIFY FEATURE - DATA TITLE - PAGE REQUEST WAIVE [08 : NEGOTIATION SPECIAL DISCOUNT (LG)]    # verify title 08
            Request_waive_08_feature.VERIFY FEATURE - DATA VALUE - PAGE REQUEST WAIVE [08 : NEGOTIATION SPECIAL DISCOUNT (LG)]    # verify value 08
            # Request_waive_08_feature.VERIFY FEATURE - DATA TITLE - PAGE REQUEST WAIVE [NEGOTIATE DETAIL] - [1. ENTRY NEGOTIATE DISCOUNT DETAIL] - [TYPE: 08]    # verify title 08 - 1
            Request_waive_08_feature.SET FEATURE - INPUT DATA - PAGE REQUEST WAIVE [NEGOTIATE DETAIL] - [1. ENTRY NEGOTIATE DISCOUNT DETAIL] - [TYPE: 08]    # input data 08 - 1
      
            # wait value dis play makesure
            ${status_submit}    BuiltIn.Run Keyword And Return Status    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE    ${btn_submit_locator}    15s
            BuiltIn.Log    >Submit Status>${status_submit}    WARN
            IF  ${status_submit}
                ${status_error}    BuiltIn.Run Keyword And Return Status    Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${txt_req_error}    20s
                BuiltIn.Log    >Status Error msg>${status_error}    WARN
                IF  '${status_error}' == 'True'
                    ${error_msg}    SeleniumLibrary.Get Text    ${txt_req_error}    
                    ${nextcase}    BuiltIn.Set Variable    False
                    BuiltIn.Set Global Variable    ${nextcase} 
                    BuiltIn.Log    ${nextcase}    WARN 
                    Common_feature.SET - DATA TO EXCEL    ${Excel_name}    ${type_08}    ${Rows}    6    FAIL
                    Common_feature.SET - DATA TO EXCEL    ${Excel_name}    ${type_08}    ${Rows}    107    FAIL
                    BuiltIn.fail    !!!!!!!!!!!!! ${error_msg} !!!!!!!!!!!!!  
                ELSE
                    
                    # wait value dis play makesure
                    ${is_disabled}    Common_keyword.WAIT FOR BUTTON TO BE DISABLED    ${btn_06_nd_submit_locator}    30s
                    BuiltIn.Log    Display(LG SCREEN)->${is_disabled}    WARN

                    ${data}    Common_keyword.GET VALUE ELEMENT BY LOCATOR AND RETURN    ${txt_value_lgscreen_judgement_date_locator}    30s          
                    BuiltIn.Log To Console    '\nLast Value Table LG Screen->${data}

                    IF  '${is_disabled}' == 'True' and '${data}' != 'none'

                        # LG Screen 
                        Request_waive_08_feature.PAGE REQUEST WAIVE - [GET-TEXT] - [VALUE] - LG SCREEN    
                        # Request_waive_08_feature.VERIFY FEATURE - DATA TITLE - PAGE REQUEST WAIVE [LG SCREEN] - [1.1 DETAIL OF COMPROMISED ADJUDICATE RESULT]    # verify title 08 - LG Screen 1.1
                        # Request_waive_08_feature.VERIFY FEATURE - DATA TITLE - PAGE REQUEST WAIVE [LG SCREEN] - [1.2 PAYMENT HISTORY]    # verify title 08 - LG Screen 1.2
                        # Request_waive_08_feature.VERIFY FEATURE - DATA TITLE - PAGE REQUEST WAIVE [LG SCREEN] - [1.3 DISCOUNT DETAIL]    # verify title 08 - LG Screen 1.3
                        # Request_waive_08_feature.VERIFY FEATURE - DATA TITLE - PAGE REQUEST WAIVE [LG SCREEN] - [1.4 PROFIT DETAIL (AUTO CAL.)]    # verify title 08 - LG Screen 1.4
                        
                        # 2
                        # Request_waive_08_feature.VERIFY FEATURE - DATA TITLE - PAGE REQUEST WAIVE [NEGOTIATE DETAIL] - [2. ENTRY DETAIL BY TERM#, TIME#] - [TYPE: 08]    # verify title 08 - 2
                        Request_waive_08_feature.SET FEATURE - INPUT DATA - PAGE REQUEST WAIVE [NEGOTIATE DETAIL] - [2. ENTRY DETAIL BY TERM#, TIME#] - [TYPE: 08]    # input data 08 - 2
                        # Request_waive_08_feature.VERIFY FEATURE - DATA TITLE TABLE - PAGE REQUEST WAIVE [NEGOTIATE DETAIL] - [2. ENTRY DETAIL BY TERM#, TIME#] - [TYPE: 08]    # verify title table 08 - 2
                        Request_waive_08_feature.VERIFY FEATURE - DATA VALUE TABLE - PAGE REQUEST WAIVE [NEGOTIATE DETAIL] - [2. ENTRY DETAIL BY TERM#, TIME#] - [TYPE: 08]    # verify value table 08 - 2
                        
                        # 3 skip no check
                        # Request_waive_08_feature.VERIFY FEATURE - DATA TITLE - PAGE REQUEST WAIVE [NEGOTIATE DETAIL] - [3.1 ENTRY OTHER D    EBT] - [TYPE: 08]    # verify title 08 - 3.1
                        # Request_waive_08_feature.SET FEATURE - INPUT DATA - PAGE REQUEST WAIVE [NEGOTIATE DETAIL] - [3.1 ENTRY OTHER DEBT] - [TYPE: 08]    # input data 08 - 3.1
                        # Request_waive_08_feature.VERIFY FEATURE - DATA TITLE TABLE - PAGE REQUEST WAIVE [NEGOTIATE DETAIL] - [3.1 ENTRY OTHER DEBT] - [TYPE: 08]    # verify title table 08 - 3.1 
                        # Request_waive_08_feature.VERIFY FEATURE - DATA VALUE TABLE - PAGE REQUEST WAIVE [NEGOTIATE DETAIL] - [3.1 ENTRY OTHER DEBT] - [TYPE: 08]    # verify value table 08 - 3.1

                        # Request_waive_08_feature.VERIFY FEATURE - DATA TITLE - PAGE REQUEST WAIVE [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER] - [TYPE: 08]    # verify title 08 - 3.2 
                        Request_waive_08_feature.SET FEATURE - INPUT DATA - PAGE REQUEST WAIVE [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER] - [TYPE: 08]    # input data 08 - 3.2
                        Request_waive_08_feature.SET FEATURE - TYPE - 08 - VERIFY - SEND TO - PAGE REQUEST WAIVE    user_level=1    # Send to User_1 = P2510033
                        
                        # กด approve
                        Request_waive_08_feature.SET FEATURE - TYPE - 08 - CLICK - APPROVE - PAGE REQUEST WAIVE    

                        # verify pop up
                        Request_waive_08_feature.SET FEATURE - TYPE - 08 - VERIFY - APPROVE POPUP - PAGE REQUEST WAIVE    

                        # verify pop up
                        Request_waive_08_feature.SET FEATURE - TYPE - 08 - CLICK - APPROVE POPUP - CLICK OK - PAGE REQUEST WAIVE  

                        # get data at current page request no
                        Request_waive_08_feature.SET FEATURE - TYPE - 08 - SAVE DATA - REQUSET NO - PAGE REQUEST WAIVE 

                        # wait for check excel write
                        Request_waive_08_feature.SET FEATURE - TYPE - 08 - SAVE DATA TO EXCEL - BY STATE

                        ${nextcase}    BuiltIn.Set Variable    True
                        BuiltIn.Set Global Variable    ${nextcase}   
                    ELSE
                        ${nextcase}    BuiltIn.Set Variable    False
                        BuiltIn.Set Global Variable    ${nextcase}   
                    END
                END
            END 
        END
    END


# add new
PAGE REQUEST WAIVE - TYPE 08 - OPEN INRANET
    IF  '${nextcase}' == 'True'
        Common_keyword.OPEN INTRANET
        Common_keyword.CLICK SSO ICON
    END
   

# add new
PAGE REQUEST WAIVE - TYPE 08 - INPUT USENAME AND PASSWORD BY USER LEVEL
    [Arguments]    ${user_level}

    IF  '${user_level}' == '0'         # user approve user0 
        PAGE REQUEST WAIVE - TYPE 08 - SETTING LOGIN    WORKFLOW    ${group_user}[${keys_group_user}[3]]    ${group_user}[${keys_group_user}[4]]    ${user_level}    # 0 row,col -> 3,4 -> P2503064
    ELSE IF  '${user_level}' == '1'    # user approve user1 
        PAGE REQUEST WAIVE - TYPE 08 - SETTING LOGIN    WORKFLOW    ${group_user}[${keys_group_user}[5]]    ${group_user}[${keys_group_user}[6]]    ${user_level}    # 1 row,col -> 5,6 -> P2510033
    ELSE IF  '${user_level}' == '2'    # user approve user2
        PAGE REQUEST WAIVE - TYPE 08 - SETTING LOGIN    WORKFLOW    ${group_user}[${keys_group_user}[7]]    ${group_user}[${keys_group_user}[8]]    ${user_level}     # 2 row,col -> 7,8  -> P2503067
    ELSE IF  '${user_level}' == '3'    # user approve user3
        PAGE REQUEST WAIVE - TYPE 08 - SETTING LOGIN    WORKFLOW    ${group_user}[${keys_group_user}[9]]    ${group_user}[${keys_group_user}[10]]    ${user_level}     # 3 row,col -> 9,10 -> P2106010 
    ELSE IF  '${user_level}' == '4'    # user approve user4
        PAGE REQUEST WAIVE - TYPE 08 - SETTING LOGIN    WORKFLOW    ${group_user}[${keys_group_user}[11]]    ${group_user}[${keys_group_user}[12]]    ${user_level}     # 4 row,col -> 11,12 -> KIMURA
    END

# add new
PAGE REQUEST WAIVE - TYPE 08 - SETTING LOGIN
    [Arguments]    ${system_name}    ${username}    ${password}    ${user_level}

    [Timeout]    180s
        # หน้า login #User Authentication
        #Verify
        SeleniumLibrary.Wait Until Element Is Visible    ${verify_header_locator}    timeout=60s    # User Authentication
        
        # Username
        SeleniumLibrary.Wait Until Element Is Visible    ${sso_username_text_area}
        SeleniumLibrary.Input Text    ${sso_username_text_area}   ${username}
        # Password
        SeleniumLibrary.Wait Until Element Is Visible    ${SSO_Password_text_area}
        SeleniumLibrary.Input Password    ${sso_password_text_area}    ${password}  
            
        # Click login button
        Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    ${system_name}    LOGIN - USER LEVEL - ${user_level} USER - ${username}
        SeleniumLibrary.Wait Until Element Is Visible    ${btn_login_on_user_authentication}
        SeleniumLibrary.Click Button    ${btn_login_on_user_authentication}


PAGE REQUEST WAIVE - TYPE 08 - [CLICK] - LINK 
    ${link_system}    Common_keyword.REPLACE BY DATA EXCEL AND RETURN LOCATOR DATA GRID    ${link_system}    ${group_user}[${keys_group_user}[2]]   
    Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${link_system}     
    Common_keyword.CLICK ELEMENT BY LOCATOR    ${link_system}   

# wait update page 
PAGE REQUEST WAIVE - TYPE 08 - [WAIT] - [VERIFY] PAGE
    Common_keyword.WAITING FOR DATA UPDATE    1s    

PAGE REQUEST WAIVE - TYPE 08 - [CLICK] - [MENU]
    [Arguments]    ${menu} 
    ${locator_menu}    Common_keyword.REPLACE BY DATA EXCEL AND RETURN LOCATOR DATA GRID    ${menu_locator}    ${menu}
    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE    ${locator_menu}

PAGE REQUEST WAIVE - TYPE 08 - [CLICK] - [SUB MENU]
    [Arguments]    ${sub_menu} 
    ${locator_menu}    Common_keyword.REPLACE BY DATA EXCEL AND RETURN LOCATOR DATA GRID    ${sub_menu_locator}    ${sub_menu}
    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE    ${locator_menu}

# เลือก iframe
PAGE REQUEST WAIVE - TYPE 08 - [SELCET] - [FRAME] IFRAME
    Common_keyword.SELECT IFRAME    ${iframe_wo_locator}

# เลือก iframe
PAGE REQUEST WAIVE - TYPE 08 - [UNSELCET] - [FRAME] UNIFRAME
    Common_keyword.UNSELECT IFRAME   


# Dropdown Request Waive
PAGE REQUEST WAIVE - [CLICK] - [MENU] - [WORK PROCESS]
    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE    ${lbl_menu_dropdown_locator}


PAGE REQUEST WAIVE - [CLICK] - [SUB MENU] - [REQUEST WAIVE]
    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE    ${lbl_sub_menu_req_waive_dropdown_locator}


PAGE REQUEST WAIVE - [CLICK] - [SUB MENU] - [INBOX]
    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE    ${lbl_sub_menu_inbox_dropdown_locator}


PAGE REQUEST WAIVE - [CLICK] - [MENU] - [INQUIRY]
    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE    ${lbl_menu_dropdown_inquiry_locator}

    
PAGE REQUEST WAIVE - [CLICK] - [SUB MENU] - [INQUIRY REQUEST]
    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE    ${lbl_sub_dropdown_inquiry_req_locator}


### 08 : Negotiation Special Discount (LG) ###
PAGE REQUEST WAIVE - [CLICK] - [BUTTON] - APPROVE
    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE    ${btn_req_waive_approve_locator}    15


# Select - 08 : Negotiation Special Discount (LG)
PAGE REQUEST WAIVE - [CLICK] - [DROPDOWN] - [08 : NEGOTIATION SPECIAL DISCOUNT (LG)]
    Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${ifrmae_req_waive_locator}    60
    SeleniumLibrary.Select Frame     ${ifrmae_req_waive_locator}
    SeleniumLibrary.Select From List By Label   ${dropdown_req_waive_select_req_type_locator}     ${group_user}[${keys_group_user}[1]]


# Request Waive - Step input id, business and contract no
PAGE REQUEST WAIVE - [INPUT] - ID CARD [08 : NEGOTIATION SPECIAL DISCOUNT (LG)]
    Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE    ${input_req_waive_id_card_locator}    ${group_data}[${group_data_label}[${keys_group_data_label}[2]]]    150


PAGE REQUEST WAIVE - [INPUT] - CONTRACT NO [08 : NEGOTIATION SPECIAL DISCOUNT (LG)]
    Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE    ${input_req_waive_contract_no_locator}    ${group_data}[${group_data_label}[${keys_group_data_label}[4]]]    15


PAGE REQUEST WAIVE - [DROPDOWN] - BUSINESS [08 : NEGOTIATION SPECIAL DISCOUNT (LG)]
    Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${dropdown_req_waive_biz_locator}
    SeleniumLibrary.Select From List By Label   ${dropdown_req_waive_biz_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[3]]]



# Input data form 08 : Negotiation Special Discount (LG)
PAGE REQUEST WAIVE - [INPUT] - NUMBER OF CHILD [08 : NEGOTIATION SPECIAL DISCOUNT (LG)]
    Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE    ${input_08_nsd_num_of_child_locator}    ${group_data}[${group_data_label}[${keys_group_data_label}[12]]]


PAGE REQUEST WAIVE - [INPUT] - LAST SALARY [08 : NEGOTIATION SPECIAL DISCOUNT (LG)]
    Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE    ${input_08_nsd_last_salary_locator}    ${group_data}[${group_data_label}[${keys_group_data_label}[15]]]


PAGE REQUEST WAIVE - [CLICK] - [DROPDOWN] - CUSTOMER STATUS [08 : NEGOTIATION SPECIAL DISCOUNT (LG)]
    Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${dropdown_08_nsd_cust_status_locator}
    SeleniumLibrary.Select From List By Label   ${dropdown_08_nsd_cust_status_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[17]]]



# Verify Herder
PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - HERDER [08 : NEGOTIATION SPECIAL DISCOUNT (LG)]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_header_08_header_locator}    ${group_user}[${keys_group_user}[1]]


    
# Verify Title - 08 : Negotiation Special Discount (LG)
PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - REQUEST TYPE [08 : NEGOTIATION SPECIAL DISCOUNT (LG)]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_08_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[1]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - REQUEST NO. [08 : NEGOTIATION SPECIAL DISCOUNT (LG)]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_08_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[5]]
    

PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - REQUESTER [08 : NEGOTIATION SPECIAL DISCOUNT (LG)]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_08_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[6]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - REQUEST DATE [08 : NEGOTIATION SPECIAL DISCOUNT (LG)]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_08_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[7]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - CUSTOMER ID [08 : NEGOTIATION SPECIAL DISCOUNT (LG)]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_08_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[2]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - CUSTOMER NO [08 : NEGOTIATION SPECIAL DISCOUNT (LG)]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_08_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[4]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - CUSTOMER NAME [08 : NEGOTIATION SPECIAL DISCOUNT (LG)]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_08_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[8]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - CALL CENTER [08 : NEGOTIATION SPECIAL DISCOUNT (LG)]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_08_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[9]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - AGE [08 : NEGOTIATION SPECIAL DISCOUNT (LG)]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_08_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[10]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - TEAM [08 : NEGOTIATION SPECIAL DISCOUNT (LG)]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_08_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[11]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - NUMBER OF CHILD [08 : NEGOTIATION SPECIAL DISCOUNT (LG)]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_08_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[12]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - OD STATUS [08 : NEGOTIATION SPECIAL DISCOUNT (LG)]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_08_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[14]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - LAST SALARY [08 : NEGOTIATION SPECIAL DISCOUNT (LG)]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_08_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[15]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - CONTRACT TYPE [08 : NEGOTIATION SPECIAL DISCOUNT (LG)]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_08_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[16]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - CUSTOMER STATUS [08 : NEGOTIATION SPECIAL DISCOUNT (LG)]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_08_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[17]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - CONTRACT DATE [08 : NEGOTIATION SPECIAL DISCOUNT (LG)]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_08_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[18]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - BUSINESS [08 : NEGOTIATION SPECIAL DISCOUNT (LG)]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_08_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[3]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - WO DATE [08 : NEGOTIATION SPECIAL DISCOUNT (LG)]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_08_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[19]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - CONTRACT STATUS [08 : NEGOTIATION SPECIAL DISCOUNT (LG)]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_08_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[20]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - TIME OF PAYMENT [08 : NEGOTIATION SPECIAL DISCOUNT (LG)]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_08_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[21]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - DUE [08 : NEGOTIATION SPECIAL DISCOUNT (LG)]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_08_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[22]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - TIMES OF PENALTY [08 : NEGOTIATION SPECIAL DISCOUNT (LG)]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_08_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[23]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - REQUEST TIMES [08 : NEGOTIATION SPECIAL DISCOUNT (LG)]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_08_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[24]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - LAST REQUEST NO [08 : NEGOTIATION SPECIAL DISCOUNT (LG)]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_08_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[25]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - MINIMUM/INSTALL: [08 : NEGOTIATION SPECIAL DISCOUNT (LG)]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_08_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[26]]



# Verify Value - 08 : Negotiation Special Discount (LG)
PAGE REQUEST WAIVE - [VERIFY] - [VALUE] - REQUEST TYPE [08 : NEGOTIATION SPECIAL DISCOUNT (LG)]
    SeleniumLibrary.Unselect Frame
    SeleniumLibrary.Select Frame    ${ifrmae_req_waive_locator}
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL    ${txt_value_08_nsd_request_type_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[1]]]


PAGE REQUEST WAIVE - [VERIFY] - [VALUE] - REQUEST NO. [08 : NEGOTIATION SPECIAL DISCOUNT (LG)]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL    ${txt_value_08_nsd_request_no_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[5]]]
    

PAGE REQUEST WAIVE - [VERIFY] - [VALUE] - REQUESTER [08 : NEGOTIATION SPECIAL DISCOUNT (LG)]
    Common_keyword.GET TEXT BY ELEMENT ATTRIBUTE AND VERIFY DATA FROM EXCEL    ${txt_value_08_nsd_requester_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[6]]]    value


PAGE REQUEST WAIVE - [VERIFY] - [VALUE] - REQUEST DATE [08 : NEGOTIATION SPECIAL DISCOUNT (LG)]
    ${current_date_from_local}    common_keyword.GET DATE IN FORMATTED DATE TIME
    Common_keyword.GET TEXT BY ELEMENT ATTRIBUTE AND VERIFY DATA FROM EXCEL    ${txt_value_08_nsd_request_date_locator}     ${current_date_from_local}	value


PAGE REQUEST WAIVE - [VERIFY] - [VALUE] - CUSTOMER ID [08 : NEGOTIATION SPECIAL DISCOUNT (LG)]
    Common_keyword.GET TEXT BY ELEMENT ATTRIBUTE AND VERIFY DATA FROM EXCEL    ${txt_value_08_nsd_cust_id_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[2]]]    value


PAGE REQUEST WAIVE - [VERIFY] - [VALUE] - CONTRACT NO [08 : NEGOTIATION SPECIAL DISCOUNT (LG)]
    Common_keyword.GET TEXT BY ELEMENT ATTRIBUTE AND VERIFY DATA FROM EXCEL    ${txt_value_08_nsd_contract_no_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[4]]]    value


PAGE REQUEST WAIVE - [VERIFY] - [VALUE] - CUSTOMER NAME [08 : NEGOTIATION SPECIAL DISCOUNT (LG)]
    Common_keyword.GET TEXT BY ELEMENT ATTRIBUTE AND VERIFY DATA FROM EXCEL    ${txt_value_08_nsd_cust_name_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[8]]]    value
    

PAGE REQUEST WAIVE - [VERIFY] - [VALUE] - CALL CENTER [08 : NEGOTIATION SPECIAL DISCOUNT (LG)]
    Common_keyword.GET TEXT BY ELEMENT ATTRIBUTE AND VERIFY DATA FROM EXCEL    ${txt_value_08_nsd_call_center_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[9]]]    value


PAGE REQUEST WAIVE - [VERIFY] - [VALUE] - AGE [08 : NEGOTIATION SPECIAL DISCOUNT (LG)]
    Common_keyword.GET TEXT BY ELEMENT ATTRIBUTE AND VERIFY DATA FROM EXCEL    ${txt_value_08_nsd_age_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[10]]]    value


PAGE REQUEST WAIVE - [VERIFY] - [VALUE] - TEAM [08 : NEGOTIATION SPECIAL DISCOUNT (LG)]
    Common_keyword.GET TEXT BY ELEMENT ATTRIBUTE AND VERIFY DATA FROM EXCEL    ${txt_value_08_nsd_team_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[11]]]    value


PAGE REQUEST WAIVE - [VERIFY] - [VALUE] - OD STATUS [08 : NEGOTIATION SPECIAL DISCOUNT (LG)]
    Common_keyword.GET TEXT BY ELEMENT ATTRIBUTE AND VERIFY DATA FROM EXCEL    ${txt_value_08_nsd_od_status_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[14]]]    value


PAGE REQUEST WAIVE - [VERIFY] - [VALUE] - CONTRACT TYPE [08 : NEGOTIATION SPECIAL DISCOUNT (LG)]
    Common_keyword.GET TEXT BY ELEMENT ATTRIBUTE AND VERIFY DATA FROM EXCEL    ${txt_value_08_nsd_contract_type_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[16]]]    value


PAGE REQUEST WAIVE - [VERIFY] - [VALUE] - CONTRACT DATE [08 : NEGOTIATION SPECIAL DISCOUNT (LG)]
    Common_keyword.GET TEXT BY ELEMENT ATTRIBUTE AND VERIFY DATA FROM EXCEL    ${txt_value_08_nsd_contract_date_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[18]]]    value


PAGE REQUEST WAIVE - [VERIFY] - [VALUE] - BUSINESS [08 : NEGOTIATION SPECIAL DISCOUNT (LG)]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL    ${txt_value_08_nsd_biz_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[3]]]


PAGE REQUEST WAIVE - [VERIFY] - [VALUE] - WO DATE [08 : NEGOTIATION SPECIAL DISCOUNT (LG)]
    Common_keyword.GET TEXT BY ELEMENT ATTRIBUTE AND VERIFY DATA FROM EXCEL    ${txt_value_08_nsd_wo_date_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[19]]]    value


PAGE REQUEST WAIVE - [VERIFY] - [VALUE] - CONTRACT STATUS [08 : NEGOTIATION SPECIAL DISCOUNT (LG)]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL    ${txt_value_08_nsd_contract_status_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[20]]]
    # Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL WITH STRIP STRING    ${txt_value_08_nsd_contract_status_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[20]]]


PAGE REQUEST WAIVE - [VERIFY] - [VALUE] - TIME OF PAYMENT [08 : NEGOTIATION SPECIAL DISCOUNT (LG)]
    Common_keyword.GET TEXT BY ELEMENT ATTRIBUTE AND VERIFY DATA FROM EXCEL    ${txt_value_08_nsd_time_of_payment_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[21]]]    value


PAGE REQUEST WAIVE - [VERIFY] - [VALUE] - DUE [08 : NEGOTIATION SPECIAL DISCOUNT (LG)]
    Common_keyword.GET TEXT BY ELEMENT ATTRIBUTE AND VERIFY DATA FROM EXCEL    ${txt_value_08_nsd_due_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[22]]]    value


PAGE REQUEST WAIVE - [VERIFY] - [VALUE] - TIMES OF PENALTY [08 : NEGOTIATION SPECIAL DISCOUNT (LG)]
    Common_keyword.GET TEXT BY ELEMENT ATTRIBUTE AND VERIFY DATA FROM EXCEL    ${txt_value_08_nsd_time_of_penalty_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[23]]]    value


PAGE REQUEST WAIVE - [VERIFY] - [VALUE] - REQUEST TIMES [08 : NEGOTIATION SPECIAL DISCOUNT (LG)]
    Common_keyword.GET TEXT BY ELEMENT ATTRIBUTE AND VERIFY DATA FROM EXCEL    ${txt_value_08_nsd_req_time_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[24]]]    value


PAGE REQUEST WAIVE - [VERIFY] - [VALUE] - MINIMUM/INSTALL: [08 : NEGOTIATION SPECIAL DISCOUNT (LG)]
    Common_keyword.GET TEXT BY ELEMENT ATTRIBUTE AND VERIFY DATA FROM EXCEL    ${txt_value_08_nsd_min_install_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[26]]]    value



### Negotiate Detail ###
# Verify Title - Negotiate Detail - 1. Entry negotiate discount detail
PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - TOTALS TERM [NEGOTIATE DETAIL] - [1. ENTRY NEGOTIATE DISCOUNT DETAIL]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_08_nd_format_locator}    ${group_data_label}[${keys_group_data_label}[27]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - TOTALS PAID AMOUNT [NEGOTIATE DETAIL] - [1. ENTRY NEGOTIATE DISCOUNT DETAIL]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_08_nd_format_locator}    ${group_data_label}[${keys_group_data_label}[28]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - FIRST DUE DATE [NEGOTIATE DETAIL] - [1. ENTRY NEGOTIATE DISCOUNT DETAIL]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_08_nd_format_locator}    ${group_data_label}[${keys_group_data_label}[29]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - START CAL. DATE [NEGOTIATE DETAIL] - [1. ENTRY NEGOTIATE DISCOUNT DETAIL]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_08_nd_format_locator}    ${group_data_label}[${keys_group_data_label}[30]]



# Input Data - Negotiate Detail - 1. Entry negotiate discount detail
PAGE REQUEST WAIVE - [INPUT] - TOTALS TERM [NEGOTIATE DETAIL] - [1. ENTRY NEGOTIATE DISCOUNT DETAIL]
    Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE    ${input_08_nd_totals_term_locator}    ${group_data}[${group_data_label}[${keys_group_data_label}[27]]]


PAGE REQUEST WAIVE - [INPUT] - TOTALS PAID AMOUNT [NEGOTIATE DETAIL] - [1. ENTRY NEGOTIATE DISCOUNT DETAIL]
    Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE    ${input_08_nd_totals_paid_amt_locator}    ${group_data}[${group_data_label}[${keys_group_data_label}[28]]]


PAGE REQUEST WAIVE - [DROPDOWN] - FIRST DUE DATE INDEX 2 [NEGOTIATE DETAIL] - [1. ENTRY NEGOTIATE DISCOUNT DETAIL]
    SeleniumLibrary.Click Element    ${dropdown_08_nd_f_due_date_locator}
    SeleniumLibrary.Click Element    ${dropdown_08_nd_f_due_date_index2_locator}
    SeleniumLibrary.Click Element    ${dropdown_08_nd_f_due_date_locator}


PAGE REQUEST WAIVE - [INPUT] - START CAL. DATE [NEGOTIATE DETAIL] - [1. ENTRY NEGOTIATE DISCOUNT DETAIL]
    BuiltIn.Log    >Date Form Excel>${group_data}[${keys_group_data_label}[30]]    WARN
    IF  '${group_data}[${keys_group_data_label}[30]]' == 'none'
        BuiltIn.Log    !!!! USING DATE IN SYSTEM !!!!    WARN
        SeleniumLibrary.Execute JavaScript    document.getElementById('${input_08_nd_js_start_cal_date_id}').value='${date_start_cal_date}';
    ELSE
        BuiltIn.Log    !!!! USING DATE IN EXCEL !!!!    WARN
        ${date_start_cal_date}    Common_keyword.CONVERT DATE FORMAT    ${group_data}[${keys_group_data_label}[30]]
        SeleniumLibrary.Execute JavaScript    document.getElementById('${input_08_nd_js_start_cal_date_id}').value='${date_start_cal_date}';
    END

PAGE REQUEST WAIVE - [CLICK] - [BUTTON] - SUBMIT
    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE    ${btn_08_nd_submit_locator}    15

# Get Text [Value] - LG Screen [1.1 Detail of compromised adjudicate result]
PAGE REQUEST WAIVE - [GET-TEXT] - [VALUE] - JUDGEMENT DATE [LG SCREEN] - [1.1 DETAIL OF COMPROMISED ADJUDICATE RESULT]
    SeleniumLibrary.Wait Until Element Is Visible    ${txt_value_lgscreen_judgement_date_locator}    120
    ${judgement_date}    SeleniumLibrary.Get Element Attribute    ${txt_value_lgscreen_judgement_date_locator}    value 
    BuiltIn.Log To Console    \n
    BuiltIn.Log To Console    1.1 Detail of compromised adjudicate result
    BuiltIn.Log To Console    Judgement Date: ${judgement_date}

PAGE REQUEST WAIVE - [GET-TEXT] - [VALUE] - TOTALS JUDGEMENT [LG SCREEN] - [1.1 DETAIL OF COMPROMISED ADJUDICATE RESULT]
    SeleniumLibrary.Wait Until Element Is Visible    ${txt_value_lgscreen_total_judgement_locator}    30
    ${total_judgement}    SeleniumLibrary.Get Element Attribute    ${txt_value_lgscreen_total_judgement_locator}    value 
    BuiltIn.Log To Console    Totals judgement: ${total_judgement}

PAGE REQUEST WAIVE - [GET-TEXT] - [VALUE] - PRINCIPAL JUDGEMENT [LG SCREEN] - [1.1 DETAIL OF COMPROMISED ADJUDICATE RESULT]
    SeleniumLibrary.Wait Until Element Is Visible    ${txt_value_lgscreen_princ_judgment_locator}    30
    ${princ_judgment}    SeleniumLibrary.Get Element Attribute    ${txt_value_lgscreen_princ_judgment_locator}    value 
    BuiltIn.Log To Console    Principal judgement: ${princ_judgment}

PAGE REQUEST WAIVE - [GET-TEXT] - [VALUE] - EXPECT. DAMAGES [LG SCREEN] - [1.1 DETAIL OF COMPROMISED ADJUDICATE RESULT]
    SeleniumLibrary.Wait Until Element Is Visible    ${txt_value_lgscreen_expect_damages_locator}    30
    ${expect_damages}    SeleniumLibrary.Get Element Attribute    ${txt_value_lgscreen_expect_damages_locator}    value 
    BuiltIn.Log To Console    Expect. Damages: ${expect_damages}

PAGE REQUEST WAIVE - [GET-TEXT] - [VALUE] - INTEREST [LG SCREEN] - [1.1 DETAIL OF COMPROMISED ADJUDICATE RESULT]
    SeleniumLibrary.Wait Until Element Is Visible    ${txt_value_lgscreen_interest_locator}    30
    ${interest}    SeleniumLibrary.Get Element Attribute    ${txt_value_lgscreen_interest_locator}    value 
    BuiltIn.Log To Console    Interest: ${interest}

PAGE REQUEST WAIVE - [GET-TEXT] - [VALUE] - COURT FEE [LG SCREEN] - [1.1 DETAIL OF COMPROMISED ADJUDICATE RESULT]
    SeleniumLibrary.Wait Until Element Is Visible    ${txt_value_lgscreen_court_fee_locator}    30
    ${court_fee}    SeleniumLibrary.Get Element Attribute    ${txt_value_lgscreen_court_fee_locator}    value 
    BuiltIn.Log To Console    Court fee: ${court_fee}

PAGE REQUEST WAIVE - [GET-TEXT] - [VALUE] - LAWYER FEE [LG SCREEN] - [1.1 DETAIL OF COMPROMISED ADJUDICATE RESULT]
    SeleniumLibrary.Wait Until Element Is Visible    ${txt_value_lgscreen_lawyer_fee_locator}    30
    ${lawyer_fee}    SeleniumLibrary.Get Element Attribute    ${txt_value_lgscreen_lawyer_fee_locator}    value 
    BuiltIn.Log To Console    Lawyer fee: ${lawyer_fee}

PAGE REQUEST WAIVE - [GET-TEXT] - [VALUE] - OTHER [LG SCREEN] - [1.1 DETAIL OF COMPROMISED ADJUDICATE RESULT]
    SeleniumLibrary.Wait Until Element Is Visible    ${txt_value_lgscreen_other_locator}    30
    ${other}    SeleniumLibrary.Get Element Attribute    ${txt_value_lgscreen_other_locator}    value 
    BuiltIn.Log To Console    Other: ${other}

PAGE REQUEST WAIVE - [GET-TEXT] - [VALUE] - TOTAL [LG SCREEN] - [1.1 DETAIL OF COMPROMISED ADJUDICATE RESULT]
    SeleniumLibrary.Wait Until Element Is Visible    ${txt_value_lgscreen_totals_locator}    30
    ${totals}    SeleniumLibrary.Get Element Attribute    ${txt_value_lgscreen_totals_locator}    value 
    BuiltIn.Log To Console    Totals: ${totals}



# Get Text [Value] - LG Screen [1.2 Payment History]
PAGE REQUEST WAIVE - [GET-TEXT] - [VALUE] - LOAN AMT OF CUSTOMER [LG SCREEN] - [1.2 PAYMENT HISTORY]
    SeleniumLibrary.Wait Until Element Is Visible    ${txt_value_lgscreen_loan_amt_cust_locator}    30
    ${loan_amt_cust}    SeleniumLibrary.Get Element Attribute    ${txt_value_lgscreen_loan_amt_cust_locator}    value 
    BuiltIn.Log To Console    \n
    BuiltIn.Log To Console    1.2 Payment History
    BuiltIn.Log To Console    Loan Amt of Customer: ${loan_amt_cust}

PAGE REQUEST WAIVE - [GET-TEXT] - [VALUE] - LOAN AMT OF NEW CONTRACT [LG SCREEN] - [1.2 PAYMENT HISTORY]
    SeleniumLibrary.Wait Until Element Is Visible    ${txt_value_lgscreen_loan_amt_new_locator}    30
    ${loan_amt_new}    SeleniumLibrary.Get Element Attribute    ${txt_value_lgscreen_loan_amt_new_locator}    value 
    BuiltIn.Log To Console    Loan Amt of New Contract: ${loan_amt_new}

PAGE REQUEST WAIVE - [GET-TEXT] - [VALUE] - CONTRACT AMOUNT [LG SCREEN] - [1.2 PAYMENT HISTORY]
    SeleniumLibrary.Wait Until Element Is Visible    ${txt_value_lgscreen_contract_amt_locator}    30
    ${contract_amt}    SeleniumLibrary.Get Element Attribute    ${txt_value_lgscreen_contract_amt_locator}    value 
    BuiltIn.Log To Console    Contract Amount: ${contract_amt}

PAGE REQUEST WAIVE - [GET-TEXT] - [VALUE] - PAID TERM [LG SCREEN] - [1.2 PAYMENT HISTORY]
    SeleniumLibrary.Wait Until Element Is Visible    ${txt_value_lgscreen_paid_term_locator}    30
    ${paid_term}    SeleniumLibrary.Get Element Attribute    ${txt_value_lgscreen_paid_term_locator}    value 
    BuiltIn.Log To Console    Paid Term: ${paid_term}

PAGE REQUEST WAIVE - [GET-TEXT] - [VALUE] - RECEIVE BF JUDG.(OLD CONTRACT) [LG SCREEN] - [1.2 PAYMENT HISTORY]
    SeleniumLibrary.Wait Until Element Is Visible    ${txt_value_lgscreen_rcv_bf_judg_old_locator}    30
    ${rcv_bf_judg_old}    SeleniumLibrary.Get Element Attribute    ${txt_value_lgscreen_rcv_bf_judg_old_locator}    value 
    BuiltIn.Log To Console    Receive BF Judg.(Old contract): ${rcv_bf_judg_old}

PAGE REQUEST WAIVE - [GET-TEXT] - [VALUE] - RECEIVE BF JUDG.(NEW CONTRACT) [LG SCREEN] - [1.2 PAYMENT HISTORY]
    SeleniumLibrary.Wait Until Element Is Visible    ${txt_value_lgscreen_rcv_bf_judg_new_locator}    30
    ${cv_bf_judg_new}    SeleniumLibrary.Get Element Attribute    ${txt_value_lgscreen_rcv_bf_judg_new_locator}    value 
    BuiltIn.Log To Console    Receive BF Judg.(New contract): ${cv_bf_judg_new}

PAGE REQUEST WAIVE - [GET-TEXT] - [VALUE] - RECEIVE AF JUDG. [LG SCREEN] - [1.2 PAYMENT HISTORY]
    SeleniumLibrary.Wait Until Element Is Visible    ${txt_value_lgscreen_rcv_af_judg_locator}    30
    ${rcv_af_judg}    SeleniumLibrary.Get Element Attribute    ${txt_value_lgscreen_rcv_af_judg_locator}    value 
    BuiltIn.Log To Console    Receive AF Judg.: ${rcv_af_judg}

PAGE REQUEST WAIVE - [GET-TEXT] - [VALUE] - OS BALANCE [LG SCREEN] - [1.2 PAYMENT HISTORY]
    SeleniumLibrary.Wait Until Element Is Visible    ${txt_value_lgscreen_os_bal_locator}    30
    ${os_bal}    SeleniumLibrary.Get Element Attribute    ${txt_value_lgscreen_os_bal_locator}    value 
    BuiltIn.Log To Console    OS Balance: ${os_bal}

PAGE REQUEST WAIVE - [GET-TEXT] - [VALUE] - WO BALANCE [LG SCREEN] - [1.2 PAYMENT HISTORY]
    SeleniumLibrary.Wait Until Element Is Visible    ${txt_value_lgscreen_wo_bal_locator}    30
    ${wo_bal}    SeleniumLibrary.Get Element Attribute    ${txt_value_lgscreen_wo_bal_locator}    value 
    BuiltIn.Log To Console    WO Balance: ${wo_bal}

PAGE REQUEST WAIVE - [GET-TEXT] - [VALUE] - ALREADY RECEIVE [LG SCREEN] - [1.2 PAYMENT HISTORY]
    SeleniumLibrary.Wait Until Element Is Visible    ${txt_value_lgscreen_already_rcv_locator}    30
    ${already_rcv}    SeleniumLibrary.Get Element Attribute    ${txt_value_lgscreen_already_rcv_locator}    value 
    BuiltIn.Log To Console    Already Receive: ${already_rcv}



# Get Text [Value] - LG Screen [1.3 Discount detail]
PAGE REQUEST WAIVE - [GET-TEXT] - [VALUE] - CUSTOMER WILL PAY [LG SCREEN] - [1.3 DISCOUNT DETAIL]
    SeleniumLibrary.Wait Until Element Is Visible    ${txt_value_lgscreen_cus_will_pay_locator}    30
    ${cus_will_pay}    SeleniumLibrary.Get Element Attribute    ${txt_value_lgscreen_cus_will_Pay_locator}    value 
    BuiltIn.Log To Console    \n
    BuiltIn.Log To Console    1.3 Discount detail
    BuiltIn.Log To Console    Customer will pay: ${cus_will_pay}

PAGE REQUEST WAIVE - [GET-TEXT] - [VALUE] - DIFF. FROM OS BALANCE AMOUNT [LG SCREEN] - [1.3 DISCOUNT DETAIL]
    SeleniumLibrary.Wait Until Element Is Visible    ${txt_value_lgscreen_diff_os_bal_amt_locator}    30
    ${os_bal_amt}    SeleniumLibrary.Get Element Attribute    ${txt_value_lgscreen_diff_os_bal_amt_locator}    value 
    BuiltIn.Log To Console    Diff. from OS Balance Amount: ${os_bal_amt}

PAGE REQUEST WAIVE - [GET-TEXT] - [VALUE] - DIFF. FROM OS BALANCE PERCENT [LG SCREEN] - [1.3 DISCOUNT DETAIL]
    SeleniumLibrary.Wait Until Element Is Visible    ${txt_value_lgscreen_diff_os_bal_percent_locator}    30
    ${os_bal_percent}    SeleniumLibrary.Get Element Attribute    ${txt_value_lgscreen_diff_os_bal_percent_locator}    value 
    BuiltIn.Log To Console    Diff. from OS Balance Percent: ${os_bal_percent}

PAGE REQUEST WAIVE - [GET-TEXT] - [VALUE] - DIFF. FROM WO BALANCE AMOUNT [LG SCREEN] - [1.3 DISCOUNT DETAIL]
    SeleniumLibrary.Wait Until Element Is Visible    ${txt_value_lgscreen_diff_wo_bal_amt_locator}    30
    ${wo_bal_amt}    SeleniumLibrary.Get Element Attribute    ${txt_value_lgscreen_diff_wo_bal_amt_locator}    value 
    BuiltIn.Log To Console    Diff. from WO Balance Amount: ${wo_bal_amt}

PAGE REQUEST WAIVE - [GET-TEXT] - [VALUE] - DIFF. FROM WO BALANCE PERCENT [LG SCREEN] - [1.3 DISCOUNT DETAIL]
    SeleniumLibrary.Wait Until Element Is Visible    ${txt_value_lgscreen_diff_wo_bal_percent_locator}    30
    ${wo_bal_percent}    SeleniumLibrary.Get Element Attribute    ${txt_value_lgscreen_diff_wo_bal_percent_locator}    value 
    BuiltIn.Log To Console    Diff. from WO Balance Percent: ${wo_bal_percent}

PAGE REQUEST WAIVE - [GET-TEXT] - [VALUE] - DIFF. FROM ADJUDICATE AMOUNT [LG SCREEN] - [1.3 DISCOUNT DETAIL]
    SeleniumLibrary.Wait Until Element Is Visible    ${txt_value_lgscreen_diff_adj_amt_locator}    30
    ${diff_adj_amt}    SeleniumLibrary.Get Element Attribute    ${txt_value_lgscreen_diff_adj_amt_locator}    value 
    BuiltIn.Log To Console    Diff. from Adjudicate Amount: ${diff_adj_amt}


PAGE REQUEST WAIVE - [GET-TEXT] - [VALUE] - DIFF. FROM ADJUDICATE PERCENT [LG SCREEN] - [1.3 DISCOUNT DETAIL]
    SeleniumLibrary.Wait Until Element Is Visible    ${txt_value_lgscreen_diff_adj_percent_locator}    30
    ${diff_adj_percent}    SeleniumLibrary.Get Element Attribute    ${txt_value_lgscreen_diff_adj_percent_locator}    value 
    BuiltIn.Log To Console    Diff. from Adjudicate Percent: ${diff_adj_percent}



# Get Text [Value] - LG Screen [1.4 Profit detail (Auto cal.)]
PAGE REQUEST WAIVE - [GET-TEXT] - [VALUE] - TOTALS RECEIVED [LG SCREEN] - [1.4 PROFIT DETAIL (AUTO CAL.)]
    SeleniumLibrary.Wait Until Element Is Visible    ${txt_value_lgscreen_already_rcv_locator}    30
    ${already_rcv}    SeleniumLibrary.Get Element Attribute    ${txt_value_lgscreen_already_rcv_locator}    value 
    BuiltIn.Log To Console    \n
    BuiltIn.Log To Console    1.4 Profit detail (Auto cal.)
    BuiltIn.Log To Console    Already received: ${already_rcv}

PAGE REQUEST WAIVE - [GET-TEXT] - [VALUE] - TOTALS RECEIVE [LG SCREEN] - [1.4 PROFIT DETAIL (AUTO CAL.)]
    SeleniumLibrary.Wait Until Element Is Visible    ${txt_value_lgscreen_totals_rcv_locator}    30
    ${totals_rcv}    SeleniumLibrary.Get Element Attribute    ${txt_value_lgscreen_totals_rcv_locator}    value 
    BuiltIn.Log To Console    Totals receive: ${totals_rcv}


PAGE REQUEST WAIVE - [GET-TEXT] - [VALUE] - LEGAL FEE [LG SCREEN] - [1.4 PROFIT DETAIL (AUTO CAL.)]
    SeleniumLibrary.Wait Until Element Is Visible    ${txt_value_lgscreen_legal_fee_locator}    30
    ${legal_fee}    SeleniumLibrary.Get Element Attribute    ${txt_value_lgscreen_legal_fee_locator}    value 
    BuiltIn.Log To Console    Legal fee: ${legal_fee}

PAGE REQUEST WAIVE - [GET-TEXT] - [VALUE] - LOAN AMT. [LG SCREEN] - [1.4 PROFIT DETAIL (AUTO CAL.)]
    SeleniumLibrary.Wait Until Element Is Visible    ${txt_value_lgscreen_loan_amt_locator}    30
    ${loan_amt}    SeleniumLibrary.Get Element Attribute    ${txt_value_lgscreen_loan_amt_locator}    value 
    BuiltIn.Log To Console    Loan Amt.: ${loan_amt}

PAGE REQUEST WAIVE - [GET-TEXT] - [VALUE] - NET RECEIVE [LG SCREEN] - [1.4 PROFIT DETAIL (AUTO CAL.)]
    SeleniumLibrary.Wait Until Element Is Visible    ${txt_value_lgscreen_net_rcv_locator}    30
    ${net_rcv}    SeleniumLibrary.Get Element Attribute    ${txt_value_lgscreen_net_rcv_locator}    value 
    BuiltIn.Log To Console    Net Receive: ${net_rcv}  


# Verify Title - 1.1 Detail of compromised adjudicate result
PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - JUDGEMENT DATE [LG SCREEN] - [1.1 DETAIL OF COMPROMISED ADJUDICATE RESULT]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_lg_format_locator}    ${group_data_label}[${keys_group_data_label}[31]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - TOTALS JUDGEMENT [LG SCREEN] - [1.1 DETAIL OF COMPROMISED ADJUDICATE RESULT]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_lg_format_locator}    ${group_data_label}[${keys_group_data_label}[32]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - PRINCIPAL JUDGEMENT [LG SCREEN] - [1.1 DETAIL OF COMPROMISED ADJUDICATE RESULT]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_lg_format_locator}    ${group_data_label}[${keys_group_data_label}[33]]
    

PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - EXPECT. DAMAGES [LG SCREEN] - [1.1 DETAIL OF COMPROMISED ADJUDICATE RESULT]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_lg_format_locator}    ${group_data_label}[${keys_group_data_label}[34]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - INTEREST [LG SCREEN] - [1.1 DETAIL OF COMPROMISED ADJUDICATE RESULT]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_lg_format_locator}    ${group_data_label}[${keys_group_data_label}[35]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - COURT FEE [LG SCREEN] - [1.1 DETAIL OF COMPROMISED ADJUDICATE RESULT]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_lg_format_locator}    ${group_data_label}[${keys_group_data_label}[36]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - LAWYER FEE [LG SCREEN] - [1.1 DETAIL OF COMPROMISED ADJUDICATE RESULT]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_lg_format_locator}    ${group_data_label}[${keys_group_data_label}[37]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - OTHER [LG SCREEN] - [1.1 DETAIL OF COMPROMISED ADJUDICATE RESULT]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_lg_format_locator}    ${group_data_label}[${keys_group_data_label}[38]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - TOTAL [LG SCREEN] - [1.1 DETAIL OF COMPROMISED ADJUDICATE RESULT]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_lg_format_locator}    ${group_data_label}[${keys_group_data_label}[39]]



# Verify Title - 1.2 Payment History
PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - LOAN AMT OF CUSTOMER [LG SCREEN] - [1.2 PAYMENT HISTORY]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_lg_format_locator}    ${group_data_label}[${keys_group_data_label}[40]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - LOAN AMT OF NEW CONTRACT [LG SCREEN] - [1.2 PAYMENT HISTORY]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_lg_format_locator}    ${group_data_label}[${keys_group_data_label}[41]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - CONTRACT AMOUNT [LG SCREEN] - [1.2 PAYMENT HISTORY]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_lg_format_locator}    ${group_data_label}[${keys_group_data_label}[42]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - PAID TERM [LG SCREEN] - [1.2 PAYMENT HISTORY]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_lg_format_locator}    ${group_data_label}[${keys_group_data_label}[43]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - RECEIVE BF JUDG.(OLD CONTRACT) [LG SCREEN] - [1.2 PAYMENT HISTORY]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_lg_format_locator}    ${group_data_label}[${keys_group_data_label}[44]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - RECEIVE BF JUDG.(NEW CONTRACT) [LG SCREEN] - [1.2 PAYMENT HISTORY]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_lg_format_locator}    ${group_data_label}[${keys_group_data_label}[45]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - RECEIVE AF JUDG. [LG SCREEN] [LG SCREEN] - [1.2 PAYMENT HISTORY]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_lg_format_locator}    ${group_data_label}[${keys_group_data_label}[46]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - OS BALANCE [LG SCREEN] - [1.2 PAYMENT HISTORY]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_lg_format_locator}    ${group_data_label}[${keys_group_data_label}[47]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - WO BALANCE [LG SCREEN] - [1.2 PAYMENT HISTORY]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_lg_format_locator}    ${group_data_label}[${keys_group_data_label}[48]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - ALREADY RECEIVE (ONLY OA) [LG SCREEN] - [1.2 PAYMENT HISTORY]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_lg_format_locator}    ${group_data_label}[${keys_group_data_label}[49]]



# Verify Title - 1.3 Discount detail
PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - CUSTOMER WILL PAY [LG SCREEN] - [1.3 DISCOUNT DETAIL]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_lg_format_locator}    ${group_data_label}[${keys_group_data_label}[50]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - DIFF. FROM OS BALANCE AMOUNT [LG SCREEN] - [1.3 DISCOUNT DETAIL]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_lg_format_locator}    ${group_data_label}[${keys_group_data_label}[51]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - DIFF. FROM OS BALANCE PERCENT [LG SCREEN] - [1.3 DISCOUNT DETAIL]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_lg_format_locator}    ${group_data_label}[${keys_group_data_label}[51]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - DIFF. FROM WO BALANCE AMOUNT [LG SCREEN] - [1.3 DISCOUNT DETAIL]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_lg_format_locator}    ${group_data_label}[${keys_group_data_label}[53]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - DIFF. FROM WO BALANCE PERCENT [LG SCREEN] - [1.3 DISCOUNT DETAIL]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_lg_format_locator}    ${group_data_label}[${keys_group_data_label}[53]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - DIFF. FROM ADJUDICATE AMOUNT [LG SCREEN] - [1.3 DISCOUNT DETAIL]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_lg_format_locator}    ${group_data_label}[${keys_group_data_label}[55]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - DIFF. FROM ADJUDICATE PERCENT [LG SCREEN] - [1.3 DISCOUNT DETAIL]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_lg_format_locator}    ${group_data_label}[${keys_group_data_label}[55]]



# Verify Title - 1.4 Profit detail (Auto cal.)
PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - TOTALS RECEIVED [LG SCREEN] - [1.4 PROFIT DETAIL (AUTO CAL.)]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_lg_format_locator}    ${group_data_label}[${keys_group_data_label}[57]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - TOTALS RECEIVE [LG SCREEN] - [1.4 PROFIT DETAIL (AUTO CAL.)]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_lg_format_locator}    ${group_data_label}[${keys_group_data_label}[58]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - LEGAL FEE [LG SCREEN] - [1.4 PROFIT DETAIL (AUTO CAL.)]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_lg_format_locator}    ${group_data_label}[${keys_group_data_label}[59]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - LOAN AMT. [LG SCREEN] - [1.4 PROFIT DETAIL (AUTO CAL.)]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_lg_format_locator}    ${group_data_label}[${keys_group_data_label}[60]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - NET RECEIVE [LG SCREEN] - [1.4 PROFIT DETAIL (AUTO CAL.)]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_lg_format_locator}    ${group_data_label}[${keys_group_data_label}[61]]



# Verify Title - 2. Entry detail by Term#, Time#
PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - TERM# [NEGOTIATE DETAIL] - [2. ENTRY DETAIL BY TERM#, TIME#]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_08_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[62]]
    

PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - PAID DATE [NEGOTIATE DETAIL] - [2. ENTRY DETAIL BY TERM#, TIME#]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_08_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[64]]
    

PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - PAID AMOUNT [NEGOTIATE DETAIL] - [2. ENTRY DETAIL BY TERM#, TIME#]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_08_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[65]]



# Input Data - Negotiate Detail - 2. Entry detail by Term#, Time#
PAGE REQUEST WAIVE - [INPUT] - TERM# START - [2. ENTRY DETAIL BY TERM#, TIME#]
    Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE    ${input_08_nd_start_term_locator}    ${group_data}[${group_data_label}[${keys_group_data_label}[62]]]


PAGE REQUEST WAIVE - [INPUT] - TERM# END - [2. ENTRY DETAIL BY TERM#, TIME#]
    Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE    ${input_08_nd_end_term_locator}    ${group_data}[${group_data_label}[${keys_group_data_label}[63]]]


PAGE REQUEST WAIVE - [INPUT] - PAID DATE - [2. ENTRY DETAIL BY TERM#, TIME#]
    BuiltIn.Log    >Date Form Excel>${group_data}[${keys_group_data_label}[64]]    WARN
    BuiltIn.Log    >Date>${date_paid_date}    WARN
    IF  '${group_data}[${keys_group_data_label}[64]]' == 'none'
        BuiltIn.Log    !!!! USING DATE IN SYSTEM !!!!    WARN
        SeleniumLibrary.Execute JavaScript    document.getElementById('${input_08_nd_js_paid_date_id}').value='${date_paid_date}';
    ELSE
        BuiltIn.Log    !!!! USING DATE IN EXCEL !!!!    WARN
        ${date_start_cal_date}    Common_keyword.CONVERT DATE FORMAT    ${group_data}[${keys_group_data_label}[30]]
        SeleniumLibrary.Execute JavaScript    document.getElementById('${input_08_nd_js_paid_date_id}').value='${date_paid_date}';
    END


    
PAGE REQUEST WAIVE - [INPUT] - PAID AMOUNT - [2. ENTRY DETAIL BY TERM#, TIME#]
    Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE    ${input_08_nd_paid_amt_locator}    ${group_data}[${group_data_label}[${keys_group_data_label}[65]]]


PAGE REQUEST WAIVE - [CLICK] - [BUTTON] - ADD [2. ENTRY DETAIL BY TERM#, TIME#]
    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE    ${btn_08_nd_2_add_locator}    15



# Verify Title Table - 2. Entry detail by Term#, Time#
PAGE REQUEST WAIVE - [VERIFY] - [TITLE][TABLE] - NO [NEGOTIATE DETAIL] - [2. ENTRY DETAIL BY TERM#, TIME#]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_08_nd_2_format_locator}    ${group_data_label}[${keys_group_data_label}[66]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE][TABLE] - TERM# [NEGOTIATE DETAIL] - [2. ENTRY DETAIL BY TERM#, TIME#]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_08_nd_2_format_locator}    ${group_data_label}[${keys_group_data_label}[67]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE][TABLE] - MIN DUE DATE [NEGOTIATE DETAIL] - [2. ENTRY DETAIL BY TERM#, TIME#]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_08_nd_2_format_locator}    ${group_data_label}[${keys_group_data_label}[68]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE][TABLE] - MAX DUE DATE [NEGOTIATE DETAIL] - [2. ENTRY DETAIL BY TERM#, TIME#]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_08_nd_2_format_locator}    ${group_data_label}[${keys_group_data_label}[69]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE][TABLE] - TIME# [NEGOTIATE DETAIL] - [2. ENTRY DETAIL BY TERM#, TIME#]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_08_nd_2_format_locator}    ${group_data_label}[${keys_group_data_label}[70]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE][TABLE] - PAID DATE [NEGOTIATE DETAIL] - [2. ENTRY DETAIL BY TERM#, TIME#]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_08_nd_2_format_locator}    ${group_data_label}[${keys_group_data_label}[71]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE][TABLE] - PAID AMOUNT [NEGOTIATE DETAIL] - [2. ENTRY DETAIL BY TERM#, TIME#]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_08_nd_2_format_locator}    ${group_data_label}[${keys_group_data_label}[72]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE][TABLE] - DELETE [NEGOTIATE DETAIL] - [2. ENTRY DETAIL BY TERM#, TIME#]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_08_nd_2_format_locator}    ${group_data_label}[${keys_group_data_label}[73]]



# Verify Value Table - 2. Entry detail by Term#, Time#
PAGE REQUEST WAIVE - [VERIFY] - [VALUE][TABLE] - TOTAL TERM [NEGOTIATE DETAIL] - [2. ENTRY DETAIL BY TERM#, TIME#]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL    ${txt_value_08_nd_2_total_team_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[74]]]

PAGE REQUEST WAIVE - [VERIFY] - [VALUE][TABLE] - TOTAL PAID AMOUNT [NEGOTIATE DETAIL] - [2. ENTRY DETAIL BY TERM#, TIME#]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL    ${txt_value_08_nd_2_total_paid_amount_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[75]]]



# Verify Title - 3.1 Entry other debt
PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - OTHER DEBT [NEGOTIATE DETAIL] - [3.1 ENTRY OTHER DEBT]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_08_nd_format_locator}    ${group_data_label}[${keys_group_data_label}[76]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - AMOUNT [NEGOTIATE DETAIL] - [3.1 ENTRY OTHER DEBT]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_08_nd_format_locator}    ${group_data_label}[${keys_group_data_label}[77]]



# Input Data - Negotiate Detail - 3.1 Entry other debt
PAGE REQUEST WAIVE - [INPUT] - OTHER DEBT - [3.1 ENTRY OTHER DEBT]
    Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE    ${input_08_nd_other_debt_locator}    ${group_data}[${group_data_label}[${keys_group_data_label}[76]]]


PAGE REQUEST WAIVE - [INPUT] - AMOUNT - [3.1 ENTRY OTHER DEBT]
    Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE    ${input_08_nd_amt_locator}    ${group_data}[${group_data_label}[${keys_group_data_label}[77]]]


PAGE REQUEST WAIVE - [CLICK] - [BUTTON] - ADD [3.1 ENTRY OTHER DEBT]
    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE    ${btn_08_nd_3_1_add_locator}    15



# Verify Title Table - 3.1 Entry other debt
PAGE REQUEST WAIVE - [VERIFY] - [TITLE][TABLE] - NO [NEGOTIATE DETAIL] - [3.1 ENTRY OTHER DEBT]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_08_nd_3_1_format_locator}    ${group_data_label}[${keys_group_data_label}[78]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE][TABLE] - OTHER DEBT [NEGOTIATE DETAIL] - [3.1 ENTRY OTHER DEBT]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_08_nd_3_1_format_locator}    ${group_data_label}[${keys_group_data_label}[79]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE][TABLE] - AMOUNT [NEGOTIATE DETAIL] - [3.1 ENTRY OTHER DEBT]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_08_nd_3_1_format_locator}    ${group_data_label}[${keys_group_data_label}[80]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE][TABLE] - DELETE [NEGOTIATE DETAIL] - [3.1 ENTRY OTHER DEBT]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_08_nd_3_1_format_locator}    ${group_data_label}[${keys_group_data_label}[81]]



# Verify Value Table - 3.1 Entry other debt
PAGE REQUEST WAIVE - [VERIFY] - [VALUE][TABLE] - TOTAL AMOUNT [NEGOTIATE DETAIL] - [3.1 ENTRY OTHER DEBT]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL    ${txt_value_08_nd_3_1_total_amount_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[82]]]



# Verify Title - 3.2 Entry other ...
PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - LAST CONTACT THIRD PARTY [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_08_nd_format_locator}    ${group_data_label}[${keys_group_data_label}[83]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - LAST CONTACT CUSTOMER [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_08_nd_format_locator}    ${group_data_label}[${keys_group_data_label}[84]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - HAVE JOB [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_08_nd_format_locator}    ${group_data_label}[${keys_group_data_label}[85]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - WHO REQUEST [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_08_nd_format_locator}    ${group_data_label}[${keys_group_data_label}[86]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - DISCOUNT CAMPAIGN [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_08_nd_format_locator}    ${group_data_label}[${keys_group_data_label}[87]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - WHO PAID [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_08_nd_format_locator}    ${group_data_label}[${keys_group_data_label}[88]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - SOURCE OF FUND [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_08_nd_format_locator}    ${group_data_label}[${keys_group_data_label}[89]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - REASON [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_08_nd_format_locator}    ${group_data_label}[${keys_group_data_label}[90]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - REASON NOTE [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_08_nd_format_locator}    ${group_data_label}[${keys_group_data_label}[91]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - SEND TO [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_08_nd_format_locator}    ${group_data_label}[${keys_group_data_label}[92]]


PAGE REQUEST WAIVE - [VERIFY] - [TITLE] - NOTE [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_08_nd_format_locator}    ${group_data_label}[${keys_group_data_label}[93]]



# Input Data - Negotiate Detail - 3.2 Entry other ...
PAGE REQUEST WAIVE - [INPUT] - LAST CONTACT THIRD PARTY [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    BuiltIn.Log    >Date Form Excel>${group_data}[${keys_group_data_label}[83]]    WARN
    IF  '${group_data}[${keys_group_data_label}[83]]' == 'none'
        BuiltIn.Log    !!!! USING DATE IN SYSTEM !!!!    WARN
        SeleniumLibrary.Execute JavaScript    document.getElementById('${input_08_nd_js_last_cont_3_party_id}').value='${date_start_cal_date}';
    ELSE
        BuiltIn.Log    !!!! USING DATE IN EXCEL !!!!    WARN
        ${date_start_cal_date}    Common_keyword.CONVERT DATE FORMAT    ${group_data}[${keys_group_data_label}[83]]
        SeleniumLibrary.Execute JavaScript    document.getElementById('${input_08_nd_js_last_cont_3_party_id}').value='${date_start_cal_date}';
    END


PAGE REQUEST WAIVE - [INPUT] - LAST CONTACT CUSTOMER [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    BuiltIn.Log    >Date Form Excel>${group_data}[${keys_group_data_label}[84]]    WARN
    IF  '${group_data}[${keys_group_data_label}[84]]' == 'none'
        BuiltIn.Log    !!!! USING DATE IN SYSTEM !!!!    WARN
        SeleniumLibrary.Execute JavaScript    document.getElementById('${input_08_nd_js_last_cont_cust_id}').value='${date_start_cal_date}';
    ELSE
        BuiltIn.Log    !!!! USING DATE IN EXCEL !!!!    WARN
        ${date_start_cal_date}    Common_keyword.CONVERT DATE FORMAT    ${group_data}[${keys_group_data_label}[84]]
        SeleniumLibrary.Execute JavaScript    document.getElementById('${input_08_nd_js_last_cont_cust_id}').value='${date_start_cal_date}';
    END


PAGE REQUEST WAIVE - [INPUT] - HAVE JOB [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    IF   "${group_data}[${group_data_label}[${keys_group_data_label}[85]]]" == "Yes"
        CLICK ELEMENT WHEN ELEMENT IS VISIBLE CHECKBOX    ${input_08_nd_have_job_yes_locator}
    ELSE IF    "${group_data}[${group_data_label}[${keys_group_data_label}[85]]]" == "No"
        CLICK ELEMENT WHEN ELEMENT IS VISIBLE CHECKBOX    ${input_08_nd_have_job_no_locator}
    ELSE
        BuiltIn.Log    Please input field Have job in excel as "Yes" or "No" only.    WARN
    END


PAGE REQUEST WAIVE - [INPUT] - WHO REQUEST [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${select_08_nd_who_req_locator}
    SeleniumLibrary.Select From List By Label   ${select_08_nd_who_req_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[86]]]


PAGE REQUEST WAIVE - [INPUT] - DISCOUNT CAMPAIGN [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${select_08_nd_discount_camp_locator}
    SeleniumLibrary.Select From List By Label   ${select_08_nd_discount_camp_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[87]]]


PAGE REQUEST WAIVE - [INPUT] - WHO PAID [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${select_08_nd_who_paid_locator}
    SeleniumLibrary.Select From List By Label   ${select_08_nd_who_paid_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[88]]]


PAGE REQUEST WAIVE - [INPUT] - SOURCE OF FUND [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${select_08_nd_source_fund__locator}
    SeleniumLibrary.Select From List By Label   ${select_08_nd_source_fund__locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[89]]]


PAGE REQUEST WAIVE - [INPUT] - REASON [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${select_08_nd_reason_locator}
    SeleniumLibrary.Select From List By Label   ${select_08_nd_reason_locator}     ${group_data}[${group_data_label}[${keys_group_data_label}[90]]]


PAGE REQUEST WAIVE - [INPUT] - REASON NOTE [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE    ${input_08_nd_reason_note_locator}    ${group_data}[${group_data_label}[${keys_group_data_label}[91]]]


PAGE REQUEST WAIVE - TYPE 08 - [DROPDOWN] - SEND TO [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    [Arguments]    ${user_level}
    ${status}    BuiltIn.Run Keyword And Return Status    Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${sel_req_send_to}    10s
    IF  '${status}' == 'True'
        IF  '${user_level}' == '0'
            Common_keyword.SELECT OPTION SELECT FROM LIST BY LABEL    ${sel_req_send_to}    ${group_user}[${keys_group_user}[3]]    # Send to 1 = P2503064
        ELSE IF  '${user_level}' == '1'
            Common_keyword.SELECT OPTION SELECT FROM LIST BY LABEL    ${sel_req_send_to}    ${group_user}[${keys_group_user}[5]]    # Send to 2 = P2510033 
        ELSE IF  '${user_level}' == '3'
            Common_keyword.SELECT OPTION SELECT FROM LIST BY LABEL    ${sel_req_send_to}    ${group_user}[${keys_group_user}[7]]    # Send to 3 = P2503067 
        ELSE IF  '${user_level}' == '4'
            Common_keyword.SELECT OPTION SELECT FROM LIST BY LABEL    ${sel_req_send_to}    ${group_user}[${keys_group_user}[9]]    # Send to 4 = P2106010 
        ELSE IF  '${user_level}' == '5'
            Common_keyword.SELECT OPTION SELECT FROM LIST BY LABEL    ${sel_req_send_to}    ${group_user}[${keys_group_user}[11]]    # Send to 5 = KIMURA 
        END
    ELSE
        BuiltIn.Log    NO USER MATCH SENDTO    WARN
    END
    

PAGE REQUEST WAIVE - [INPUT] - NOTE [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE    ${input_08_nd_note_locator}    ${group_data}[${group_data_label}[${keys_group_data_label}[93]]]


# btn approve
PAGE REQUEST WAIVE - TYPE 08 - [CLICK] - [BTN] APPROVE
    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE    ${btn_approve}    

# verify title popup
PAGE REQUEST WAIVE - TYPE 08 - [VERIFY] - [TITLE] APPROVE 
    Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR     ${verfiy_approve_popup}    

PAGE REQUEST WAIVE - TYPE 08 - [VERIFY] - [POPUP] APPROVE - [CLICK] OK
    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE     ${btn_ok_approve_popup}    

PAGE REQUEST WAIVE - TYPE 08 - [VERIFY] - [POPUP] APPROVE - [CLICK] CANCEL
    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE     ${btn_cancel_approve_popup}    


# verify loading
PAGE REQUEST WAIVE - TYPE 08 - [VERIFY] - [LOADING]
    Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${loading}    time_out=60s    


# get requst no save to excel
PAGE REQUEST WAIVE - TYPE 08 - [GET] - [DATA] REQUEST NO - [SAVE] EXCEL
    
    # wait finish loading..
    PAGE REQUEST WAIVE - TYPE 08 - [VERIFY] - [LOADING]

    ${state}    Common_keyword.RUN KEYWORD AND IGNORE ERROR WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR     ${txt_red_value_08_nsd_request_no_locator}    60s
    BuiltIn.Log    STATE SAVE->${state}    WARN

    IF  '${state}' == 'True'    # ถ้าเจอ
        ${point}    BuiltIn.Evaluate    1
        BuiltIn.Set Global Variable    ${point}
        Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${txt_red_value_08_nsd_request_no_locator}    5s      # get req No to save
        ${result_request_no}    Common_keyword.GET VALUE PAGE CONTAINS ELEMENT BY LOCATOR AND STRIP AND NOT CHECK EQUAL AND RETURN    ${txt_red_value_08_nsd_request_no_locator}
        BuiltIn.Log    REQ_NO_SAVE->${result_request_no}    WARN
        BuiltIn.Set Global Variable    ${result_request_no}

    ELSE IF  '${state}' == 'False'    # ถ้าไม่เจอ
        ${point}    BuiltIn.Evaluate    0
        BuiltIn.Set Global Variable    ${point}
        Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${txt_msg_08_error}    5s 
        ${msgerror}    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR NO SPLIT    ${txt_msg_08_error}  
        BuiltIn.Log    MSG ERROR->${msgerror}    WARN
        ${result_request_no}    BuiltIn.Set Variable    ${msgerror}    
        BuiltIn.Set Global Variable    ${result_request_no}

    END



### INBOX ###
# Verify Title - 08 : Negotiation Special Discount (LG) [Inbox]
PAGE INBOX - [VERIFY] - [TITLE] - REQUEST TYPE [08 : NEGOTIATION SPECIAL DISCOUNT (LG)]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_08_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[1]]


PAGE INBOX - [VERIFY] - [TITLE] - REQUESTER [08 : NEGOTIATION SPECIAL DISCOUNT (LG)]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_08_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[6]]


PAGE INBOX - [VERIFY] - [TITLE] - REQUEST NO. [08 : NEGOTIATION SPECIAL DISCOUNT (LG)]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_08_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[5]]


PAGE INBOX - [VERIFY] - [TITLE] - CUSTOMER ID [08 : NEGOTIATION SPECIAL DISCOUNT (LG)]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_08_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[2]]


PAGE INBOX - [VERIFY] - [TITLE] - CUSTOMER NO [08 : NEGOTIATION SPECIAL DISCOUNT (LG)]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL BY REPLACE VAULE    ${txt_title_08_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[4]]


