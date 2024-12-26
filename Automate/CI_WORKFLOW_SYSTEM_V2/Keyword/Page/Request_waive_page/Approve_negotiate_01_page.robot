*** Settings ***
Resource    ${CURDIR}/../../../Import/Path_import.robot    # robotcode: ignore

*** Variables ***
# request no
${result_request_no}


*** Keywords ***

SET FORMAT DATA TYPE 01
    [Arguments]    ${matrix}    ${user_level}

    ${result_excel}    JSONLibrary.Get Value From Json    ${data_matrix_test_case}    $[?(@.TC == '${matrix}')]
    ${data_matrix}    BuiltIn.Set Variable   ${result_excel}[0]
    BuiltIn.Set Global Variable    ${data_matrix}
    # BuiltIn.Log    ${data_matrix}    WARN
    # BuiltIn.Log    ${Request_No}    WARN
    # BuiltIn.Log    ${State}    WARN

    IF  '${Request_No}' != 'none' and '${State}' == 'PASS_Request' or '${Request_No}' != 'none' and '${State}' == 'PASS_Approve' 
    
        BuiltIn.Log    ----------------------------------------    WARN 
        BuiltIn.Log    >RequestNO->${Request_No}    WARN
        BuiltIn.Log    >State->${State}    WARN
        BuiltIn.Log    ----------------------------------------    WARN

        # เลือก requst type
        Approve_negotiate_01_feature.SET FEATURE - TYPE - 01 - SELECT MENU - REQUEST TYPE - PAGE INBOX  

        # verify lable
        Approve_negotiate_01_feature.SET FEATURE - TYPE - 01 - VERIFY - REQUEST PAGE - PAGE INBOX   

        # input data
        Approve_negotiate_01_feature.SET FEATURE - TYPE - 01 - INPUT CRITERIA SEARCH - PAGE INBOX 

        # กดค้นหา
        Approve_negotiate_01_feature.SET FEATURE - TYPE - 01 - CLICK BTN SEARCH

        # รอ page loading
        Approve_negotiate_01_feature.SET FEATURE - TYPE - 01 - WAIT - VERIFY - PAGE INBOX

        # Verify data 
        Approve_negotiate_01_feature.SET FEATURE - TYPE - 01 - VERIFY STEP 1 - DATA - PAGE INBOX

        # click action 
        Approve_negotiate_01_feature.SET FEATURE - TYPE - 01 - CLICK LINK ACTION
        
        # verify data
        Approve_negotiate_01_feature.SET FEATURE - TYPE - 01 - VERIFY - DATA STEP 2 - PAGE INBOX

        # check send to
        ${status}    BuiltIn.Run Keyword And Return Status    Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${lbl_ib_sendto}    10s
    
        IF  '${status}' == 'True'    # ถ้ามี ปุ่ม send to
            BuiltIn.Log   SEND TO STATUS->${status}    WARN

            IF  '${user_level}' == '0'
                BuiltIn.Log   CASE SEND TO->${user_level}    WARN
                Common_keyword.SELECT OPTION SELECT FROM LIST BY LABEL    ${txt_ib_sendto}    ${group_user}[${keys_group_user}[3]]    #Send to 1 = P2503064
            
            ELSE IF  '${user_level}' == '1'
                BuiltIn.Log   CASE SEND TO->${user_level}    WARN
                Common_keyword.SELECT OPTION SELECT FROM LIST BY LABEL    ${txt_ib_sendto}    ${group_user}[${keys_group_user}[5]]    #Send to 2 = P2510033 
        
            ELSE IF  '${user_level}' == '2'
                BuiltIn.Log   CASE SEND TO->${user_level}    WARN
                Common_keyword.SELECT OPTION SELECT FROM LIST BY LABEL    ${txt_ib_sendto}    ${group_user}[${keys_group_user}[7]]    #Send to 3 = P2503067 
        
            ELSE IF  '${user_level}' == '3'
                BuiltIn.Log   CASE SEND TO->${user_level}    WARN
                Common_keyword.SELECT OPTION SELECT FROM LIST BY LABEL    ${txt_ib_sendto}    ${group_user}[${keys_group_user}[9]]    #Send to 4 = P2106010 
        
            ELSE IF  '${user_level}' == '4'
                BuiltIn.Log   CASE SEND TO->${user_level}    WARN
                Common_keyword.SELECT OPTION SELECT FROM LIST BY LABEL    ${txt_ib_sendto}    ${group_user}[${keys_group_user}[11]]    #Send to 5 = KIMURA
            END

            ${finish_send_to}    BuiltIn.Set Variable    True
            BuiltIn.Set Global Variable    ${finish_send_to}
    
        ELSE IF  '${status}' == 'False'    # ถ้าไม่มี ปุ่ม send to
            BuiltIn.Log   SEND TO STATUS->${status}    WARN
            ${finish_send_to}    BuiltIn.Set Variable    False
            BuiltIn.Set Global Variable    ${finish_send_to}

            # ถ้าไม่เจอ send to 
            SET ACTUAL RESULT NAME    ${type_01}
            Common_feature.SET DATA ACTUAL RESULT ON EXCEL UPDATE   Results    ${Customer_ID}    State    PASS_Approve 
        END   
      
        # input data note
        Approve_negotiate_01_feature.SET FEATURE - TYPE - 01 - INPUT - NOTE - PAGE INBOX

        # กด approve
        Approve_negotiate_01_feature.SET FEATURE - TYPE - 01 - CLICK - APPROVE - PAGE INBOX     

        # verify pop up
        Approve_negotiate_01_feature.SET FEATURE - TYPE - 01 - VERIFY - APPROVE POPUP - PAGE INBOX  

        # verify data
        Approve_negotiate_01_feature.SET FEATURE - TYPE - 01 - CLICK - APPROVE POPUP - CLICK OK - PAGE INBOX     
    
        # logout
        Common_keyword.UNSELECT IFRAME   
        Common_keyword.WAITING FOR DATA UPDATE    1s 
        Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE     ${btn_signout}  

    END

