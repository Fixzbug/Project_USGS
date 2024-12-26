*** Settings ***
Resource    ${CURDIR}/../../../Import/Path_import.robot    # robotcode: ignore          


*** Variables ***
${status}
${state_next_step}    Not Success : Changepriority_KS2

*** Keywords ***

SELECT CHANGE PRIORITY 
    [Arguments]    ${locator}    ${group_value}    ${Data_Dropdowns}        
    [Documentation]
    ...    ลำดับการส่ง 1.Locator  2.Excel  3.Data Dropdown

    ${Status}    BuiltIn.Run Keyword And Return Status    SeleniumLibrary.Wait Until Element Is Visible    ${locator}    60s

    IF  '${Status}' == 'True' 
            SeleniumLibrary.Wait Until Element Is Visible    ${locator}    20s
            SeleniumLibrary.Click Element    ${locator}

            ${locator_sel_str}    BuiltIn.Set Variable    ${group_value}
            ${locator_sel_str1}    BuiltIn.Convert to String    ${locator_sel_str}
            ${locator_Dropdown}    String.Replace string       ${Data_Dropdowns}    ***replace***       ${locator_sel_str1}

            SeleniumLibrary.Wait Until Element Is Visible    ${locator_Dropdown}    20s
            SeleniumLibrary.Scroll Element Into View    ${locator_Dropdown}
            SeleniumLibrary.Click Element    ${locator_Dropdown}
    ELSE
        BuiltIn.Log    False    WARN
    END

CHANGE PRIORITY - SELECT DROPDOWN BOTEN
    [Arguments]    ${group_value_User}
    SELECT CHANGE PRIORITY    ${Locator_ChangePriority_Boten}    ${group_value_User}[0][BOTEN]    ${Dropdown_Changepriority_Boten}
    

CHANGE PRIORITY - SELECT DROPDOWN SECTION
    [Arguments]    ${group_value_User}
    SELECT CHANGE PRIORITY    ${Locator_ChangePriority_Card}    ${group_value_User}[0][SECTION]    ${Dropdown_Changepriority_Card}


CHANGE PRIORITY - SELECT DROPDOWN TEAM
    [Arguments]    ${group_value_User}
    SELECT CHANGE PRIORITY    ${Locator_ChangePriority_Team}    ${group_value_User}[0][TEAM]    ${Dropdown_Changepriority_Team}


CHANGE PRIORITY - SELECT DROPDOWN USER
    [Arguments]    ${group_value_User}
    SELECT CHANGE PRIORITY    ${Locator_ChangePriority_User}    ${group_value_User}[0][ID]    ${Dropdown_Changepriority_User}


CLICK BUTTON OK BRANCH
    SeleniumLibrary.Wait Until Element Is Visible    ${Locator_Button_Ok}    ${Timeout}
    SeleniumLibrary.Click Element    ${Locator_Button_Ok}


SELECT BRANCH TO CHANGE PRIORITY PAGE
    [Arguments]    ${group_value}
    Common_keyword.CHECK BRANCH BEFORE SELECT    ${group_value}[0][BOTEN]
    CLICK BUTTON OK BRANCH
    Execute JavaScript    MenuOnClick('CHANGE PRIORITY','','/ChangePriority/Index')
    

INPUT AND SEARCH APPLICATION NUMBER
    [Arguments]    ${app_no_use}
    
    # กรอก app no
    SeleniumLibrary.Wait until Element is visible    ${txt_app_no}    10s
    SeleniumLibrary.Input Text    ${input_txt_app_no}     ${app_no_use}
    
    # กด ค้นหา
    Common_keyword.CLICK WHEN ELEMENT IS VISIBLE BY LOCATOR    ${app_no_btn_search}    10s
    
    # กด เลือก data นั้น
    Common_keyword.CLICK WHEN ELEMENT IS VISIBLE BY LOCATOR     ${select_seq_at_table}    10s
    
    # รอให้ popup เด้งขึ้นมา
    SeleniumLibrary.Wait until Element is visible    ${modal_change_boten}    10s
    

