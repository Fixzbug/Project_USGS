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


# set globle for debug
${DBUG}

*** Keywords ***

SET FORMAT DATA TYPE 09 - WRITE
    [Arguments]    ${row}    ${start_at_case}    ${end_at_case}
    ${countrow}=    BuiltIn.Set Variable If    ${end_at_case} <= ${data_count_row}    ${end_at_case}    ${data_count_row}
    
    ${count}    BuiltIn.Evaluate    0    # set count error start at zero
    BuiltIn.Set Global Variable    ${count} 

    FOR  ${index}  IN RANGE    ${start_at_case}    ${countrow} + 1  
        ${result_excel}    JSONLibrary.Get Value From Json    ${data_from_excel_by_sheet}    $[?(@.TC == '${row}_${index}')]
        ${group_data}=    BuiltIn.Set Variable   ${result_excel}[0]
        BuiltIn.Set Global Variable    ${group_data}

        ${Request_No}    BuiltIn.Set Variable    '${group_data}[${keys_group_data_label}[5]]'    #'${group_data}[Request No.]'     # get case   สำหรับเช็ค  
        ${State}    BuiltIn.Set Variable    '${group_data}[${keys_group_data_label}[6]]'         #'${group_data}[State]'           # get case   สำหรับเช็ค 


        IF  ${Request_No} == 'none' and ${State} == 'none'                                   # none, none -> make
                            
            ${Rows}    BuiltIn.Evaluate    ${index} + 2                                      # +2 because add title at row 2 
            BuiltIn.Set Global Variable    ${Rows}   
            BuiltIn.Log    ----------------------------------------    WARN 
            BuiltIn.Log    CONATRACT->ROW->${Rows}:${row}_${index}    WARN
            BuiltIn.Log    ----------------------------------------    WARN
        
            # input Contract no, ID card, business
            Request_waive_09_feature.SET FEATURE - TYPE - 09 - INPUT CRITERIA SEARCH - REQUEST TYPE - PAGE REQUEST WAIVE

            # click aprrove
            Request_waive_09_feature.SET FEATURE - TYPE - 09 - CLICK - APPROVE - PAGE REQUEST WAIVE
            
            # get data from web before run
            ${value_cust_name_locator}    Common_keyword.GET VALUE PAGE CONTAINS ELEMENT BY LOCATOR AND STRIP AND NOT CHECK EQUAL AND RETURN    ${txt_value_09_nsd_cust_name_locator}
            ${value_call_center}    Common_keyword.GET VALUE PAGE CONTAINS ELEMENT BY LOCATOR AND STRIP AND NOT CHECK EQUAL AND RETURN    ${txt_value_09_nsd_call_center_locator}
            ${value_age}    Common_keyword.GET VALUE PAGE CONTAINS ELEMENT BY LOCATOR AND STRIP AND NOT CHECK EQUAL AND RETURN    ${txt_value_09_nsd_age_locator}
            ${value_team}    Common_keyword.GET VALUE PAGE CONTAINS ELEMENT BY LOCATOR AND STRIP AND NOT CHECK EQUAL AND RETURN    ${txt_value_09_nsd_team_locator}
            ${value_time_of_payment}    Common_keyword.GET VALUE PAGE CONTAINS ELEMENT BY LOCATOR AND STRIP AND NOT CHECK EQUAL AND RETURN    ${txt_value_09_nsd_time_of_payment_locator}
            ${value_due}    Common_keyword.GET VALUE PAGE CONTAINS ELEMENT BY LOCATOR AND STRIP AND NOT CHECK EQUAL AND RETURN    ${txt_value_09_nsd_due_locator}

            IF  '${value_cust_name_locator}' != 'none' and '${value_call_center}' != 'none' and '${value_age}' != 'none' and '${value_team}' != 'none' and '${value_time_of_payment}' != 'none' and '${value_due}' != 'none' 
                Common_feature.SET - DATA TO EXCEL    excel_name=${Excel_name}    sheet_name=${type_09}    row=${Rows}    column=11    data=${value_cust_name_locator} 
                Common_feature.SET - DATA TO EXCEL    excel_name=${Excel_name}    sheet_name=${type_09}    row=${Rows}    column=12    data=${value_call_center}  
                Common_feature.SET - DATA TO EXCEL    excel_name=${Excel_name}    sheet_name=${type_09}    row=${Rows}    column=13    data=${value_age}  
                Common_feature.SET - DATA TO EXCEL    excel_name=${Excel_name}    sheet_name=${type_09}    row=${Rows}    column=14    data=${value_team}    
                Common_feature.SET - DATA TO EXCEL    excel_name=${Excel_name}    sheet_name=${type_09}    row=${Rows}    column=24    data=${value_time_of_payment}  
                Common_feature.SET - DATA TO EXCEL    excel_name=${Excel_name}    sheet_name=${type_09}    row=${Rows}    column=25    data=${value_due}  
                Common_feature.SET - DATA TO EXCEL    excel_name=${Excel_name}    sheet_name=${type_09}    row=${Rows}    column=9    data=${group_user}[${keys_group_user}[3]]    #P2503064  
                Common_feature.SET - DATA TO EXCEL    excel_name=${Excel_name}    sheet_name=${type_09}    row=${Rows}    column=89    data=${group_user}[${keys_group_user}[3]]    #P2503064  
                Common_feature.SET - DATA TO EXCEL    excel_name=${Excel_name}    sheet_name=${type_09}    row=${Rows}    column=93    data=${group_user}[${keys_group_user}[3]]    #P2503064
            ELSE
                Common_feature.SET - DATA TO EXCEL    excel_name=${Excel_name}    sheet_name=${type_09}    row=${Rows}    column=6    data=FAIL
                Common_feature.SET - DATA TO EXCEL    excel_name=${Excel_name}    sheet_name=${type_09}    row=${Rows}    column=7    data=FAIL
            END  

            BuiltIn.Exit For Loop
         
        END

    END

