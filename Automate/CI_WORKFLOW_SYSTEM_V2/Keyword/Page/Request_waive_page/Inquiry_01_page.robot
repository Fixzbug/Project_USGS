*** Settings ***
Resource    ${CURDIR}/../../../Import/Path_import.robot    # robotcode: ignore

*** Variables ***
# request no
${result_request_no}

*** Keywords ***

SET FORMAT DATA TYPE 01
    [Arguments]    ${matrix}

    ${result_excel}    JSONLibrary.Get Value From Json    ${data_matrix_test_case}    $[?(@.TC == '${matrix}')]
    ${data_matrix}    BuiltIn.Set Variable   ${result_excel}[0]
    BuiltIn.Set Global Variable    ${data_matrix}
    # BuiltIn.Log    ${data_matrix}    WARN
    # BuiltIn.Log    ${Request_No}    WARN
    # BuiltIn.Log    ${State}    WARN

    IF  '${Request_No}' != 'none' and '${State}' == 'PASS_Approve' 
    
        BuiltIn.Log    ----------------------------------------    WARN 
        BuiltIn.Log    >RequestNO->${Request_No}    WARN
        BuiltIn.Log    >State->${State}    WARN
        BuiltIn.Log    ----------------------------------------    WARN

        # เลือก requst type
        Inquiry_01_feature.SET FEATURE - TYPE - 01 - SELECT MENU - REQUEST TYPE - PAGE INQUIRY  

        # verify lable
        Inquiry_01_feature.SET FEATURE - TYPE - 01 - VERIFY - REQUEST PAGE - PAGE INQUIRY   

        # input data
        Inquiry_01_feature.SET FEATURE - TYPE - 01 - INPUT CRITERIA SEARCH - PAGE INQUIRY

        # กดค้นหา
        Inquiry_01_feature.SET FEATURE - TYPE - 01 - CLICK BTN SEARCH

        # รอ page loading
        Inquiry_01_feature.SET FEATURE - TYPE - 01 - WAIT - VERIFY - PAGE INQUIRY

        # verify data
        Inquiry_01_feature.SET FEATURE - TYPE - 01 - VERIFY - DATA - PAGE INQUIRY    


        ${status_}    BuiltIn.Run Keyword And Return Status    SeleniumLibrary.Wait Until Element Is Visible    ${txt_value_table_inq_status_finish_locator}
        IF  ${status_}

            SET ACTUAL RESULT NAME    ${type_01}
            Common_feature.SET DATA ACTUAL RESULT ON EXCEL UPDATE   Results    ${Customer_ID}    State    Finished 

            # ออกจากระบบ
            Inquiry_01_feature.SET FEATURE - TYPE - 01 - CLICK - LOGOUT - PAGE INQUIRY
        ELSE
            
            SET ACTUAL RESULT NAME    ${type_01}
            Common_feature.SET DATA ACTUAL RESULT ON EXCEL UPDATE   Results    ${Customer_ID}    State    Pending 

            # ออกจากระบบ
            Inquiry_01_feature.SET FEATURE - TYPE - 01 - CLICK - LOGOUT - PAGE INQUIRY
        END

    END

# add new
PAGE INQUIRY - TYPE 01 - OPEN INRANET
    Common_keyword.OPEN INTRANET
    Common_keyword.CLICK SSO ICON

# add new
PAGE INQUIRY - TYPE 01 - INPUT USENAME AND PASSWORD BY USER LEVEL
    [Arguments]    ${user_level}

    IF  '${user_level}' == '0'         # user approve user0 
        PAGE INQUIRY - TYPE 01 - SETTING LOGIN    WORKFLOW    ${group_user}[${keys_group_user}[3]]    ${group_user}[${keys_group_user}[4]]    ${user_level}    # 1 row,col -> 3,4 -> P2503064
    ELSE IF  '${user_level}' == '1'    # user approve user1 
        PAGE INQUIRY - TYPE 01 - SETTING LOGIN    WORKFLOW    ${group_user}[${keys_group_user}[5]]    ${group_user}[${keys_group_user}[6]]    ${user_level}    # 1 row,col -> 5,6 -> P2510033
    ELSE IF  '${user_level}' == '2'    # user approve user2
        PAGE INQUIRY - TYPE 01 - SETTING LOGIN    WORKFLOW    ${group_user}[${keys_group_user}[7]]    ${group_user}[${keys_group_user}[8]]    ${user_level}     # 2 row,col -> 7,8  -> P2503067
    ELSE IF  '${user_level}' == '3'    # user approve user3
        PAGE INQUIRY - TYPE 01 - SETTING LOGIN    WORKFLOW    ${group_user}[${keys_group_user}[9]]    ${group_user}[${keys_group_user}[10]]    ${user_level}     # 3 row,col -> 9,10 -> P2106010 
    ELSE IF  '${user_level}' == '4'    # user approve user4
        PAGE INQUIRY - TYPE 01 - SETTING LOGIN    WORKFLOW    ${group_user}[${keys_group_user}[11]]    ${group_user}[${keys_group_user}[12]]    ${user_level}     # 4 row,col -> 11,12 -> KIMURA
    END

