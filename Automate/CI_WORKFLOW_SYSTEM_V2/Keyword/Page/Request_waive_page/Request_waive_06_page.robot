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

*** Keywords ***

SET FORMAT DATA TYPE 06 - WRITE
    [Arguments]    ${row}    ${start_at_case}    ${end_at_case}
    ${countrow}    BuiltIn.Set Variable If    ${end_at_case} <= ${data_count_row}    ${end_at_case}    ${data_count_row}
    
    ${count}    BuiltIn.Evaluate    0    # set count error start at zero
    BuiltIn.Set Global Variable    ${count} 

    FOR  ${index}  IN RANGE    ${start_at_case}    ${countrow} + 1  
        ${result_excel}    JSONLibrary.Get Value From Json    ${data_from_excel_by_sheet}    $[?(@.TC == '${row}_${index}')]
        ${group_data}    BuiltIn.Set Variable   ${result_excel}[0]
        BuiltIn.Set Global Variable    ${group_data}

        ${Request_No}    BuiltIn.Set Variable    '${group_data}[${keys_group_data_label}[5]]'    #'${group_data}[Request No.]'     # get case   สำหรับเช็ค  
        ${State}    BuiltIn.Set Variable    '${group_data}[${keys_group_data_label}[6]]'         #'${group_data}[State]'           # get case   สำหรับเช็ค 


        IF  ${Request_No} == 'none' and ${State} == 'none'                                   # none, none -> make
                            
            ${Rows}    BuiltIn.Evaluate    ${index} + 2                                      # +2 because add title at row 2 
            BuiltIn.Set Global Variable    ${Rows}   
            BuiltIn.Log    ----------------------------------------    WARN 
            BuiltIn.Log    CONATRACT->ROW->${Rows}:${row}_${index}    WARN
            BuiltIn.Log    ----------------------------------------    WARN
        
            # input Contract no, ID card, business click aprrove
            Request_waive_06_feature.SET FEATURE - TYPE - 06 - INPUT CRITERIA SEARCH - REQUEST TYPE - PAGE REQUEST WAIVE

            ${status_error}    BuiltIn.Run Keyword And Return Status    Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${txt_error}    5s
            IF  '${status_error}' == 'True'
                ${error_msg}    SeleniumLibrary.Get Text    ${txt_error}    
                ${nextcase}    BuiltIn.Set Variable    False
                BuiltIn.Set Global Variable    ${nextcase}   
                Common_feature.SET - DATA TO EXCEL    ${Excel_name}    ${type_06}    ${Rows}    6    FAIL
                Common_feature.SET - DATA TO EXCEL    ${Excel_name}    ${type_06}    ${Rows}    7    FAIL
                BuiltIn.fail    !!!!!!!!!!!!! ${error_msg} !!!!!!!!!!!!!
                Common_keyword.CLOSE ALL BROWSERS TEARDOWN  
            ELSE
            
                # get data from web before run
                ${value_cust_name_locator}    Common_keyword.GET VALUE PAGE CONTAINS ELEMENT BY LOCATOR AND STRIP AND NOT CHECK EQUAL AND RETURN    ${txt_value_06_nsd_cust_name_locator}
                ${value_request_data_locator}    Common_keyword.GET VALUE PAGE CONTAINS ELEMENT BY LOCATOR AND STRIP AND NOT CHECK EQUAL AND RETURN    ${txt_value_06_nsd_request_date_locator}
                ${value_call_center}    Common_keyword.GET VALUE PAGE CONTAINS ELEMENT BY LOCATOR AND STRIP AND NOT CHECK EQUAL AND RETURN    ${txt_value_06_nsd_call_center_locator}
                ${value_age}    Common_keyword.GET VALUE PAGE CONTAINS ELEMENT BY LOCATOR AND STRIP AND NOT CHECK EQUAL AND RETURN    ${txt_value_06_nsd_age_locator}
                ${value_team}    Common_keyword.GET VALUE PAGE CONTAINS ELEMENT BY LOCATOR AND STRIP AND NOT CHECK EQUAL AND RETURN    ${txt_value_06_nsd_team_locator}
                ${value_time_of_payment}    Common_keyword.GET VALUE PAGE CONTAINS ELEMENT BY LOCATOR AND STRIP AND NOT CHECK EQUAL AND RETURN    ${txt_value_06_nsd_time_of_payment_locator}
                ${value_due}    Common_keyword.GET VALUE PAGE CONTAINS ELEMENT BY LOCATOR AND STRIP AND NOT CHECK EQUAL AND RETURN    ${txt_value_06_nsd_due_locator}

                IF  '${value_cust_name_locator}' != 'none' and '${value_call_center}' != 'none' and '${value_call_center}' != 'none' and '${value_age}' != 'none' and '${value_team}' != 'none' and '${value_time_of_payment}' != 'none' and '${value_due}' != 'none' 
                    Common_feature.SET - DATA TO EXCEL    ${Excel_name}    ${type_06}    ${Rows}    10    ${value_request_data_locator} 
                    Common_feature.SET - DATA TO EXCEL    ${Excel_name}    ${type_06}    ${Rows}    11    ${value_cust_name_locator} 
                    Common_feature.SET - DATA TO EXCEL    ${Excel_name}    ${type_06}    ${Rows}    12    ${value_call_center}  
                    Common_feature.SET - DATA TO EXCEL    ${Excel_name}    ${type_06}    ${Rows}    13    ${value_age}  
                    Common_feature.SET - DATA TO EXCEL    ${Excel_name}    ${type_06}    ${Rows}    14    ${value_team}    
                    Common_feature.SET - DATA TO EXCEL    ${Excel_name}    ${type_06}    ${Rows}    24    ${value_time_of_payment}  
                    Common_feature.SET - DATA TO EXCEL    ${Excel_name}    ${type_06}    ${Rows}    25    ${value_due}  
                    Common_feature.SET - DATA TO EXCEL    ${Excel_name}    ${type_06}    ${Rows}    9     ${group_user}[${keys_group_user}[3]]    #P2503064  
                    Common_feature.SET - DATA TO EXCEL    ${Excel_name}    ${type_06}    ${Rows}    89    ${group_user}[${keys_group_user}[3]]    #P2503064  
                    Common_feature.SET - DATA TO EXCEL    ${Excel_name}    ${type_06}    ${Rows}    92    ${value_cust_name_locator}
                    Common_feature.SET - DATA TO EXCEL    ${Excel_name}    ${type_06}    ${Rows}    93    ${group_user}[${keys_group_user}[3]]    #P2503064
                    ${nextcase}    BuiltIn.Set Variable    True
                    BuiltIn.Set Global Variable    ${nextcase}
                ELSE
                    ${nextcase}    BuiltIn.Set Variable    False
                    BuiltIn.Set Global Variable    ${nextcase}
                    Common_feature.SET - DATA TO EXCEL    ${Excel_name}    ${type_06}    ${Rows}    6    FAIL
                    Common_feature.SET - DATA TO EXCEL    ${Excel_name}    ${type_06}    ${Rows}    7    FAIL
                    BuiltIn.fail    !!!!!!!!!!!!! error some get value !!!!!!!!!!!!! 
                    Common_keyword.CLOSE ALL BROWSERS TEARDOWN 
                END  
            END

            BuiltIn.Exit For Loop
         
        END

    END