# add new
PAGE INBOX - TYPE 01 - OPEN INRANET
    Common_keyword.OPEN INTRANET
    Common_keyword.CLICK SSO ICON

# add new
PAGE INBOX - TYPE 01 - INPUT USENAME AND PASSWORD BY USER LEVEL
    [Arguments]    ${user_level}

    IF  '${user_level}' == '0'         # user approve user0 
        PAGE INBOX - TYPE 01 - SETTING LOGIN    WORKFLOW    ${group_user}[${keys_group_user}[3]]    ${group_user}[${keys_group_user}[4]]    ${user_level}    # 0 row,col -> 3,4 -> P2503064
    ELSE IF  '${user_level}' == '1'    # user approve user1 
        PAGE INBOX - TYPE 01 - SETTING LOGIN    WORKFLOW    ${group_user}[${keys_group_user}[5]]    ${group_user}[${keys_group_user}[6]]    ${user_level}    # 1 row,col -> 5,6 -> P2510033
    ELSE IF  '${user_level}' == '2'    # user approve user2
        PAGE INBOX - TYPE 01 - SETTING LOGIN    WORKFLOW    ${group_user}[${keys_group_user}[7]]    ${group_user}[${keys_group_user}[8]]    ${user_level}     # 2 row,col -> 7,8  -> P2503067
    ELSE IF  '${user_level}' == '3'    # user approve user3
        PAGE INBOX - TYPE 01 - SETTING LOGIN    WORKFLOW    ${group_user}[${keys_group_user}[9]]    ${group_user}[${keys_group_user}[10]]    ${user_level}     # 3 row,col -> 9,10 -> P2106010 
    ELSE IF  '${user_level}' == '4'    # user approve user4
        PAGE INBOX - TYPE 01 - SETTING LOGIN    WORKFLOW    ${group_user}[${keys_group_user}[11]]    ${group_user}[${keys_group_user}[12]]    ${user_level}     # 4 row,col -> 11,12 -> KIMURA
    END

# add new
PAGE INBOX - TYPE 01 - SETTING LOGIN
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
PAGE INBOX - TYPE 01 - [CLICK] - LINK 
    ${link_system}=    Common_keyword.REPLACE BY DATA EXCEL AND RETURN LOCATOR DATA GRID    ${link_system}    ${group_user}[${keys_group_user}[2]]    
    Common_keyword.CLICK ELEMENT BY LOCATOR    ${link_system}   

# wait update page 
PAGE INBOX - TYPE 01 - [WAIT] - [VERIFY] PAGE
    Common_keyword.WAITING FOR DATA UPDATE    1s    

PAGE INBOX - TYPE 01 - [CLICK] - [MENU]
    [Arguments]    ${menu} 
    ${locator_menu}    Common_keyword.REPLACE BY DATA EXCEL AND RETURN LOCATOR DATA GRID    ${menu_locator}    ${menu}
    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE    ${locator_menu}    

PAGE INBOX - TYPE 01 - [CLICK] - [SUB MENU]
    [Arguments]    ${sub_menu} 
    ${locator_menu}    Common_keyword.REPLACE BY DATA EXCEL AND RETURN LOCATOR DATA GRID    ${sub_menu_locator}    ${sub_menu}
    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE    ${locator_menu}    

