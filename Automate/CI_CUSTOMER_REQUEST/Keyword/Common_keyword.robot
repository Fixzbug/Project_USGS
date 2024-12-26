*** Settings ***
Resource    ${CURDIR}/../Import/Path_import.robot    # robotcode: ignore

*** Variables ***
# Set Global
${Customer_xxx}
${get_list_value}

${sel_name_for_click_locator}
${sel_name_locator}

${new_date}

*** Keywords ***

CLOSE ALL BROWSERS TEARDOWN
    BuiltIn.Run keyword and ignore error    SeleniumLibrary.Close all browsers


OPEN INTRANET
    SeleniumLibrary.Open Browser    ${URL_Intranet}     ${BrowserChrome}
    # SeleniumLibrary.Set Window Size    1920    1080
    SeleniumLibrary.Maximize Browser Window
    SeleniumLibrary.Delete All Cookies

SETTING LOGIN
    [Arguments]    ${system_name}    ${username}    ${password}
   
    OPEN INTRANET
    CLICK SSO ICON
            
        [Timeout]    180s
            # หน้า login #User Authentication
            #Verify
            SeleniumLibrary.Wait Until Element Is Visible    ${verify_header_locator}    60s    # User Authentication
            
            # LOG IN
            # User name
            SeleniumLibrary.Wait Until Element Is Visible    ${sso_username_text_area}
            SeleniumLibrary.Input Text    ${sso_username_text_area}   ${username}
            # Password
            SeleniumLibrary.Wait Until Element Is Visible    ${SSO_Password_text_area}
            SeleniumLibrary.Input Password    ${sso_password_text_area}    ${password}  
                
            # Click login button
            Capture_Screen.CUSTOM CAPTURE WITH SYSTEM AND CASE    ${system_name}    LOGIN
            SeleniumLibrary.Wait Until Element Is Visible    ${btn_login_on_user_authentication}
            SeleniumLibrary.Click Button    ${btn_login_on_user_authentication}


CONVERT DATE FORMAT
    [Arguments]    ${original_date}

    IF  '${original_date}' == 'none'

        ${converted_date}=    GET DATE IN FORMATTED DATE TIME
        ${new_converted_date}    BuiltIn.Convert To String    ${converted_date}
        RETURN    ${new_converted_date}
   
    ELSE

        ${date_parts}=    String.Split String    ${original_date}    ${SPACE}
        ${date}=   BuiltIn.Set Variable   ${date_parts}[0]
        ${new_date}=    String.Split String    ${date}   -
        
        # # ถ้าวันที่กรอกมาเป็น str python จะมองหา - ไม่เจอแล้วจะตัดไม่ได้ มันจะพังให้ไปแก้ format cell ที่ cell นั้นให้ถูกต้อง
        # ${split_result}=    BuiltIn.Run Keyword And Return Status    String.Split String    ${date}   -
        # BuiltIn.Run Keyword If   '${split_result}' == 'False'   BuiltIn.Log    DATE FORMAT ON EXCEL NOT TURE FORMAT    ERROR
        # # BuiltIn.Log    ${date}    WARN

        ${day}    BuiltIn.Convert To String    ${new_date}[2]    
        ${month}    BuiltIn.Convert To String    ${new_date}[1] 
        ${year}    BuiltIn.Convert To String    ${new_date}[0]
        
        ${current_date}    DateTime.Get Current Date    result_format=%d/%m/%Y  
        ${current_date}    String.Split String    ${current_date}    /
        ${current_thai_year}    BuiltIn.Evaluate    ${current_date}[2]+543
        
        # ${year} != '2567' บางครั้ง year ที่เอามาไม่ได้เป็น พ.ศ มันกลายเป็น ค.ศ ให้เอา พ.ศ ปัจุบัน มาเช็ค ถ้าไม่ตรง (หมายความว่ามากลายเป็น ค.ศ ตอนดึงมา) ให้เอาปัจุบันไปใช้
        IF  '${year}' != '${current_thai_year}'   
            ${years}=    BuiltIn.Set Variable    ${current_thai_year} 
        ELSE
            ${years}=    BuiltIn.Set Variable    ${year}
        END
        
        ${converted_date}=    BuiltIn.Catenate    ${day}/${month}/${years}
        RETURN    ${converted_date}
    END  

PRESS KEY
    [Arguments]    ${locator}    ${key}
    SeleniumLibrary.Press Keys    ${locator}    ${key}

CLICK SSO ICON
    BuiltIn.Sleep    02s
    SeleniumLibrary.Wait Until Element Is Visible    ${btn_SSO}
    SeleniumLibrary.Click Element    ${btn_SSO}