SET FORMAT DATA TYPE 09 - USING
    [Arguments]    ${row}    ${start_at_case}    ${end_at_case}    ${user_level}
    ${countrow}=    BuiltIn.Set Variable If    ${end_at_case} <= ${data_count_row}    ${end_at_case}    ${data_count_row}
    
    ${count}    BuiltIn.Evaluate    0    # set count error start at zero
    BuiltIn.Set Global Variable    ${count} 

    FOR  ${index}  IN RANGE    ${start_at_case}    ${countrow} + 1  
        ${result_excel}    JSONLibrary.Get Value From Json    ${data_from_excel_by_sheet}    $[?(@.TC == '${row}_${index}')]
        ${group_data}=    BuiltIn.Set Variable   ${result_excel}[0]
        BuiltIn.Set Global Variable    ${group_data}

        ${Request_No}    BuiltIn.Set Variable    '${group_data}[${keys_group_data_label}[5]]'    #'${group_data}[Request No.]'     # get case   สำหรับเช็ค  
        ${State}    BuiltIn.Set Variable    '${group_data}[${keys_group_data_label}[6]]'         #'${group_data}[State]'           # get case   สำหรับเช็ค 


        IF  '${point}' == '0' and '${count}' == '3'    # case point = 0 mean error and counter fail 3 time just Break
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
        
            # input Contract no, ID card, business
            Request_waive_09_feature.SET FEATURE - TYPE - 09 - INPUT CRITERIA SEARCH - REQUEST TYPE - PAGE REQUEST WAIVE

            # click aprrove
            Request_waive_09_feature.SET FEATURE - TYPE - 09 - CLICK - APPROVE - PAGE REQUEST WAIVE
            

            # 06 : Negotiation Special discount (Fraud)
            # Input Data - 06 : Negotiation Special discount (Fraud)
            Request_waive_09_feature.SET FEATURE - TYPE - 09 - INPUT DATA - PAGE REQUEST WAIVE [09 : NEGOTIATION SPECIAL DISCOUNT (Fraud)]

            #  Verify Title - 06 : Negotiation Special discount (Fraud)
            Request_waive_09_feature.SET FEATURE - TYPE - 09 - VERIFY - REQUEST PAGE - PAGE REQUEST WAIVE    

            #  Verify data - 06 : Negotiation Special discount (Fraud)
            Request_waive_09_feature.SET FEATURE - TYPE - 09 - VERIFY - DATA REQUEST PAGE - PAGE REQUEST WAIVE    

        
            # Negotiate Detail
            # 1. Entry negotiate discount detail
            # Verify Title - Negotiate Detail - 1. Entry negotiate discount detail
            Request_waive_09_feature.SET FEATURE - TYPE - 09 - DATA TITLE - PAGE REQUEST WAIVE [NEGOTIATE DETAIL] - [1. ENTRY NEGOTIATE DISCOUNT DETAIL]

            # Input Data - Negotiate Detail - 1. Entry negotiate discount detail
            Request_waive_09_feature.SET FEATURE - TYPE - 09 - INPUT DATA - PAGE REQUEST WAIVE [NEGOTIATE DETAIL] - [1. ENTRY NEGOTIATE DISCOUNT DETAIL]
            
            # Click submit
            Request_waive_09_feature.SET FEATURE - TYPE - 09 - SUBMIT - PAGE REQUEST WAIVE [NEGOTIATE DETAIL] - [1. ENTRY NEGOTIATE DISCOUNT DETAIL]
            
            # รอ page loading
            # BuiltIn.Run Keyword And Continue On Failure    PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [LOADING]

            # wait value dis play makesure
            ${is_disabled}    Common_keyword.WAIT FOR BUTTON TO BE DISABLED    ${btn_09_nd_submit_locator}    timeout=60s
            BuiltIn.Log    Display(Fraud SCREEN)->${is_disabled}    WARN

            ${data}    Common_keyword.GET VALUE ELEMENT BY LOCATOR AND RETURN    ${value_fraud_diff_from_wo}    timeout=60s          
            BuiltIn.Log To Console    '\nLast Value Table Fraud Screen->${data}

            IF  '${is_disabled}' == 'True' and '${data}' != 'none'
            
                # --------------------------------------------------------------------------
                # (Fraud)

                # verify title                
                Request_waive_09_feature.SET FEATURE - TYPE - 09 - DATA TITLE - PAGE REQUEST WAIVE [NEGOTIATE DETAIL] - [ODSCREEN]
                
                # verify value
                Request_waive_09_feature.SET FEATURE - TYPE - 09 - DATA VALUE - PAGE REQUEST WAIVE [NEGOTIATE DETAIL] - [ODSCREEN]

                # --------------------------------------------------------------------------

                # 2. Entry detail by Term#, Time#
                # Verify Title - 2. Entry detail by Term#, Time#
                Request_waive_09_feature.SET FEATURE - TYPE - 09 - DATA TITLE - PAGE REQUEST WAIVE [NEGOTIATE DETAIL] - [2. ENTRY DETAIL BY TERM#, TIME#]

                # Input Data - Negotiate Detail - 2. Entry detail by Term#, Time#
                Request_waive_09_feature.SET FEATURE - TYPE - 09 - INPUT DATA - PAGE REQUEST WAIVE [NEGOTIATE DETAIL] - [2. ENTRY DETAIL BY TERM#, TIME#]
                
                # Click add
                Request_waive_09_feature.SET FEATURE - TYPE - 09 - ADD - PAGE REQUEST WAIVE [NEGOTIATE DETAIL] - [2. ENTRY DETAIL BY TERM#, TIME#]
                
                # รอ page loading
                # BuiltIn.Run Keyword And Continue On Failure    PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [LOADING]
                
                # table
                # Verify Title Table - 2. Entry detail by Term#, Time#
                Request_waive_09_feature.SET FEATURE - TYPE - 09 - DATA TITLE TABLE - PAGE REQUEST WAIVE [NEGOTIATE DETAIL] - [2. ENTRY DETAIL BY TERM#, TIME#]

                # Verify Value Table - 2. Entry detail by Term#, Time#
                Request_waive_09_feature.SET FEATURE - TYPE - 09 - DATA VALUE TABLE - PAGE REQUEST WAIVE [NEGOTIATE DETAIL] - [2. ENTRY DETAIL BY TERM#, TIME#]
            

                # 3. Entry request detail
                # 3.1 Entry other debt
                # Verify Title - 3.1 Entry other debt
                Request_waive_09_feature.SET FEATURE - TYPE - 09 - DATA TITLE - PAGE REQUEST WAIVE [NEGOTIATE DETAIL] - [3.1 ENTRY OTHER DEBT]

                # Input Data - Negotiate Detail - 3.1 Entry other debt
                Request_waive_09_feature.SET FEATURE - TYPE - 09 - INPUT DATA - PAGE REQUEST WAIVE [NEGOTIATE DETAIL] - [3.1 ENTRY OTHER DEBT]

                # Click add
                Request_waive_09_feature.SET FEATURE - TYPE - 09 - ADD - PAGE REQUEST WAIVE [NEGOTIATE DETAIL] - [3.1 ENTRY OTHER DEBT]

                # รอ page loading
                # BuiltIn.Run Keyword And Continue On Failure    PAGE REQUEST WAIVE - TYPE 06 - [VERIFY] - [LOADING]

                # table
                # Verify Title Table - 3.1 Entry other debt
                Request_waive_09_feature.SET FEATURE - TYPE - 09 - DATA TITLE TABLE - PAGE REQUEST WAIVE [NEGOTIATE DETAIL] - [3.1 ENTRY OTHER DEBT]

                # Verify Value Table - 3.1 Entry other debt
                Request_waive_09_feature.SET FEATURE - TYPE - 09 - DATA VALUE TABLE - PAGE REQUEST WAIVE [NEGOTIATE DETAIL] - [3.1 ENTRY OTHER DEBT]

                # Verify Title - 3.2 Entry other ...
                Request_waive_09_feature.SET FEATURE - TYPE - 09 - DATA TITLE - PAGE REQUEST WAIVE [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]


                # 3.2 Entry other ...
                # Verify Title - 3.2 Entry other ...
                Request_waive_09_feature.SET FEATURE - TYPE - 09 - DATA TITLE - PAGE REQUEST WAIVE [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
                                    
                # Input Data - Negotiate Detail - 3.2 Entry other ...
                Request_waive_09_feature.SET FEATURE - TYPE - 09 - INPUT DATA - PAGE REQUEST WAIVE [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
                Request_waive_09_feature.SET FEATURE - TYPE - 09 - VERIFY - SEND TO - PAGE REQUEST WAIVE    user_level=1    # Send to User_1 = P2510033
                    
                # กด approve
                Request_waive_09_feature.SET FEATURE - TYPE - 09 - CLICK - APPROVE - PAGE REQUEST WAIVE    

                # verify pop up
                Request_waive_09_feature.SET FEATURE - TYPE - 09 - VERIFY - APPROVE POPUP - PAGE REQUEST WAIVE    

                # verify pop up
                Request_waive_09_feature.SET FEATURE - TYPE - 09 - CLICK - APPROVE POPUP - CLICK OK - PAGE REQUEST WAIVE   

                # get data at current page request no
                Request_waive_09_feature.SET FEATURE - TYPE - 09 - SAVE DATA - REQUSET NO - PAGE REQUEST WAIVE  

                # wait for check excel write
                Request_waive_09_feature.SET FEATURE - TYPE - 09 - SAVE DATA TO EXCEL - BY STATE
          
            
            END

        END
    END

                
# add new
PAGE REQUEST WAIVE - TYPE 09 - OPEN INRANET
    Common_keyword.OPEN INTRANET
    Common_keyword.CLICK SSO ICON

# add new
PAGE REQUEST WAIVE - TYPE 09 - INPUT USENAME AND PASSWORD BY USER LEVEL
    [Arguments]    ${user_level}

    IF  '${user_level}' == '0'         # user approve user0 
        PAGE REQUEST WAIVE - TYPE 09 - SETTING LOGIN    WORKFLOW    ${group_user}[${keys_group_user}[3]]    ${group_user}[${keys_group_user}[4]]    ${group_user}[${keys_group_user}[3]]    # 1 row,col -> 3,4 -> P2506064
    ELSE IF  '${user_level}' == '1'    # user approve user1 
        PAGE REQUEST WAIVE - TYPE 09 - SETTING LOGIN    WORKFLOW    ${group_user}[${keys_group_user}[5]]    ${group_user}[${keys_group_user}[6]]    ${group_user}[${keys_group_user}[5]]    # 1 row,col -> 5,6 -> P2510033
    ELSE IF  '${user_level}' == '2'    # user approve user2
        PAGE REQUEST WAIVE - TYPE 09 - SETTING LOGIN    WORKFLOW    ${group_user}[${keys_group_user}[7]]    ${group_user}[${keys_group_user}[8]]    ${group_user}[${keys_group_user}[7]]     # 2 row,col -> 7,8  -> P2503067
    ELSE IF  '${user_level}' == '3'    # user approve user3
        PAGE REQUEST WAIVE - TYPE 09 - SETTING LOGIN    WORKFLOW    ${group_user}[${keys_group_user}[9]]    ${group_user}[${keys_group_user}[10]]    ${group_user}[${keys_group_user}[9]]     # 3 row,col -> 9,10 -> P2106010 
    ELSE IF  '${user_level}' == '4'    # user approve user4
        PAGE REQUEST WAIVE - TYPE 09 - SETTING LOGIN    WORKFLOW    ${group_user}[${keys_group_user}[11]]    ${group_user}[${keys_group_user}[12]]    ${group_user}[${keys_group_user}[11]]     # 4 row,col -> 11,12 -> KIMURA
    END

# add new
PAGE REQUEST WAIVE - TYPE 09 - SETTING LOGIN
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


PAGE REQUEST WAIVE - TYPE 09 - [CLICK] - LINK 
    ${link_system}=    Common_keyword.REPLACE BY DATA EXCEL AND RETURN LOCATOR DATA GRID    ${link_system}    ${group_user}[${keys_group_user}[2]]   
    Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${link_system}     
    Common_keyword.CLICK ELEMENT BY LOCATOR    ${link_system}   

# wait update page 
PAGE REQUEST WAIVE - TYPE 09 - [WAIT] - [VERIFY] PAGE
    Common_keyword.WAITING FOR DATA UPDATE    1s    

PAGE REQUEST WAIVE - TYPE 09 - [CLICK] - [MENU]
    [Arguments]    ${menu} 
    ${locator_menu}    Common_keyword.REPLACE BY DATA EXCEL AND RETURN LOCATOR DATA GRID    ${menu_locator}    ${menu}
    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE    ${locator_menu}

PAGE REQUEST WAIVE - TYPE 09 - [CLICK] - [SUB MENU]
    [Arguments]    ${sub_menu} 
    ${locator_menu}    Common_keyword.REPLACE BY DATA EXCEL AND RETURN LOCATOR DATA GRID    ${sub_menu_locator}    ${sub_menu}
    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE    ${locator_menu}

# เลือก iframe
PAGE REQUEST WAIVE - TYPE 09 - [SELCET] - [FRAME] IFRAME
    Common_keyword.SELECT IFRAME    ${iframe_fraud_locator}

# เลือก iframe
PAGE REQUEST WAIVE - TYPE 09 - [UNSELCET] - [FRAME] UNIFRAME
    Common_keyword.UNSELECT IFRAME   

# เลือก request type
PAGE REQUEST WAIVE - TYPE 09 - [SELCET] - [DROPDOWN] REQUEST TYPE
    Common_keyword.SELECT OPTION SELECT FROM LIST BY LABEL    ${sel_fraud_request_type_locator}    ${group_user}[${keys_group_user}[1]]
    
PAGE REQUEST WAIVE - TYPE 09 - [CLICK] - [BTN] APPROVE
    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE    ${btn_approve}    

#verify   
PAGE REQUEST WAIVE - TYPE 09 - [VERIFY] - [LABEL] BUSINESS
    Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${lbl_fraud_req_business}    5s          

PAGE REQUEST WAIVE - TYPE 09 - [VERIFY] - [LABEL] CONTRACT NO 
    Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${lbl_fraud_contract_no}    5s          

PAGE REQUEST WAIVE - TYPE 09 - [VERIFY] - [LABEL] ID CARD 
    Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${lbl_fraud_id_card}    5s       

# input 
PAGE REQUEST WAIVE - TYPE 09 - [INPUT] - [TEXT] ID CARD 
    Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE    ${req_id_card}    ${group_data}[${keys_group_data_label}[2]]         

PAGE REQUEST WAIVE - TYPE 09 - [SELECT] - [DROPDOWN] BUSINESS
    Common_keyword.SELECT OPTION SELECT FROM LIST BY LABEL    ${sel_req_business}    ${group_data}[${keys_group_data_label}[3]]     
  
PAGE REQUEST WAIVE - TYPE 09 - [INPUT] - [TEXT] CONTRACT NO  
    Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE    ${req_contract_no}    ${group_data}[${keys_group_data_label}[4]]       

# verify loading
PAGE REQUEST WAIVE - TYPE 09 - [VERIFY] - [LOADING]
    Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${loading}    time_out=180s    


# Input data form 06 : Negotiation Special discount (Fraud)
PAGE REQUEST WAIVE - TYPE 09 - [INPUT] - NUMBER OF CHILD [09 : NEGOTIATION SPECIAL DISCOUNT (Fraud)]
    Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE    ${input_09_nsd_num_of_child_locator}    ${group_data}[${keys_group_data_label}[14]]


PAGE REQUEST WAIVE - TYPE 09 - [INPUT] - LAST SALARY [09 : NEGOTIATION SPECIAL DISCOUNT (Fraud)]
    Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE    ${input_09_nsd_last_salary_locator}    ${group_data}[${keys_group_data_label}[17]]


PAGE REQUEST WAIVE - TYPE 09 - [CLICK] - [DROPDOWN] - CUSTOMER STATUS [09 : NEGOTIATION SPECIAL DISCOUNT (Fraud)]
    Common_keyword.SELECT OPTION SELECT FROM LIST BY LABEL   ${dropdown_09_nsd_cust_status_locator}     ${group_data}[${keys_group_data_label}[19]]


#verify label 06 : Negotiation Special discount (Fraud)
PAGE REQUEST WAIVE - TYPE 09 - [VERIFY] - [TITLE] - HERDER [09 : NEGOTIATION SPECIAL DISCOUNT (Fraud)]
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR AND EQUAL STRINGS    ${txt_header_09_header_locator}    ${group_user}[${keys_group_user}[1]]

PAGE REQUEST WAIVE - TYPE 09 - [VERIFY] - [TITLE] - REQUEST TYPE [09 : NEGOTIATION SPECIAL DISCOUNT (Fraud)]
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR OPTIPON REPLACE AND EQUAL STRINGS    ${txt_title_09_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[1]]

PAGE REQUEST WAIVE - TYPE 09 - [VERIFY] - [TITLE] - REQUEST NO. [09 : NEGOTIATION SPECIAL DISCOUNT (Fraud)]
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR OPTIPON REPLACE AND EQUAL STRINGS    ${txt_title_09_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[5]]
    
PAGE REQUEST WAIVE - TYPE 09 - [VERIFY] - [TITLE] - REQUESTER [09 : NEGOTIATION SPECIAL DISCOUNT (Fraud)]
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR OPTIPON REPLACE AND EQUAL STRINGS    ${txt_title_09_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[8]]

PAGE REQUEST WAIVE - TYPE 09 - [VERIFY] - [TITLE] - REQUEST DATE [09 : NEGOTIATION SPECIAL DISCOUNT (Fraud)]
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR OPTIPON REPLACE AND EQUAL STRINGS    ${txt_title_09_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[9]]

PAGE REQUEST WAIVE - TYPE 09 - [VERIFY] - [TITLE] - CUSTOMER ID [09 : NEGOTIATION SPECIAL DISCOUNT (Fraud)]
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR OPTIPON REPLACE AND EQUAL STRINGS    ${txt_title_09_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[2]]

PAGE REQUEST WAIVE - TYPE 09 - [VERIFY] - [TITLE] - CONTRACT NO [09 : NEGOTIATION SPECIAL DISCOUNT (Fraud)]
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR OPTIPON REPLACE AND EQUAL STRINGS    ${txt_title_09_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[4]]    

PAGE REQUEST WAIVE - TYPE 09 - [VERIFY] - [TITLE] - CUSTOMER NAME [09 : NEGOTIATION SPECIAL DISCOUNT (Fraud)]
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR OPTIPON REPLACE AND EQUAL STRINGS    ${txt_title_09_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[10]]

PAGE REQUEST WAIVE - TYPE 09 - [VERIFY] - [TITLE] - CALL CENTER [09 : NEGOTIATION SPECIAL DISCOUNT (Fraud)]
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR OPTIPON REPLACE AND EQUAL STRINGS    ${txt_title_09_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[11]]

PAGE REQUEST WAIVE - TYPE 09 - [VERIFY] - [TITLE] - AGE [09 : NEGOTIATION SPECIAL DISCOUNT (Fraud)]
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR OPTIPON REPLACE AND EQUAL STRINGS    ${txt_title_09_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[12]]

PAGE REQUEST WAIVE - TYPE 09 - [VERIFY] - [TITLE] - TEAM [09 : NEGOTIATION SPECIAL DISCOUNT (Fraud)]
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR OPTIPON REPLACE AND EQUAL STRINGS    ${txt_title_09_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[13]]

PAGE REQUEST WAIVE - TYPE 09 - [VERIFY] - [TITLE] - NUMBER OF CHILD [09 : NEGOTIATION SPECIAL DISCOUNT (Fraud)]
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR OPTIPON REPLACE AND EQUAL STRINGS    ${txt_title_09_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[14]]

PAGE REQUEST WAIVE - TYPE 09 - [VERIFY] - [TITLE] - OD STATUS [09 : NEGOTIATION SPECIAL DISCOUNT (Fraud)]
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR OPTIPON REPLACE AND EQUAL STRINGS    ${txt_title_09_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[16]]

PAGE REQUEST WAIVE - TYPE 09 - [VERIFY] - [TITLE] - LAST SALARY [09 : NEGOTIATION SPECIAL DISCOUNT (Fraud)]
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR OPTIPON REPLACE AND EQUAL STRINGS    ${txt_title_09_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[17]]

PAGE REQUEST WAIVE - TYPE 09 - [VERIFY] - [TITLE] - CONTRACT TYPE [09 : NEGOTIATION SPECIAL DISCOUNT (Fraud)]
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR OPTIPON REPLACE AND EQUAL STRINGS    ${txt_title_09_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[18]]

PAGE REQUEST WAIVE - TYPE 09 - [VERIFY] - [TITLE] - CUSTOMER STATUS [09 : NEGOTIATION SPECIAL DISCOUNT (Fraud)]
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR OPTIPON REPLACE AND EQUAL STRINGS    ${txt_title_09_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[19]]

PAGE REQUEST WAIVE - TYPE 09 - [VERIFY] - [TITLE] - CONTRACT DATE [09 : NEGOTIATION SPECIAL DISCOUNT (Fraud)]
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR OPTIPON REPLACE AND EQUAL STRINGS    ${txt_title_09_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[20]]

PAGE REQUEST WAIVE - TYPE 09 - [VERIFY] - [TITLE] - BUSINESS [09 : NEGOTIATION SPECIAL DISCOUNT (Fraud)]
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR OPTIPON REPLACE AND EQUAL STRINGS    ${txt_title_09_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[3]]

PAGE REQUEST WAIVE - TYPE 09 - [VERIFY] - [TITLE] - WO DATE [09 : NEGOTIATION SPECIAL DISCOUNT (Fraud)]
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR OPTIPON REPLACE AND EQUAL STRINGS    ${txt_title_09_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[21]]

PAGE REQUEST WAIVE - TYPE 09 - [VERIFY] - [TITLE] - CONTRACT STATUS [09 : NEGOTIATION SPECIAL DISCOUNT (Fraud)]
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR OPTIPON REPLACE AND EQUAL STRINGS    ${txt_title_09_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[22]]

PAGE REQUEST WAIVE - TYPE 09 - [VERIFY] - [TITLE] - TIME OF PAYMENT [09 : NEGOTIATION SPECIAL DISCOUNT (Fraud)]
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR OPTIPON REPLACE AND EQUAL STRINGS    ${txt_title_09_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[23]]

PAGE REQUEST WAIVE - TYPE 09 - [VERIFY] - [TITLE] - DUE [09 : NEGOTIATION SPECIAL DISCOUNT (Fraud)]
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR OPTIPON REPLACE AND EQUAL STRINGS    ${txt_title_09_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[24]]

PAGE REQUEST WAIVE - TYPE 09 - [VERIFY] - [TITLE] - TIMES OF PENALTY [09 : NEGOTIATION SPECIAL DISCOUNT (Fraud)]
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR OPTIPON REPLACE AND EQUAL STRINGS    ${txt_title_09_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[25]]

PAGE REQUEST WAIVE - TYPE 09 - [VERIFY] - [TITLE] - REQUEST TIMES [09 : NEGOTIATION SPECIAL DISCOUNT (Fraud)]
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR OPTIPON REPLACE AND EQUAL STRINGS    ${txt_title_09_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[26]]

PAGE REQUEST WAIVE - TYPE 09 - [VERIFY] - [TITLE] - LAST REQUEST NO [09 : NEGOTIATION SPECIAL DISCOUNT (Fraud)]
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR OPTIPON REPLACE AND EQUAL STRINGS    ${txt_title_09_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[27]]

PAGE REQUEST WAIVE - TYPE 09 - [VERIFY] - [TITLE] - MINIMUM/INSTALL: [09 : NEGOTIATION SPECIAL DISCOUNT (Fraud)]
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR OPTIPON REPLACE AND EQUAL STRINGS    ${txt_title_09_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[28]]



# Verify data 06 : Negotiation Special discount (Fraud)
PAGE REQUEST WAIVE - TYPE 09 - [VERIFY] - [VALUE] - REQUEST TYPE [09 : NEGOTIATION SPECIAL DISCOUNT (Fraud)]
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR STRIP AND EQUAL STRINGS    ${txt_value_09_nsd_request_type_locator}     ${group_data}[${keys_group_data_label}[1]]

PAGE REQUEST WAIVE - TYPE 09 - [VERIFY] - [VALUE] - REQUEST NO. [09 : NEGOTIATION SPECIAL DISCOUNT (Fraud)]
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR STRIP AND EQUAL STRINGS    ${txt_value_09_nsd_request_no_locator}     ${group_data}[${keys_group_data_label}[5]]
    
PAGE REQUEST WAIVE - TYPE 09 - [VERIFY] - [VALUE] - REQUESTER [09 : NEGOTIATION SPECIAL DISCOUNT (Fraud)]
    Common_keyword.GET VALUE PAGE CONTAINS ELEMENT BY LOCATOR AND EQUAL STRINGS    ${txt_value_09_nsd_requester_locator}     ${group_data}[${keys_group_data_label}[8]]    

PAGE REQUEST WAIVE - TYPE 09 - [VERIFY] - [VALUE] - REQUEST DATE [09 : NEGOTIATION SPECIAL DISCOUNT (Fraud)]
    ${con_date}    Common_keyword.CONVERT DATE FORMAT    ${group_data}[${keys_group_data_label}[9]]
    Common_keyword.GET VALUE PAGE CONTAINS ELEMENT BY LOCATOR AND EQUAL STRINGS    ${txt_value_09_nsd_request_date_locator}    ${con_date}

PAGE REQUEST WAIVE - TYPE 09 - [VERIFY] - [VALUE] - CUSTOMER ID [09 : NEGOTIATION SPECIAL DISCOUNT (Fraud)]
    Common_keyword.GET VALUE PAGE CONTAINS ELEMENT BY LOCATOR AND EQUAL STRINGS    ${txt_value_09_nsd_cust_id_locator}     ${group_data}[${keys_group_data_label}[2]]    

PAGE REQUEST WAIVE - TYPE 09 - [VERIFY] - [VALUE] - CONTRACT NO [09 : NEGOTIATION SPECIAL DISCOUNT (Fraud)]
    Common_keyword.GET VALUE PAGE CONTAINS ELEMENT BY LOCATOR AND EQUAL STRINGS    ${txt_value_09_nsd_contract_no_locator}     ${group_data}[${keys_group_data_label}[4]]    

PAGE REQUEST WAIVE - TYPE 09 - [VERIFY] - [VALUE] - CUSTOMER NAME [09 : NEGOTIATION SPECIAL DISCOUNT (Fraud)]
    Common_keyword.GET VALUE PAGE CONTAINS ELEMENT BY LOCATOR AND EQUAL STRINGS    ${txt_value_09_nsd_cust_name_locator}     ${group_data}[${keys_group_data_label}[10]]    
    
PAGE REQUEST WAIVE - TYPE 09 - [VERIFY] - [VALUE] - CALL CENTER [09 : NEGOTIATION SPECIAL DISCOUNT (Fraud)]
    Common_keyword.GET VALUE PAGE CONTAINS ELEMENT BY LOCATOR AND EQUAL STRINGS    ${txt_value_09_nsd_call_center_locator}     ${group_data}[${keys_group_data_label}[11]]    

PAGE REQUEST WAIVE - TYPE 09 - [VERIFY] - [VALUE] - AGE [09 : NEGOTIATION SPECIAL DISCOUNT (Fraud)]
    Common_keyword.GET VALUE PAGE CONTAINS ELEMENT BY LOCATOR AND EQUAL STRINGS    ${txt_value_09_nsd_age_locator}     ${group_data}[${keys_group_data_label}[12]]    

PAGE REQUEST WAIVE - TYPE 09 - [VERIFY] - [VALUE] - TEAM [09 : NEGOTIATION SPECIAL DISCOUNT (Fraud)]
    Common_keyword.GET VALUE PAGE CONTAINS ELEMENT BY LOCATOR AND EQUAL STRINGS    ${txt_value_09_nsd_team_locator}     ${group_data}[${keys_group_data_label}[13]]    

PAGE REQUEST WAIVE - TYPE 09 - [VERIFY] - [VALUE] - OD STATUS [09 : NEGOTIATION SPECIAL DISCOUNT (Fraud)]
    Common_keyword.GET VALUE PAGE CONTAINS ELEMENT BY LOCATOR AND EQUAL STRINGS    ${txt_value_09_nsd_od_status_locator}     ${group_data}[${keys_group_data_label}[16]]    

PAGE REQUEST WAIVE - TYPE 09 - [VERIFY] - [VALUE] - CONTRACT TYPE [09 : NEGOTIATION SPECIAL DISCOUNT (Fraud)]
    Common_keyword.GET VALUE PAGE CONTAINS ELEMENT BY LOCATOR AND EQUAL STRINGS    ${txt_value_09_nsd_contract_type_locator}     ${group_data}[${keys_group_data_label}[18]]    

PAGE REQUEST WAIVE - TYPE 09 - [VERIFY] - [VALUE] - CONTRACT DATE [09 : NEGOTIATION SPECIAL DISCOUNT (Fraud)]    
    Common_keyword.GET VALUE PAGE CONTAINS ELEMENT BY LOCATOR AND EQUAL STRINGS    ${txt_value_09_nsd_contract_date_locator}     ${group_data}[${keys_group_data_label}[20]]    

PAGE REQUEST WAIVE - TYPE 09 - [VERIFY] - [VALUE] - BUSINESS [09 : NEGOTIATION SPECIAL DISCOUNT (Fraud)]
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR STRIP AND EQUAL STRINGS    ${txt_value_09_nsd_biz_locator}     ${group_data}[${keys_group_data_label}[3]]

PAGE REQUEST WAIVE - TYPE 09 - [VERIFY] - [VALUE] - WO DATE [09 : NEGOTIATION SPECIAL DISCOUNT (Fraud)]    
    Common_keyword.GET VALUE PAGE CONTAINS ELEMENT BY LOCATOR AND EQUAL STRINGS    ${txt_value_09_nsd_wo_date_locator}     ${group_data}[${keys_group_data_label}[21]]    

PAGE REQUEST WAIVE - TYPE 09 - [VERIFY] - [VALUE] - CONTRACT STATUS [09 : NEGOTIATION SPECIAL DISCOUNT (Fraud)]
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR STRIP AND EQUAL STRINGS    ${txt_value_09_nsd_contract_status_locator}     ${group_data}[${keys_group_data_label}[22]]

PAGE REQUEST WAIVE - TYPE 09 - [VERIFY] - [VALUE] - TIME OF PAYMENT [09 : NEGOTIATION SPECIAL DISCOUNT (Fraud)]
    Common_keyword.GET VALUE PAGE CONTAINS ELEMENT BY LOCATOR AND EQUAL STRINGS    ${txt_value_09_nsd_time_of_payment_locator}     ${group_data}[${keys_group_data_label}[23]]    

PAGE REQUEST WAIVE - TYPE 09 - [VERIFY] - [VALUE] - DUE [09 : NEGOTIATION SPECIAL DISCOUNT (Fraud)]
    Common_keyword.GET VALUE PAGE CONTAINS ELEMENT BY LOCATOR AND EQUAL STRINGS    ${txt_value_09_nsd_due_locator}     ${group_data}[${keys_group_data_label}[24]]    

PAGE REQUEST WAIVE - TYPE 09 - [VERIFY] - [VALUE] - TIMES OF PENALTY [09 : NEGOTIATION SPECIAL DISCOUNT (Fraud)]
    Common_keyword.GET VALUE PAGE CONTAINS ELEMENT BY LOCATOR AND EQUAL STRINGS    ${txt_value_09_nsd_time_of_penalty_locator}     ${group_data}[${keys_group_data_label}[25]]    

PAGE REQUEST WAIVE - TYPE 09 - [VERIFY] - [VALUE] - REQUEST TIMES [09 : NEGOTIATION SPECIAL DISCOUNT (Fraud)]
    Common_keyword.GET VALUE PAGE CONTAINS ELEMENT BY LOCATOR AND EQUAL STRINGS    ${txt_value_09_nsd_req_time_locator}     ${group_data}[${keys_group_data_label}[26]]    

PAGE REQUEST WAIVE - TYPE 09 - [VERIFY] - [VALUE] - MINIMUM/INSTALL: [09 : NEGOTIATION SPECIAL DISCOUNT (Fraud)]
    Common_keyword.GET VALUE PAGE CONTAINS ELEMENT BY LOCATOR AND EQUAL STRINGS    ${txt_value_09_nsd_min_install_locator}     ${group_data}[${keys_group_data_label}[28]]    


### Negotiate Detail ###
# Verify Title - Negotiate Detail - 1. Entry negotiate discount detail
PAGE REQUEST WAIVE - TYPE 09 - [VERIFY] - [TITLE] - TOTALS TERM [NEGOTIATE DETAIL] - [1. ENTRY NEGOTIATE DISCOUNT DETAIL]
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_title_09_nd_format_locator}    ${group_data_label}[${keys_group_data_label}[29]]

PAGE REQUEST WAIVE - TYPE 09 - [VERIFY] - [TITLE] - TOTALS PAID AMOUNT [NEGOTIATE DETAIL] - [1. ENTRY NEGOTIATE DISCOUNT DETAIL]
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_title_09_nd_format_locator}    ${group_data_label}[${keys_group_data_label}[30]]

PAGE REQUEST WAIVE - TYPE 09 - [VERIFY] - [TITLE] - FIRST DUE DATE [NEGOTIATE DETAIL] - [1. ENTRY NEGOTIATE DISCOUNT DETAIL]
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_title_09_nd_format_locator}    ${group_data_label}[${keys_group_data_label}[31]]

PAGE REQUEST WAIVE - TYPE 09 - [VERIFY] - [TITLE] - START CAL. DATE [NEGOTIATE DETAIL] - [1. ENTRY NEGOTIATE DISCOUNT DETAIL]
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_title_09_nd_format_locator}    ${group_data_label}[${keys_group_data_label}[32]]



# Input Data - Negotiate Detail - 1. Entry negotiate discount detail
PAGE REQUEST WAIVE - TYPE 09 - [INPUT] - TOTALS TERM [NEGOTIATE DETAIL] - [1. ENTRY NEGOTIATE DISCOUNT DETAIL]
    Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE    ${input_09_nd_totals_term_locator}    ${group_data}[${group_data_label}[${keys_group_data_label}[29]]]

PAGE REQUEST WAIVE - TYPE 09 - [INPUT] - TOTALS PAID AMOUNT [NEGOTIATE DETAIL] - [1. ENTRY NEGOTIATE DISCOUNT DETAIL]
    Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE    ${input_09_nd_totals_paid_amt_locator}    ${group_data}[${group_data_label}[${keys_group_data_label}[30]]]

PAGE REQUEST WAIVE - TYPE 09 - [DROPDOWN] - FIRST DUE DATE INDEX 2 [NEGOTIATE DETAIL] - [1. ENTRY NEGOTIATE DISCOUNT DETAIL]
    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE    ${dropdown_09_nd_f_due_date_locator}
    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE    ${dropdown_09_nd_f_due_date_index2_locator}
    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE    ${dropdown_09_nd_f_due_date_locator}


PAGE REQUEST WAIVE - TYPE 09 - [INPUT] - START CAL. DATE [NEGOTIATE DETAIL] - [1. ENTRY NEGOTIATE DISCOUNT DETAIL]
    ${date_start_cal_date}    Common_keyword.CONVERT DATE FORMAT    ${group_data}[${keys_group_data_label}[32]]
    SeleniumLibrary.Execute JavaScript    document.getElementById('${input_09_nd_js_start_cal_date_id}').value='${date_start_cal_date}';


PAGE REQUEST WAIVE - TYPE 09 - [CLICK] - [BUTTON] - SUBMIT
    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE    ${btn_09_nd_submit_locator}    15
    


# --------------------------------------------------------------------------
# (OD screen)
# title 
PAGE REQUEST WAIVE - TYPE 09 - [VERIFY] - [TITLE] - [09 : LOAN AMT OF CUSTOMER]
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR OPTIPON REPLACE AND EQUAL STRINGS    ${txt_value_fraud_loan_amt_of_customer}    ${group_data_label}[${keys_group_data_label}[33]]

PAGE REQUEST WAIVE - TYPE 09 - [VERIFY] - [TITLE] - [09 : LOAN AMT OF NEW CONTRACT]
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR OPTIPON REPLACE AND EQUAL STRINGS    ${txt_value_fraud_loan_amt_of_new_contract}    ${group_data_label}[${keys_group_data_label}[34]]

PAGE REQUEST WAIVE - TYPE 09 - [VERIFY] - [TITLE] - [09 : CONTRACT AMOUNT]
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR OPTIPON REPLACE AND EQUAL STRINGS    ${txt_value_fraud_contract_amount}    ${group_data_label}[${keys_group_data_label}[35]]

PAGE REQUEST WAIVE - TYPE 09 - [VERIFY] - [TITLE] - [09 : PAID TERM]
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR OPTIPON REPLACE AND EQUAL STRINGS    ${txt_value_fraud_paid_term}    ${group_data_label}[${keys_group_data_label}[36]]

PAGE REQUEST WAIVE - TYPE 09 - [VERIFY] - [TITLE] - [09 : TOTAL PAID AMT (OLD CONTRACT)]
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR OPTIPON REPLACE AND EQUAL STRINGS    ${txt_value_fraud_total_paid_amt_old_contract}    ${group_data_label}[${keys_group_data_label}[37]]

PAGE REQUEST WAIVE - TYPE 09 - [VERIFY] - [TITLE] - [09 : TOTAL PAID AMT (NEW CONTRACT)]
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR OPTIPON REPLACE AND EQUAL STRINGS    ${txt_value_fraud_total_paid_amt_new_contract}    ${group_data_label}[${keys_group_data_label}[38]]

PAGE REQUEST WAIVE - TYPE 09 - [VERIFY] - [TITLE] - [09 : OS (AS OF CLOSING DATE)]
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR OPTIPON REPLACE AND EQUAL STRINGS    ${txt_value_fraud_os_as_of_closing_date}    ${group_data_label}[${keys_group_data_label}[39]]

PAGE REQUEST WAIVE - TYPE 09 - [VERIFY] - [TITLE] - [09 : OD AMOUNT]
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR OPTIPON REPLACE AND EQUAL STRINGS    ${txt_value_fraud_od_amount}    ${group_data_label}[${keys_group_data_label}[40]]

PAGE REQUEST WAIVE - TYPE 09 - [VERIFY] - [TITLE] - [09 : PENALTY AMOUNT]
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR OPTIPON REPLACE AND EQUAL STRINGS    ${txt_value_fraud_penalty_amount}    ${group_data_label}[${keys_group_data_label}[41]]

PAGE REQUEST WAIVE - TYPE 09 - [VERIFY] - [TITLE] - [09 : CLOSING (SYD)]
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR OPTIPON REPLACE AND EQUAL STRINGS    ${txt_value_fraud_closing_syd}    ${group_data_label}[${keys_group_data_label}[42]]

PAGE REQUEST WAIVE - TYPE 09 - [VERIFY] - [TITLE] - [09 : WO AMOUNT]
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR OPTIPON REPLACE AND EQUAL STRINGS    ${txt_value_fraud_wo_amount}    ${group_data_label}[${keys_group_data_label}[43]]

PAGE REQUEST WAIVE - TYPE 09 - [VERIFY] - [TITLE] - [09 : CUSTOMER WILL PAY]
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR OPTIPON REPLACE AND EQUAL STRINGS    ${txt_value_fraud_customer_will_pay}    ${group_data_label}[${keys_group_data_label}[44]]

PAGE REQUEST WAIVE - TYPE 09 - [VERIFY] - [TITLE] - [09 : DIFF. FROM CLOSING]
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR OPTIPON REPLACE AND EQUAL STRINGS    ${txt_value_fraud_diff_from_closing}    ${group_data_label}[${keys_group_data_label}[45]]

PAGE REQUEST WAIVE - TYPE 09 - [VERIFY] - [TITLE] - [09 : DIFF. FROM WO (OD)]
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR OPTIPON REPLACE AND EQUAL STRINGS    ${txt_value_fraud_diff_from_wo_od}    ${group_data_label}[${keys_group_data_label}[46]]

PAGE REQUEST WAIVE - TYPE 09 - [VERIFY] - [TITLE] - [09 : TOTAL RECEIVED]
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR OPTIPON REPLACE AND EQUAL STRINGS    ${txt_value_fraud_total_received}    ${group_data_label}[${keys_group_data_label}[47]]

PAGE REQUEST WAIVE - TYPE 09 - [VERIFY] - [TITLE] - [09 : DIFF FROM LOAN AMOUNT]
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR OPTIPON REPLACE AND EQUAL STRINGS    ${txt_value_fraud_diff_from_loan_amount}    ${group_data_label}[${keys_group_data_label}[48]]

PAGE REQUEST WAIVE - TYPE 09 - [VERIFY] - [TITLE] - [09 : DIFF FROM OS]
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR OPTIPON REPLACE AND EQUAL STRINGS    ${txt_value_fraud_diff_from_os}    ${group_data_label}[${keys_group_data_label}[49]]

PAGE REQUEST WAIVE - TYPE 09 - [VERIFY] - [TITLE] - [09 : DIFF FROM WO]
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR OPTIPON REPLACE AND EQUAL STRINGS    ${txt_value_fraud_diff_from_wo}    ${group_data_label}[${keys_group_data_label}[50]]



# value 
PAGE REQUEST WAIVE - TYPE 09 - [VERIFY] - [VALUE] - [09 : LOAN AMT OF CUSTOMER]
    Common_keyword.GET VALUE ELEMENT BY LOCATOR AND EQUAL STRINGS    ${value_fraud_loan_amt_of_customer}    ${group_data}[${keys_group_data_label}[33]]
    Common_keyword.GET VALUE ELEMENT BY LOCATOR AND RETURN    ${value_fraud_loan_amt_of_customer}    timeout=30s

PAGE REQUEST WAIVE - TYPE 09 - [VERIFY] - [VALUE] - [09 : LOAN AMT OF NEW CONTRACT]
    Common_keyword.GET VALUE ELEMENT BY LOCATOR AND EQUAL STRINGS    ${value_fraud_loan_amt_of_new_contract}    ${group_data}[${keys_group_data_label}[34]]
    Common_keyword.GET VALUE ELEMENT BY LOCATOR AND RETURN    ${value_fraud_loan_amt_of_new_contract}    timeout=30s

PAGE REQUEST WAIVE - TYPE 09 - [VERIFY] - [VALUE] - [09 : CONTRACT AMOUNT]
    Common_keyword.GET VALUE ELEMENT BY LOCATOR AND EQUAL STRINGS    ${value_fraud_contract_amount}    ${group_data}[${keys_group_data_label}[35]]
    Common_keyword.GET VALUE ELEMENT BY LOCATOR AND RETURN    ${value_fraud_contract_amount}    timeout=30s

PAGE REQUEST WAIVE - TYPE 09 - [VERIFY] - [VALUE] - [09 : PAID TERM]
    Common_keyword.GET VALUE ELEMENT BY LOCATOR AND EQUAL STRINGS    ${value_fraud_paid_term}    ${group_data}[${keys_group_data_label}[36]]
    Common_keyword.GET VALUE ELEMENT BY LOCATOR AND RETURN    ${value_fraud_paid_term}    timeout=30s

PAGE REQUEST WAIVE - TYPE 09 - [VERIFY] - [VALUE] - [09 : TOTAL PAID AMT (OLD CONTRACT)]
    Common_keyword.GET VALUE ELEMENT BY LOCATOR AND EQUAL STRINGS    ${value_fraud_total_paid_amt_old_contract}    ${group_data}[${keys_group_data_label}[37]]
    Common_keyword.GET VALUE ELEMENT BY LOCATOR AND RETURN    ${value_fraud_total_paid_amt_old_contract}    timeout=30s

PAGE REQUEST WAIVE - TYPE 09 - [VERIFY] - [VALUE] - [09 : TOTAL PAID AMT (NEW CONTRACT)]
    Common_keyword.GET VALUE ELEMENT BY LOCATOR AND EQUAL STRINGS    ${value_fraud_total_paid_amt_new_contract}    ${group_data}[${keys_group_data_label}[38]]
    Common_keyword.GET VALUE ELEMENT BY LOCATOR AND RETURN    ${value_fraud_total_paid_amt_new_contract}    timeout=30s

PAGE REQUEST WAIVE - TYPE 09 - [VERIFY] - [VALUE] - [09 : OS (AS OF CLOSING DATE)]
    Common_keyword.GET VALUE ELEMENT BY LOCATOR AND EQUAL STRINGS    ${value_fraud_os_as_of_closing_date}    ${group_data}[${keys_group_data_label}[39]]
    Common_keyword.GET VALUE ELEMENT BY LOCATOR AND RETURN    ${value_fraud_os_as_of_closing_date}    timeout=30s

PAGE REQUEST WAIVE - TYPE 09 - [VERIFY] - [VALUE] - [09 : OD AMOUNT]
    Common_keyword.GET VALUE ELEMENT BY LOCATOR AND EQUAL STRINGS    ${value_fraud_od_amount}    ${group_data}[${keys_group_data_label}[40]]
    Common_keyword.GET VALUE ELEMENT BY LOCATOR AND RETURN    ${value_fraud_od_amount}    timeout=30s

PAGE REQUEST WAIVE - TYPE 09 - [VERIFY] - [VALUE] - [09 : PENALTY AMOUNT]
    Common_keyword.GET VALUE ELEMENT BY LOCATOR AND EQUAL STRINGS    ${value_fraud_penalty_amount}    ${group_data}[${keys_group_data_label}[41]]
    Common_keyword.GET VALUE ELEMENT BY LOCATOR AND RETURN    ${value_fraud_penalty_amount}    timeout=30s

PAGE REQUEST WAIVE - TYPE 09 - [VERIFY] - [VALUE] - [09 : CLOSING (SYD)]
    Common_keyword.GET VALUE ELEMENT BY LOCATOR AND EQUAL STRINGS    ${value_fraud_closing_syd}    ${group_data}[${keys_group_data_label}[42]]
    Common_keyword.GET VALUE ELEMENT BY LOCATOR AND RETURN    ${value_fraud_closing_syd}    timeout=30s

PAGE REQUEST WAIVE - TYPE 09 - [VERIFY] - [VALUE] - [09 : WO AMOUNT]
    Common_keyword.GET VALUE ELEMENT BY LOCATOR AND EQUAL STRINGS    ${value_fraud_wo_amount}    ${group_data}[${keys_group_data_label}[43]]
    Common_keyword.GET VALUE ELEMENT BY LOCATOR AND RETURN    ${value_fraud_wo_amount}    timeout=30s

PAGE REQUEST WAIVE - TYPE 09 - [VERIFY] - [VALUE] - [09 : CUSTOMER WILL PAY]
    Common_keyword.GET VALUE ELEMENT BY LOCATOR AND EQUAL STRINGS    ${value_fraud_customer_will_pay}    ${group_data}[${keys_group_data_label}[44]]
    Common_keyword.GET VALUE ELEMENT BY LOCATOR AND RETURN    ${value_fraud_customer_will_pay}    timeout=30s

PAGE REQUEST WAIVE - TYPE 09 - [VERIFY] - [VALUE] - [09 : TOTAL RECEIVED]
    Common_keyword.GET VALUE ELEMENT BY LOCATOR AND EQUAL STRINGS    ${value_fraud_total_received}    ${group_data}[${keys_group_data_label}[47]]
    Common_keyword.GET VALUE ELEMENT BY LOCATOR AND RETURN    ${value_fraud_total_received}    timeout=30s

PAGE REQUEST WAIVE - TYPE 09 - [VERIFY] - [VALUE] - [09 : DIFF FROM LOAN AMOUNT]
    Common_keyword.GET VALUE ELEMENT BY LOCATOR AND EQUAL STRINGS    ${value_fraud_diff_from_loan_amount}    ${group_data}[${keys_group_data_label}[48]]
    Common_keyword.GET VALUE ELEMENT BY LOCATOR AND RETURN    ${value_fraud_diff_from_loan_amount}    timeout=30s

PAGE REQUEST WAIVE - TYPE 09 - [VERIFY] - [VALUE] - [09 : DIFF FROM OS]
    Common_keyword.GET VALUE ELEMENT BY LOCATOR AND EQUAL STRINGS    ${value_fraud_diff_from_os}    ${group_data}[${keys_group_data_label}[49]]
    Common_keyword.GET VALUE ELEMENT BY LOCATOR AND RETURN    ${value_fraud_diff_from_os}    timeout=30s

PAGE REQUEST WAIVE - TYPE 09 - [VERIFY] - [VALUE] - [09 : DIFF FROM WO]
    Common_keyword.GET VALUE ELEMENT BY LOCATOR AND EQUAL STRINGS    ${value_fraud_diff_from_wo}    ${group_data}[${keys_group_data_label}[50]]
    Common_keyword.GET VALUE ELEMENT BY LOCATOR AND RETURN    ${value_fraud_diff_from_wo}    timeout=30s

# --------------------------------------------------------------------------

# Verify Title - 2. Entry detail by Term#, Time#
PAGE REQUEST WAIVE - TYPE 09 - [VERIFY] - [TITLE] - TERM# [NEGOTIATE DETAIL] - [2. ENTRY DETAIL BY TERM#, TIME#]
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_title_09_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[52]]
    
PAGE REQUEST WAIVE - TYPE 09 - [VERIFY] - [TITLE] - PAID DATE [NEGOTIATE DETAIL] - [2. ENTRY DETAIL BY TERM#, TIME#]
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_title_09_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[54]]

PAGE REQUEST WAIVE - TYPE 09 - [VERIFY] - [TITLE] - PAID AMOUNT [NEGOTIATE DETAIL] - [2. ENTRY DETAIL BY TERM#, TIME#]
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_title_09_nsd_format_locator}    ${group_data_label}[${keys_group_data_label}[55]]



# Input Data - Negotiate Detail - 2. Entry detail by Term#, Time#
PAGE REQUEST WAIVE - TYPE 09 - [INPUT] - TERM# START - [2. ENTRY DETAIL BY TERM#, TIME#]
    Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE    ${input_09_nd_start_term_locator}    ${group_data}[${group_data_label}[${keys_group_data_label}[52]]]

PAGE REQUEST WAIVE - TYPE 09 - [INPUT] - TERM# END - [2. ENTRY DETAIL BY TERM#, TIME#]
    Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE    ${input_09_nd_end_term_locator}    ${group_data}[${group_data_label}[${keys_group_data_label}[53]]]

PAGE REQUEST WAIVE - TYPE 09 - [INPUT] - PAID DATE - [2. ENTRY DETAIL BY TERM#, TIME#]
    ${date_paid_date}    Common_keyword.CONVERT DATE FORMAT    ${group_data}[${keys_group_data_label}[54]]
    SeleniumLibrary.Execute JavaScript    document.getElementById('${input_09_nd_js_paid_date_id}').value='${date_paid_date}';
    
PAGE REQUEST WAIVE - TYPE 09 - [INPUT] - PAID AMOUNT - [2. ENTRY DETAIL BY TERM#, TIME#]
    Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE    ${input_09_nd_paid_amt_locator}    ${group_data}[${group_data_label}[${keys_group_data_label}[55]]]

PAGE REQUEST WAIVE - TYPE 09 - [CLICK] - [BUTTON] - ADD [2. ENTRY DETAIL BY TERM#, TIME#]
    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE    ${btn_09_nd_2_add_locator}    15



# Verify Title Table - 2. Entry detail by Term#, Time#
PAGE REQUEST WAIVE - TYPE 09 - [VERIFY] - [TITLE][TABLE] - NO [NEGOTIATE DETAIL] - [2. ENTRY DETAIL BY TERM#, TIME#]
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_title_09_nd_2_format_locator}    ${group_data_label}[${keys_group_data_label}[56]]

PAGE REQUEST WAIVE - TYPE 09 - [VERIFY] - [TITLE][TABLE] - TERM# [NEGOTIATE DETAIL] - [2. ENTRY DETAIL BY TERM#, TIME#]
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_title_09_nd_2_format_locator}    ${group_data_label}[${keys_group_data_label}[57]]

PAGE REQUEST WAIVE - TYPE 09 - [VERIFY] - [TITLE][TABLE] - MIN DUE DATE [NEGOTIATE DETAIL] - [2. ENTRY DETAIL BY TERM#, TIME#]
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_title_09_nd_2_format_locator}    ${group_data_label}[${keys_group_data_label}[58]]

PAGE REQUEST WAIVE - TYPE 09 - [VERIFY] - [TITLE][TABLE] - MAX DUE DATE [NEGOTIATE DETAIL] - [2. ENTRY DETAIL BY TERM#, TIME#]
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_title_09_nd_2_format_locator}    ${group_data_label}[${keys_group_data_label}[59]]

PAGE REQUEST WAIVE - TYPE 09 - [VERIFY] - [TITLE][TABLE] - TIME# [NEGOTIATE DETAIL] - [2. ENTRY DETAIL BY TERM#, TIME#]
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_title_09_nd_2_format_locator}    ${group_data_label}[${keys_group_data_label}[60]]

PAGE REQUEST WAIVE - TYPE 09 - [VERIFY] - [TITLE][TABLE] - PAID DATE [NEGOTIATE DETAIL] - [2. ENTRY DETAIL BY TERM#, TIME#]
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_title_09_nd_2_format_locator}    ${group_data_label}[${keys_group_data_label}[61]]

PAGE REQUEST WAIVE - TYPE 09 - [VERIFY] - [TITLE][TABLE] - PAID AMOUNT [NEGOTIATE DETAIL] - [2. ENTRY DETAIL BY TERM#, TIME#]
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_title_09_nd_2_format_locator}    ${group_data_label}[${keys_group_data_label}[62]]

PAGE REQUEST WAIVE - TYPE 09 - [VERIFY] - [TITLE][TABLE] - DELETE [NEGOTIATE DETAIL] - [2. ENTRY DETAIL BY TERM#, TIME#]
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_title_09_nd_2_format_locator}    ${group_data_label}[${keys_group_data_label}[63]]



# Verify Value Table - 2. Entry detail by Term#, Time#
PAGE REQUEST WAIVE - TYPE 09 - [VERIFY] - [VALUE][TABLE] - TOTAL TERM [NEGOTIATE DETAIL] - [2. ENTRY DETAIL BY TERM#, TIME#]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL    ${txt_value_09_nd_2_total_team_locator}     ${group_data}[${keys_group_data_label}[64]]

PAGE REQUEST WAIVE - TYPE 09 - [VERIFY] - [VALUE][TABLE] - TOTAL PAID AMOUNT [NEGOTIATE DETAIL] - [2. ENTRY DETAIL BY TERM#, TIME#]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL    ${txt_value_09_nd_2_total_paid_amount_locator}     ${group_data}[${keys_group_data_label}[65]]



# Verify Title - 3.1 Entry other debt
PAGE REQUEST WAIVE - TYPE 09 - [VERIFY] - [TITLE] - OTHER DEBT [NEGOTIATE DETAIL] - [3.1 ENTRY OTHER DEBT]
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_title_09_nd_format_locator}    ${group_data_label}[${keys_group_data_label}[66]]

PAGE REQUEST WAIVE - TYPE 09 - [VERIFY] - [TITLE] - AMOUNT [NEGOTIATE DETAIL] - [3.1 ENTRY OTHER DEBT]
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_title_09_nd_format_locator}    ${group_data_label}[${keys_group_data_label}[67]]



# Input Data - Negotiate Detail - 3.1 Entry other debt
PAGE REQUEST WAIVE - TYPE 09 - [INPUT] - OTHER DEBT - [3.1 ENTRY OTHER DEBT]
    Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE    ${input_09_nd_other_debt_locator}    ${group_data}[${keys_group_data_label}[69]]

PAGE REQUEST WAIVE - TYPE 09 - [INPUT] - AMOUNT - [3.1 ENTRY OTHER DEBT]
    Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE    ${input_09_nd_amt_locator}    ${group_data}[${keys_group_data_label}[70]]

PAGE REQUEST WAIVE - TYPE 09 - [CLICK] - [BUTTON] - ADD [3.1 ENTRY OTHER DEBT]
    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE    ${btn_09_nd_3_1_add_locator}    15



# Verify Title Table - 3.1 Entry other debt
PAGE REQUEST WAIVE - TYPE 09 - [VERIFY] - [TITLE][TABLE] - NO [NEGOTIATE DETAIL] - [3.1 ENTRY OTHER DEBT]
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_title_09_nd_3_1_format_locator}    ${group_data_label}[${keys_group_data_label}[68]]

PAGE REQUEST WAIVE - TYPE 09 - [VERIFY] - [TITLE][TABLE] - OTHER DEBT [NEGOTIATE DETAIL] - [3.1 ENTRY OTHER DEBT]
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_title_09_nd_3_1_format_locator}    ${group_data_label}[${keys_group_data_label}[69]]

PAGE REQUEST WAIVE - TYPE 09 - [VERIFY] - [TITLE][TABLE] - AMOUNT [NEGOTIATE DETAIL] - [3.1 ENTRY OTHER DEBT]
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_title_09_nd_3_1_format_locator}    ${group_data_label}[${keys_group_data_label}[70]]