SET FORMAT DATA TYPE 06 - USING
    [Arguments]    ${row}    ${start_at_case}    ${end_at_case}    ${user_level}
    ${countrow}    BuiltIn.Set Variable If    ${end_at_case} <= ${data_count_row}    ${end_at_case}    ${data_count_row}
    
    ${count}    BuiltIn.Evaluate    0    # set count error start at zero
    BuiltIn.Set Global Variable    ${count} 

    FOR  ${index}  IN RANGE    ${start_at_case}    ${countrow} + 1  
        ${result_excel}    JSONLibrary.Get Value From Json    ${data_from_excel_by_sheet}    $[?(@.TC == '${row}_${index}')]
        ${group_data}    BuiltIn.Set Variable   ${result_excel}[0]
        BuiltIn.Set Global Variable    ${group_data}

        ${Request_No}    BuiltIn.Set Variable    '${group_data}[${keys_group_data_label}[5]]'    #'${group_data}[Request No.]'     # get case   สำหรับเช็ค  
        ${State}    BuiltIn.Set Variable    '${group_data}[${keys_group_data_label}[6]]'         #'${group_data}[State]'           # get case   สำหรับเช็ค 


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
        
            # input Contract no, ID card, business click aprrove
            Request_waive_06_feature.SET FEATURE - TYPE - 06 - INPUT CRITERIA SEARCH - REQUEST TYPE - PAGE REQUEST WAIVE

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
            

            # 06 : Negotiation Special discount (WO)
            # Input Data - 06 : Negotiation Special discount (WO)
            Request_waive_06_feature.SET FEATURE - TYPE - 06 - INPUT DATA - PAGE REQUEST WAIVE [06 : NEGOTIATION SPECIAL DISCOUNT (WO)]

            #  Verify Title - 06 : Negotiation Special discount (WO)
            # Request_waive_06_feature.SET FEATURE - TYPE - 06 - VERIFY - REQUEST PAGE - PAGE REQUEST WAIVE    

            #  Verify data - 06 : Negotiation Special discount (WO)
            Request_waive_06_feature.SET FEATURE - TYPE - 06 - VERIFY - DATA REQUEST PAGE - PAGE REQUEST WAIVE    

        
            # Negotiate Detail
            # 1. Entry negotiate discount detail
            # Verify Title - Negotiate Detail - 1. Entry negotiate discount detail
            # Request_waive_06_feature.SET FEATURE - TYPE - 06 - DATA TITLE - PAGE REQUEST WAIVE [NEGOTIATE DETAIL] - [1. ENTRY NEGOTIATE DISCOUNT DETAIL]

            # Input Data - Negotiate Detail - 1. Entry negotiate discount detail
            Request_waive_06_feature.SET FEATURE - TYPE - 06 - INPUT DATA - PAGE REQUEST WAIVE [NEGOTIATE DETAIL] - [1. ENTRY NEGOTIATE DISCOUNT DETAIL]
            
            
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
                    Common_feature.SET - DATA TO EXCEL    ${Excel_name}    ${type_06}    ${Rows}    6    FAIL
                    Common_feature.SET - DATA TO EXCEL    ${Excel_name}    ${type_06}    ${Rows}    7    FAIL
                    BuiltIn.fail    !!!!!!!!!!!!! ${error_msg} !!!!!!!!!!!!!  
                    Common_keyword.CLOSE ALL BROWSERS TEARDOWN 
                ELSE

                    # wait value dis play makesure
                    ${is_disabled}    Common_keyword.WAIT FOR BUTTON TO BE DISABLED    ${btn_06_nd_submit_locator}    60s
                    BuiltIn.Log    Display(WO SCREEN)->${is_disabled}    WARN

                    ${data}    Common_keyword.GET VALUE ELEMENT BY LOCATOR AND RETURN    ${value_wo_net_receive_only_oa}    60s          
                    BuiltIn.Log To Console    '\nLast Value Table WO Screen->${data}

                    IF  '${is_disabled}' == 'True' and '${data}' != 'none'
                

                        # WO Screen
                        # verify title                
                        # Request_waive_06_feature.SET FEATURE - TYPE - 06 - DATA TITLE - PAGE REQUEST WAIVE [NEGOTIATE DETAIL] - [WOSCREEN]
                        
                        # verify value
                        Request_waive_06_feature.SET FEATURE - TYPE - 06 - DATA VALUE - PAGE REQUEST WAIVE [NEGOTIATE DETAIL] - [WOSCREEN]

                        # 2. Entry detail by Term#, Time#
                        # Verify Title - 2. Entry detail by Term#, Time#
                        # Request_waive_06_feature.SET FEATURE - TYPE - 06 - DATA TITLE - PAGE REQUEST WAIVE [NEGOTIATE DETAIL] - [2. ENTRY DETAIL BY TERM#, TIME#]

                        # Input Data - Negotiate Detail - 2. Entry detail by Term#, Time#
                        Request_waive_06_feature.SET FEATURE - TYPE - 06 - INPUT DATA - PAGE REQUEST WAIVE [NEGOTIATE DETAIL] - [2. ENTRY DETAIL BY TERM#, TIME#]
                        
                        # Click add
                        Request_waive_06_feature.SET FEATURE - TYPE - 06 - ADD - PAGE REQUEST WAIVE [NEGOTIATE DETAIL] - [2. ENTRY DETAIL BY TERM#, TIME#]
                        

                        # table
                        # # Verify Title Table - 2. Entry detail by Term#, Time#
                        # Request_waive_06_feature.SET FEATURE - TYPE - 06 - DATA TITLE TABLE - PAGE REQUEST WAIVE [NEGOTIATE DETAIL] - [2. ENTRY DETAIL BY TERM#, TIME#]

                        # # Verify Value Table - 2. Entry detail by Term#, Time#
                        # Request_waive_06_feature.SET FEATURE - TYPE - 06 - DATA VALUE TABLE - PAGE REQUEST WAIVE [NEGOTIATE DETAIL] - [2. ENTRY DETAIL BY TERM#, TIME#]
                    

                        # 3. Entry request detail
                        # 3.1 Entry other debt
                        # Verify Title - 3.1 Entry other debt
                        # Request_waive_06_feature.SET FEATURE - TYPE - 06 - DATA TITLE - PAGE REQUEST WAIVE [NEGOTIATE DETAIL] - [3.1 ENTRY OTHER DEBT]

                        # # Input Data - Negotiate Detail - 3.1 Entry other debt
                        # Request_waive_06_feature.SET FEATURE - TYPE - 06 - INPUT DATA - PAGE REQUEST WAIVE [NEGOTIATE DETAIL] - [3.1 ENTRY OTHER DEBT]

                        # # Click add
                        # Request_waive_06_feature.SET FEATURE - TYPE - 06 - ADD - PAGE REQUEST WAIVE [NEGOTIATE DETAIL] - [3.1 ENTRY OTHER DEBT]

                        # # table
                        # # Verify Title Table - 3.1 Entry other debt
                        # Request_waive_06_feature.SET FEATURE - TYPE - 06 - DATA TITLE TABLE - PAGE REQUEST WAIVE [NEGOTIATE DETAIL] - [3.1 ENTRY OTHER DEBT]

                        # # Verify Value Table - 3.1 Entry other debt
                        # Request_waive_06_feature.SET FEATURE - TYPE - 06 - DATA VALUE TABLE - PAGE REQUEST WAIVE [NEGOTIATE DETAIL] - [3.1 ENTRY OTHER DEBT]

                        # # Verify Title - 3.2 Entry other ...
                        # Request_waive_06_feature.SET FEATURE - TYPE - 06 - DATA TITLE - PAGE REQUEST WAIVE [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]


                        # 3.2 Entry other ...
                        # Verify Title - 3.2 Entry other ...
                        Request_waive_06_feature.SET FEATURE - TYPE - 06 - DATA TITLE - PAGE REQUEST WAIVE [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
                                            
                        # Input Data - Negotiate Detail - 3.2 Entry other ...
                        Request_waive_06_feature.SET FEATURE - TYPE - 06 - INPUT DATA - PAGE REQUEST WAIVE [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
                        Request_waive_06_feature.SET FEATURE - TYPE - 06 - VERIFY - SEND TO - PAGE REQUEST WAIVE    user_level=1    # Send to User_1 = P2510033
                            
                        # กด approve
                        Request_waive_06_feature.SET FEATURE - TYPE - 06 - CLICK - APPROVE - PAGE REQUEST WAIVE    

                        # verify pop up
                        Request_waive_06_feature.SET FEATURE - TYPE - 06 - VERIFY - APPROVE POPUP - PAGE REQUEST WAIVE    

                        # verify pop up
                        Request_waive_06_feature.SET FEATURE - TYPE - 06 - CLICK - APPROVE POPUP - CLICK OK - PAGE REQUEST WAIVE   

                        # get data at current page request no
                        Request_waive_06_feature.SET FEATURE - TYPE - 06 - SAVE DATA - REQUSET NO - PAGE REQUEST WAIVE  

                        # wait for check excel write
                        Request_waive_06_feature.SET FEATURE - TYPE - 06 - SAVE DATA TO EXCEL - BY STATE
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
PAGE REQUEST WAIVE - TYPE 06 - OPEN INRANET
    IF  '${nextcase}' == 'True'
        Common_keyword.OPEN INTRANET
        Common_keyword.CLICK SSO ICON
    END

# add new
PAGE REQUEST WAIVE - TYPE 06 - INPUT USENAME AND PASSWORD BY USER LEVEL
    [Arguments]    ${user_level}

    IF  '${user_level}' == '0'         # user approve user0 
        PAGE REQUEST WAIVE - TYPE 06 - SETTING LOGIN    WORKFLOW    ${group_user}[${keys_group_user}[3]]    ${group_user}[${keys_group_user}[4]]    ${group_user}[${keys_group_user}[3]]    # 1 row,col -> 3,4 -> P2506064
    ELSE IF  '${user_level}' == '1'    # user approve user1 
        PAGE REQUEST WAIVE - TYPE 06 - SETTING LOGIN    WORKFLOW    ${group_user}[${keys_group_user}[5]]    ${group_user}[${keys_group_user}[6]]    ${group_user}[${keys_group_user}[5]]    # 1 row,col -> 5,6 -> P2510033
    ELSE IF  '${user_level}' == '2'    # user approve user2
        PAGE REQUEST WAIVE - TYPE 06 - SETTING LOGIN    WORKFLOW    ${group_user}[${keys_group_user}[7]]    ${group_user}[${keys_group_user}[8]]    ${group_user}[${keys_group_user}[7]]     # 2 row,col -> 7,8  -> P2503067
    ELSE IF  '${user_level}' == '3'    # user approve user3
        PAGE REQUEST WAIVE - TYPE 06 - SETTING LOGIN    WORKFLOW    ${group_user}[${keys_group_user}[9]]    ${group_user}[${keys_group_user}[10]]    ${group_user}[${keys_group_user}[9]]     # 3 row,col -> 9,10 -> P2106010 
    ELSE IF  '${user_level}' == '4'    # user approve user4
        PAGE REQUEST WAIVE - TYPE 06 - SETTING LOGIN    WORKFLOW    ${group_user}[${keys_group_user}[11]]    ${group_user}[${keys_group_user}[12]]    ${group_user}[${keys_group_user}[11]]     # 4 row,col -> 11,12 -> KIMURA
    END

# add new
PAGE REQUEST WAIVE - TYPE 06 - SETTING LOGIN
    [Arguments]    ${system_name}    ${username}    ${password}    ${user_level}

    [Timeout]    180s
        # หน้า login #User Authentication
        #Verify
        SeleniumLibrary.Wait Until Element Is Visible    ${verify_header_locator}    60s    # User Authentication
        
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


PAGE REQUEST WAIVE - TYPE 06 - [CLICK] - LINK 
    ${link_system}    Common_keyword.REPLACE BY DATA EXCEL AND RETURN LOCATOR DATA GRID    ${link_system}    ${group_user}[${keys_group_user}[2]]   
    Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${link_system}     
    Common_keyword.CLICK ELEMENT BY LOCATOR    ${link_system}   

# wait update page 
PAGE REQUEST WAIVE - TYPE 06 - [WAIT] - [VERIFY] PAGE
    Common_keyword.WAITING FOR DATA UPDATE    1s    

PAGE REQUEST WAIVE - TYPE 06 - [CLICK] - [MENU]
    [Arguments]    ${menu} 
    ${locator_menu}    Common_keyword.REPLACE BY DATA EXCEL AND RETURN LOCATOR DATA GRID    ${menu_locator}    ${menu}
    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE    ${locator_menu}

PAGE REQUEST WAIVE - TYPE 06 - [CLICK] - [SUB MENU]
    [Arguments]    ${sub_menu} 
    ${locator_menu}    Common_keyword.REPLACE BY DATA EXCEL AND RETURN LOCATOR DATA GRID    ${sub_menu_locator}    ${sub_menu}
    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE    ${locator_menu}

# เลือก iframe
PAGE REQUEST WAIVE - TYPE 06 - [SELCET] - [FRAME] IFRAME
    Common_keyword.SELECT IFRAME    ${iframe_wo_locator}

# เลือก iframe
PAGE REQUEST WAIVE - TYPE 06 - [UNSELCET] - [FRAME] UNIFRAME
    Common_keyword.UNSELECT IFRAME   

# เลือก request type
PAGE REQUEST WAIVE - TYPE 06 - [SELCET] - [DROPDOWN] REQUEST TYPE
    Common_keyword.SELECT OPTION SELECT FROM LIST BY LABEL    ${sel_wo_request_type_locator}    ${group_user}[${keys_group_user}[1]]


#verify   
PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [LABEL] BUSINESS
    Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${lbl_wo_req_business}    5s          

PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [LABEL] CONTRACT NO 
    Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${lbl_wo_contract_no}    5s          

PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [LABEL] ID CARD 
    Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${lbl_wo_id_card}    5s       

# input 
PAGE REQUEST WAIVE - TYPE 06 - [INPUT] - [TEXT] ID CARD 
    Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE    ${req_id_card}    ${group_data}[${keys_group_data_label}[2]]         

PAGE REQUEST WAIVE - TYPE 06 - [SELECT] - [DROPDOWN] BUSINESS
    Common_keyword.SELECT OPTION SELECT FROM LIST BY LABEL    ${sel_req_business}    ${group_data}[${keys_group_data_label}[3]]     
  
PAGE REQUEST WAIVE - TYPE 06 - [INPUT] - [TEXT] CONTRACT NO  
    Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE    ${req_contract_no}    ${group_data}[${keys_group_data_label}[4]]       

# verify loading
PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [LOADING]
    Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${loading}    time_out=60s    


# Input data form 06 : Negotiation Special discount (WO)
PAGE REQUEST WAIVE - TYPE 06 - [INPUT] - NUMBER OF CHILD [06 : NEGOTIATION SPECIAL DISCOUNT (WO)]
    Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE    ${input_06_nsd_num_of_child_locator}    ${group_data}[${keys_group_data_label}[14]]


PAGE REQUEST WAIVE - TYPE 06 - [INPUT] - LAST SALARY [06 : NEGOTIATION SPECIAL DISCOUNT (WO)]
    Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE    ${input_06_nsd_last_salary_locator}    ${group_data}[${keys_group_data_label}[17]]


PAGE REQUEST WAIVE - TYPE 06 - [CLICK] - [DROPDOWN] - CUSTOMER STATUS [06 : NEGOTIATION SPECIAL DISCOUNT (WO)]
    Common_keyword.SELECT OPTION SELECT FROM LIST BY LABEL   ${dropdown_06_nsd_cust_status_locator}     ${group_data}[${keys_group_data_label}[19]]


#verify label 06 : Negotiation Special discount (WO)
PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE] - HERDER [06 : NEGOTIATION SPECIAL DISCOUNT (WO)]
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR AND EQUAL STRINGS    ${txt_header_06_header_locator}    ${group_user}[${keys_group_user}[1]]

PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE] - REQUEST TYPE [06 : NEGOTIATION SPECIAL DISCOUNT (WO)]
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR OPTIPON REPLACE AND EQUAL STRINGS    ${txt_title_06_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[1]]

PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE] - REQUEST NO. [06 : NEGOTIATION SPECIAL DISCOUNT (WO)]
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR OPTIPON REPLACE AND EQUAL STRINGS    ${txt_title_06_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[5]]
    
PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE] - REQUESTER [06 : NEGOTIATION SPECIAL DISCOUNT (WO)]
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR OPTIPON REPLACE AND EQUAL STRINGS    ${txt_title_06_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[8]]

PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE] - REQUEST DATE [06 : NEGOTIATION SPECIAL DISCOUNT (WO)]
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR OPTIPON REPLACE AND EQUAL STRINGS    ${txt_title_06_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[9]]

PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE] - CUSTOMER ID [06 : NEGOTIATION SPECIAL DISCOUNT (WO)]
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR OPTIPON REPLACE AND EQUAL STRINGS    ${txt_title_06_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[2]]

PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE] - CONTRACT NO [06 : NEGOTIATION SPECIAL DISCOUNT (WO)]
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR OPTIPON REPLACE AND EQUAL STRINGS    ${txt_title_06_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[4]]    

PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE] - CUSTOMER NAME [06 : NEGOTIATION SPECIAL DISCOUNT (WO)]
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR OPTIPON REPLACE AND EQUAL STRINGS    ${txt_title_06_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[10]]

PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE] - CALL CENTER [06 : NEGOTIATION SPECIAL DISCOUNT (WO)]
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR OPTIPON REPLACE AND EQUAL STRINGS    ${txt_title_06_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[11]]

PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE] - AGE [06 : NEGOTIATION SPECIAL DISCOUNT (WO)]
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR OPTIPON REPLACE AND EQUAL STRINGS    ${txt_title_06_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[12]]

PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE] - TEAM [06 : NEGOTIATION SPECIAL DISCOUNT (WO)]
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR OPTIPON REPLACE AND EQUAL STRINGS    ${txt_title_06_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[13]]

PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE] - NUMBER OF CHILD [06 : NEGOTIATION SPECIAL DISCOUNT (WO)]
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR OPTIPON REPLACE AND EQUAL STRINGS    ${txt_title_06_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[14]]

PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE] - OD STATUS [06 : NEGOTIATION SPECIAL DISCOUNT (WO)]
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR OPTIPON REPLACE AND EQUAL STRINGS    ${txt_title_06_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[16]]

PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE] - LAST SALARY [06 : NEGOTIATION SPECIAL DISCOUNT (WO)]
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR OPTIPON REPLACE AND EQUAL STRINGS    ${txt_title_06_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[17]]

PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE] - CONTRACT TYPE [06 : NEGOTIATION SPECIAL DISCOUNT (WO)]
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR OPTIPON REPLACE AND EQUAL STRINGS    ${txt_title_06_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[18]]

PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE] - CUSTOMER STATUS [06 : NEGOTIATION SPECIAL DISCOUNT (WO)]
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR OPTIPON REPLACE AND EQUAL STRINGS    ${txt_title_06_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[19]]

PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE] - CONTRACT DATE [06 : NEGOTIATION SPECIAL DISCOUNT (WO)]
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR OPTIPON REPLACE AND EQUAL STRINGS    ${txt_title_06_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[20]]

PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE] - BUSINESS [06 : NEGOTIATION SPECIAL DISCOUNT (WO)]
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR OPTIPON REPLACE AND EQUAL STRINGS    ${txt_title_06_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[3]]

PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE] - WO DATE [06 : NEGOTIATION SPECIAL DISCOUNT (WO)]
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR OPTIPON REPLACE AND EQUAL STRINGS    ${txt_title_06_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[21]]

PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE] - CONTRACT STATUS [06 : NEGOTIATION SPECIAL DISCOUNT (WO)]
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR OPTIPON REPLACE AND EQUAL STRINGS    ${txt_title_06_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[22]]

PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE] - TIME OF PAYMENT [06 : NEGOTIATION SPECIAL DISCOUNT (WO)]
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR OPTIPON REPLACE AND EQUAL STRINGS    ${txt_title_06_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[23]]

PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE] - DUE [06 : NEGOTIATION SPECIAL DISCOUNT (WO)]
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR OPTIPON REPLACE AND EQUAL STRINGS    ${txt_title_06_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[24]]

PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE] - TIMES OF PENALTY [06 : NEGOTIATION SPECIAL DISCOUNT (WO)]
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR OPTIPON REPLACE AND EQUAL STRINGS    ${txt_title_06_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[25]]

PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE] - REQUEST TIMES [06 : NEGOTIATION SPECIAL DISCOUNT (WO)]
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR OPTIPON REPLACE AND EQUAL STRINGS    ${txt_title_06_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[26]]

PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE] - LAST REQUEST NO [06 : NEGOTIATION SPECIAL DISCOUNT (WO)]
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR OPTIPON REPLACE AND EQUAL STRINGS    ${txt_title_06_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[27]]

PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE] - MINIMUM/INSTALL: [06 : NEGOTIATION SPECIAL DISCOUNT (WO)]
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR OPTIPON REPLACE AND EQUAL STRINGS    ${txt_title_06_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[28]]



# Verify data 06 : Negotiation Special discount (WO)
PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [VALUE] - REQUEST TYPE [06 : NEGOTIATION SPECIAL DISCOUNT (WO)]
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR STRIP AND EQUAL STRINGS    ${txt_value_06_nsd_request_type_locator}     ${group_data}[${keys_group_data_label}[1]]

PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [VALUE] - REQUEST NO. [06 : NEGOTIATION SPECIAL DISCOUNT (WO)]
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR STRIP AND EQUAL STRINGS    ${txt_value_06_nsd_request_no_locator}     ${group_data}[${keys_group_data_label}[5]]
    
PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [VALUE] - REQUESTER [06 : NEGOTIATION SPECIAL DISCOUNT (WO)]
    Common_keyword.GET VALUE PAGE CONTAINS ELEMENT BY LOCATOR AND EQUAL STRINGS    ${txt_value_06_nsd_requester_locator}     ${group_data}[${keys_group_data_label}[8]]    

PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [VALUE] - REQUEST DATE [06 : NEGOTIATION SPECIAL DISCOUNT (WO)]
    BuiltIn.Log    ${group_data}[${keys_group_data_label}[9]]    WARN
    ${con_date}    Common_keyword.CONVERT DATE FORMAT    ${group_data}[${keys_group_data_label}[9]]
    BuiltIn.Log    ${con_date}    WARN
    # Common_keyword.GET VALUE PAGE CONTAINS ELEMENT BY LOCATOR AND EQUAL STRINGS    ${txt_value_06_nsd_request_date_locator}    ${con_date}

PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [VALUE] - CUSTOMER ID [06 : NEGOTIATION SPECIAL DISCOUNT (WO)]
    Common_keyword.GET VALUE PAGE CONTAINS ELEMENT BY LOCATOR AND EQUAL STRINGS    ${txt_value_06_nsd_cust_id_locator}     ${group_data}[${keys_group_data_label}[2]]    

PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [VALUE] - CONTRACT NO [06 : NEGOTIATION SPECIAL DISCOUNT (WO)]
    Common_keyword.GET VALUE PAGE CONTAINS ELEMENT BY LOCATOR AND EQUAL STRINGS    ${txt_value_06_nsd_contract_no_locator}     ${group_data}[${keys_group_data_label}[4]]    

PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [VALUE] - CUSTOMER NAME [06 : NEGOTIATION SPECIAL DISCOUNT (WO)]
    Common_keyword.GET VALUE PAGE CONTAINS ELEMENT BY LOCATOR AND EQUAL STRINGS    ${txt_value_06_nsd_cust_name_locator}     ${group_data}[${keys_group_data_label}[10]]    
    
PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [VALUE] - CALL CENTER [06 : NEGOTIATION SPECIAL DISCOUNT (WO)]
    Common_keyword.GET VALUE PAGE CONTAINS ELEMENT BY LOCATOR AND EQUAL STRINGS    ${txt_value_06_nsd_call_center_locator}     ${group_data}[${keys_group_data_label}[11]]    

PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [VALUE] - AGE [06 : NEGOTIATION SPECIAL DISCOUNT (WO)]
    Common_keyword.GET VALUE PAGE CONTAINS ELEMENT BY LOCATOR AND EQUAL STRINGS    ${txt_value_06_nsd_age_locator}     ${group_data}[${keys_group_data_label}[12]]    

PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [VALUE] - TEAM [06 : NEGOTIATION SPECIAL DISCOUNT (WO)]
    Common_keyword.GET VALUE PAGE CONTAINS ELEMENT BY LOCATOR AND EQUAL STRINGS    ${txt_value_06_nsd_team_locator}     ${group_data}[${keys_group_data_label}[13]]    

PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [VALUE] - OD STATUS [06 : NEGOTIATION SPECIAL DISCOUNT (WO)]
    Common_keyword.GET VALUE PAGE CONTAINS ELEMENT BY LOCATOR AND EQUAL STRINGS    ${txt_value_06_nsd_od_status_locator}     ${group_data}[${keys_group_data_label}[16]]    

PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [VALUE] - CONTRACT TYPE [06 : NEGOTIATION SPECIAL DISCOUNT (WO)]
    Common_keyword.GET VALUE PAGE CONTAINS ELEMENT BY LOCATOR AND EQUAL STRINGS    ${txt_value_06_nsd_contract_type_locator}     ${group_data}[${keys_group_data_label}[18]]    

PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [VALUE] - CONTRACT DATE [06 : NEGOTIATION SPECIAL DISCOUNT (WO)]    
    Common_keyword.GET VALUE PAGE CONTAINS ELEMENT BY LOCATOR AND EQUAL STRINGS    ${txt_value_06_nsd_contract_date_locator}     ${group_data}[${keys_group_data_label}[20]]    

PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [VALUE] - BUSINESS [06 : NEGOTIATION SPECIAL DISCOUNT (WO)]
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR STRIP AND EQUAL STRINGS    ${txt_value_06_nsd_biz_locator}     ${group_data}[${keys_group_data_label}[3]]

PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [VALUE] - WO DATE [06 : NEGOTIATION SPECIAL DISCOUNT (WO)]    
    Common_keyword.GET VALUE PAGE CONTAINS ELEMENT BY LOCATOR AND EQUAL STRINGS    ${txt_value_06_nsd_wo_date_locator}     ${group_data}[${keys_group_data_label}[21]]    

PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [VALUE] - CONTRACT STATUS [06 : NEGOTIATION SPECIAL DISCOUNT (WO)]
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR STRIP AND EQUAL STRINGS    ${txt_value_06_nsd_contract_status_locator}     ${group_data}[${keys_group_data_label}[22]]

PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [VALUE] - TIME OF PAYMENT [06 : NEGOTIATION SPECIAL DISCOUNT (WO)]
    Common_keyword.GET VALUE PAGE CONTAINS ELEMENT BY LOCATOR AND EQUAL STRINGS    ${txt_value_06_nsd_time_of_payment_locator}     ${group_data}[${keys_group_data_label}[23]]    

PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [VALUE] - DUE [06 : NEGOTIATION SPECIAL DISCOUNT (WO)]
    Common_keyword.GET VALUE PAGE CONTAINS ELEMENT BY LOCATOR AND EQUAL STRINGS    ${txt_value_06_nsd_due_locator}     ${group_data}[${keys_group_data_label}[24]]    

PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [VALUE] - TIMES OF PENALTY [06 : NEGOTIATION SPECIAL DISCOUNT (WO)]
    Common_keyword.GET VALUE PAGE CONTAINS ELEMENT BY LOCATOR AND EQUAL STRINGS    ${txt_value_06_nsd_time_of_penalty_locator}     ${group_data}[${keys_group_data_label}[25]]    

PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [VALUE] - REQUEST TIMES [06 : NEGOTIATION SPECIAL DISCOUNT (WO)]
    Common_keyword.GET VALUE PAGE CONTAINS ELEMENT BY LOCATOR AND EQUAL STRINGS    ${txt_value_06_nsd_req_time_locator}     ${group_data}[${keys_group_data_label}[26]]    

PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [VALUE] - MINIMUM/INSTALL: [06 : NEGOTIATION SPECIAL DISCOUNT (WO)]
    Common_keyword.GET VALUE PAGE CONTAINS ELEMENT BY LOCATOR AND EQUAL STRINGS    ${txt_value_06_nsd_min_install_locator}     ${group_data}[${keys_group_data_label}[28]]    


### Negotiate Detail ###
# Verify Title - Negotiate Detail - 1. Entry negotiate discount detail
PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE] - TOTALS TERM [NEGOTIATE DETAIL] - [1. ENTRY NEGOTIATE DISCOUNT DETAIL]
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_title_06_nd_format_locator}    ${group_data_label}[${keys_group_data_label}[29]]

PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE] - TOTALS PAID AMOUNT [NEGOTIATE DETAIL] - [1. ENTRY NEGOTIATE DISCOUNT DETAIL]
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_title_06_nd_format_locator}    ${group_data_label}[${keys_group_data_label}[30]]

PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE] - FIRST DUE DATE [NEGOTIATE DETAIL] - [1. ENTRY NEGOTIATE DISCOUNT DETAIL]
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_title_06_nd_format_locator}    ${group_data_label}[${keys_group_data_label}[31]]

PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE] - START CAL. DATE [NEGOTIATE DETAIL] - [1. ENTRY NEGOTIATE DISCOUNT DETAIL]
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_title_06_nd_format_locator}    ${group_data_label}[${keys_group_data_label}[32]]



# Input Data - Negotiate Detail - 1. Entry negotiate discount detail
PAGE REQUEST WAIVE - TYPE 06 - [INPUT] - TOTALS TERM [NEGOTIATE DETAIL] - [1. ENTRY NEGOTIATE DISCOUNT DETAIL]
    Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE    ${input_06_nd_totals_term_locator}    ${group_data}[${keys_group_data_label}[29]]

PAGE REQUEST WAIVE - TYPE 06 - [INPUT] - TOTALS PAID AMOUNT [NEGOTIATE DETAIL] - [1. ENTRY NEGOTIATE DISCOUNT DETAIL]
    Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE    ${input_06_nd_totals_paid_amt_locator}    ${group_data}[${keys_group_data_label}[30]]

PAGE REQUEST WAIVE - TYPE 06 - [DROPDOWN] - FIRST DUE DATE INDEX 2 [NEGOTIATE DETAIL] - [1. ENTRY NEGOTIATE DISCOUNT DETAIL]
    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE    ${dropdown_06_nd_f_due_date_locator}
    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE    ${dropdown_06_nd_f_due_date_index2_locator}
    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE    ${dropdown_06_nd_f_due_date_locator}


PAGE REQUEST WAIVE - TYPE 06 - [INPUT] - START CAL. DATE [NEGOTIATE DETAIL] - [1. ENTRY NEGOTIATE DISCOUNT DETAIL]
    BuiltIn.Log    >Date Form Excel>${group_data}[${keys_group_data_label}[32]]    WARN
    IF  '${group_data}[${keys_group_data_label}[32]]' == 'none'
        BuiltIn.Log    !!!! USING DATE IN SYSTEM !!!!    WARN
        SeleniumLibrary.Execute JavaScript    document.getElementById('${input_06_nd_js_start_cal_date_id}').value='${date_start_cal_date}';
    ELSE
        BuiltIn.Log    !!!! USING DATE IN EXCEL !!!!    WARN
        ${date_start_cal_date}    Common_keyword.CONVERT DATE FORMAT    ${group_data}[${keys_group_data_label}[32]]
        SeleniumLibrary.Execute JavaScript    document.getElementById('${input_06_nd_js_start_cal_date_id}').value='${date_start_cal_date}';
    END



PAGE REQUEST WAIVE - TYPE 06 - [CLICK] - [BUTTON] - SUBMIT
    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE    ${btn_06_nd_submit_locator}    15
    


# --------------------------------------------------------------------------
# WOScreen
# title 
PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE] - LOAN AMT OF CUSTOMER
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR    ${txt_value_wo_loan_amt_of_customer}    ${group_data_label}[${keys_group_data_label}[33]]

PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE] - LOAN AMT OF NEW CONTRACT
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR    ${txt_value_wo_loan_amt_of_new_contract}    ${group_data_label}[${keys_group_data_label}[34]]

PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE] - CONTRACT AMOUNT
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR    ${txt_value_wo_contract_amount}    ${group_data_label}[${keys_group_data_label}[35]]

PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE] - PAID TERM
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR    ${txt_value_wo_paid_term}    ${group_data_label}[${keys_group_data_label}[36]]

PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE] - RECEIVE BF WO (OLD CONT)
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR    ${txt_value_wo_receive_bf_wo_old_cont}    ${group_data_label}[${keys_group_data_label}[37]]

PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE] - RECEIVE BF WO (NEW CONT)
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR    ${txt_value_wo_receive_bf_wo_new_cont}    ${group_data_label}[${keys_group_data_label}[38]]

PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE] - OS BALANCE
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR    ${txt_value_wo_os_balance}    ${group_data_label}[${keys_group_data_label}[39]]

PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE] - OTHER
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR    ${txt_value_wo_other}    ${group_data_label}[${keys_group_data_label}[40]]

PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE] - WO BALANCE AS OF CLOSING
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR    ${txt_value_wo_wo_balance_as_of_closing}    ${group_data_label}[${keys_group_data_label}[41]]

PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE] - NEW WO BALANCE
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR    ${txt_value_wo_new_wo_balance}    ${group_data_label}[${keys_group_data_label}[42]]

PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE] - CUSTOMER WILL PAY
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR    ${txt_value_wo_customer_will_pay}    ${group_data_label}[${keys_group_data_label}[43]]

PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE] - RECEIVE AFTER WO
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR    ${txt_value_wo_receive_after_wo}    ${group_data_label}[${keys_group_data_label}[44]]

PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE] - DIFF AMOUNT
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR    ${txt_value_wo_diff_amount}    ${group_data_label}[${keys_group_data_label}[45]]

PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE] - OA COM
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR    ${txt_value_wo_oa_com}    ${group_data_label}[${keys_group_data_label}[46]]

PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE] - TOTALS RECEIVED
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR    ${txt_value_wo_totals_received}    ${group_data_label}[${keys_group_data_label}[47]]

PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE] - DIFF FROM LOAN AMOUNT
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR    ${txt_value_wo_diff_from_loan_amount}    ${group_data_label}[${keys_group_data_label}[48]]

PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE] - PERCENT DISCOUNT
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR    ${txt_value_wo_percent_discount}    ${group_data_label}[${keys_group_data_label}[49]]

PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE] - AFTER WO PERCENT DISCOUNT
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR    ${txt_value_wo_after_wo_percent_discount}    ${group_data_label}[${keys_group_data_label}[50]]

PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE] - NET RECEIVE ONLY OA
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR    ${txt_value_wo_net_receive_only_oa}    ${group_data_label}[${keys_group_data_label}[51]]


# value 
PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [VALUE] - LOAN AMT OF CUSTOMER
    Common_keyword.GET VALUE ELEMENT BY LOCATOR AND EQUAL STRINGS    ${value_wo_loan_amt_of_customer}    ${group_data}[${keys_group_data_label}[33]]
    Common_keyword.GET VALUE ELEMENT BY LOCATOR AND RETURN    ${value_wo_loan_amt_of_customer}    30s

PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [VALUE] - LOAN AMT OF NEW CONTRACT
    Common_keyword.GET VALUE ELEMENT BY LOCATOR AND EQUAL STRINGS    ${value_wo_loan_amt_of_new_contract}    ${group_data}[${keys_group_data_label}[34]]
    Common_keyword.GET VALUE ELEMENT BY LOCATOR AND RETURN    ${value_wo_loan_amt_of_new_contract}    30s

PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [VALUE] - CONTRACT AMOUNT
    Common_keyword.GET VALUE ELEMENT BY LOCATOR AND EQUAL STRINGS    ${value_wo_contract_amount}    ${group_data}[${keys_group_data_label}[35]]
    Common_keyword.GET VALUE ELEMENT BY LOCATOR AND RETURN    ${value_wo_contract_amount}    30s

PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [VALUE] - PAID TERM
    Common_keyword.GET VALUE ELEMENT BY LOCATOR AND EQUAL STRINGS    ${value_wo_paid_term}    ${group_data}[${keys_group_data_label}[36]]
    Common_keyword.GET VALUE ELEMENT BY LOCATOR AND RETURN    ${value_wo_paid_term}    30s

PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [VALUE] - RECEIVE BF WO OLD CONT
    Common_keyword.GET VALUE ELEMENT BY LOCATOR AND EQUAL STRINGS    ${value_wo_receive_bf_wo_old_cont}    ${group_data}[${keys_group_data_label}[37]]
    Common_keyword.GET VALUE ELEMENT BY LOCATOR AND RETURN    ${value_wo_receive_bf_wo_old_cont}    30s

PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [VALUE] - RECEIVE BF WO NEW CONT
    Common_keyword.GET VALUE ELEMENT BY LOCATOR AND EQUAL STRINGS    ${value_wo_receive_bf_wo_new_cont}    ${group_data}[${keys_group_data_label}[38]]
    Common_keyword.GET VALUE ELEMENT BY LOCATOR AND RETURN    ${value_wo_receive_bf_wo_new_cont}    30s

PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [VALUE] - OS BALANCE
    Common_keyword.GET VALUE ELEMENT BY LOCATOR AND EQUAL STRINGS    ${value_wo_os_balance}    ${group_data}[${keys_group_data_label}[39]]
    Common_keyword.GET VALUE ELEMENT BY LOCATOR AND RETURN    ${value_wo_os_balance}    30s

PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [VALUE] - OTHER
    Common_keyword.GET VALUE ELEMENT BY LOCATOR AND EQUAL STRINGS    ${value_wo_other}    ${group_data}[${keys_group_data_label}[40]]
    Common_keyword.GET VALUE ELEMENT BY LOCATOR AND RETURN    ${value_wo_other}    30s

PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [VALUE] - WO BALANCE AS OF CLOSING
    Common_keyword.GET VALUE ELEMENT BY LOCATOR AND EQUAL STRINGS    ${value_wo_wo_balance_as_of_closing}    ${group_data}[${keys_group_data_label}[41]]
    Common_keyword.GET VALUE ELEMENT BY LOCATOR AND RETURN    ${value_wo_wo_balance_as_of_closing}    30s

PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [VALUE] - NEW WO BALANCE
    Common_keyword.GET VALUE ELEMENT BY LOCATOR AND EQUAL STRINGS    ${value_wo_new_wo_balance}    ${group_data}[${keys_group_data_label}[42]]
    Common_keyword.GET VALUE ELEMENT BY LOCATOR AND RETURN    ${value_wo_new_wo_balance}    30s

PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [VALUE] - CUSTOMER WILL PAY
    Common_keyword.GET VALUE ELEMENT BY LOCATOR AND EQUAL STRINGS    ${value_wo_customer_will_pay}    ${group_data}[${keys_group_data_label}[43]]
    Common_keyword.GET VALUE ELEMENT BY LOCATOR AND RETURN    ${value_wo_customer_will_pay}    30s

PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [VALUE] - RECEIVE AFTER WO
    Common_keyword.GET VALUE ELEMENT BY LOCATOR AND EQUAL STRINGS    ${value_wo_receive_after_wo}    ${group_data}[${keys_group_data_label}[44]]
    Common_keyword.GET VALUE ELEMENT BY LOCATOR AND RETURN    ${value_wo_receive_after_wo}    30s

PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [VALUE] - DIFF AMOUNT
    Common_keyword.GET VALUE ELEMENT BY LOCATOR AND EQUAL STRINGS    ${value_wo_diff_amount}    ${group_data}[${keys_group_data_label}[45]]
    Common_keyword.GET VALUE ELEMENT BY LOCATOR AND RETURN    ${value_wo_diff_amount}    30s

PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [VALUE] - OA COM
    Common_keyword.GET VALUE ELEMENT BY LOCATOR AND EQUAL STRINGS    ${value_wo_oa_com}    ${group_data}[${keys_group_data_label}[46]]
    Common_keyword.GET VALUE ELEMENT BY LOCATOR AND RETURN    ${value_wo_oa_com}    30s

PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [VALUE] - TOTALS RECEIVED
    Common_keyword.GET VALUE ELEMENT BY LOCATOR AND EQUAL STRINGS    ${value_wo_totals_received}    ${group_data}[${keys_group_data_label}[47]]
    Common_keyword.GET VALUE ELEMENT BY LOCATOR AND RETURN    ${value_wo_totals_received}    30s

PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [VALUE] - DIFF FROM LOAN AMOUNT
    Common_keyword.GET VALUE ELEMENT BY LOCATOR AND EQUAL STRINGS    ${value_wo_diff_from_loan_amount}    ${group_data}[${keys_group_data_label}[48]]
    Common_keyword.GET VALUE ELEMENT BY LOCATOR AND RETURN    ${value_wo_diff_from_loan_amount}    30s

PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [VALUE] - PERCENT DISCOUNT
    Common_keyword.GET VALUE ELEMENT BY LOCATOR AND EQUAL STRINGS    ${value_wo_percent_discount}    ${group_data}[${keys_group_data_label}[49]]
    Common_keyword.GET VALUE ELEMENT BY LOCATOR AND RETURN    ${value_wo_percent_discount}    30s

PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [VALUE] - AFTER WO PERCENT DISCOUNT
    Common_keyword.GET VALUE ELEMENT BY LOCATOR AND EQUAL STRINGS    ${value_wo_after_wo_percent_discount}    ${group_data}[${keys_group_data_label}[50]]
    Common_keyword.GET VALUE ELEMENT BY LOCATOR AND RETURN    ${value_wo_after_wo_percent_discount}    30s

PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [VALUE] - NET RECEIVE ONLY OA
    Common_keyword.GET VALUE ELEMENT BY LOCATOR AND EQUAL STRINGS    ${value_wo_net_receive_only_oa}    ${group_data}[${keys_group_data_label}[51]]
    Common_keyword.GET VALUE ELEMENT BY LOCATOR AND RETURN    ${value_wo_net_receive_only_oa}    30s

# --------------------------------------------------------------------------

# Verify Title - 2. Entry detail by Term#, Time#
PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE] - TERM# [NEGOTIATE DETAIL] - [2. ENTRY DETAIL BY TERM#, TIME#]
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_title_06_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[52]]
    
PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE] - PAID DATE [NEGOTIATE DETAIL] - [2. ENTRY DETAIL BY TERM#, TIME#]
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_title_06_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[54]]

PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE] - PAID AMOUNT [NEGOTIATE DETAIL] - [2. ENTRY DETAIL BY TERM#, TIME#]
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_title_06_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[55]]



# Input Data - Negotiate Detail - 2. Entry detail by Term#, Time#
PAGE REQUEST WAIVE - TYPE 06 - [INPUT] - TERM# START - [2. ENTRY DETAIL BY TERM#, TIME#]
    Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE    ${input_06_nd_start_term_locator}    ${group_data}[${keys_group_data_label}[52]]


PAGE REQUEST WAIVE - TYPE 06 - [INPUT] - TERM# END - [2. ENTRY DETAIL BY TERM#, TIME#]
    Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE    ${input_06_nd_end_term_locator}    ${group_data}[${keys_group_data_label}[53]]


PAGE REQUEST WAIVE - TYPE 06 - [INPUT] - PAID DATE - [2. ENTRY DETAIL BY TERM#, TIME#]
    BuiltIn.Log    >Date Form Excel>${group_data}[${keys_group_data_label}[54]]    WARN
    BuiltIn.Log    >Date>${date_paid_date}    WARN
    IF  '${group_data}[${keys_group_data_label}[54]]' == 'none'
        BuiltIn.Log    !!!! USING DATE IN SYSTEM !!!!    WARN
        SeleniumLibrary.Execute JavaScript    document.getElementById('${input_06_nd_js_paid_date_id}').value='${date_paid_date}';
    ELSE
        BuiltIn.Log    !!!! USING DATE IN EXCEL !!!!    WARN
        ${date_start_cal_date}    Common_keyword.CONVERT DATE FORMAT    ${group_data}[${keys_group_data_label}[54]]
        SeleniumLibrary.Execute JavaScript    document.getElementById('${input_06_nd_js_paid_date_id}').value='${date_paid_date}';
    END


    
PAGE REQUEST WAIVE - TYPE 06 - [INPUT] - PAID AMOUNT - [2. ENTRY DETAIL BY TERM#, TIME#]
    Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE    ${input_06_nd_paid_amt_locator}    ${group_data}[${keys_group_data_label}[55]]

PAGE REQUEST WAIVE - TYPE 06 - [CLICK] - [BUTTON] - ADD [2. ENTRY DETAIL BY TERM#, TIME#]
    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE    ${btn_06_nd_2_add_locator}    15



# Verify Title Table - 2. Entry detail by Term#, Time#
PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE][TABLE] - NO [NEGOTIATE DETAIL] - [2. ENTRY DETAIL BY TERM#, TIME#]
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_title_06_nd_2_format_locator}    ${group_data_label}[${keys_group_data_label}[56]]

PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE][TABLE] - TERM# [NEGOTIATE DETAIL] - [2. ENTRY DETAIL BY TERM#, TIME#]
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_title_06_nd_2_format_locator}    ${group_data_label}[${keys_group_data_label}[57]]

PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE][TABLE] - MIN DUE DATE [NEGOTIATE DETAIL] - [2. ENTRY DETAIL BY TERM#, TIME#]
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_title_06_nd_2_format_locator}    ${group_data_label}[${keys_group_data_label}[58]]

PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE][TABLE] - MAX DUE DATE [NEGOTIATE DETAIL] - [2. ENTRY DETAIL BY TERM#, TIME#]
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_title_06_nd_2_format_locator}    ${group_data_label}[${keys_group_data_label}[59]]

PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE][TABLE] - TIME# [NEGOTIATE DETAIL] - [2. ENTRY DETAIL BY TERM#, TIME#]
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_title_06_nd_2_format_locator}    ${group_data_label}[${keys_group_data_label}[60]]

PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE][TABLE] - PAID DATE [NEGOTIATE DETAIL] - [2. ENTRY DETAIL BY TERM#, TIME#]
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_title_06_nd_2_format_locator}    ${group_data_label}[${keys_group_data_label}[61]]

PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE][TABLE] - PAID AMOUNT [NEGOTIATE DETAIL] - [2. ENTRY DETAIL BY TERM#, TIME#]
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_title_06_nd_2_format_locator}    ${group_data_label}[${keys_group_data_label}[62]]

PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE][TABLE] - DELETE [NEGOTIATE DETAIL] - [2. ENTRY DETAIL BY TERM#, TIME#]
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_title_06_nd_2_format_locator}    ${group_data_label}[${keys_group_data_label}[63]]



# Verify Value Table - 2. Entry detail by Term#, Time#
PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [VALUE][TABLE] - TOTAL TERM [NEGOTIATE DETAIL] - [2. ENTRY DETAIL BY TERM#, TIME#]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL    ${txt_value_06_nd_2_total_team_locator}     ${group_data}[${keys_group_data_label}[64]]

PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [VALUE][TABLE] - TOTAL PAID AMOUNT [NEGOTIATE DETAIL] - [2. ENTRY DETAIL BY TERM#, TIME#]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL    ${txt_value_06_nd_2_total_paid_amount_locator}     ${group_data}[${keys_group_data_label}[65]]



# Verify Title - 3.1 Entry other debt
PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE] - OTHER DEBT [NEGOTIATE DETAIL] - [3.1 ENTRY OTHER DEBT]
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_title_06_nd_format_locator}    ${group_data_label}[${keys_group_data_label}[66]]

PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE] - AMOUNT [NEGOTIATE DETAIL] - [3.1 ENTRY OTHER DEBT]
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_title_06_nd_format_locator}    ${group_data_label}[${keys_group_data_label}[67]]



# Input Data - Negotiate Detail - 3.1 Entry other debt
PAGE REQUEST WAIVE - TYPE 06 - [INPUT] - OTHER DEBT - [3.1 ENTRY OTHER DEBT]
    Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE    ${input_06_nd_other_debt_locator}    ${group_data}[${keys_group_data_label}[69]]

PAGE REQUEST WAIVE - TYPE 06 - [INPUT] - AMOUNT - [3.1 ENTRY OTHER DEBT]
    Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE    ${input_06_nd_amt_locator}    ${group_data}[${keys_group_data_label}[70]]

PAGE REQUEST WAIVE - TYPE 06 - [CLICK] - [BUTTON] - ADD [3.1 ENTRY OTHER DEBT]
    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE    ${btn_06_nd_3_1_add_locator}    15



# Verify Title Table - 3.1 Entry other debt
PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE][TABLE] - NO [NEGOTIATE DETAIL] - [3.1 ENTRY OTHER DEBT]
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_title_06_nd_3_1_format_locator}    ${group_data_label}[${keys_group_data_label}[68]]

PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE][TABLE] - OTHER DEBT [NEGOTIATE DETAIL] - [3.1 ENTRY OTHER DEBT]
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_title_06_nd_3_1_format_locator}    ${group_data_label}[${keys_group_data_label}[69]]

PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE][TABLE] - AMOUNT [NEGOTIATE DETAIL] - [3.1 ENTRY OTHER DEBT]
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_title_06_nd_3_1_format_locator}    ${group_data_label}[${keys_group_data_label}[70]]

PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE][TABLE] - DELETE [NEGOTIATE DETAIL] - [3.1 ENTRY OTHER DEBT]
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_title_06_nd_3_1_format_locator}    ${group_data_label}[${keys_group_data_label}[71]]



# Verify Value Table - 3.1 Entry other debt
PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [VALUE][TABLE] - TOTAL AMOUNT [NEGOTIATE DETAIL] - [3.1 ENTRY OTHER DEBT]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL    ${txt_value_06_nd_3_1_total_amount_locator}     ${group_data}[${keys_group_data_label}[72]]