CLICK BUTTON RELOAD
    [Arguments]    ${btn_reload}
    SeleniumLibrary.Wait Until Element Is Visible   ${btn_reload}
    SeleniumLibrary.Click Button    ${btn_reload}

CLICK ELEMENT BY LOCATOR
    [Arguments]    ${locator}                      
    SeleniumLibrary.Click Element    ${locator}

CLICK ELEMENT WHEN ELEMENT IS VISIBLE
    [Arguments]    ${locator}    ${time_out}=60s
    SeleniumLibrary.Wait Until Element Is Visible    ${locator}    ${time_out}
    SeleniumLibrary.Click Element    ${locator}    

CLICK ELEMENT AND SCROLL INTO VIEW WHEN ELEMENT IS VISIBLE
    [Arguments]    ${locator}    ${time_out}=60s
    SeleniumLibrary.Wait Until Element Is Visible    ${locator}    ${time_out}
    SeleniumLibrary.Scroll Element Into View    ${locator}
    SeleniumLibrary.Click Element    ${locator}    

CLICK ELEMENT AND SCROLL INTO VIEW WHEN ELEMENT IS ENABLED
    [Arguments]    ${locator}    ${time_out}=60s
    SeleniumLibrary.Wait Until Element Is Enabled    ${locator}    ${time_out}
    SeleniumLibrary.Scroll Element Into View    ${locator}
    SeleniumLibrary.Click Element    ${locator}  

CLICK ELEMENT WHEN ELEMENT IS VISIBLE CHECKBOX
    [Arguments]    ${locator}    ${time_out}=60s
    SeleniumLibrary.Wait Until Element Is Visible    ${locator}    ${time_out}
    SeleniumLibrary.Click Element    ${locator}

GET TITLE BY LOCATOR
    [Arguments]     ${locator}
    SeleniumLibrary.Wait Until Element Is Visible    ${locator} 
    ${data}     SeleniumLibrary.Get text      ${locator}
    RETURN    ${data}  

GET TEXT AND VERIFY DATA
    [Arguments]    ${data}    ${locator}
    ${data_test}    SeleniumLibrary.Get Text    ${locator}                 
    BuiltIn.Should Be Equal    ${data}    ${data_test}

GET TEXT WHEN ELEMENT IS VISIBLE
    [Arguments]    ${locator}    ${time_out}=30s
    SeleniumLibrary.Wait Until Element Is Visible    ${locator}    ${time_out}
    ${text}    SeleniumLibrary.Get Text    ${locator}
    RETURN    ${text}

GET VALUE WHEN ELEMENT IS VISIBLE
    [Arguments]    ${locator}    ${time_out}=30s
    SeleniumLibrary.Wait Until Element Is Visible    ${locator}    ${time_out}
    ${text}    SeleniumLibrary.Get Value    ${locator}
    RETURN    ${text}

GET DATE IN FORMATTED DATE TIME
    [Documentation]    Set date time format by fotmat thai date
    [Arguments]        ${format_date}=%d/%m/%Y    ${add_date}=00
    ${current_date}    DateTime.Get Current Date    result_format=${format_date}   
    ${current_date}    String.Split String    ${current_date}    /
    ${current_thai_year}    BuiltIn.Evaluate    ${current_date}[2]+543
    ${current_thai_date}    BuiltIn.Set Variable    ${current_date}[0]/${current_date}[1]/${current_thai_year}
    RETURN    ${current_thai_date}

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
    @{data}     SeleniumLibrary.Get WebElements      ${name_tap}  
    @{data_list}    BuiltIn.Create List
    FOR     ${i}   IN    @{data}
        SeleniumLibrary.Scroll Element Into View    ${i}
        ${text}     SeleniumLibrary.Get value   ${i}
        Collections.Append To List    ${data_list}    ${text}
    END
    RETURN    @{data_list}


GET DATA TEXT BY LOCATOR
    [Arguments]     ${locator}
    SeleniumLibrary.Wait Until Element Is Visible    ${locator}    10s
    @{data}     SeleniumLibrary.Get WebElements      ${locator}  
    @{data_list}    BuiltIn.Create List
    FOR     ${i}   IN    @{data}
        ${text}     SeleniumLibrary.Get Text   ${i}
        Collections.Append To List    ${data_list}    ${text}
    END
    RETURN    @{data_list}


GET DATA TEXT BY LOCATOR AND SCROLL
    [Arguments]     ${locator}
    SeleniumLibrary.Wait Until Element Is Visible    ${locator}    5s
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