PAGE REQUEST WAIVE - TYPE 09 - [VERIFY] - [TITLE][TABLE] - DELETE [NEGOTIATE DETAIL] - [3.1 ENTRY OTHER DEBT]
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_title_09_nd_3_1_format_locator}    ${group_data_label}[${keys_group_data_label}[71]]



# Verify Value Table - 3.1 Entry other debt
PAGE REQUEST WAIVE - TYPE 09 - [VERIFY] - [VALUE][TABLE] - TOTAL AMOUNT [NEGOTIATE DETAIL] - [3.1 ENTRY OTHER DEBT]
    Common_keyword.GET TEXT AND VERIFY DATA FROM EXCEL    ${txt_value_09_nd_3_1_total_amount_locator}     ${group_data}[${keys_group_data_label}[72]]


# Verify Title - 3.2 Entry other ...
PAGE REQUEST WAIVE - TYPE 09 - [VERIFY] - [TITLE] - LAST CONTACT THIRD PARTY [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_title_09_nd_format_locator}    ${group_data_label}[${keys_group_data_label}[73]]

PAGE REQUEST WAIVE - TYPE 09 - [VERIFY] - [TITLE] - LAST CONTACT CUSTOMER [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_title_09_nd_format_locator}    ${group_data_label}[${keys_group_data_label}[74]]

