*** Settings ***
Resource    ${CURDIR}/../Import/Path_import.robot    # robotcode: ignore 


*** Variables ***
# set global to about time
${start_time}
${start_epoch}
${end_time}
${end_epoch}


*** Keywords ***

OPEN INTRANET
    ${result}    BuiltIn.Run Keyword And Ignore Error    SeleniumLibrary.Open Browser    ${URL_Intranet}    ${BrowserChrome}    headless=True
    BuiltIn.Log    !!OPEN BROWSER->${result}[0]    WARN

    IF  '${result}[0]' == 'FAIL'   
        SeleniumLibrary.Open Browser    ${URL_Intranet}    ${BrowserChrome}    headless=True
        # SeleniumLibrary.Set Window Size    1024    768
        SeleniumLibrary.Maximize Browser Window
    ELSE
        # SeleniumLibrary.Set Window Size    1024    768
        SeleniumLibrary.Maximize Browser Window
    END

          
SWITCH WINDOW TO ACTIVE
    # สลับไปทำ Action ที่หน้าจอที่ 2 (โดยการ Get Window Handles)
    ${windowhandles}    SeleniumLibrary.Get Window Handles
    ${length}    BuiltIn.Get Length    ${windowhandles}

    # If length is 2, proceed with switching window
    IF  ${length} == 2    
        SeleniumLibrary.Switch Window    ${windowhandles}[1]
        # SeleniumLibrary.Set Window Size    1024    768
        SeleniumLibrary.Maximize Browser Window
    END

    # Log message if length is not 2
    BuiltIn.Sleep    3s
    BuiltIn.Run Keyword If    ${length} != 2    SWITCH WINDOW TO ACTIVE


SWITCH WINDOW TO ACTIVE [SWITCH 1]
    # สลับไปทำ Action ที่หน้าจอที่ 1 (โดยการ Get Window Handles)
    ${windowhandles}    SeleniumLibrary.Get Window Handles
    ${length}    BuiltIn.Get Length    ${windowhandles}

    # If length is 2, proceed with switching window
    IF  ${length} == 2
        BuiltIn.Log    ${windowhandles}    WARN
        SeleniumLibrary.Switch Window    ${windowhandles}[0]
    END

    # Log message if length is not 2
    BuiltIn.Run Keyword If    ${length} != 2    SWITCH WINDOW TO ACTIVE [SWITCH 1]

    
CLOSE NEW WINDOW     
    INTRANET TEARDOWN


CLICK SSO ICON
    SeleniumLibrary.Wait Until Element Is Visible    ${btn_SSO}    20s
    SeleniumLibrary.Click Element    ${btn_SSO}


INPUT USERNAME AND PASSWORD SSO
    [Arguments]    ${TC_Index}

    ${group_value_User}    JSONLibrary.Get value from json    ${data_user_rl}    $[?(@.TC=='${TC_Index}')] 

    # Check cert uat sso expire or not
    ${status}    BuiltIn.Run Keyword And Return Status    SeleniumLibrary.Wait Until Element Is Visible    //button[@id="details-button"]    5s
    IF    '${status}' == 'True'
        Log    !! Cert uat sso expire : ${status}    WARN
        CLICK WHEN ELEMENT IS VISIBLE BY LOCATOR    //button[@id="details-button"]
        CLICK WHEN ELEMENT IS VISIBLE BY LOCATOR    //a[@id="proceed-link"]
    ELSE
        Log    !! Cert uat sso active    WARN
    END

    # ID User name
    SeleniumLibrary.Wait Until Element Is Visible    ${Locator_SSO_Username}    20s
    BuiltIn.Wait Until Keyword Succeeds   10x    1s    SeleniumLibrary.Input text    ${Locator_SSO_Username}      ${group_value_User}[0][ID]

    # Password
    SeleniumLibrary.Wait Until Element Is Visible    ${Locator_SSO_Password}    20s
    BuiltIn.Wait Until Keyword Succeeds   10x    1s    SeleniumLibrary.Input text    ${Locator_SSO_Password}     ${group_value_User}[0][Password]

    # Capture Screen
    Capture_screen.TEXT SET MESSAGE TO GLOBAL FOR PRINT TO CAPTURE SCREEN    USER_AUTHENTICATION
    Capture_screen.CAPTURE SCREEN INTRO PAGE

    # Click Submit
    SeleniumLibrary.Wait Until Element Is Visible    ${btn_SubmitSSO}    20s
    BuiltIn.Wait Until Keyword Succeeds   10x    1s    SeleniumLibrary.Click Element    ${btn_SubmitSSO}



