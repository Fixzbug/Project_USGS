*** Settings ***
Resource    ${CURDIR}/../../../Import/Path_import.robot    # robotcode: ignore

*** Variables ***

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

SET FORMAT DATA - ALL DATA AND INPUT DATA
    [Arguments]    ${row}    ${start_at_case}    ${end_at_case}
    
    ${countrow}    BuiltIn.Set Variable If    ${end_at_case} <= ${data_count_row}    ${end_at_case}    ${data_count_row}
    
    FOR  ${index}  IN RANGE    ${start_at_case}    ${countrow} + 1  

        ${result_excel}    JSONLibrary.Get Value From Json    ${data_from_excel_by_sheet}    $[?(@.TC == '${row}_${index}')]

            ${group_data}   BuiltIn.Set Variable   ${result_excel}[0]
            BuiltIn.Set Global Variable    ${group_data}

            # BuiltIn.Log    ${keys_group_data_label}    WARN
            # ['TC', 'Request_Type', 'Business', 'AAA', 'Contract_No', 'Customer_ID', 'Receipt_No', 'Receipt_Amount', 'Receipt_Date', 'Request_No', 'State', 'Customer_Name', 'OD_Status']
   
            FOR    ${index}    ${title_key_data_label_value}    IN ENUMERATE    @{keys_group_data_label}     

                ${Titles_label_excel}    BuiltIn.Set Variable    ${group_data_label}[${keys_group_data_label}[${index}]]
                ${Datas}    BuiltIn.Set Variable    ${group_data}[${keys_group_data_label}[${index}]]    

                BuiltIn.Log    --------------------------------    WARN   
                BuiltIn.Log    INEX>${index}<---->TITLE>${title_key_data_label_value}    WARN   
                BuiltIn.Log    TilteLable>${title_key_data_label_value}    WARN
                BuiltIn.Log    Tilte>${Titles_label_excel}    WARN
                BuiltIn.Log    Data>${Datas}    WARN
             
                IF  '${Titles_label_excel}' == '${title_key_data_label_value}' and '${Titles_label_excel}' != '${spaces}' # ไม่เอา title AAA
                   BuiltIn.Log    INCASE->${group_data}[${keys_group_data_label}[${index}]]    WARN
                #    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR    ${txt_replace}    ${group_data}[${keys_group_data_label}[${index}]]
                END
            END
     
    END

                
# add new
PAGE REQUEST WAIVE - OPEN INRANET
    Common_keyword.OPEN INTRANET
    Common_keyword.CLICK SSO ICON

# add new
PAGE REQUEST WAIVE - INPUT USENAME AND PASSWORD BY USER LEVEL
    [Arguments]    ${user_level}

    IF  '${user_level}' == '0'         # user approve user0 
        PAGE REQUEST WAIVE - SETTING LOGIN    WORKFLOW    ${group_user}[${keys_group_user}[3]]    ${group_user}[${keys_group_user}[4]]    ${user_level}    # 1 row,col -> 3,4 -> P2503064
    ELSE IF  '${user_level}' == '1'    # user approve user1 
        PAGE REQUEST WAIVE - SETTING LOGIN    WORKFLOW    ${group_user}[${keys_group_user}[5]]    ${group_user}[${keys_group_user}[6]]    ${user_level}    # 1 row,col -> 5,6 -> P2510033
    ELSE IF  '${user_level}' == '2'    # user approve user2
        PAGE REQUEST WAIVE - SETTING LOGIN    WORKFLOW    ${group_user}[${keys_group_user}[7]]    ${group_user}[${keys_group_user}[8]]    ${user_level}     # 2 row,col -> 7,8  -> P2503067
    ELSE IF  '${user_level}' == '3'    # user approve user3
        PAGE REQUEST WAIVE - SETTING LOGIN    WORKFLOW    ${group_user}[${keys_group_user}[9]]    ${group_user}[${keys_group_user}[10]]    ${user_level}     # 3 row,col -> 9,10 -> P2106010 
    ELSE IF  '${user_level}' == '4'    # user approve user4
        PAGE REQUEST WAIVE - SETTING LOGIN    WORKFLOW    ${group_user}[${keys_group_user}[11]]    ${group_user}[${keys_group_user}[12]]    ${user_level}     # 4 row,col -> 11,12 -> KIMURA
    END