SELECT MENU TO CHANGE PRIORITY PAGE
    
    BuiltIn.Log    TC_no->${TC_no}    WARN 
    BuiltIn.Set global Variable    ${state_next_step}
    
    Common_feature.SET ACTUAL RESULT NAME
    Sync_sheet_excel.GET DATA ACTUAL RESULT FROM EXCEL    ${excel}[${Excel_Actual_Result}]    ${TC_no}
    
    FOR  ${index_data}  IN RANGE    0    ${count_row_excel_data_actual_result}   

        ${result_branch}    BuiltIn.Set Variable    ${RL_excel_data_actual_result}[${index_data}][Branch]
        ${result_app_no}    BuiltIn.Set Variable    ${RL_excel_data_actual_result}[${index_data}][App_no]
        ${result_state}    BuiltIn.Set Variable    ${RL_excel_data_actual_result}[${index_data}][State]

        IF  '${result_branch}' == '${branch}' and '${result_app_no}' == '${app_no}' and '${result_state}' == 'KS1' 

            BuiltIn.Set global Variable    ${result_branch}
            BuiltIn.Set global Variable    ${result_app_no}
            BuiltIn.Set global Variable    ${result_state}

            ${result}    JSONLibrary.Get value from json    ${data_user_rl}    $[?(@.TC=='Key2')]
            BuiltIn.Log    !!!!case->${result_state}->${app_no}    WARN

            SELECT BRANCH TO CHANGE PRIORITY PAGE    ${result}
            INPUT AND SEARCH APPLICATION NUMBER    ${app_no}    # anywhere
            CHANGE PRIORITY - SELECT DROPDOWN BOTEN     ${result}
            CHANGE PRIORITY - SELECT DROPDOWN SECTION    ${result}
            CHANGE PRIORITY - SELECT DROPDOWN TEAM    ${result}
            CHANGE PRIORITY - SELECT DROPDOWN USER    ${result}
            BuiltIn.Exit For Loop
    
        ELSE IF  '${result_branch}' == '${branch}' and '${result_app_no}' == '${app_no}' and '${result_state}' == 'KS2' 

            BuiltIn.Set global Variable    ${result_branch}
            BuiltIn.Set global Variable    ${result_app_no}
            BuiltIn.Set global Variable    ${result_state}

            ${result}    JSONLibrary.Get value from json    ${data_user_rl}    $[?(@.TC=='Verify')] 
            BuiltIn.Log    !!!!case->${result_state}->${app_no}    WARN

            SELECT BRANCH TO CHANGE PRIORITY PAGE    ${result}
            INPUT AND SEARCH APPLICATION NUMBER    ${app_no}    # anywhere
            CHANGE PRIORITY - SELECT DROPDOWN BOTEN     ${result}
            CHANGE PRIORITY - SELECT DROPDOWN SECTION    ${result}
            CHANGE PRIORITY - SELECT DROPDOWN TEAM    ${result}
            CHANGE PRIORITY - SELECT DROPDOWN USER    ${result}
            BuiltIn.Exit For Loop
    
        ELSE IF  '${result_branch}' == '${branch}' and '${result_app_no}' == '${app_no}' and '${result_state}' == 'INT' 


            BuiltIn.Set global Variable    ${result_branch}
            BuiltIn.Set global Variable    ${result_app_no}
            BuiltIn.Set global Variable    ${result_state}

            ${result}    JSONLibrary.Get value from json    ${data_user_rl}    $[?(@.TC=='Kessai')]
            BuiltIn.Log    !!!!case->${result_state}->${app_no}    WARN

            SELECT BRANCH TO CHANGE PRIORITY PAGE    ${result}
            INPUT AND SEARCH APPLICATION NUMBER    ${app_no}    # anywhere
            CHANGE PRIORITY - SELECT DROPDOWN BOTEN     ${result}
            CHANGE PRIORITY - SELECT DROPDOWN SECTION    ${result}
            CHANGE PRIORITY - SELECT DROPDOWN TEAM    ${result}
            CHANGE PRIORITY - SELECT DROPDOWN USER    ${result}
            BuiltIn.Exit For Loop
        END
    END

    ${status}    BuiltIn.Run Keyword And Return Status    SeleniumLibrary.Click Element    ${Btn_Hidepdpa}
    BuiltIn.Log    END STEP STATUS->${status}    WARN    
    BuiltIn.Run Keyword And Ignore Error    SeleniumLibrary.Wait until Element is visible    ${popup_success_change_priority}    150s

    IF  '${result_branch}' == '${branch}' and '${result_app_no}' == '${app_no}' and '${result_state}' == 'KS1' and '${status}' == 'True'

        BuiltIn.Log    !!WRITE STATE EXCEL STEP CHANGE PRIORITY_>${result_state}!!    WARN 
        BuiltIn.Log    result_branch->${result_branch} : ${result_app_no}    WARN
        BuiltIn.Log    -------------------------------    WARN
        Common_feature.SET DATA ACTUAL RESULT ON EXCEL UPDATE    ${TC_no}    ${ID_no}    ID_no    State    Change_to_KS2
        ${state_next_step}    BuiltIn.Set Variable    Change_to_KS2
        BuiltIn.Set global Variable    ${state_next_step}

    ELSE IF  '${result_branch}' == '${branch}' and '${result_app_no}' == '${app_no}' and '${result_state}' == 'KS2' and '${status}' == 'True'
        BuiltIn.Log    !!WRITE STATE EXCEL STEP CHANGE PRIORITY_>${result_state}!!    WARN 
        BuiltIn.Log    result_branch->${result_branch} : ${result_app_no}    WARN
        BuiltIn.Log    -------------------------------    WARN
        Common_feature.SET DATA ACTUAL RESULT ON EXCEL UPDATE    ${TC_no}    ${ID_no}    ID_no    State    Change_to_INT
        ${state_next_step}    BuiltIn.Set Variable    Change_to_INT
        BuiltIn.Set global Variable    ${state_next_step}
  
    ELSE IF  '${result_branch}' == '${branch}' and '${result_app_no}' == '${app_no}' and '${result_state}' == 'INT' and '${status}' == 'True'
        BuiltIn.Log    !!WRITE STATE EXCEL STEP CHANGE PRIORITY_>${result_state}!!    WARN 
        BuiltIn.Log    result_branch->${result_branch} : ${result_app_no}    WARN
        BuiltIn.Log    -------------------------------    WARN
        Common_feature.SET DATA ACTUAL RESULT ON EXCEL UPDATE    ${TC_no}    ${ID_no}    ID_no    State    Change_to_KES
        ${state_next_step}    BuiltIn.Set Variable    Change_to_KES
        BuiltIn.Set global Variable    ${state_next_step}

    ELSE IF  '${result_branch}' == '${branch}' and '${result_app_no}' == '${app_no}' and '${result_state}' == 'KS1' and '${status}' == 'False'
        Common_feature.SET DATA ACTUAL RESULT ON EXCEL UPDATE    ${TC_no}    ${ID_no}    ID_no    State    Not Success : Changepriority_KS1
        BuiltIn.fail    Not Success : Changepriority_KS1  
        BuiltIn.Set global Variable    ${state_next_step}  

    ELSE IF  '${result_branch}' == '${branch}' and '${result_app_no}' == '${app_no}' and '${result_state}' == 'KS2' and '${status}' == 'False'  
        Common_feature.SET DATA ACTUAL RESULT ON EXCEL UPDATE    ${TC_no}    ${ID_no}    ID_no    State    Not Success : Changepriority_KS2
        BuiltIn.fail    Not Success : Changepriority_KS2    
        BuiltIn.Set global Variable    ${state_next_step}

    ELSE IF  '${result_branch}' == '${branch}' and '${result_app_no}' == '${app_no}' and '${result_state}' == 'INT' and '${status}' == 'False' 
        Common_feature.SET DATA ACTUAL RESULT ON EXCEL UPDATE    ${TC_no}    ${ID_no}    ID_no    State    Not Success : Changepriority_INT
        BuiltIn.fail    Not Success : Changepriority_INT  
        BuiltIn.Set global Variable    ${state_next_step}
    END

    Common_keyword.INTRANET TEARDOWN    CHANGE PRIORITY


SELECT MENU TO CHANGE PRIORITY PAGE GNO
    
    ${result}    JSONLibrary.Get value from json    ${data_user_rl}    $[?(@.TC=='Key2')]
    BuiltIn.Log    !!SELECT DROPDOWN CHANGE PRIORITY!!    WARN 

    SELECT BRANCH TO CHANGE PRIORITY PAGE    ${result}
    INPUT AND SEARCH APPLICATION NUMBER    ${app_no}    
    CHANGE PRIORITY - SELECT DROPDOWN BOTEN     ${result}
    CHANGE PRIORITY - SELECT DROPDOWN SECTION    ${result}
    CHANGE PRIORITY - SELECT DROPDOWN TEAM    ${result}
    CHANGE PRIORITY - SELECT DROPDOWN USER    ${result}

    ${status}    BuiltIn.Run Keyword And Return Status    SeleniumLibrary.Click Element    ${Btn_Hidepdpa}
    BuiltIn.Log    END STEP STATUS->${status}    WARN  

    BuiltIn.Run Keyword And Ignore Error    SeleniumLibrary.Wait until Element is visible    ${popup_success_change_priority}    10s
    Common_keyword.INTRANET TEARDOWN    CHANGE PRIORITY