CLICK MENU RL SYSTEM
    [Arguments]    ${Data_Dropdowns}    ${lable_name}    

    ${locator_sel}    String.Replace string       ${Data_Dropdowns}     ***replace***     ${lable_name}

    SeleniumLibrary.Wait Until Element Is Visible    ${locator_sel}    5s
    BuiltIn.Wait Until Keyword Succeeds   15x    1s    SeleniumLibrary.Scroll Element Into View    ${locator_sel}
    SeleniumLibrary.Click Element    ${locator_sel}
    SWITCH WINDOW TO ACTIVE 


WAIT STATE AUTOALLOWCATE OR MANUAL
    [Arguments]    ${state}=MANUAL

    IF  '${state}' == 'MANUAL'
        BuiltIn.Log    !!MANUAL!!    WARN
        SeleniumLibrary.Wait Until Element Is Visible    ${popupchange_auto_and_manual}
        SeleniumLibrary.Click Element    ${popupchange_auto_and_manual}
        SeleniumLibrary.Press Keys    NONE    ARROW_DOWN
        SeleniumLibrary.Press Keys    NONE    ENTER
        BuiltIn.Run Keyword And Ignore Error    SeleniumLibrary.Wait Until Element Is Visible    ${popupchange_auto_and_manual_btn_confrim}
        BuiltIn.Run Keyword And Ignore Error    SeleniumLibrary.Click Button    ${popupchange_auto_and_manual_btn_confrim}
    ELSE IF  '${state}' == 'AUTOALLOWCATE'
        BuiltIn.Log    !!AUTO!!    WARN
        BuiltIn.Sleep    20s
    END

                
INTRANET TEARDOWN
    [Arguments]    ${topic}=Please tell the topic
    BuiltIn.Run Keyword And Ignore Error    SeleniumLibrary.Close All Browsers
    BuiltIn.Log    ----------------------------------    WARN
    END TIME AND ELAPSED TIME    ${topic}
    BuiltIn.Log    ----------------------------------    WARN
    BuiltIn.Sleep    2s


CLEAR TEXT
    [Arguments]    ${locator}
    SeleniumLibrary.Clear Element Text    ${locator}


VERIFY ELEMENT NOT VISIBLE
    [Arguments]    ${locator}
    SeleniumLibrary.Element Should Not Be Visible    ${locator}

    
GET DATA VALUE BY LOCATOR
    [Arguments]     ${name_tap}
    SeleniumLibrary.Wait Until Element Is Visible    ${name_tap} 
    @{data}     SeleniumLibrary.Get WebElements      ${name_tap}  
    @{data_list}    BuiltIn.Create List
    FOR     ${i}   IN    @{data}
        ${text}     SeleniumLibrary.Get value   ${i}
        Collections.Append To List    ${data_list}    ${text}
    END
    RETURN    @{data_list}


GET DATA VALUE BY LOCATOR AND SCROLL
    [Arguments]     ${name_tap}
    SeleniumLibrary.Wait Until Element Is Visible    ${name_tap} 
    @{data}    SeleniumLibrary.Get WebElements    ${name_tap}  
    @{data_list}    BuiltIn.Create List
    FOR     ${i}   IN    @{data}
        SeleniumLibrary.Scroll Element Into View    ${i}
        ${text}     SeleniumLibrary.Get value   ${i}
        Collections.Append To List    ${data_list}    ${text}
    END
    RETURN    @{data_list}


GET DATA TEXT BY LOCATOR
    [Arguments]     ${locator}
    SeleniumLibrary.Wait Until Element Is Visible    ${locator}    20s   
    @{data}    SeleniumLibrary.Get WebElements    ${locator}  
    @{data_list}    BuiltIn.Create List
    FOR     ${i}   IN    @{data}
        ${text}     SeleniumLibrary.Get Text   ${i}
        ${cleaned_text}    Evaluate    "${text.replace('\n', ' , ')}"
        Collections.Append To List    ${data_list}    ${cleaned_text}
    END
    RETURN    @{data_list}


GET DATA TEXT BY LOCATOR AND SCROLL
    [Arguments]     ${locator}
    SeleniumLibrary.Wait Until Element Is Visible    ${locator}
    @{data}     SeleniumLibrary.Get WebElements      ${locator}  
    @{data_list}    BuiltIn.Create List
    FOR     ${i}   IN    @{data}
        SeleniumLibrary.Scroll Element Into View    ${i}
        ${text}     SeleniumLibrary.Get Text   ${i}
        Collections.Append To List    ${data_list}    ${text}
    END
    RETURN    @{data_list}