# add new
PAGE INQUIRY - TYPE 01 - SETTING LOGIN
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
PAGE INQUIRY - TYPE 01 - [CLICK] - LINK 
    ${link_system}=    Common_keyword.REPLACE BY DATA EXCEL AND RETURN LOCATOR DATA GRID    ${link_system}    ${group_user}[${keys_group_user}[2]]    
    Common_keyword.CLICK ELEMENT BY LOCATOR    ${link_system}   

# wait update page 
PAGE INQUIRY - TYPE 01 - [WAIT] - [VERIFY] PAGE
    Common_keyword.WAITING FOR DATA UPDATE    1s    


PAGE INQUIRY - TYPE 01 - [CLICK] - [MENU]
    [Arguments]    ${menu} 
    ${locator_menu}    Common_keyword.REPLACE BY DATA EXCEL AND RETURN LOCATOR DATA GRID    ${menu_locator}    ${menu}
    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE    ${locator_menu}    


PAGE INQUIRY - TYPE 01 - [CLICK] - [SUB MENU]
    [Arguments]    ${sub_menu} 
    ${locator_menu}    Common_keyword.REPLACE BY DATA EXCEL AND RETURN LOCATOR DATA GRID    ${sub_menu_locator}    ${sub_menu}
    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE    ${locator_menu}    


# เลือก iframe
PAGE INQUIRY - TYPE 01 - [SELCET] - [FRAME] IFRAME
    Common_keyword.SELECT IFRAME    ${iframe_locator}

# เลือก iframe
PAGE INQUIRY - TYPE 01 - [UNSELCET] - [FRAME] UNIFRAME
    Common_keyword.UNSELECT IFRAME   

# เลือก request type
PAGE INQUIRY - TYPE 01 - [SELCET] - [DROPDOWN] REQUEST TYPE
    Common_keyword.SELECT OPTION SELECT FROM LIST BY LABEL    ${sel_ibs_request_type}    ${group_user}[${keys_group_user}[1]]

# input 

PAGE INQUIRY - TYPE 01 - [INPUT] - [TEXT] CUSTOMER ID
    Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE    ${txt_ib_customer_id}    ${Customer_ID}   

PAGE INQUIRY - TYPE 01 - [INPUT] - [TEXT] CONTRACT
    Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE    ${txt_ib_contract}    ${Contract_No}    

PAGE INQUIRY - TYPE 01 - [INPUT] - [TEXT] REQUEST NO
    Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE    ${txt_ib_request_no}    ${Request_No}    

PAGE INQUIRY - TYPE 01 - [INPUT] - [TEXT] REQUESTER
    Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE    ${txt_ib_requester}    ${group_user}[${keys_group_user}[3]]   


# click search button
PAGE INQUIRY - TYPE 01 - [CLICK] - [BTN] SEARCH
    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE     ${btn_search}    

# step 1 verify table title and data in table
# verify table
PAGE INQUIRY - TYPE 01 - [VERIFY] - [DATA] - STEP 1 - REQUEST TYPE
    ${list}    Common_keyword.CONVERT DATA SPLIT AND STRIP BY OPTION    ${group_user}[${keys_group_user}[1]]    option=:
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_td_replace}    ${list}[1]    

PAGE INQUIRY - TYPE 01 - [VERIFY] - [DATA] - STEP 1 - CUSTOMER ID
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_td_replace}     ${Customer_ID}     

PAGE INQUIRY - TYPE 01 - [VERIFY] - [DATA] - STEP 1 - REASON
    ${list}    Common_keyword.CONVERT DATA SPLIT AND STRIP BY OPTION    ${data_matrix}[Reason]    option=:
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_td_replace}    ${list}[0]            

PAGE INQUIRY - TYPE 01 - [VERIFY] - [DATA] - STEP 1 - REQ NO
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_td_replace}    ${Request_No}  
  
PAGE INQUIRY - TYPE 01 - [VERIFY] - [DATA] - STEP 1 - SEND DATE
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_td_replace}    ${date_start_cal_date}    

PAGE INQUIRY - TYPE 01 - [VERIFY] - [DATA] - STEP 1 - CONTRACT NO
    ${Contract_No}    Common_keyword.Convert To Desired Format    ${Contract_No}     # contract no. have - / 3969-001-000255494   
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_td_replace}    ${Contract_No}         

PAGE INQUIRY - TYPE 01 - [VERIFY] - [DATA] - STEP 1 - NAME
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_td_replace}    ${Customer_Name}     

PAGE INQUIRY - TYPE 01 - [VERIFY] - [DATA] - STEP 1 - REQUEST BY
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_td_replace}    ${group_user}[${keys_group_user}[3]]  

PAGE INQUIRY - TYPE 01 - [VERIFY] - [DATA] - STEP 1 - REQUEST AMT
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_td_replace}    ${Waive_Amount}  

PAGE INQUIRY - TYPE 01 - [VERIFY] - [DATA] - STEP 1 - STATUS
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_td_replace}    Finished    


# click link action
PAGE INQUIRY - TYPE 01 - [CLICK] - [LINK] ACTION
    Common_keyword.CLICK ELEMENT BY LOCATOR    ${action_locator}

# loading 
PAGE INQUIRY - TYPE 01 - [WAIT] LOADING PAGE
    Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${loading}   

# logout
PAGE INQUIRY - TYPE 01 - [CLICK] - [BTN] LOGOUT
    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE     ${btn_signout}    