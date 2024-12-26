*** Settings ***
Resource    ${CURDIR}/../../../Import/Path_import.robot    # robotcode: ignore

*** Variables ***
# excel name
${Excel_name}

# group data all
${group_data}
${keys_group_data}
${result_excel} 

# request no
${result_request_no}

# write data
${Rows}

# set globle for debug
${DBUG}

*** Keywords ***

SET FORMAT DATA TYPE 03
    [Arguments]    ${row}    ${start_at_case}    ${end_at_case}
    ${countrow}    BuiltIn.Set Variable If    ${end_at_case} <= ${data_count_row}    ${end_at_case}    ${data_count_row} 

    FOR  ${index}  IN RANGE    ${start_at_case}    ${countrow} + 1  
        ${result_excel}    JSONLibrary.Get Value From Json    ${data_from_excel_by_sheet}    $[?(@.TC == '${row}_${index}')]   

            ${group_data}=    BuiltIn.Set Variable   ${result_excel}[0]
            BuiltIn.Set Global Variable    ${group_data}
    
                ${Request_No}    BuiltIn.Set Variable    '${group_data}[${keys_group_data_label}[5]]'       #'${group_data}[Request No.]'     # get case   สำหรับเช็ค  
                ${State}    BuiltIn.Set Variable    '${group_data}[${keys_group_data_label}[6]]'            #'${group_data}[State]'           # get case   สำหรับเช็ค 

                IF  ${Request_No} != 'none' and ${State} == 'Approve'
                                        
                    ${Rows}    BuiltIn.Evaluate    ${index} + 2    # +2 because add title at row 2 
                    BuiltIn.Set Global Variable    ${Rows}   
                    BuiltIn.Log    ----------------------------------------    WARN 
                    BuiltIn.Log    CONATRACT ->ROW->${Rows}:${row}_${index}    WARN
                    BuiltIn.Log    ----------------------------------------    WARN

                    # เลือก requst type
                    Inquiry_03_feature.SET FEATURE - TYPE - 03 - SELECT MENU - REQUEST TYPE - PAGE INQUIRY  

                    # verify lable
                    Inquiry_03_feature.SET FEATURE - TYPE - 03 - VERIFY - REQUEST PAGE - PAGE INQUIRY   

                    # input data
                    Inquiry_03_feature.SET FEATURE - TYPE - 03 - INPUT CRITERIA SEARCH - PAGE INQUIRY

                    # กดค้นหา
                    Inquiry_03_feature.SET FEATURE - TYPE - 03 - CLICK BTN SEARCH

                    # รอ page loading
                    Inquiry_03_feature.SET FEATURE - TYPE - 03 - WAIT - VERIFY - PAGE INQUIRY

                    # verify title
                    Inquiry_03_feature.SET FEATURE - TYPE - 03 - VERIFY - TITLE - PAGE INQUIRY

                    # verify data
                    Inquiry_03_feature.SET FEATURE - TYPE - 03 - VERIFY - DATA - PAGE INQUIRY    # อย่าลืม จำว่า สิ้นสุดที่ user level ไหนละเอาคนนั้นมาเช็คเพื่อ ตรวสอบตอนจบด้วย

                    # เขียนข้อมูล row, column -> Request
                    Common_feature.SET - DATA TO EXCEL    excel_name=${Excel_name}    sheet_name=${type_03}    row=${Rows}    column=7    data=Finished    # Rows global ,colum fix ,data global
                    
                    # ออกจากระบบ
                    Inquiry_03_feature.SET FEATURE - TYPE - 03 - CLICK - LOGOUT - PAGE INQUIRY

                    BuiltIn.Exit For Loop 
                
                END
    END

# add new
PAGE INQUIRY - TYPE 03 - OPEN INRANET
    Common_keyword.OPEN INTRANET
    Common_keyword.CLICK SSO ICON