GET ELEMENT ATTRIBUTE BY LOCATOR
    [Arguments]     ${locator}
    SeleniumLibrary.Wait Until Element Is Visible    ${locator}
    @{data}     SeleniumLibrary.Get WebElements      ${locator}  
    @{data_list}    BuiltIn.Create List
    FOR     ${i}   IN    @{data}
        SeleniumLibrary.Scroll Element Into View    ${i}
        ${text}     SeleniumLibrary.Get Element Attribute    ${i}    value
        Collections.Append To List    ${data_list}    ${text}
    END
    RETURN    @{data_list}


CLEAR ELEMENT VALUE IN INPUT TEXT AREA
    [Arguments]     ${locator}  
    SeleniumLibrary.Wait until element is visible   ${locator}
    ${value}    SeleniumLibrary.Get value    ${locator}
    ${value_length}    BuiltIn.Get length    ${value}
    FOR    ${index}    IN RANGE    ${value_length} + 1
        SeleniumLibrary.Clear Element Text    ${locator}
        SeleniumLibrary.Clear Element Text    ${locator}
    END


CONVERT DATA FLOAT TO STRING 
    [Arguments]    ${Data1}
    ${locator_sel_str1}    Set Variable    ${Data1}
    ${locator_sel_str2}    Convert To Integer    ${locator_sel_str1}    
    ${locator_sel_str3}    Convert to String    ${locator_sel_str2}
    RETURN    ${locator_sel_str3}


RELOAD PAGE AND SCROLL TO TOP
    SeleniumLibrary.Reload Page
    Execute JavaScript    window.scrollTo(0, 0)


CONVERT ARRAY TO STRING
    [Arguments]    ${array}
    ${t}    Get From List    ${array}    0
    RETURN    ${t}


COUNT STRING 
    [Arguments]    ${text}
    ${set_text}    Set Variable    ${text}
    ${length}=    Evaluate    len($set_text)
    ${Convert_complete}    Convert to String    ${length}
    RETURN    ${Convert_complete}


SET SHEET EXCEL AND ROW EXCEL
    [Arguments]    ${row_excel}    ${sheet_excel} 
    ${set_tc_value_Case}    Set Variable    ${row_excel}
    ${group_value}    JSONLibrary.Get value from json    ${sheet_excel}    $[?(@.TC=='${set_tc_value_Case}')]
    RETURN    ${group_value}


COMPARE THE DATA BETWEEN EXCEL AND PAGE AND YAML BY SHOULD BE EQUAL    # เปรียบเทียบระหว่าง EXCEL และ PAGE และ YAML โดยการ SHOULD BE EQUAL
    [Arguments]    ${index_excel}    ${index_page}    ${data_excel}    ${data_value_page}
    ${data_from_excel}    BuiltIn.Set Variable If    "${data_excel}[0][${index_excel}]" == "None"    data_is_empty    ${data_excel}[0][${index_excel}]    
    ${data_from_page}    BuiltIn.Set Variable If    "${data_value_page}[${index_page}]" == "${EMPTY}"    data_is_empty    ${data_value_page}[${index_page}]   
    VERIFY DATA PAGE BY FILE INDEX     ${data_from_excel}    ${data_from_page}


# (integer) != 1 (string)
COMPARE THE DATA BETWEEN EXCEL AND PAGE AND YAML BY SHOULD BE EQUAL integer != string    # เปรียบเทียบระหว่าง EXCEL และ PAGE และ YAML โดยการ SHOULD BE EQUAL
    [Arguments]    ${index_excel}    ${index_page}    ${data_excel}    ${data_value_page}
    ${data_from_excel}    BuiltIn.Set Variable If    "${${data_excel}[0][${index_excel}]}" == "None"    data_is_empty    ${${data_excel}[0][${index_excel}]}    
    ${data_from_page}    BuiltIn.Set Variable If    "${${data_value_page}[${index_page}]}" == "${EMPTY}"    data_is_empty    ${${data_value_page}[${index_page}]} 
    VERIFY DATA PAGE BY FILE INDEX     ${data_from_excel}    ${data_from_page} 


REPLACE BY DATA EXCEL AND RETURN LOCATOR DATA GRID
    [Arguments]     ${locator}    ${data_excel}
    ${locator}      String.Replace string       ${locator}    ***replace***     ${data_excel}
    RETURN        ${locator}


REPLACE BY DATA EXCEL 2 FILE AND RETURN LOCATOR DATA GRID
    [Arguments]     ${locator}    ${data_excel_1}    ${data_excel_2}
    ${locator}           String.Replace string       ${locator}    ***replace***       ${data_excel_1}
    ${last_locator}      String.Replace string       ${locator}    ***replace_2***     ${data_excel_2}
    RETURN             ${last_locator}