GET TEXT PAGE CONTAINS ELEMENT BY LOCATOR
    [Arguments]     ${locator}    ${text}
    SeleniumLibrary.Wait Until Page Contains Element    ${locator}
    ${data}=    SeleniumLibrary.Get Text    ${locator}  
    BuiltIn.Run Keyword If   '${data}' == '${text}'    BuiltIn.Log    ${data}                  
    RETURN    ${data}

GET DATA JSON GET ONLY KEY
    [Arguments]    ${keys_group}
    ${indexed_keys}=    Get Dictionary Keys    ${keys_group}    sort_keys=False    # get key to dic
    RETURN    ${indexed_keys}     

GET DATA PAGE CONTAINS ELEMENT BY LOCATOR 
    [Arguments]    ${locator}
    SeleniumLibrary.Wait Until Page Contains Element    ${locator}    # get text contains on table <tag td>
    ${data_from_locator}=    SeleniumLibrary.Get Text    ${locator}
    ${result}    String.Split String    ${data_from_locator}    :
    ${new_result}    BuiltIn.Set Variable    ${result}[1]
    BuiltIn.Convert To String    ${new_result}  
    IF  '${DBUG}' == 'TRUE'
        BuiltIn.Log To Console    '\nData Web->${new_result}
    END
    RETURN    ${new_result}
  
INPUT TEXT WHEN ELEMENT IS VISIBLE
    [Arguments]    ${locator}    ${data}    ${time_out}=30s
    SeleniumLibrary.Wait Until Element Is Visible    ${locator}    ${time_out}
    SeleniumLibrary.Input Text    ${locator}    ${data}

VERIFY DATA NUMBER BY TABLE AND EXCEL
    [Arguments]     ${data_excel}
    
    IF  '${data_excel}' != 'none'    
        ${locator}    String.Replace string    ${TXT_REPLACE}    ***replace***    ${data_excel}
        SeleniumLibrary.Wait Until Element Is Visible    ${locator}    5s
        SeleniumLibrary.Wait Until Page Contains Element    ${locator}    # get text contains on table <tag td>
        SeleniumLibrary.Wait Until Element Is Visible    ${TXT_REPLACE_LOCATOR}    5s    # tag <center>
        ${data_from_locator}=    SeleniumLibrary.Get Text    ${TXT_REPLACE_LOCATOR}     # get normal
        IF  '${DBUG}' == 'TRUE'
            BuiltIn.Log To Console    '\nData Web->${data_from_locator}<-With Excel->${data_excel}
        END     
        BuiltIn.Should Be Equal    ${data_from_locator}    ${data_excel}   
    END
    
VERIFY DATA TEXT BY TABLE AND EXCEL
    [Arguments]     ${data_excel}

    IF  '${data_excel}' != 'none'   
        ${locator}    String.Replace string    ${TXT_REPLACE}    ***replace***    ${data_excel}
        SeleniumLibrary.Wait Until Element Is Visible    ${locator}    5s
        SeleniumLibrary.Wait Until Page Contains Element    ${locator}     # get text contains on table <tag td>
        ${data_from_locator}=    SeleniumLibrary.Get Text     ${locator} 
        IF  '${DBUG}' == 'TRUE'
            BuiltIn.Log To Console    '\nData Web->${data_from_locator}<-With Excel->${data_excel}    
        END
        BuiltIn.Should Be Equal As Strings    ${data_from_locator}    ${data_excel} 
    END

VERIFY DATA TEXT AND EXCEL
    [Arguments]     ${data_from_locator}    ${data_excel}

    IF  '${data_excel}' != 'none' or '${data_excel}' != 'None'
        BuiltIn.Log To Console    '\nData Web->${data_from_locator}<-With Excel->${data_excel}    
        BuiltIn.Should Be Equal As Strings    ${data_from_locator}    ${data_excel} 
    END


VERIFY FULL DATE TIME DATA TEXT BY TABLE AND EXCEL
    [Arguments]     ${data_excel}

    IF  '${data_excel}' != 'none'   
        ${locator}    String.Replace string    ${TXT_REPLACE}    ***replace***    ${data_excel}
        SeleniumLibrary.Wait Until Element Is Visible    ${locator}    5s
        SeleniumLibrary.Wait Until Page Contains Element    ${locator}     # get text contains on table <tag td>
        ${data_from_locator}=    SeleniumLibrary.Get Text     ${locator} 
        ${date}    String.Split String    ${data_from_locator}    separator=
        IF  '${DBUG}' == 'TRUE'
            BuiltIn.Log To Console    '\nData Web->${date}[0]<-With Excel->${data_excel}  
        END  
        BuiltIn.Should Be Equal    '${date}[0]'    '${data_excel}'  
    END