# add new
PAGE INQUIRY - TYPE 03 - INPUT USENAME AND PASSWORD BY USER LEVEL
    [Arguments]    ${user_level}

    IF  '${user_level}' == '0'         # user approve user0 
        PAGE INQUIRY - TYPE 03 - SETTING LOGIN    WORKFLOW    ${group_user}[${keys_group_user}[3]]    ${group_user}[${keys_group_user}[4]]    ${user_level}    # 1 row,col -> 3,4 -> P2503064
    ELSE IF  '${user_level}' == '1'    # user approve user1 
        PAGE INQUIRY - TYPE 03 - SETTING LOGIN    WORKFLOW    ${group_user}[${keys_group_user}[5]]    ${group_user}[${keys_group_user}[6]]    ${user_level}    # 1 row,col -> 5,6 -> P2510033
    ELSE IF  '${user_level}' == '2'    # user approve user2
        PAGE INQUIRY - TYPE 03 - SETTING LOGIN    WORKFLOW    ${group_user}[${keys_group_user}[7]]    ${group_user}[${keys_group_user}[8]]    ${user_level}     # 2 row,col -> 7,8  -> P2503067
    ELSE IF  '${user_level}' == '3'    # user approve user3
        PAGE INQUIRY - TYPE 03 - SETTING LOGIN    WORKFLOW    ${group_user}[${keys_group_user}[9]]    ${group_user}[${keys_group_user}[10]]    ${user_level}     # 3 row,col -> 9,10 -> P2106010 
    ELSE IF  '${user_level}' == '4'    # user approve user4
        PAGE INQUIRY - TYPE 03 - SETTING LOGIN    WORKFLOW    ${group_user}[${keys_group_user}[11]]    ${group_user}[${keys_group_user}[12]]    ${user_level}     # 4 row,col -> 11,12 -> KIMURA
    END

# add new
PAGE INQUIRY - TYPE 03 - SETTING LOGIN
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

# work
PAGE INQUIRY - TYPE 03 - [CLICK] - LINK 
    ${link_system}=    Common_keyword.REPLACE BY DATA EXCEL AND RETURN LOCATOR DATA GRID    ${link_system}    ${group_user}[${keys_group_user}[2]]    
    Common_keyword.CLICK ELEMENT BY LOCATOR    ${link_system}   

# wait update page 
PAGE INQUIRY - TYPE 03 - [WAIT] - [VERIFY] PAGE
    Common_keyword.WAITING FOR DATA UPDATE    1s    


PAGE INQUIRY - TYPE 03 - [CLICK] - [MENU]
    [Arguments]    ${menu} 
    ${locator_menu}    Common_keyword.REPLACE BY DATA EXCEL AND RETURN LOCATOR DATA GRID    ${menu_locator}    ${menu}
    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE    ${locator_menu}    


PAGE INQUIRY - TYPE 03 - [CLICK] - [SUB MENU]
    [Arguments]    ${sub_menu} 
    ${locator_menu}    Common_keyword.REPLACE BY DATA EXCEL AND RETURN LOCATOR DATA GRID    ${sub_menu_locator}    ${sub_menu}
    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE    ${locator_menu}    


# เลือก iframe
PAGE INQUIRY - TYPE 03 - [SELCET] - [FRAME] IFRAME
    Common_keyword.SELECT IFRAME    ${iframe_locator}

# เลือก iframe
PAGE INQUIRY - TYPE 03 - [UNSELCET] - [FRAME] UNIFRAME
    Common_keyword.UNSELECT IFRAME   

# เลือก request type
PAGE INQUIRY - TYPE 03 - [SELCET] - [DROPDOWN] REQUEST TYPE
    Common_keyword.SELECT OPTION SELECT FROM LIST BY LABEL    ${sel_ibs_request_type}    ${group_user}[${keys_group_user}[1]]

#verify 
PAGE INQUIRY - TYPE 03 - [VERIFY] - [LABELS] REQUEST TYPE
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR    ${lbl_ibs_request_type}    ${group_data_label}[${keys_group_data_label}[1]] 

PAGE INQUIRY - TYPE 03 - [VERIFY] - [LABELS] CUSTOMER ID
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR    ${lbl_ibs_customer_id}    ${group_data_label}[${keys_group_data_label}[2]]

PAGE INQUIRY - TYPE 03 - [VERIFY] - [LABELS] REQUEST NO
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR    ${lbl_ibs_request_no}    ${group_data_label}[${keys_group_data_label}[5]]

PAGE INQUIRY - TYPE 03 - [VERIFY] - [LABELS] REQUESTER
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR    ${lbl_ibs_requester}    ${group_data_label}[${keys_group_data_label}[10]]