WAIT UNTIL TEXT IS VISIBLE
    [Arguments]    ${text}    ${timeout}=10s
    SeleniumLibrary.Wait Until Page Contains    ${text}    ${timeout}


WAIT UNTIL ELEMENT VISIBLE
    [Arguments]    ${element}    ${timeout}=10s
    SeleniumLibrary.Wait Until Element Is Visible    ${element}    ${timeout}


VERIFY LENGTH TEXT
    [Arguments]    ${locator}    ${data_excel}
    ${length}    BuiltIn.Get Length    ${locator}
    BuiltIn.Should Be Equal    ${length}    ${data_excel}


SELECT OPTION BY LABEL NAME PRESS KEYS
    [Arguments]    ${locator}    ${data_excel}
    SeleniumLibrary.Wait Until Element Is Visible    ${locator}    3 0s
    SeleniumLibrary.Click Element    ${locator}
    SeleniumLibrary.Press Keys    None    ${data_excel}
    SeleniumLibrary.Press Keys    None    ENTER


SELECT OPTION BY LABEL NAME
# ลำดับการส่ง 1.Locator  2.Excel  3.Loop Dropdown
    [Arguments]    ${locator}    ${lable_name}    ${Data_Dropdowns}  
    
    IF  '${lable_name}' != 'none'

        ${Status}    BuiltIn.Run Keyword And Return Status    SeleniumLibrary.Wait Until Element Is Visible    ${locator}    10s

        IF  '${Status}' == 'True'
        
            BuiltIn.Wait Until Keyword Succeeds   15x    1s    SeleniumLibrary.Scroll Element Into View    ${locator}
            ${label_data}    SeleniumLibrary.Get Text    ${locator}

            IF  '${label_data}' != '${lable_name}'  # add new

                IF  '${label_data}' == '--Select--'  
                    BuiltIn.Wait Until Keyword Succeeds   15x    1s    SeleniumLibrary.Click Element    ${locator}
                    ${locator_sel}    String.Replace string    ${Data_Dropdowns}    ***replace***    ${lable_name}

                    SeleniumLibrary.Wait Until Element Is Visible    ${locator_sel}    15s
                    BuiltIn.Wait Until Keyword Succeeds   15x    1s    SeleniumLibrary.Scroll Element Into View    ${locator_sel}
                    SeleniumLibrary.Click Element    ${locator_sel}

                ELSE IF  '${label_data}' == '-- Select --'
                    BuiltIn.Wait Until Keyword Succeeds   15x    1s    SeleniumLibrary.Click Element    ${locator}
                    ${locator_sel}    String.Replace string       ${Data_Dropdowns}    ***replace***    ${lable_name}

                    SeleniumLibrary.Wait Until Element Is Visible    ${locator_sel}    15s
                    BuiltIn.Wait Until Keyword Succeeds   15x    1s    SeleniumLibrary.Scroll Element Into View    ${locator_sel}
                    SeleniumLibrary.Click Element    ${locator_sel}  
            
                ELSE IF  '${label_data}' == ''
                    BuiltIn.Wait Until Keyword Succeeds   15x    1s    SeleniumLibrary.Click Element    ${locator}
                    ${locator_sel}    String.Replace string       ${Data_Dropdowns}    ***replace***    ${lable_name}

                    SeleniumLibrary.Wait Until Element Is Visible    ${locator_sel}    15s
                    BuiltIn.Wait Until Keyword Succeeds   15x    1s    SeleniumLibrary.Scroll Element Into View    ${locator_sel}
                    SeleniumLibrary.Click Element    ${locator_sel}  

                ELSE IF  '${label_data}' == '-- เลือก --'
                    BuiltIn.Wait Until Keyword Succeeds   15x    1s    SeleniumLibrary.Click Element    ${locator}
                    ${locator_sel}    String.Replace string       ${Data_Dropdowns}    ***replace***    ${lable_name}

                    SeleniumLibrary.Wait Until Element Is Visible    ${locator_sel}    15s
                    BuiltIn.Wait Until Keyword Succeeds   15x    1s    SeleniumLibrary.Scroll Element Into View    ${locator_sel}
                    SeleniumLibrary.Click Element    ${locator_sel}     

                ELSE IF  '${label_data}' == '*'
                    BuiltIn.Wait Until Keyword Succeeds   15x    1s    SeleniumLibrary.Click Element    ${locator}
                    ${locator_sel}    String.Replace string       ${Data_Dropdowns}    ***replace***    ${lable_name}

                    SeleniumLibrary.Wait Until Element Is Visible    ${locator_sel}    15s
                    BuiltIn.Wait Until Keyword Succeeds   15x    1s    SeleniumLibrary.Scroll Element Into View    ${locator_sel}
                    SeleniumLibrary.Click Element    ${locator_sel}     

                ELSE IF  '${label_data}' == 'Select'
                    BuiltIn.Wait Until Keyword Succeeds   15x    1s    SeleniumLibrary.Click Element    ${locator}
                    ${locator_sel}    String.Replace string    ${Data_Dropdowns}    ***replace***    ${lable_name}

                    SeleniumLibrary.Wait Until Element Is Visible    ${locator_sel}    15s
                    BuiltIn.Wait Until Keyword Succeeds   15x    1s    SeleniumLibrary.Scroll Element Into View    ${locator_sel}
                    SeleniumLibrary.Click Element    ${locator_sel}  

                ELSE IF  '${label_data}' == '---Select---'
                    BuiltIn.Wait Until Keyword Succeeds   15x    1s    SeleniumLibrary.Click Element    ${locator}
                    ${locator_sel}    String.Replace string    ${Data_Dropdowns}    ***replace***    ${lable_name}

                    SeleniumLibrary.Wait Until Element Is Visible    ${locator_sel}    15s
                    BuiltIn.Wait Until Keyword Succeeds   15x    1s    SeleniumLibrary.Scroll Element Into View    ${locator_sel}
                    SeleniumLibrary.Click Element    ${locator_sel}  
            
                ELSE    
                    BuiltIn.Log    OLD DATA: ${label_data}"    WARN

                    BuiltIn.Wait Until Keyword Succeeds   15x    1s    SeleniumLibrary.Click Element    ${locator}
                    ${locator_sel}    String.Replace string    ${Data_Dropdowns}    ***replace***    ${lable_name}

                    SeleniumLibrary.Wait Until Element Is Visible    ${locator_sel}    15s
                    BuiltIn.Wait Until Keyword Succeeds   15x    1s    SeleniumLibrary.Scroll Element Into View    ${locator_sel}
                    SeleniumLibrary.Click Element    ${locator_sel}
                END
            ELSE
                BuiltIn.Log    EQUAL DATA SKIP PROCESS : ${label_data}"    WARN
            END
        END
    END


