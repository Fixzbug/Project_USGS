*** Settings ***
Resource    ${CURDIR}/../../Import/Path_import.robot    # robotcode: ignore
Suite Setup    Common_feature.SET - LOGIN    excel_name=DATAFILE_WORKFLOW_USER_LOGIN     sheet_name=User_Login    row=SYS_8 
Test Setup    Request_waive_08_page.PAGE REQUEST WAIVE - TYPE 08 - OPEN INRANET   
Test Teardown    Common_keyword.CLOSE ALL BROWSERS TEARDOWN

*** Variables ***
${user_level}    0
${Excel_name}    DATAFILE_WORKFLOW_TYPE_08
${finish_send_to}    True
${nextcase}    True

*** Test Cases *** 

TC001 - REQUEST NEGOTIATION SPECIAL DISCOUNT (LG) [TYPE:08]
    [Tags]    TC001

    ${user_level}    BuiltIn.Evaluate    0    # P2503064  request send to P2510033  approve

    # approve 1,4 and write data
    Request_waive_08_feature.SET FEATURE - TYPE - 08 - GO TO - PAGE REQUEST WAIVE - BY USER LEVEL    ${user_level}   

    # req waive
    Request_waive_08_feature.SET FEATURE - TYPE - 08 - SELECT MENU - PAGE REQUEST WAIVE    menu=Work Process    sub_menu=Request Waive    # select menu       

    # select type 08
    Request_waive_08_feature.SET FEATURE - SELECT REQUEST TYPE - PAGE REQUEST WAIVE [08 : NEGOTIATION SPECIAL DISCOUNT (LG)]    

    # read data label
    Common_feature.SET - VERIFY - TITLE    excel_name=${Excel_name}    sheet_name=${type_08}    row=TITLE    

    # จัดรูปแบบข้อมูล และเช็ค ว่าเข้า เคสที่ต้อง และ verify data table กับ กรอก Contract no, ID card, business
    ${data_count_row}    BuiltIn.Evaluate    ${data_count_row} - 1     # เอาจำนวนแถวจาก excel มาใช้ run TC_${index} = TC_1,2,3,4,5,- last index   
    Request_waive_08_page.SET FORMAT DATA TYPE 08 - WRITE    row=TC    start_at_case=1   end_at_case=${data_count_row}  


TC002 - REQUEST NEGOTIATION SPECIAL DISCOUNT (LG) [TYPE:08]
    [Tags]    TC001
    
    IF  '${nextcase}' == 'True'
        ${user_level}    BuiltIn.Evaluate    0    # P2503064  request send to P2510033  approve

        # approve 1,4 and write data
        Request_waive_08_feature.SET FEATURE - TYPE - 08 - GO TO - PAGE REQUEST WAIVE - BY USER LEVEL    ${user_level}   

        # req waive
        Request_waive_08_feature.SET FEATURE - TYPE - 08 - SELECT MENU - PAGE REQUEST WAIVE    menu=Work Process    sub_menu=Request Waive    # select menu       

        # select type 08
        Request_waive_08_feature.SET FEATURE - SELECT REQUEST TYPE - PAGE REQUEST WAIVE [08 : NEGOTIATION SPECIAL DISCOUNT (LG)]   
        
        # read data sheet 
        Common_feature.GET - DATA FROM EXCEL    excel_name=${Excel_name}    sheet_name=${type_08}

        # read data label
        Common_feature.SET - VERIFY - TITLE    excel_name=${Excel_name}    sheet_name=${type_08}    row=TITLE    

        # จัดรูปแบบข้อมูล และเช็ค ว่าเข้า เคสที่ต้อง และ verify data table กับ กรอก Contract no, ID card, business
        ${user_level}    BuiltIn.Evaluate    ${user_level} + 1    # Send to1 User_1 = P2510033
        ${data_count_row}    BuiltIn.Evaluate    ${data_count_row} - 1     # เอาจำนวนแถวจาก excel มาใช้ run TC_${index} = TC_1,2,3,4,5,- last index    
        Request_waive_08_page.SET FORMAT DATA TYPE 08 - USING    row=TC    start_at_case=1   end_at_case=${data_count_row}    user_level=${user_level}   
    ELSE
        BuiltIn.fail    !!!! SOME CASE FAIL !!!!
    END  

  