PAGE INQUIRY - TYPE 03 - [VERIFY] - [LABELS] CONTRACT
    ${list}=    Common_keyword.CONVERT DATA SPLIT AND STRIP BY OPTION    ${group_data_label}[${keys_group_data_label}[4]]    option=${SPACE}
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR    ${lbl_ibs_contract}    ${list}[0]

# input 

PAGE INQUIRY - TYPE 03 - [INPUT] - [TEXT] CUSTOMER ID
    Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE    ${txt_ib_customer_id}    ${group_data}[${keys_group_data_label}[2]]   

PAGE INQUIRY - TYPE 03 - [INPUT] - [TEXT] CONTRACT
    Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE    ${txt_ib_contract}    ${group_data}[${keys_group_data_label}[4]]   

PAGE INQUIRY - TYPE 03 - [INPUT] - [TEXT] REQUEST NO
    Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE    ${txt_ib_request_no}    ${group_data}[${keys_group_data_label}[5]]   

PAGE INQUIRY - TYPE 03 - [INPUT] - [TEXT] REQUESTER
    Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE    ${txt_ib_requester}    ${group_data}[${keys_group_data_label}[10]]   


# click search button
PAGE INQUIRY - TYPE 03 - [CLICK] - [BTN] SEARCH
    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE     ${btn_search}    

# step 1 verify table title and data in table
# verify table
PAGE INQUIRY - TYPE 03 - [VERIFY] - [TITLE] - STEP 1 - REQUEST TYPE
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_td_replace}    ${group_data_label}[${keys_group_data_label}[1]]    # request type PAGE INQUIRY title exists   

PAGE INQUIRY - TYPE 03 - [VERIFY] - [TITLE] - STEP 1 - REQUEST TYPES
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_td_replace}    ${group_data_label}[${keys_group_data_label}[1]]    # request type PAGE INQUIRY title exists   

PAGE INQUIRY - TYPE 03 - [VERIFY] - [TITLE] - STEP 1 - REQUEST DESC
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_td_replace}    ${group_data_label}[${keys_group_data_label}[1]]    # request desc page inquiry title  

PAGE INQUIRY - TYPE 03 - [VERIFY] - [TITLE] - STEP 1 - CUSTOMER ID
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_td_replace}    ${group_data_label}[${keys_group_data_label}[2]]     

PAGE INQUIRY - TYPE 03 - [VERIFY] - [TITLE] - STEP 1 - TEAM
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_td_replace}    ${group_data_label}[${keys_group_data_label}[11]]          

PAGE INQUIRY - TYPE 03 - [VERIFY] - [TITLE] - STEP 1 - REASON
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_td_replace}    ${group_data_label}[${keys_group_data_label}[15]]           

PAGE INQUIRY - TYPE 03 - [VERIFY] - [TITLE] - STEP 1 - REQ NO
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_td_replace}    ${group_data_label}[${keys_group_data_label}[24]]    

PAGE INQUIRY - TYPE 03 - [VERIFY] - [TITLE] - STEP 1 - SENDER
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_td_replace}    ${group_data_label}[${keys_group_data_label}[25]]    

PAGE INQUIRY - TYPE 03 - [VERIFY] - [TITLE] - STEP 1 - SEND DATE
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_td_replace}    ${group_data_label}[${keys_group_data_label}[26]]    

PAGE INQUIRY - TYPE 03 - [VERIFY] - [TITLE] - STEP 1 - CONTRACT NO
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_td_replace}    ${group_data_label}[${keys_group_data_label}[27]]    # contract no. have - / 3969-001-000255494

PAGE INQUIRY - TYPE 03 - [VERIFY] - [TITLE] - STEP 1 - NAME
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_td_replace}    ${group_data_label}[${keys_group_data_label}[28]]     

PAGE INQUIRY - TYPE 03 - [VERIFY] - [TITLE] - STEP 1 - REQUEST BY
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_td_replace}    ${group_data_label}[${keys_group_data_label}[29]]  

PAGE INQUIRY - TYPE 03 - [VERIFY] - [TITLE] - STEP 1 - REQUEST AMT
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_td_replace}    ${group_data_label}[${keys_group_data_label}[30]]  

PAGE INQUIRY - TYPE 03 - [VERIFY] - [TITLE] - STEP 1 - APPROVE USER
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_td_replace}    ${group_data_label}[${keys_group_data_label}[31]]    # approve user PAGE INQUIRY and inquiry