GET TEXT AND INPUT TEXT 
    [Arguments]    ${locator}    ${data_excel}
    # ใช้กรณีดักว่ามีการกรอกมาแล้วหรือไม่ ถ้ามีการกรอกข้อมูลมาแล้ว จะไม่ทำการ Input เข้าไป 
    # ถ้า Get text แล้ว มี Data จะไม่ทำการ Input text
    ${Status}    BuiltIn.Run Keyword And Return Status    SeleniumLibrary.Wait Until Element Is Visible    ${locator}    30s
    IF  '${Status}' == 'True'
        BuiltIn.Wait Until Keyword Succeeds   10x    2s    SeleniumLibrary.Scroll Element Into View    ${locator}
        ${label_data}    SeleniumLibrary.Get Text    ${locator}
        IF  '${label_data}' == ''
            SeleniumLibrary.Input Text    ${locator}    ${data_excel}
        ELSE 
            BuiltIn.Log    GET_>${label_data}"    WARN
        END
    END


GET TEXT AND PRESS KEYS 
    [Arguments]    ${locator}    ${data_excel}
    # ใช้กรณีดักว่ามีการกรอกมาแล้วหรือไม่ ถ้ามีการกรอกข้อมูลมาแล้ว จะไม่ทำการ Input โดยใช้คำสั่ง Press Key เข้าไป 
    # ถ้า Get text แล้ว มี Data จะไม่ทำการ Inpu text

    BuiltIn.Wait Until Keyword Succeeds   5x    2s    SeleniumLibrary.Scroll Element Into View    ${locator}
    SeleniumLibrary.Wait Until Element Is Visible    ${locator}    10s
    ${label_data}    SeleniumLibrary.Get Text    ${locator}

    IF  '${label_data}' == ''
        SeleniumLibrary.Press Keys    ${locator}    ${data_excel}    TAB
    ELSE IF    '${label_data}' == '*' 
        SeleniumLibrary.Press Keys    ${locator}    ${data_excel}    TAB
    ELSE 
        BuiltIn.Log    Have a Data = "${label_data}"    WARN
    END    