TC003 - APPROVE NEGOTIATION SPECIAL DISCOUNT (LG) [TYPE:08]
    [Tags]    TC001
    
    IF  '${nextcase}' == 'True'
        BuiltIn.Set Global Variable    ${Excel_name}

        FOR    ${user_level}    IN RANGE    1    5    
        
            IF  '${finish_send_to}' == 'True'
                Approve_negotiate_08_feature.SET FEATURE - TYPE - 08 - GO TO - PAGE INBOX - BY USER LEVEL    ${user_level}    # approve 1,4 and write data
            
                # select menu inbox
                Approve_negotiate_08_feature.SET FEATURE - TYPE - 08 - SELECT MENU - PAGE INBOX    menu=Work Process    sub_menu=Inbox    # select menu

                # read sheet label
                Common_feature.SET - VERIFY - TITLE    excel_name=${Excel_name}    sheet_name=${type_08}    row=TITLE

                # read sheet data
                Common_feature.GET - DATA FROM EXCEL    excel_name=${Excel_name}    sheet_name=${type_08}

                # ดึงข้อมูล ทั้งชีท และ verify data table กับ กรอก
                ${data_count_row}    BuiltIn.Evaluate    ${data_count_row} - 1
                Approve_negotiate_08_page.SET FORMAT DATA TYPE 08    row=TC    start_at_case=1    end_at_case=${data_count_row}    # auto count row

                # verify title -> send to , note ,  input send to , note 
                ${user_levels}    BuiltIn.Evaluate    ${user_level} + 1
                Approve_negotiate_08_feature.SET FEATURE - TYPE - 08 - VERIFY - SEND TO - PAGE INBOX    user_level=${user_levels}    # user 2 P2503067

            ELSE
                # ถ้าไม่เจอ send to 
                BuiltIn.Exit For Loop
            END

        END
    ELSE
        BuiltIn.fail    !!!! SOME CASE FAIL !!!!
    END  

  
TC004 - INQUIRY NEGOTIATION SPECIAL DISCOUNT (LG) [TYPE:08]
    [Tags]    TC001

    IF  '${nextcase}' == 'True'
        BuiltIn.Set Global Variable    ${Excel_name}

        ${user_level}    BuiltIn.Evaluate    0    # P2503064  request send to P2510033  approve

        # approve 1,4 and write data
        Inquiry_08_feature.SET FEATURE - TYPE - 08 - GO TO - PAGE INQUIRY - BY USER LEVEL    ${user_level}   

        # select menu Inquiry
        Inquiry_08_feature.SET FEATURE - TYPE - 08 - SELECT MENU - PAGE INQUIRY    menu=Inquiry    sub_menu=Inquiry Request    # select menu    

        # read sheet label
        Common_feature.SET - VERIFY - TITLE    excel_name=${Excel_name}    sheet_name=${type_08}    row=TITLE

        # read sheet data
        Common_feature.GET - DATA FROM EXCEL    excel_name=${Excel_name}    sheet_name=${type_08}

        # จัดรูปแบบข้อมูล และเช็ค ว่าเข้า เคสที่ต้อง และ verify data table กับ กรอก Request Type , Requester , Request No ,customer Id
        ${data_count_row}    BuiltIn.Evaluate    ${data_count_row} - 1
        Inquiry_08_page.SET FORMAT DATA TYPE 08    row=TC    start_at_case=1    end_at_case=${data_count_row}    # auto count row
    ELSE
        BuiltIn.fail    !!!! SOME CASE FAIL !!!!
    END  
        