VERIFY DATA PAGE BY FILE INDEX
    [Arguments]      ${data_from_excel}    ${data_from_page} 
    BuiltIn.Should Be Equal     ${data_from_excel}    ${data_from_page} 

CLEAR ELEMENT VALUE IN INPUT TEXT AREA
    [Arguments]     ${locator}  
    SeleniumLibrary.Wait until element is visible   ${locator}
    ${value}    SeleniumLibrary.Get value    ${locator}
    ${value_length}    BuiltIn.Get length    ${value}
    FOR    ${index}    IN RANGE    ${value_length} + 1
        SeleniumLibrary.Clear Element Text    ${locator}
        Clear Element Text    ${locator}
    END

WAITING FOR DATA UPDATE
    [Arguments]    ${time_sleep}=2s
    Sleep    ${time_sleep}

WAITING ELEMENT WHEN ELEMENT IS VISIBLE BY LOCATOR 
    [Arguments]    ${locator}    ${time_out}=60s
    SeleniumLibrary.Wait Until Element Is Visible    ${locator}    ${time_out}

WAITING ELEMENT WHEN ELEMENT CONTAINS BY LOCATOR
    [Arguments]    ${locator}    ${text}
    SeleniumLibrary.Wait Until Element Contains    ${locator}    ${text}
    
WAITING ELEMENT CONTAINS BY LOCATOR
    [Arguments]     ${locator}    ${text}
   
    # data เข้ามา ตอนแรกไม่มี ทำให้ การเช็ค element นั่นไม่เจอ เช่นตอนแรกสามาถเช็ค table emty ได้ตอนข้อมูลไม่มี พอข้อมูลมี element นั้นหายไป ทำให้ error 
    BuiltIn.Run Keyword And Ignore Error    SeleniumLibrary.Wait Until Element Contains    ${locator}    ${text}        
    ${status}=    Run Keyword And Return Status    SeleniumLibrary.Element Should Not Be Visible    ${locator}   
    # BuiltIn.Log To Console    '\nStatus data change->${status}       
    BuiltIn.Run Keyword If    '${status}' == 'True'    BuiltIn.Log To Console    '\n${status}->[Website Change data Website != Excel -> No data available in table T-> Have data]     


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
    RETURN    ${locator}

REPLACE BY DATA EXCEL 2 FILE AND RETURN LOCATOR DATA GRID
    [Arguments]     ${locator}    ${data_excel_1}    ${data_excel_2}
    ${locator}    String.Replace string       ${locator}    ***replace***       ${data_excel_1}
    ${last_locator}    String.Replace string       ${locator}    ***replace_2***     ${data_excel_2}
    RETURN    ${last_locator}


SELECT OPTION BY LABEL NAME
    [Arguments]    ${lable_name}    ${value}
    ${locator}     String.Replace string       ${sel_name_for_click_locator}    ***replace***       ${lable_name}
    SeleniumLibrary.Wait Until Element Is Visible    ${locator}   
    SeleniumLibrary.Click Element    ${locator}

    ${locator_sel}    String.Replace string       ${sel_name_locator}    ***replace***       ${lable_name}
    SeleniumLibrary.Select From List By Label    ${locator_sel}    ${value}


SELCET OPTION
    [Arguments]    ${sel_locator}    ${txt_locator}    ${value}

    SeleniumLibrary.Wait Until Element Is Visible    ${sel_locator}    10s
    SeleniumLibrary.Click Element    ${sel_locator}

    SeleniumLibrary.Input Text    ${txt_locator}    ${value}
    SeleniumLibrary.Press Keys     ${txt_locator}       ENTER


SELECT OPTION BY LABEL NAME PRESS KEYS
    [Arguments]    ${locator}    ${data_excel}
    SeleniumLibrary.Wait Until Element Is Visible    ${locator}    30s
    SeleniumLibrary.Click Element    ${locator}
    SeleniumLibrary.Press Keys    None    ${data_excel}
    SeleniumLibrary.Press Keys    None    ENTER


EXTRACT ALPHANUMERIC
    [Arguments]    ${text}
    ${cleaned_text}    String.Replace String Using Regexp    ${text}    .*?:\s*    ''
    # ${cleaned_text}    Replace String Using Regexp    ${text}    [^0-9A-Z]+    ''
    ${result}    String.Strip String    ${cleaned_text}
    RETURN    ${result}


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