GET TEXT AND PRESS KEYS ENTER
    [Arguments]    ${locator}    ${data_excel}
    # ใช้กรณีดักว่ามีการกรอกมาแล้วหรือไม่ ถ้ามีการกรอกข้อมูลมาแล้ว จะไม่ทำการ Input โดยใช้คำสั่ง Press Key เข้าไป 
    # ถ้า Get text แล้ว มี Data จะไม่ทำการ Inpu text

    BuiltIn.Wait Until Keyword Succeeds   20x    2s    SeleniumLibrary.Scroll Element Into View    ${locator}
    SeleniumLibrary.Wait Until Element Is Visible    ${locator}    60s
    ${label_data}    SeleniumLibrary.Get Text    ${locator}

    IF  '${label_data}' == ''
        SeleniumLibrary.Press Keys    ${locator}    ${data_excel}     ENTER
    ELSE IF    '${label_data}' == '---Select---'
        SeleniumLibrary.Press Keys    ${locator}    ${data_excel}     ENTER
    ELSE IF    '${label_data}' == '--Select--'
        SeleniumLibrary.Press Keys    ${locator}    ${data_excel}     ENTER
    ELSE 
        BuiltIn.Log    Have a Data = "${label_data}"    WARN
    END


INPUT TEXT FIELD NOT REQUIFIELD
    [Arguments]    ${locator_field_text_area}    ${group_data_value}
    BuiltIn.Run Keyword If    '${group_data_value}'!='none'    Press Keys    ${locator_field_text_area}    ${group_data_value}    


SELECT DROPDOWN FIELD NOT REQUIFIELD
    [Arguments]    ${locator_field_text_area}    ${group_data_value}    ${Dropdown}    
    BuiltIn.Run Keyword If    '${group_data_value}'!='none'    SELECT OPTION BY LABEL NAME    ${locator_field_text_area}    ${group_data_value}    ${Dropdown}  


GET TEXT AND SHOULD BE EQUAL
    [Arguments]    ${locator}    ${data_excel}

    ${text_for_compare}    SeleniumLibrary.Get Text    ${locator}
    BuiltIn.Should Be Equal    ${text_for_compare}    ${data_excel}

        
VERIFY DATA PAGE BY FILE INDEX
    [Arguments]     ${data_excel}   ${file_index}
    
    BuiltIn.Should Be Equal    ${data_excel}   ${file_index}


CLICK WHEN ELEMENT IS VISIBLE BY LOCATOR
    [Arguments]    ${locator}    ${timeout}=30s
    SeleniumLibrary.Wait Until Element Is Visible    ${locator}    ${timeout}
    SeleniumLibrary.Click Element    ${locator} 


INPUT TEXT WHEN ELEMENT IS VISIBLE BY LOCATOR
    [Arguments]    ${locator}    ${data_input}    ${timeout}=150s    
    SeleniumLibrary.Wait Until Element Is Visible    ${locator}    ${timeout}
    SeleniumLibrary.Input Text    ${locator}    ${data_input}


CHOOSE MENU BY LOCATOR
    [Arguments]    ${locator_Menu}

    BuiltIn.Wait Until Keyword Succeeds   3x    2s    SeleniumLibrary.Scroll Element Into View    ${locator_Menu}

    SeleniumLibrary.Wait Until Element Is Visible    ${locator_Menu}    10s

    ${Status}    BuiltIn.Run Keyword And Return Status    BuiltIn.Wait Until Keyword Succeeds   3x    2s    SeleniumLibrary.Click Element    ${locator_Menu}

    BuiltIn.Run Keyword If    '${Status}'!='True'    CLICK SIDEBAR DOWN BUTTON

    SeleniumLibrary.Wait Until Element Is Visible    ${locator_Menu}   ${Timeout}

    BuiltIn.Wait Until Keyword Succeeds   20x    1s    SeleniumLibrary.Click Element    ${locator_Menu}


WRITE DATA TO EXCEL
    [Arguments]    ${file_path}    ${sheet_name}    ${row}    ${column}    ${data}

    reader.Write and set value from excel    ${share_drive}${file_path}    ${sheet_name}    ${row}    ${column}    ${data}   


CLICK LINK PROJECT NAME
    [Arguments]    ${link_menu_project}    ${lable_name}    

    ${locator_sel}    String.Replace string       ${link_menu_project}     ***replace***     ${lable_name}
 
    SeleniumLibrary.Wait Until Element Is Visible    ${locator_sel}    5s
    BuiltIn.Wait Until Keyword Succeeds   15x    1s    SeleniumLibrary.Scroll Element Into View    ${locator_sel}
    SeleniumLibrary.Click Element    ${locator_sel}

    BuiltIn.Wait Until Keyword Succeeds   30x    1s    SWITCH WINDOW TO ACTIVE 


