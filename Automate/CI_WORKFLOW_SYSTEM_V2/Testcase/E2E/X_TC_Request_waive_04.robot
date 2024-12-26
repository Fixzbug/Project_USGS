*** Settings ***
Resource    ${CURDIR}/../../Import/Path_import.robot    # robotcode: ignore
Test Teardown    SeleniumLibrary.Close All Browsers

*** Variables ***
${DBUG}    FALSE

# Set global
${index_tc}
${index_user}
${index_password}
${index_send_to}
${index_start}
${index_end}
${index_main}
${user_approve_now}


*** Test Cases *** 

TC001 - Negotiation Special discount (Re finance) [Type:04]
    [Tags]    TC001
    [Documentation]    Type - 04 : Negotiation Special discount (Re finance).

    Request_waive_04_page.SET GLOBAL VARIABLE START AND END [USER APPROVE]    # Set start 1 and Set end 5 = 4 rounds for loop login เป็น approve P2510033, P2503067, P2106010, KIMURA]

    Common_feature.SET - LOGIN    ${DBUG}
    ...    excel_name=DATAFILE_WORKFLOW_USER_LOGIN
    ...    sheet_name=User_Login
    ...    row=SYS_4    # ${group_user} ${keys_group_user}

    Common_feature.SET - VERIFY - TITLE 
    ...    excel_name=DATAFILE_WORKFLOW_TYPE_04
    ...    sheet_name=04_SD_WO 
    ...    row=TITLE    # ${group_data_label} ${keys_group_data_label}

    Request_waive_04_feature.SET - FORMAT DATA - ALL DATA AND INPUT DATA
    ...    excel_name=DATAFILE_WORKFLOW_TYPE_04
    ...    sheet_name=04_SD_WO 
    ...    row=TC_${index_start}    # ${group_data}

    ###-----  Main - page  -----###
    Request_waive_04_feature.SET FEATURE - GO TO - PAGE REQUEST WAIVE - [USER REQUEST]    # login
    Request_waive_04_feature.SET FEATURE - SELECT MENU - PAGE REQUEST WAIVE    # req waive

    Request_waive_04_feature.SET FEATURE - SELECT REQUEST TYPE - PAGE REQUEST WAIVE [04 : NEGOTIATION SPECIAL DISCOUNT (LG)]    # select type 04
    Request_waive_04_feature.SET FEATURE - INPUT REQUEST - PAGE REQUEST WAIVE [04 : NEGOTIATION SPECIAL DISCOUNT (LG)]    # input idcard,biz,contract    [capture]

    ###-----  04 : Negotiation Special Discount (NOR-OD) - page  -----### 
    Request_waive_04_feature.PAGE REQUEST WAIVE - VERIFY TITLE VALUE AND INPUT DATA    # Verify title, value and input data

    Approve_negotiate_04_feature.SET FEATURE - WRITE DATA - PAGE INBOX [REQUEST NO]
    Approve_negotiate_04_page.PAGE INBOX - [CLICK] - [BUTTON] - SIGN OUT

    ###-----  Inbox - login เป็น approve 1,2,3,4 [P2510033,P2503067,P2106010,KIMURA]  -----###
    Approve_negotiate_04_feature.PAGE APPROVE NEGOTIATE - VERIFY TITLE VALUE AND INPUT DATA    # Verify title, value and input data

    # ###-----  Inquiry - new open web  -----###
    Request_waive_04_feature.SET FEATURE - GO TO - PAGE REQUEST WAIVE - [USER REQUEST]    # login
    Request_waive_04_feature.SET FEATURE - SELECT MENU - PAGE INQUIRY    # Inquiry
    Inquiry_04_feature.VERIFY FEATURE - DATA TITLE - PAGE INQUIRY        # verify title 04 - Inquiry
    Inquiry_04_feature.SET FEATURE - INPUT DATA - PAGE INQUIRY           # Input req type, reqter, req no,cust id and cont no - Inquiry

    Inquiry_04_feature.SET FEATURE - WRITE DATA - PAGE INQUIRY [STATUS]     # write status finished
    Inquiry_04_feature.VERIFY FEATURE - DATA TITLE TABLE - PAGE INQUIRY     # verify title table - Inquiry
    Inquiry_04_feature.VERIFY FEATURE - DATA VALUE TABLE - PAGE INQUIRY     # verify value table - Inquiry    [capture]