# Verify Title - 3.2 Entry other ...
PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE] - LAST CONTACT THIRD PARTY [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_title_06_nd_format_locator}    ${group_data_label}[${keys_group_data_label}[73]]

PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE] - LAST CONTACT CUSTOMER [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_title_06_nd_format_locator}    ${group_data_label}[${keys_group_data_label}[74]]

PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE] - HAVE JOB [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_title_06_nd_format_locator}    ${group_data_label}[${keys_group_data_label}[75]]

PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE] - WHO REQUEST [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_title_06_nd_format_locator}    ${group_data_label}[${keys_group_data_label}[76]]

PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE] - DISCOUNT CAMPAIGN [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_title_06_nd_format_locator}    ${group_data_label}[${keys_group_data_label}[77]]

PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE] - WHO PAID [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_title_06_nd_format_locator}    ${group_data_label}[${keys_group_data_label}[78]]

PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE] - SOURCE OF FUND [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_title_06_nd_format_locator}    ${group_data_label}[${keys_group_data_label}[79]]

PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE] - REASON [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_title_06_nd_format_locator}    ${group_data_label}[${keys_group_data_label}[80]]

PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE] - REASON NOTE [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_title_06_nd_format_locator}    ${group_data_label}[${keys_group_data_label}[81]]

PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE] - NOTE [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_title_06_nd_format_locator}    ${group_data_label}[${keys_group_data_label}[86]]



# Input Data - Negotiate Detail - 3.2 Entry other ...   
PAGE REQUEST WAIVE - TYPE 06 - [INPUT] - LAST CONTACT THIRD PARTY [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    BuiltIn.Log    >Date Form Excel>${group_data}[${keys_group_data_label}[73]]    WARN
    IF  '${group_data}[${keys_group_data_label}[73]]' == 'none'
        BuiltIn.Log    !!!! USING DATE IN SYSTEM !!!!    WARN
        SeleniumLibrary.Execute JavaScript    document.getElementById('${input_06_nd_js_last_cont_3_party_id}').value='${date_start_cal_date}';
    ELSE
        BuiltIn.Log    !!!! USING DATE IN EXCEL !!!!    WARN
        ${date_start_cal_date}    Common_keyword.CONVERT DATE FORMAT    ${group_data}[${keys_group_data_label}[73]]
        SeleniumLibrary.Execute JavaScript    document.getElementById('${input_06_nd_js_last_cont_3_party_id}').value='${date_start_cal_date}';
    END


PAGE REQUEST WAIVE - TYPE 06 - [INPUT] - LAST CONTACT CUSTOMER [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    BuiltIn.Log    >Date Form Excel>${group_data}[${keys_group_data_label}[74]]    WARN
    IF  '${group_data}[${keys_group_data_label}[74]]' == 'none'
        BuiltIn.Log    !!!! USING DATE IN SYSTEM !!!!    WARN
        SeleniumLibrary.Execute JavaScript    document.getElementById('${input_06_nd_js_last_cont_cust_id}').value='${date_start_cal_date}';
    ELSE
        BuiltIn.Log    !!!! USING DATE IN EXCEL !!!!    WARN
        ${date_start_cal_date}    Common_keyword.CONVERT DATE FORMAT    ${group_data}[${keys_group_data_label}[74]]
        SeleniumLibrary.Execute JavaScript    document.getElementById('${input_06_nd_js_last_cont_cust_id}').value='${date_start_cal_date}';
    END


PAGE REQUEST WAIVE - TYPE 06 - [INPUT] - HAVE JOB [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    ${data_}    BuiltIn.Set Variable    ${group_data}[${keys_group_data_label}[75]]    
    IF  '${data_}' == 'Yes'
        Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE CHECKBOX    ${input_06_nd_have_job_yes_locator}
    ELSE IF  '${data_}' == 'No'
        Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE CHECKBOX    ${input_06_nd_have_job_no_locator}
    END

PAGE REQUEST WAIVE - TYPE 06 - [INPUT] - WHO REQUEST [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    Common_keyword.SELECT OPTION SELECT FROM LIST BY LABEL   ${select_06_nd_who_req_locator}     ${group_data}[${keys_group_data_label}[76]]

PAGE REQUEST WAIVE - TYPE 06 - [INPUT] - DISCOUNT CAMPAIGN [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    Common_keyword.SELECT OPTION SELECT FROM LIST BY LABEL   ${select_06_nd_discount_camp_locator}     ${group_data}[${keys_group_data_label}[77]]

PAGE REQUEST WAIVE - TYPE 06 - [INPUT] - WHO PAID [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    Common_keyword.SELECT OPTION SELECT FROM LIST BY LABEL   ${select_06_nd_who_paid_locator}     ${group_data}[${keys_group_data_label}[78]]

PAGE REQUEST WAIVE - TYPE 06 - [INPUT] - SOURCE OF FUND [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    Common_keyword.SELECT OPTION SELECT FROM LIST BY LABEL   ${select_06_nd_source_fund__locator}     ${group_data}[${keys_group_data_label}[79]]

PAGE REQUEST WAIVE - TYPE 06 - [INPUT] - REASON [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    Common_keyword.SELECT OPTION SELECT FROM LIST BY LABEL   ${select_06_nd_reason_locator}     ${group_data}[${keys_group_data_label}[80]]

PAGE REQUEST WAIVE - TYPE 06 - [INPUT] - REASON NOTE [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE    ${input_06_nd_reason_note_locator}    ${group_data}[${keys_group_data_label}[81]]

PAGE REQUEST WAIVE - TYPE 06 - [INPUT] - NOTE [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE    ${input_06_nd_note_locator}    ${group_data}[${keys_group_data_label}[86]]


PAGE REQUEST WAIVE - TYPE 06 - [DROPDOWN] - SEND TO [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
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


# btn approve
PAGE REQUEST WAIVE - TYPE 06 - [CLICK] - [BTN] APPROVE
    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE    ${btn_approve}    

# verify title popup
PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [TITLE] APPROVE 
    Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR     ${verfiy_approve_popup}    

PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [POPUP] APPROVE - [CLICK] OK
    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE     ${btn_ok_approve_popup}    

PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [POPUP] APPROVE - [CLICK] CANCEL
    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE     ${btn_cancel_approve_popup}    


# get requst no save to excel
PAGE REQUEST WAIVE - TYPE 06 - [GET] - [DATA] REQUEST NO - [SAVE] EXCEL
    
    # wait finish loading..
    PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [LOADING]

    ${state}    Common_keyword.RUN KEYWORD AND IGNORE ERROR WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR     ${table_manager_locator}    60s
    BuiltIn.Log    STATE SAVE->${state}    WARN

    IF  '${state}' == 'True'    # ถ้าเจอ
        ${point}    BuiltIn.Evaluate    1
        BuiltIn.Set Global Variable    ${point}
        Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${title_system_cancel_req_locator}    5s        # makesure title is true
        Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${txt_request_no}    5s                         # get req No to save
        ${result_request_no}=    Common_keyword.GET VALUE PAGE CONTAINS ELEMENT BY LOCATOR AND STRIP AND NOT CHECK EQUAL AND RETURN    ${txt_request_no}
        BuiltIn.Log    REQ_NO_SAVE->${result_request_no}    WARN
        BuiltIn.Set Global Variable    ${result_request_no}

    ELSE IF  '${state}' == 'False'    # ถ้าไม่เจอ
        ${point}    BuiltIn.Evaluate    0
        BuiltIn.Set Global Variable    ${point}
        Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${title_system_req_locator}    5s               # verify table before title -> Request
        Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${txt_error}    5s 
        ${msgerror}    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR NO SPLIT    ${txt_error}  
        BuiltIn.Log    MSG ERROR->${msgerror}    WARN
        ${result_request_no}    BuiltIn.Set Variable    ${msgerror}    
        BuiltIn.Set Global Variable    ${result_request_no}

    END

# btn back 
PAGE REQUEST WAIVE - TYPE 06 - [CLICK] - [BTN] BACK
    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE     ${btn_back}    10s

# logout
PAGE REQUEST WAIVE - TYPE 06 - [CLICK] - [BTN] LOGOUT
    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE     ${btn_signout}    10s    