PAGE INQUIRY - TYPE 03 - [VERIFY] - [TITLE] - STEP 1 - STATUS
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_td_replace}    ${group_data_label}[${keys_group_data_label}[32]]        

PAGE INQUIRY - TYPE 03 - [VERIFY] - [TITLE] - STEP 1 - BIZ
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_td_replace}    ${group_data_label}[${keys_group_data_label}[37]]    



# verify table
PAGE INQUIRY - TYPE 03 - [VERIFY] - [TEXT] - STEP 1 - REQUEST TYPE
    ${list}=    Common_keyword.CONVERT DATA SPLIT AND STRIP BY OPTION    ${group_data}[${keys_group_data_label}[1]]    option=:
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_td_replace}    ${list}[0]    

PAGE INQUIRY - TYPE 03 - [VERIFY] - [TEXT] - STEP 1 - REQUEST DESC
    ${list}=    Common_keyword.CONVERT DATA SPLIT AND STRIP BY OPTION    ${group_data}[${keys_group_data_label}[1]]    option=:
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_td_replace}    ${list}[1] 

PAGE INQUIRY - TYPE 03 - [VERIFY] - [TEXT] - STEP 1 - CUSTOMER ID
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_td_replace}    ${group_data}[${keys_group_data_label}[2]]     

PAGE INQUIRY - TYPE 03 - [VERIFY] - [TEXT] - STEP 1 - TEAM
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_td_replace}    ${group_data}[${keys_group_data_label}[11]]    # move focus     

PAGE INQUIRY - TYPE 03 - [VERIFY] - [TEXT] - STEP 1 - REASON
    ${list}=    Common_keyword.CONVERT DATA SPLIT AND STRIP BY OPTION    ${group_data}[${keys_group_data_label}[15]]    option=:
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_td_replace}    ${list}[0]            

PAGE INQUIRY - TYPE 03 - [VERIFY] - [TEXT] - STEP 1 - REQ NO
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_td_replace}    ${group_data}[${keys_group_data_label}[24]] 

PAGE INQUIRY - TYPE 03 - [VERIFY] - [TEXT] - STEP 1 - SENDER
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_td_replace}    ${group_data}[${keys_group_data_label}[25]]   

PAGE INQUIRY - TYPE 03 - [VERIFY] - [TEXT] - STEP 1 - SEND DATE
    ${con_date}=    Common_keyword.CONVERT DATE FORMAT    ${group_data}[${keys_group_data_label}[26]]
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_td_replace}    ${con_date}    

PAGE INQUIRY - TYPE 03 - [VERIFY] - [TEXT] - STEP 1 - CONTRACT NO
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_td_replace}    ${group_data}[${keys_group_data_label}[27]]     # contract no. have - / 3969-001-000255494     

PAGE INQUIRY - TYPE 03 - [VERIFY] - [TEXT] - STEP 1 - NAME
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_td_replace}    ${group_data}[${keys_group_data_label}[28]]     

PAGE INQUIRY - TYPE 03 - [VERIFY] - [TEXT] - STEP 1 - REQUEST BY
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_td_replace}    ${group_data}[${keys_group_data_label}[29]]  

PAGE INQUIRY - TYPE 03 - [VERIFY] - [TEXT] - STEP 1 - REQUEST AMT
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_td_replace}    ${group_data}[${keys_group_data_label}[30]]  

PAGE INQUIRY - TYPE 03 - [VERIFY] - [TEXT] - STEP 1 - APPROVE USER
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_td_replace}    ${group_data}[${keys_group_data_label}[31]]    # add new  P2106010

PAGE INQUIRY - TYPE 03 - [VERIFY] - [TEXT] - STEP 1 - STATUS
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_td_replace}    ${group_data}[${keys_group_data_label}[38]]    # data approve status finished  

PAGE INQUIRY - TYPE 03 - [VERIFY] - [TEXT] - STEP 1 - BIZ
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_td_replace}    ${group_data}[${keys_group_data_label}[37]]    

# click link action
PAGE INQUIRY - TYPE 03 - [CLICK] - [LINK] ACTION
    Common_keyword.CLICK ELEMENT BY LOCATOR    ${action_locator}

# loading 
PAGE INQUIRY - TYPE 03 - [WAIT] LOADING PAGE
    Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${loading}

# logout
PAGE INQUIRY - TYPE 03 - [CLICK] - [BTN] LOGOUT
    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE     ${btn_signout}    