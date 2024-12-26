*** Settings ***
Resource    ${CURDIR}/../../Import/Path_import.robot    # robotcode: ignore   
Suite Setup    BuiltIn.Run Keywords   Common_feature.SET - LOGIN    excel_name=DATAFILE_WORKFLOW_USER_LOGIN     sheet_name=User_Login    row=SYS_1    
...    AND   Sync_sheet_excel.GET ALL DATA FROM EXCEL MARTRIX    ${excel_file}[data_matrix_type_01_yaml]
...    AND   Sync_sheet_excel.GET DATA STOCK FROM EXCEL    ${excel_file}[data_stock_type_01_yaml]
Test Setup    Request_waive_01_page.PAGE REQUEST WAIVE - TYPE 01 - OPEN INRANET   
Test Teardown    Common_keyword.CLOSE ALL BROWSERS TEARDOWN


*** Variables ***
${user_level}    0
${finish_send_to}    True
${nextcase}    True
${yaml_type}    data_stock_type_01_yaml
${yaml_type_actual}    Actual_result_type_01_yaml
${matrix}    TC_1

*** Test Cases *** 

TC001 - REQUEST
    [Tags]    TC001
    
    ${user_level}    BuiltIn.Evaluate    0    # P2503064  request send to P2510033  approve

    Common_feature.GET ID CARD FROM EXCEL DATA STOCK
    Common_feature.WRITE STATUS DATA STOCK ID CARD    ${yaml_type}    PENDING
    
    # go to page login input username password page 
    Request_waive_01_feature.SET FEATURE - TYPE - 01 - GO TO - PAGE REQUEST WAIVE - BY USER LEVEL    ${user_level}    # login web -> # P2503064  request send to P2510033  approve

    # select menu
    Request_waive_01_feature.SET FEATURE - TYPE - 01 - SELECT MENU - PAGE REQUEST WAIVE    menu=Work Process    sub_menu=Request Waive    # select menu

    # select dropdown request type
    Request_waive_01_feature.SET FEATURE - TYPE - 01 - SELECT MENU - REQUEST TYPE - PAGE REQUEST WAIVE     # select menu

    # click approve
    Request_waive_01_feature.SET FEATURE - TYPE - 01 - CLICK - APPROVE - PAGE REQUEST WAIVE     # input data

    # จัดรูปแบบข้อมูล และเช็ค ว่าเข้า เคสที่ต้อง และ verify data table กับ กรอก Contract no, ID card, business
    ${user_level}    BuiltIn.Evaluate    ${user_level} + 1    # Send to1 User_1 = P2510033
    Request_waive_01_page.SET FORMAT DATA TYPE 01 - USING    ${matrix}    ${user_level}    # auto count row
    
 
TC002 - APPROVE
    [Tags]    TC001
    
    IF  '${nextcase}' == 'True'

        Common_feature.GET DATA ACTUAL RESULT ON EXCEL ALL FOR ONLY CASE    ${yaml_type_actual}    Results    PASS_Request    ${type_01}

        FOR    ${user_level}    IN RANGE    1    4    
        
            IF  '${finish_send_to}' == 'True'

                # go to page login input username password page 
                Approve_negotiate_01_feature.SET FEATURE - TYPE - 01 - GO TO - PAGE INBOX - BY USER LEVEL    ${user_level}    # user_level = 1 -> login web -> P2510033

                # select menu
                Approve_negotiate_01_feature.SET FEATURE - TYPE - 01 - SELECT MENU - PAGE INBOX    menu=Work Process    sub_menu=Inbox    # select menu

                # verify title -> send to , note ,  input send to , note 
                ${user_levels}    BuiltIn.Evaluate    ${user_level} + 1

                # ดึงข้อมูล ทั้งชีท และ verify data table กับ กรอก
                Approve_negotiate_01_page.SET FORMAT DATA TYPE 01    ${matrix}    ${user_levels}   

            ELSE
                BuiltIn.Exit For Loop
            END
        END
    ELSE
        BuiltIn.fail    !!!! SOME CASE FAIL !!!!
    END


TC003 - INQUIRY 
    [Tags]    TC001
    
    IF  '${nextcase}' == 'True'

        Common_feature.GET DATA ACTUAL RESULT ON EXCEL ALL FOR ONLY CASE    ${yaml_type_actual}    Results    PASS_Approve    ${type_01}

        ${user_level}    BuiltIn.Evaluate    0    # P2503064  request send to P2510033  approve

        # ไปที่หน้า login กรอก username password page ที่ user 0
        Inquiry_01_feature.SET FEATURE - TYPE - 01 - GO TO - PAGE INQUIRY - BY USER LEVEL    ${user_level}   # login web -> user approve 

        # เลือก menu
        Inquiry_01_feature.SET FEATURE - TYPE - 01 - SELECT MENU - PAGE INQUIRY    menu=Inquiry    sub_menu=Inquiry Request    # select menu

        # จัดรูปแบบข้อมูล และเช็ค ว่าเข้า เคสที่ต้อง และ verify data table กับ กรอก Request Type , Requester , Request No ,customer Id
        Inquiry_01_page.SET FORMAT DATA TYPE 01    ${matrix}
    ELSE
        BuiltIn.fail    !!!! SOME CASE FAIL !!!!
    END