SET LOGIN SSO TO PORTAL PAGE
   [Arguments]    ${TC_Index}    ${link_name_from_excel}    ${sheet_excel}
   
    OPEN INTRANET

    CLICK SSO ICON

    INPUT USERNAME AND PASSWORD SSO    ${TC_Index}

    Capture_Screen.TEXT SET MESSAGE TO GLOBAL FOR PRINT TO CAPTURE SCREEN    PORTAL_PAGE

    Capture_Screen.CAPTURE SCREEN INTRO PAGE

    CLICK LINK PROJECT NAME    ${link_menu_project_locator}    ${link_name_from_excel}


GET DATA TEXT BY LOCATOR AND USED OPTION STRING BY SPECIAL MARK
    # Get text ทั้งหมดจาก Locator ที่มี Data text หลายตัว มาแยกด้วย เครื่องหมาย แล้ว Return ออกเป็น List
    [Arguments]     ${locator}    ${split_text_by}=${SPACE}   ${option}=Split_only     # สามารถส่งเครื่องหมายอื่นเข้ามา SPLIT ได้ ถ้าไม่ส่ง Arguments ${split_text_by} = ${SPACE}
  
    IF  '${option}' == 'Split_only'
        SeleniumLibrary.Wait Until Element Is Visible    ${locator}    30s
        ${data}     SeleniumLibrary.Get Text      ${locator}  
        @{data_list}     String.Split String    ${data}    ${split_text_by}
        RETURN    ${data_list}
    END

    IF  '${option}' == 'Strip'
        SeleniumLibrary.Wait Until Element Is Visible    ${locator}    30s
        ${data}     SeleniumLibrary.Get Text      ${locator} 
        ${data}     String.Strip String    ${data}
        ${data_list}     String.Split String    ${data}    ${split_text_by}
        RETURN    ${data_list}
    END

    IF  '${option}' == 'Full'
        SeleniumLibrary.Wait Until Element Is Visible    ${locator}    30s
        ${data}     SeleniumLibrary.Get Text      ${locator}  
        @{data_list}     String.Split String    ${data}    ${split_text_by}
        ${data_list}    BuiltIn.Evaluate    [item.strip() for item in ${data_list}]
        RETURN    ${data_list}
    END


GET TEXT BY LOCATOR FOR DATA EQUAL NONE
    [Arguments]     ${locator}
    SeleniumLibrary.Wait Until Element Is Visible    ${locator}
    ${data}    SeleniumLibrary.Get Text    ${locator}
    BuiltIn.Run Keyword If    '${data}' == ''    BuiltIn.fail    "Data is empty"
    RETURN    ${data}


TASK TIME
    [Arguments]    ${START_TIME}  
    ${END_TIME}    BuiltIn.Get Time    epoch
    ${WAIT_TIME}    BuiltIn.Evaluate    ${END_TIME} - ${START_TIME}
    BuiltIn.Log    Total waiting time: ${WAIT_TIME} s    WARN
    BuiltIn.Log    ----------------------------------    WARN


CALCULATE NEW TIME OUT
    [Arguments]    ${timeout}    ${number_of_divide}
    ${timeout_status_name_eng}    BuiltIn.Set Variable    ${timeout}
    ${split_time}    String.Split String    ${timeout_status_name_eng}    s
    ${cal_timeout_status}    BuiltIn.Convert To Integer    ${split_time}[0]
    ${cal_timeout_status}    BuiltIn.Evaluate    ${cal_timeout_status} / ${number_of_divide}
    ${cal_timeout_status}    BuiltIn.Convert To Integer    ${cal_timeout_status}
    BuiltIn.Set Variable    ${cal_timeout_status}
    RETURN    ${cal_timeout_status}