PAGE REQUEST WAIVE - TYPE 09 - [VERIFY] - [TITLE] - HAVE JOB [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_title_09_nd_format_locator}    ${group_data_label}[${keys_group_data_label}[75]]

PAGE REQUEST WAIVE - TYPE 09 - [VERIFY] - [TITLE] - WHO REQUEST [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_title_09_nd_format_locator}    ${group_data_label}[${keys_group_data_label}[76]]

PAGE REQUEST WAIVE - TYPE 09 - [VERIFY] - [TITLE] - DISCOUNT CAMPAIGN [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_title_09_nd_format_locator}    ${group_data_label}[${keys_group_data_label}[77]]

PAGE REQUEST WAIVE - TYPE 09 - [VERIFY] - [TITLE] - WHO PAID [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_title_09_nd_format_locator}    ${group_data_label}[${keys_group_data_label}[78]]

PAGE REQUEST WAIVE - TYPE 09 - [VERIFY] - [TITLE] - SOURCE OF FUND [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_title_09_nd_format_locator}    ${group_data_label}[${keys_group_data_label}[79]]

PAGE REQUEST WAIVE - TYPE 09 - [VERIFY] - [TITLE] - REASON [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_title_09_nd_format_locator}    ${group_data_label}[${keys_group_data_label}[80]]

