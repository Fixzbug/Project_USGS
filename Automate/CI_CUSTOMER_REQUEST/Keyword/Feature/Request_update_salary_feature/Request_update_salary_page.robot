*** Settings ***
Resource    ${CURDIR}/../../../Import/Path_import.robot

*** Variables ***
${PW_request_excel_index}
${request_customer_salary_data_operating_row}
${id_number}

# group data all
${group_data}
${keys_group_data}
${result_excel} 

# change format date
${request_date_from}
${request_date_to}

# request no from popup
${result_request_no}

# set globle for debug
${DBUG}

${CRS_request_status_not_have_contract_number}

*** Keywords ***

GET INDEX OF CRS STATUS FROM EXCEL (STEP REQUEST)
# ตรวจสอบสถานะของคอลัมน์ 'Status' ใน Excel ไล่จากบนลงมา ว่ามีค่าสถาระตาม Arguments ที่ส่งมาหรือไม่ ถ้ามีให้ทำการบันทึกหมายเลขแถวลงไปในตัวแปรชื่อ ${pw_request_excel_index}
    [Arguments]    ${status}    ${progress}    ${sub_progress}

    FOR    ${index}    IN RANGE    1    10    #${data_count_row}
        ${condition_status}=      BuiltIn.Run Keyword And Return Status    should be equal    '${data_from_excel_by_sheet}[${index}][Status]'      '${status}'
        ${condition_progress}=    BuiltIn.Run Keyword And Return Status    should be equal    '${data_from_excel_by_sheet}[${index}][Stamp_Progress]'    '${Progress}'
        Log To Console    ${data_from_excel_by_sheet}[${index}][Status] with ${status}
        BuiltIn.Exit For Loop If    ${condition_status} == ${True} and ${condition_progress} == ${True}
        IF  ${index} == ${data_count_row}
            BuiltIn.Log to console    No available CRS Data from Excel founded in range 0 to ${data_count_row}
        END
    END
    ${CRS_request_excel_index}=    BuiltIn.Set Variable    ${index}
    BuiltIn.Set Global Variable     ${CRS_request_excel_index}
    ${request_customer_salary_data_operating_row}=    BuiltIn.Set Variable    ${data_from_excel_by_sheet}[${index}]
    BuiltIn.Set Global Variable     ${request_customer_salary_data_operating_row}

SET FORMAT DATA - SHEET CLOSING CONTRACT FOR VERIFY
    [Arguments]    ${row}    

    ${result_excel}    JSONLibrary.Get Value From Json    ${data_from_excel_by_sheet}    $[?(@.TC == '${row}')]
    BuiltIn.Run Keyword If    ${result_excel} == ""    BuiltIn.Log    [CAN'T READ EXCEL]   ERROR

    ${group_data}=    BuiltIn.Set Variable   ${result_excel}[0]
    BuiltIn.Set Global Variable    ${group_data}

    ${CASE}    BuiltIn.Set Variable    '${group_data}[Case]'     # get case   สำหรับเช็ค  

    IF  '${DBUG}' == 'TRUE'

        BuiltIn.Log To Console    '\ngroup_data->${group_data}
        # {'TC': 'TC_1', 'Case': 'cancel', 'ID Number:': '3100502003018', 'Date From:': '2024-07-01 00:00:00',
        BuiltIn.Log To Console    '\nCASE->${CASE}
        # CASE->'cancel' 
        BuiltIn.Log To Console    '\nkeys + group->${group_data_label}   
        # {'TC': 'TLB_1', 'Case': 'Case', 'ID_Number': 'ID Number:', 'Date_From': 'Date From:',
        
        FOR  ${index}  IN RANGE    1    16
            ${header_title}=    Set Variable    ${group_data_label}[${keys_group_data_label}[${index}]]    # Contract No:   
            BuiltIn.Log To Console    'Header_title->${header_title}       
            # Contract No:

            ${data_excel}=    Set Variable     ${group_data}[${group_data_label}[${keys_group_data_label}[${index}]]]    # ${group_data}[Contract No:]
            BuiltIn.Log To Console    'Data_excel->${data_excel}      
            # 9369001002931587   

        END
    END
 
REQUEST UPDATE SALARY PAGE - INPUT USENAME AND PASSWORD
    Common_keyword.SETTING LOGIN    REQ    ${group_user}[${keys_group_user}[3]]    ${group_user}[${keys_group_user}[4]]

REQUEST UPDATE SALARY PAGE - [CLICK] - LINK 
    Common_keyword.CLICK ELEMENT BY LOCATOR    ${link_customer_request_system}

REQUEST UPDATE SALARY PAGE - [CLICK] - [SELECT] BRANCH
    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE    ${sel_branch_for_click_locator}

REQUEST UPDATE SALARY PAGE - [INPUT] - [TEXT] BRANCH
    Common_keyword.INPUT TEXT WHEN ELEMENT IS VISIBLE    ${txt_sel_locator}   ${group_user}[${keys_group_user}[1]]

REQUEST UPDATE SALARY PAGE - [PRESS KEY] - ENTER
    Common_keyword.PRESS KEY    ${txt_sel_locator}    ENTER

REQUEST UPDATE SALARY PAGE - [CLICK] - [BTN] OK
    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE    ${btn_ok_cus_request_page_locator}
  
REQUEST UPDATE SALARY PAGE - [CLICK] - [MENU] 
    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE    //*[@id="MenuHeader2"]/a

REQUEST UPDATE SALARY PAGE - [CLICK] - [SUB MENU] 
    Common_keyword.CLICK ELEMENT WHEN ELEMENT IS VISIBLE    //*[@id="MenuHeader2"]/ul/li[4]/a

VERIFY REQUEST CONTRACT NUMBER STATUS
    ${CRS_request_status_not_have_contract_number}    Run Keyword And Return Status    Wait Until Element Is Visible    //*[@id="KycModal"]/div/div/div[1]/h4    30s
    Set Global Variable    ${CRS_request_status_not_have_contract_number}

[VERIFY CUSTOMER MODAL] - VERIFY CUSTOMER TITLE

[VERIFY CUSTOMER MODAL] - VERIFY CUSTOMER TABLE TITLE

[VERIFY CUSTOMER MODAL] - FILL ANSWER TO VERIFY CUSTOMER