CHECK BRANCH BEFORE SELECT
    [Arguments]    ${branch}
    SeleniumLibrary.Wait Until Element Is Visible    ${Locator_Button_Ok}    20s 
    ${result_get_branch}    BuiltIn.Run Keyword And Return Status    SeleniumLibrary.Get Text    ${select_branch_locator}
    BuiltIn.Log    >result_get_branch->${result_get_branch}    WARN

    IF  '${result_get_branch}' == 'True'
        BuiltIn.Wait Until Keyword Succeeds    3x    2s     SELECT OPTION BY LABEL NAME    ${Locator_Select_Branch}    ${branch}    ${Locator_Text_Branch}
        # ${Status_select_branch}    BuiltIn.Run Keyword And Return Status    SELECT OPTION BY LABEL NAME    ${Locator_Select_Branch}    ${branch}    ${Locator_Text_Branch}
        # BuiltIn.Set global Variable    ${Status_select_branch} 
        # BuiltIn.Log    >Status_select_branch->${Status_select_branch}    WARN
        BuiltIn.Log    >Status_select_branch->Pass    WARN
    ELSE
        SeleniumLibrary.Click Element    ${Locator_Button_Ok} 
        BuiltIn.Run Keyword And Ignore Error    SeleniumLibrary.Wait Until Element Is Visible    ${popup_select_branch}    
        SeleniumLibrary.Reload Page
        BuiltIn.Wait Until Keyword Succeeds    3x    2s     SELECT OPTION BY LABEL NAME    ${Locator_Select_Branch}    ${branch}    ${Locator_Text_Branch}
        # ${Status_select_branch}    BuiltIn.Run Keyword And Return Status    SELECT OPTION BY LABEL NAME    ${Locator_Select_Branch}    ${branch}    ${Locator_Text_Branch}
        # BuiltIn.Set global Variable    ${Status_select_branch} 
        # BuiltIn.Log    >Status_select_branch->${Status_select_branch}    WARN
        BuiltIn.Log    >Status_select_branch->Pass    WARN
    END

START TIME
    ${start_time}      BuiltIn.Get Time
    ${start_epoch}     BuiltIn.Get Time    epoch
    Set Global Variable     ${start_time}
    Set Global Variable     ${start_epoch}
    BuiltIn.Log    Start Time: ${start_time}, Start Time: ${start_epoch}    WARN


END TIME AND ELAPSED TIME
    [Arguments]    ${topic}
    ${end_time}      BuiltIn.Get Time
    ${end_epoch}     BuiltIn.Get Time    epoch
    Set Global Variable     ${end_time}
    Set Global Variable     ${end_epoch}
    BuiltIn.Log    End Time: ${end_time}, End Time: ${end_epoch}    WARN
    CALCULATE ELAPSED TIME AND STEMP DATA    ${topic}


CALCULATE ELAPSED TIME AND STEMP DATA
    [Arguments]    ${topic}
    ${total_seconds}       BuiltIn.Evaluate    ${end_epoch} - ${start_epoch}
    ${minutes}             BuiltIn.Evaluate    ${total_seconds} // 60
    ${seconds}             BuiltIn.Evaluate    ${total_seconds} % 60
    ${formatted_minutes}   BuiltIn.Evaluate    '{:02d}'.format(${minutes})
    ${formatted_seconds}   BuiltIn.Evaluate    '{:02d}'.format(${seconds})

    # ดึงเวลาเริ่มต้นและสิ้นสุดในรูปแบบ HH:MM โดยการตัดสตริง
    ${start_hour}     BuiltIn.Evaluate    '${start_time}[11:16]'[0:5]  # ตัดเอาเวลาในรูปแบบ HH:MM
    ${end_hour}       BuiltIn.Evaluate    '${end_time}[11:16]'[0:5]    # ตัดเอาเวลาในรูปแบบ HH:MM
    BuiltIn.Log       >>>>>${topic}: ${start_hour}-${end_hour} = ${formatted_minutes} min ${formatted_seconds} sec   WARN

    ${elapsed_time}    BuiltIn.Set Variable    ${start_hour}-${end_hour} = ${formatted_minutes} min ${formatted_seconds} sec
    BuiltIn.Set global Variable    ${elapsed_time}

    BuiltIn.Run Keyword If    '${topic}' == 'Time_key_in_step_1'    Common_feature.SET DATA ACTUAL RESULT ON EXCEL UPDATE   ${TC_no}    ${ID_no}    ID_no    ${topic}    ${elapsed_time}
    BuiltIn.Run Keyword If    '${topic}' == 'Time_key_in_step_2'    Common_feature.SET DATA ACTUAL RESULT ON EXCEL UPDATE   ${TC_no}    ${ID_no}    ID_no    ${topic}    ${elapsed_time}
    BuiltIn.Run Keyword If    '${topic}' == 'Time_verify'           Common_feature.SET DATA ACTUAL RESULT ON EXCEL UPDATE   ${TC_no}    ${ID_no}    ID_no    ${topic}    ${elapsed_time}
    BuiltIn.Run Keyword If    '${topic}' == 'Time_kessai'           Common_feature.SET DATA ACTUAL RESULT ON EXCEL UPDATE   ${TC_no}    ${ID_no}    ID_no    ${topic}    ${elapsed_time}