PAGE REQUEST WAIVE - TYPE 09 - [VERIFY] - [TITLE] - REASON NOTE [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_title_09_nd_format_locator}    ${group_data_label}[${keys_group_data_label}[81]]

PAGE REQUEST WAIVE - TYPE 09 - [VERIFY] - [TITLE] - NOTE [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_title_09_nd_format_locator}    ${group_data_label}[${keys_group_data_label}[86]]



# Input Data - Negotiate Detail - 3.2 Entry other ...
PAGE REQUEST WAIVE - TYPE 09 - [INPUT] - LAST CONTACT THIRD PARTY [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    ${date_last_cont_3_party}    Common_keyword.CONVERT DATE FORMAT    ${group_data}[${keys_group_data_label}[73]]
    SeleniumLibrary.Execute JavaScript    document.getElementById('${input_09_nd_js_last_cont_3_party_id}').value='${date_last_cont_3_party}';

    ${date_paid_date}    Common_keyword.CONVERT DATE FORMAT    ${group_data}[${keys_group_data_label}[54]]
    SeleniumLibrary.Execute JavaScript    document.getElementById('${input_09_nd_js_paid_date_id}').value='${date_paid_date}';

PAGE REQUEST WAIVE - TYPE 09 - [INPUT] - LAST CONTACT CUSTOMER [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    ${date_last_cont_cust}    Common_keyword.CONVERT DATE FORMAT    ${group_data}[${keys_group_data_label}[74]]
    SeleniumLibrary.Execute JavaScript    document.getElementById('${input_09_nd_js_last_cont_cust_id}').value='${date_last_cont_cust}';

PAGE REQUEST WAIVE - TYPE 09 - [INPUT] - HAVE JOB [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    ${data_}    BuiltIn.Set Variable    ${group_data}[${keys_group_data_label}[75]]    
    IF  '${data_}' == 'Yes'
        Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE CHECKBOX    ${input_09_nd_have_job_yes_locator}
    ELSE IF  '${data_}' == 'No'
        Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE CHECKBOX    ${input_09_nd_have_job_no_locator}
    END

PAGE REQUEST WAIVE - TYPE 09 - [INPUT] - WHO REQUEST [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    Common_keyword.SELECT OPTION SELECT FROM LIST BY LABEL   ${select_09_nd_who_req_locator}     ${group_data}[${keys_group_data_label}[76]]

PAGE REQUEST WAIVE - TYPE 09 - [INPUT] - DISCOUNT CAMPAIGN [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    Common_keyword.SELECT OPTION SELECT FROM LIST BY LABEL   ${select_09_nd_discount_camp_locator}     ${group_data}[${keys_group_data_label}[77]]

PAGE REQUEST WAIVE - TYPE 09 - [INPUT] - WHO PAID [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    Common_keyword.SELECT OPTION SELECT FROM LIST BY LABEL   ${select_09_nd_who_paid_locator}     ${group_data}[${keys_group_data_label}[78]]

PAGE REQUEST WAIVE - TYPE 09 - [INPUT] - SOURCE OF FUND [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    Common_keyword.SELECT OPTION SELECT FROM LIST BY LABEL   ${select_09_nd_source_fund__locator}     ${group_data}[${keys_group_data_label}[79]]

PAGE REQUEST WAIVE - TYPE 09 - [INPUT] - REASON [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    Common_keyword.SELECT OPTION SELECT FROM LIST BY LABEL   ${select_09_nd_reason_locator}     ${group_data}[${keys_group_data_label}[80]]

PAGE REQUEST WAIVE - TYPE 09 - [INPUT] - REASON NOTE [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE    ${input_09_nd_reason_note_locator}    ${group_data}[${keys_group_data_label}[81]]

PAGE REQUEST WAIVE - TYPE 09 - [INPUT] - NOTE [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE    ${input_09_nd_note_locator}    ${group_data}[${keys_group_data_label}[86]]

PAGE REQUEST WAIVE - TYPE 09 - [DROPDOWN] - SEND TO [NEGOTIATE DETAIL] - [3.2 ENTRY OTHER]
    [Arguments]    ${user_level}
    ${status}=    BuiltIn.Run Keyword And Return Status    Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${select_09_nd_send_to_locator}    10s
    IF  '${status}' == 'True'
        IF  '${user_level}' == '0'
            Common_keyword.SELECT OPTION SELECT FROM LIST BY LABEL    ${select_09_nd_send_to_locator}    ${group_data}[${keys_group_data_label}[8]]    # Send to 1 = P2503064
        ELSE IF  '${user_level}' == '1'
            Common_keyword.SELECT OPTION SELECT FROM LIST BY LABEL    ${select_09_nd_send_to_locator}    ${group_data}[${keys_group_data_label}[82]]    # Send to 2 = P2510033 
        ELSE IF  '${user_level}' == '3'
            Common_keyword.SELECT OPTION SELECT FROM LIST BY LABEL    ${select_09_nd_send_to_locator}    ${group_data}[${keys_group_data_label}[83]]    # Send to 3 = P2503067 
        ELSE IF  '${user_level}' == '4'
            Common_keyword.SELECT OPTION SELECT FROM LIST BY LABEL    ${select_09_nd_send_to_locator}    ${group_data}[${keys_group_data_label}[84]]    # Send to 4 = P2106010 
        ELSE IF  '${user_level}' == '5'
            Common_keyword.SELECT OPTION SELECT FROM LIST BY LABEL    ${select_09_nd_send_to_locator}    ${group_data}[${keys_group_data_label}[85]]    # Send to 5 = KIMURA 
        END
    END



# verify title popup
PAGE REQUEST WAIVE - TYPE 09 - [VERIFY] - [TITLE] APPROVE 
    Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR     ${verfiy_approve_popup}    

PAGE REQUEST WAIVE - TYPE 09 - [VERIFY] - [POPUP] APPROVE - [CLICK] OK
    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE     ${btn_ok_approve_popup}    

PAGE REQUEST WAIVE - TYPE 09 - [VERIFY] - [POPUP] APPROVE - [CLICK] CANCEL
    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE     ${btn_cancel_approve_popup}    


# get requst no save to excel
PAGE REQUEST WAIVE - TYPE 09 - [GET] - [DATA] REQUEST NO - [SAVE] EXCEL
    
    # wait finish loading..
    PAGE REQUEST WAIVE - TYPE 09 - [VERIFY] - [LOADING]

    ${state}=    Common_keyword.RUN KEYWORD AND IGNORE ERROR WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR     ${table_manager_locator}    60s
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
        ${msgerror}=    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR NO SPLIT    ${txt_error}  
        BuiltIn.Log    MSG ERROR->${msgerror}    WARN
        ${result_request_no}    BuiltIn.Set Variable    ${msgerror}    
        BuiltIn.Set Global Variable    ${result_request_no}

    END

# btn back 
PAGE REQUEST WAIVE - TYPE 09 - [CLICK] - [BTN] BACK
    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE     ${btn_back}    10s

# logout
PAGE REQUEST WAIVE - TYPE 09 - [CLICK] - [BTN] LOGOUT
    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE     ${btn_signout}    10s    