# add new
PAGE REQUEST WAIVE - SETTING LOGIN
    [Arguments]    ${system_name}    ${username}    ${password}    ${user_level}

    [Timeout]    180s
        # หน้า login #User Authentication
        #Verify
        SeleniumLibrary.Wait Until Element Is Visible    ${verify_header_locator}    timeout=60s    # User Authentication
        
        # User name
        SeleniumLibrary.Wait Until Element Is Visible    ${sso_username_text_area}
        SeleniumLibrary.Input Text    ${sso_username_text_area}   ${username}
        # Password
        SeleniumLibrary.Wait Until Element Is Visible    ${SSO_Password_text_area}
        SeleniumLibrary.Input Password    ${sso_password_text_area}    ${password}  
            
        # Click login button
        Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    ${system_name}    LOGIN - USER LEVEL - ${user_level} USER - ${username}
        SeleniumLibrary.Wait Until Element Is Visible    ${btn_login_on_user_authentication}
        SeleniumLibrary.Click Button    ${btn_login_on_user_authentication}


PAGE REQUEST WAIVE - [CLICK] - LINK 
    ${link_system}=    Common_keyword.REPLACE BY DATA EXCEL AND RETURN LOCATOR DATA GRID    ${link_system}    ${group_user}[${keys_group_user}[2]]   
    Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${link_system}     
    Common_keyword.CLICK ELEMENT BY LOCATOR    ${link_system}   

# wait update page 
PAGE REQUEST WAIVE - [WAIT] - [VERIFY] PAGE
    Common_keyword.WAITING FOR DATA UPDATE    1s    

PAGE REQUEST WAIVE - [CLICK] - [MENU]
    [Arguments]    ${menu} 
    ${locator_menu}    Common_keyword.REPLACE BY DATA EXCEL AND RETURN LOCATOR DATA GRID    ${menu_locator}    ${menu}
    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE    ${locator_menu}

PAGE REQUEST WAIVE - [CLICK] - [SUB MENU]
    [Arguments]    ${sub_menu} 
    ${locator_menu}    Common_keyword.REPLACE BY DATA EXCEL AND RETURN LOCATOR DATA GRID    ${sub_menu_locator}    ${sub_menu}
    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE    ${locator_menu}

# เลือก iframe
PAGE REQUEST WAIVE - [SELCET] - [FRAME] IFRAME
    Common_keyword.SELECT IFRAME    ${iframe_locator}

# เลือก iframe
PAGE REQUEST WAIVE - [UNSELCET] - [FRAME] UNIFRAME
    Common_keyword.UNSELECT IFRAME   

# เลือก request type
PAGE REQUEST WAIVE - [SELCET] - [DROPDOWN] REQUEST TYPE
    Common_keyword.SELECT OPTION SELECT FROM LIST BY LABEL    ${sel_request_type_locator}    ${group_user}[${keys_group_user}[1]]
    
PAGE REQUEST WAIVE - [CLICK] - [BTN] APPROVE
    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE    ${btn_approve}    

#verify   
PAGE REQUEST WAIVE - [VERIFY] - [LABEL] BUSINESS
    Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${lbl_req_business}    5s          

PAGE REQUEST WAIVE - [VERIFY] - [LABEL] CONTRACT NO 
    Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${lbl_contract_no}    5s          

PAGE REQUEST WAIVE - [VERIFY] - [LABEL] ID CARD 
    Common_keyword.WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR    ${lbl_id_card}    5s       

# input 
PAGE REQUEST WAIVE - [SELECT] - [DROPDOWN] BUSINESS
    Common_keyword.SELECT OPTION SELECT FROM LIST BY LABEL    ${sel_req_business}    ${group_data}[${keys_group_data_label}[2]]   

PAGE REQUEST WAIVE - [INPUT] - [TEXT] CONTRACT NO  
    Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE    ${req_contract_no}    ${group_data}[${keys_group_data_label}[3]]    
  
PAGE REQUEST WAIVE - [INPUT] - [TEXT] ID CARD 
    Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE    ${req_id_card}    ${group_data}[${keys_group_data_label}[4]]     
  
#verify 

PAGE REQUEST WAIVE - [VERIFY] - [LABELS] MID
    Common_keyword.GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR    ${txt_replace}    ${group_data_label}[A2]
    