# เลือก iframe
PAGE INBOX - TYPE 01 - [SELCET] - [FRAME] IFRAME
    Common_keyword.SELECT IFRAME    ${iframe_locator}

# เลือก iframe
PAGE INBOX - TYPE 01 - [UNSELCET] - [FRAME] UNIFRAME
    Common_keyword.UNSELECT IFRAME   

# เลือก request type
PAGE INBOX - TYPE 01 - [SELCET] - [DROPDOWN] REQUEST TYPE
    Common_keyword.SELECT OPTION SELECT FROM LIST BY LABEL    ${sel_ibs_request_type}    ${group_user}[${keys_group_user}[1]]

# input 
PAGE INBOX - TYPE 01 - [INPUT] - [TEXT] CUSTOMER ID
    Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE    ${txt_ib_customer_id}    ${Customer_ID}   

PAGE INBOX - TYPE 01 - [INPUT] - [TEXT] CONTRACT
    Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE    ${txt_ib_contract}    ${Contract_No}   

PAGE INBOX - TYPE 01 - [INPUT] - [TEXT] REQUEST NO
    Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE    ${txt_ib_request_no}    ${Request_No}   

PAGE INBOX - TYPE 01 - [INPUT] - [TEXT] REQUESTER
    Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE    ${txt_ib_requester}    ${group_user}[${keys_group_user}[3]]   

# click search button
PAGE INBOX - TYPE 01 - [CLICK] - [BTN] SEARCH
    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE     ${btn_search}    

# step 1 verify table title and data in table
# verify table
PAGE INBOX - TYPE 01 - [VERIFY] - [DATA] - STEP 1 - REQUEST TYPE
    ${list}    Common_keyword.CONVERT DATA SPLIT AND STRIP BY OPTION    ${group_user}[${keys_group_user}[1]]     option=:
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_td_replace}    ${list}[1]    

PAGE INBOX - TYPE 01 - [VERIFY] - [DATA] - STEP 1 - CUSTOMER ID
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_td_replace}    ${Customer_ID}     

PAGE INBOX - TYPE 01 - [VERIFY] - [DATA] - STEP 1 - REASON
    ${list}    Common_keyword.CONVERT DATA SPLIT AND STRIP BY OPTION    ${data_matrix}[Reason]    option=:
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_td_replace}    ${list}[0]            

PAGE INBOX - TYPE 01 - [VERIFY] - [DATA] - STEP 1 - REQ NO
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_td_replace}    ${Request_No} 

PAGE INBOX - TYPE 01 - [VERIFY] - [DATA] - STEP 1 - SENDER
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_td_replace}    ${group_user}[${keys_group_user}[3]]  

PAGE INBOX - TYPE 01 - [VERIFY] - [DATA] - STEP 1 - CONTRACT NO
    ${Contract_No}    Common_keyword.Convert To Desired Format    ${Contract_No}     # contract no. have - / 3969-001-000255494    
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_td_replace}    ${Contract_No}    

PAGE INBOX - TYPE 01 - [VERIFY] - [DATA] - STEP 1 - NAME
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_td_replace}    ${Customer_Name}     

PAGE INBOX - TYPE 01 - [VERIFY] - [DATA] - STEP 1 - REQUEST BY
    Common_keyword.GET TEXT VERIFY DATA AND PAGE REPLACE LOCATOR OPTION AND EQUAL STRINGS    ${txt_td_replace}    ${group_user}[${keys_group_user}[3]]  

# click link action for go to page approve type 01 
PAGE INBOX - TYPE 01 - [CLICK] - [LINK] ACTION
    Common_keyword.CLICK ELEMENT BY LOCATOR    ${action_locator}


# step 2 change page old content new fields
#verify data step 2 
PAGE INBOX - TYPE 01 - [VERIFY] - [DATA] - STEP 2 - REQUEST TYPE    
    Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${txt_ib_request_type}
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR STRIP AND EQUAL STRINGS    ${txt_ib_request_type}    ${group_user}[${keys_group_user}[1]]        

PAGE INBOX - TYPE 01 - [VERIFY] - [DATA] - STEP 2 - BUSINESS
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR STRIP AND EQUAL STRINGS    ${txt_ib_business}    ${data_matrix}[Business]     

PAGE INBOX - TYPE 01 - [VERIFY] - [DATA] - STEP 2 - CONTRACT NO
    Common_keyword.GET VALUE PAGE CONTAINS ELEMENT BY LOCATOR AND EQUAL STRINGS    ${txt_ib_contract_no}    ${Contract_No}

PAGE INBOX - TYPE 01 - [VERIFY] - [DATA] - STEP 2 - CUSTOMER ID
    Common_keyword.GET VALUE PAGE CONTAINS ELEMENT BY LOCATOR AND EQUAL STRINGS    ${txt_ib_customer_id}    ${Customer_ID}    
    
PAGE INBOX - TYPE 01 - [VERIFY] - [DATA] - STEP 2 - CUSTOMER NAME
    Common_keyword.GET VALUE PAGE CONTAINS ELEMENT BY LOCATOR AND EQUAL STRINGS    ${txt_ib_customer_name}    ${Customer_Name}

PAGE INBOX - TYPE 01 - [VERIFY] - [DATA] - STEP 2 - REQUEST NO
    Common_keyword.GET VALUE PAGE CONTAINS ELEMENT BY LOCATOR AND EQUAL STRINGS    ${txt_ib_request_no}    ${Request_No}

PAGE INBOX - TYPE 01 - [VERIFY] - [DATA] - STEP 2 - STATUS DATE  
    Common_keyword.GET VALUE PAGE CONTAINS ELEMENT BY LOCATOR AND EQUAL STRINGS    ${txt_ib_request_date}    ${date_start_cal_date}   

PAGE INBOX - TYPE 01 - [VERIFY] - [DATA] - STEP 2 - REQUEST DATE  
    Common_keyword.GET VALUE PAGE CONTAINS ELEMENT BY LOCATOR AND EQUAL STRINGS    ${txt_ib_request_date}    ${date_start_cal_date}   

PAGE INBOX - TYPE 01 - [VERIFY] - [DATA] - STEP 2 - REQUESTER
    Common_keyword.GET VALUE PAGE CONTAINS ELEMENT BY LOCATOR AND EQUAL STRINGS    ${txt_ib_requester}    ${group_user}[${keys_group_user}[3]]

PAGE INBOX - TYPE 01 - [VERIFY] - [DATA] - STEP 2 - TOTAL O/S BALANCE
    Common_keyword.GET VALUE PAGE CONTAINS ELEMENT BY LOCATOR AND EQUAL STRINGS    ${txt_ib_total_os_balance}    ${Total_OS_Balance}

PAGE INBOX - TYPE 01 - [VERIFY] - [DATA] - STEP 2 - TOTAL PENALTY
    Common_keyword.GET VALUE PAGE CONTAINS ELEMENT BY LOCATOR AND EQUAL STRINGS    ${txt_ib_total_penalty}    ${Total_Penalty}

PAGE INBOX - TYPE 01 - [VERIFY] - [DATA] - STEP 2 - WAIVE AMOUNT
    Common_keyword.GET VALUE PAGE CONTAINS ELEMENT BY LOCATOR AND EQUAL STRINGS    ${txt_ib_waive_amount}    ${Waive_Amount}

PAGE INBOX - TYPE 01 - [VERIFY] - [DATA] - STEP 2 - REASON
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR STRIP AND EQUAL STRINGS    ${txt_ib_reason}    ${data_matrix}[Reason]       

PAGE INBOX - TYPE 01 - [VERIFY] - [DATA] - STEP 2 - REASON NOTE
    Common_keyword.GET VALUE PAGE CONTAINS ELEMENT BY LOCATOR AND EQUAL STRINGS    ${txt_ib_reason_note}    ${data_matrix}[Reason Note]

# verify note 
PAGE INBOX - TYPE 01 - [VERIFY] - [LABEL] NOTE
    Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${lbl_ib_note}       

# input data note
PAGE INBOX - TYPE 01 - [INPUT] - [TEXT] NOTE
    Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE    ${txt_ib_note}    ${data_matrix}[Note]   

# btn approve
PAGE INBOX - TYPE 01 - [CLICK] - [BTN] APPROVE
    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE    ${btn_approve}        

# verify title popup
PAGE INBOX - TYPE 01 - [VERIFY] - [TITLE] APPROVE 
    Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR     ${verfiy_approve_popup}    

PAGE INBOX - TYPE 01 - [VERIFY] - [POPUP] APPROVE - [CLICK] OK
    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE     ${btn_ok_approve_popup}    

PAGE INBOX - TYPE 01 - [VERIFY] - [POPUP] APPROVE - [CLICK] CANCEL
    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE     ${btn_cancel_approve_popup}    

# loading 
PAGE INBOX - TYPE 01 - [WAIT] LOADING PAGE
    Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${loading}    time_out=120s

PAGE INBOX - TYPE 01 - [VERIFY] - [LOADING] 
    Common_keyword.WAITING ELEMENT WHEN ELEMENT IS NOT VISIBLE BY LOCATOR    ${loading}    time_out=120s
 
# logout
PAGE INBOX - TYPE 01 - [CLICK] - [BTN] LOGOUT
    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE     ${btn_signout}    