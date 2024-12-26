*** Settings ***
Resource    ${CURDIR}/../../Import/Path_import.robot
Suite Setup     Run Keywords    Sync_sheet_excel.GET ALL DATA FROM EXCEL AUTO REJECT      ${excel}[auto_reject_condition_yaml]  
...             AND    Sync_sheet_excel.GET USER LOGIN    ${excel}[RL_User_Login] 
# Suite Teardown    Common_keyword.INTRANET TEARDOWN     
Test Teardown    Common_keyword.RELOAD PAGE AND SCROLL TO TOP

*** Test cases ***
MOCK LOGIN SSO TO RL KEYINSTEP 1
    [Tags]    mock_login
    Login_page.SET LOGIN SSO TO RL AUTO REJECT    Key1       
        Key_in_step_1_page.SET EXCEL - SELECT BRANCH KEYINSTEP 1 AND CHOOSE MENU    Hearder    ${Virual_Card_error_message}    
    [Teardown]    Log    Success

TS1001_001 - VALIDATE FIELD ID NO CASE INPUT INCOMEPLETE 13 DIGITS
    [Tags]    TS1001_001
    [Documentation]    Validate : Field ID No กรณี กรอกไม่ครบ 13 ตัว
    
    ${group_value}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    TS1001_001    ${Virual_Card_error_message}

        Key_in_step_1_feature.VERIFY FIELD - TS1001_001    ${group_value}


TS1001_002 - VALIDATE FIELD ID NO CASE INPUT ID AND CONFIRM ID NOT MATCH
    [Tags]    TS1001_002
    [Documentation]    Validate : Field ID No กรณี กรอก ID กับ Confirm ID ไม่ตรงกัน
    
    ${group_value}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    TS1001_002    ${Virual_Card_error_message}
    ${group_value_verify}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    error_message    ${Virual_Card_error_message}

        Key_in_step_1_feature.VERIFY FIELD - TS1001_002    ${group_value}    ${group_value_verify}


TS1001_003 - VALIDATE FIELD ID NO CASE INPUT WRONG FORMAT
    [Tags]    TS1001_003
    [Documentation]    Validate : Field ID No กรณี กรอกไม่ถูก Format ID
    
    ${group_value}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    TS1001_003    ${Virual_Card_error_message}
    ${group_value_verify}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    error_message_2    ${Virual_Card_error_message}

        Key_in_step_1_feature.VERIFY FIELD - TS1001_003    ${group_value}    ${group_value_verify} 


TS1001_004 - VALIDATE FIELD ID NO CASE INPUT INFORMATION CORRECTLY
    [Tags]    TS1001_004
    [Documentation]    Validate : Field ID No กรณี กรอก ID ถูกต้อง
    
    ${group_value}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    TS1001_004    ${Virual_Card_error_message}

        Key_in_step_1_feature.VERIFY FIELD - TS1001_004    ${group_value}


TS1002_001 - VALIDATE FIELD TITLE (THAI) CASE NOT SELECT
    [Tags]    TS1002_001
    [Documentation]    Validate : Field Title (Thai) กรณี ไม่เลือกข้อมูล
    
    ${group_value}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    TS1002_001    ${Virual_Card_error_message}
    ${group_value_verify}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    error_message    ${Virual_Card_error_message}

        Key_in_step_1_feature.VERIFY FIELD - TS1002_001    ${group_value}    ${group_value_verify} 


TS1002_002 - VALIDATE FIELD TITLE (THAI) CASE INPUT DATA DO NOT HAVE A LIST
    [Tags]    TS1002_002
    [Documentation]    Validate : Field Title (Thai) กรณี กรอกข้อมูลที่ไม่มีในตัวเลือก
    
    ${group_value}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    TS1002_002    ${Virual_Card_error_message}
    ${group_value_verify}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    error_message_2    ${Virual_Card_error_message}

        Key_in_step_1_feature.VERIFY FIELD - TS1002_002    ${group_value}    ${group_value_verify} 


TS1002_003 - VALIDATE FIELD TITLE (THAI) CASE INPUT ALL DATA FORM LIST
    [Tags]    TS1002_003
    [Documentation]    Validate : Field Title (Thai) กรณี กรอกข้อมูลที่มีในตัวเลือกทุกอัน
    
    ${group_value}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    TS1002_003    ${Virual_Card_error_message}

        Key_in_step_1_feature.VERIFY FIELD - TS1002_003    ${group_value}


TS1003_001 - VALIDATE FIELD TITLE (THAI) CASE OF ENTERING MORE THAN 100 CHARACTERS
    [Tags]    TS1003_001
    [Documentation]    Validate : Field Name (Thai) :* กรณี กรอกข้อมูลเกิน 100 ตัวอักษร

    ${group_value}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    TS1003_001    ${Virual_Card_error_message}

        Key_in_step_1_feature.VERIFY FIELD - TS1003_001    ${group_value}


TS1003_002 - VALIDATE FIELD NAME (THAI) IN CASE OF INCOMPLETE DATA ENTRY
    [Tags]    TS1003_002
    [Documentation]    Validate : Field Name (Thai) :* กรณี ไม่กรอกกรอกข้อมูล
    
    ${group_value}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    TS1003_002    ${Virual_Card_error_message}
    ${group_value_error}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    error_message    ${Virual_Card_error_message}

        Key_in_step_1_feature.VERIFY FIELD - TS1003_002    ${group_value}    ${group_value_error}


TS1004_001 - VALIDATE SURNAME (THAI) IN CASE OF ENTERING MORE THAN 100 CHARACTERS
    [Tags]    TS1004_001
    [Documentation]    Validate : Field Surname(Thai) :* กรณี กรอกข้อมูลเกิน 100 ตัวอักษร
    
    ${group_value}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    TS1004_001    ${Virual_Card_error_message}

        Key_in_step_1_feature.VERIFY FIELD - TS1004_001    ${group_value}


TS1004_002 - VALIDATE FIELD SURNAME (THAI) IN CASE OF INCOMPLETE DATA ENTRY
    [Tags]    TS1004_002
    [Documentation]    Validate : Field Surname (Thai) :* กรณี ไม่กรอกกรอกข้อมูล
    
    ${group_value}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    TS1004_002    ${Virual_Card_error_message}
    ${group_value_error}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    error_message    ${Virual_Card_error_message}

        Key_in_step_1_feature.VERIFY FIELD - TS1004_002    ${group_value}    ${group_value_error}


TS1005_001 - VALIDATE FIELD BIRTH DATE (THAI) IN CASE OF INCOMPLETE DATA ENTRY
    [Tags]    TS1005_001
    [Documentation]    Validate : Field Birth Date:* กรณี ไม่กรอกข้อมูล
    
    ${group_value}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    TS1005_001    ${Virual_Card_error_message}
    ${group_value_error}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    error_message    ${Virual_Card_error_message}

        Key_in_step_1_feature.VERIFY FIELD - TS1005_001    ${group_value}    ${group_value_error}


TS1005_002 - VALIDATE FIELD BIRTH DATE (THAI) IN CASE OF INCORRECT DATA ENTRY
    [Tags]    TS1005_002
    [Documentation]    Validate : Field Birth Date:* กรณี กรอกข้อมูลไม่ถูกต้อง
    
    ${group_value}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    TS1005_002    ${Virual_Card_error_message}
    ${group_value_error}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    error_message    ${Virual_Card_error_message}

        Key_in_step_1_feature.VERIFY FIELD - TS1005_002    ${group_value}    ${group_value_error}


TS1005_003 - VALIDATE FIELD BIRTH DATE (THAI) IN CASE OF DATA NOT SAME
    [Tags]    TS1005_003
    [Documentation]    Validate : Field Birth Date:* กรณี กรอกข้อมูลไม่ตรงกัน
    
    ${group_value}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    TS1005_003    ${Virual_Card_error_message}
    ${group_value_error}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    error_message    ${Virual_Card_error_message}

        Key_in_step_1_feature.VERIFY FIELD - TS1005_003    ${group_value}    ${group_value_error}


TS1006_001 - VALIDATE FIELD MOBILE NUMBER (THAI) IN CASE OF DATA OVER 10 CHARACTER
    [Tags]    TS1006_001
    [Documentation]    Validate : Field Mobile No. : ตรวจสอบกรอกได้ไม่เกิน 10 ตัว
    
    ${group_value}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    TS1006_001    ${Virual_Card_error_message}

        Key_in_step_1_feature.VERIFY FIELD - TS1006_001    ${group_value}


TS1007_001 - VALIDATE FIELD EXPIRE DATE (THAI) IN CASE OF DATA BLANK
    [Tags]    TS1007_001
    [Documentation]    Validate : Field Expire Date :* กรณี ไม่กรอกข้อมูล
    
    ${group_value}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    TS1007_001    ${Virual_Card_error_message}
    ${group_value_error}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    error_message    ${Virual_Card_error_message}

        Key_in_step_1_feature.VERIFY FIELD - TS1007_001    ${group_value}    ${group_value_error}


TS1007_002 - VALIDATE FIELD EXPIRE DATE (THAI) IN CASE OF INCORRECT DATA ENTRY
    [Tags]    TS1007_002
    [Documentation]    Validate : Field Expire Date :* กรณี กรอกข้อมูลไม่ถูกต้อง
    
    ${group_value}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    TS1007_002    ${Virual_Card_error_message}
    ${group_value_error}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    error_message    ${Virual_Card_error_message}

        Key_in_step_1_feature.VERIFY FIELD - TS1007_002    ${group_value}    ${group_value_error}


TS1008_001 - VALIDATE FIELD APPLY TYPE CASE INPUT DATA DO NOT HAVE A LIST
    [Tags]    TS1008_001
    [Documentation]    Validate : Field Apply Type :* กรณี กรอกข้อมูลที่ไม่มีในตัวเลือก

    ${group_value}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    TS1008_001    ${Virual_Card_error_message}
    ${group_value_verify}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    error_message_2    ${Virual_Card_error_message}

        Key_in_step_1_feature.VERIFY FIELD - TS1008_001    ${group_value}    ${group_value_verify}


TS1008_002 - VALIDATE FIELD APPLY TYPE CASE CASE NOT SELECT
    [Tags]    TS1008_002
    [Documentation]    Validate : Field Apply Type :* กรณี ไม่เลือกข้อมูล

    ${group_value}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    TS1008_002    ${Virual_Card_error_message}
    ${group_value_verify}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    error_message    ${Virual_Card_error_message}

        Key_in_step_1_feature.VERIFY FIELD - TS1008_002    ${group_value}    ${group_value_verify}


TS1008_003 - VALIDATE FIELD APPLY TYPE CASE SELECT ALL DATA FORM LIST
    [Tags]    TS1008_003
    [Documentation]    Validate : Field Apply Type :* กรณี เลือกข้อมูลที่มีในตัวเลือกทุกอัน

    ${group_value}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    TS1008_003    ${Virual_Card_error_message}

        Key_in_step_1_feature.VERIFY FIELD - TS1008_003    ${group_value}


TS1009_001 - VALIDATE FIELD APPLY VIA CASE OF NO DATA IN SELECTION
    [Tags]    TS1009_001
    [Documentation]    Validate : Field Apply Via :* กรณี กรอกข้อมูลที่ไม่มีในตัวเลือก
    
    ${group_value}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    TS1009_001    ${Virual_Card_error_message}
    ${group_value_error}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    error_message_2    ${Virual_Card_error_message}

        Key_in_step_1_feature.VERIFY FIELD - TS1009_001    ${group_value}    ${group_value_error}


TS1009_002 - VALIDATE FIELD APPLY VIA CASE OF DATA BLANK
    [Tags]    TS1009_002
    [Documentation]    Validate : Field Apply Via :* กรณี ไม่เลือกข้อมูล
    
    ${group_value}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    TS1009_002    ${Virual_Card_error_message}
    ${group_value_error}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    error_message    ${Virual_Card_error_message}

        Key_in_step_1_feature.VERIFY FIELD - TS1009_002    ${group_value}    ${group_value_error}


TS1009_003 - VALIDATE FIELD APPLY VIA CASE SELECT ALL DATA FORM LIST
    [Tags]    TS1009_003
    [Documentation]    'Validate : Field Apply Via :* กรณี เลือกข้อมูลที่มีในตัวเลือกทุกอัน

    ${group_value}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    TS1009_003    ${Virual_Card_error_message}

        Key_in_step_1_feature.VERIFY FIELD - TS1009_003    ${group_value}


TS1010_001 - VALIDATE FIELD APPLY CHANNEL CASE INPUT DATA DO NOT HAVE A LIST
    [Tags]    TS1010_001
    [Documentation]    Validate : Field Apply Channel :* กรณี กรอกข้อมูลที่ไม่มีในตัวเลือก

    ${group_value}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    TS1010_001    ${Virual_Card_error_message}
    ${group_value_verify}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    error_message_2    ${Virual_Card_error_message}

        Key_in_step_1_feature.VERIFY FIELD - TS1010_001    ${group_value}    ${group_value_verify}


TS1010_002 - VALIDATE FIELD APPLY CHANNEL CASE NOT SELECT
    [Tags]    TS1010_002
    [Documentation]    Validate : Field Apply Channel :* กรณี ไม่เลือกข้อมูล

    ${group_value}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    TS1010_002    ${Virual_Card_error_message}
    ${group_value_verify}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    error_message    ${Virual_Card_error_message}

        Key_in_step_1_feature.VERIFY FIELD - TS1010_002    ${group_value}    ${group_value_verify}


TS1010_003 - VALIDATE FIELD APPLY CHANNEL CASE SELECT ALL DATA FORM LIST
    [Tags]    TS1010_003
    [Documentation]    Validate : Field Apply Channel :* กรณี เลือกข้อมูลที่มีในตัวเลือกทุกอัน

    ${group_value}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    TS1010_003    ${Virual_Card_error_message}

        Key_in_step_1_feature.VERIFY FIELD - TS1010_003    ${group_value}


TS1011_001 - VALIDATE FIELD SLAE AGENT CODE CASE INPUT DATA DO NOT HAVE A LIST
    [Tags]    TS1011_001
    [Documentation]    Validate : Field Sale Agent Code : กรณี กรอกข้อมูลที่ไม่มีในตัวเลือก

    ${group_value}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    TS1011_001    ${Virual_Card_error_message}
    ${group_value_verify}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    error_message_2    ${Virual_Card_error_message}

        Key_in_step_1_feature.VERIFY FIELD - TS1011_001    ${group_value}    ${group_value_verify}


TS1011_002 - VALIDATE FIELD SLAE AGENT CODE CASE SELECT ALL DATA FORM LIST
    [Tags]    TS1011_002
    [Documentation]    Validate : Field Sale Agent Code : กรณี เลือกข้อมูลที่มีในตัวเลือกทุกอัน

    ${group_value}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    TS1011_002    ${Virual_Card_error_message}

        Key_in_step_1_feature.VERIFY FIELD - TS1011_002    ${group_value}


TS1012_001 - VALIDATE FIELD CAMPAIGN CODE CASE INPUT DATA DO NOT HAVE A LIST
    [Tags]    TS1012_001
    [Documentation]    Validate : Field Campaign Code : กรณี กรอกข้อมูลที่ไม่มีในตัวเลือก

    ${group_value}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    TS1012_001    ${Virual_Card_error_message}
    ${group_value_verify}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    error_message_2    ${Virual_Card_error_message}

        Key_in_step_1_feature.VERIFY FIELD - TS1012_001    ${group_value}    ${group_value_verify}


TS1012_002 - VALIDATE FIELD CAMPAIGN CODE CASE SELECT ALL DATA FORM LIST
    [Tags]    TS1012_002
    [Documentation]    Validate : Field Campaign Code : กรณี เลือกข้อมูลที่มีในตัวเลือกทุกอัน

    ${group_value}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    TS1012_002    ${Virual_Card_error_message}

        Key_in_step_1_feature.VERIFY FIELD - TS1012_002    ${group_value}


TS1013_001 - VALIDATE FIELD ACTIVITY CODE INPUT DATA DO NOT HAVE A LIST
    [Tags]    TS1013_001
    [Documentation]    Validate : Field Activity Code : กรณี กรอกข้อมูลที่ไม่มีในตัวเลือก

    ${group_value}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    TS1013_001    ${Virual_Card_error_message}
    ${group_value_verify}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    error_message_2    ${Virual_Card_error_message}

        Key_in_step_1_feature.VERIFY FIELD - TS1013_001    ${group_value}    ${group_value_verify}


TS1013_002 - VALIDATE FIELD ACTIVITY CODE CASE SELECT ALL DATA FORM LIST
    [Tags]    TS1013_002
    [Documentation]    Validate : Field Special Case : กรณี เลือกข้อมูลที่มีในตัวเลือกทุกอัน

    ${group_value}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    TS1013_002    ${Virual_Card_error_message}

        Key_in_step_1_feature.VERIFY FIELD - TS1013_002    ${group_value}


TS1014_001 - VALIDATE FIELD SPECIAL CASE CASE INPUT DATA DO NOT HAVE A LIST
    [Tags]    TS1014_001
    [Documentation]    Validate : Field Special Case : กรณี ไม่เลือกข้อมูล

    ${group_value}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    TS1014_001    ${Virual_Card_error_message}
    ${group_value_verify}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    error_message_2    ${Virual_Card_error_message}

        Key_in_step_1_feature.VERIFY FIELD - TS1014_001    ${group_value}    ${group_value_verify}


TS1014_002 - VALIDATE FIELD SPECIAL CASE CASE SELECT ALL DATA FORM LIST
    [Tags]    TS1014_002
    [Documentation]    Validate : Field Special Case : กรณี เลือกข้อมูลที่มีในตัวเลือกทุกอัน

    ${group_value}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    TS1014_002    ${Virual_Card_error_message}

        Key_in_step_1_feature.VERIFY FIELD - TS1014_002    ${group_value}


TS2001_001 - VALIDATE FIELD ID NO CASE INPUT INCOMEPLETE 13 DIGITS 
    [Tags]    TS2001_001
    [Documentation]    Validate : Field ID No กรณี กรอกไม่ครบ 13 ตัว 
    
    ${group_value}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    TS2001_001    ${Virual_Card_error_message}

        Key_in_step_1_feature.VERIFY FIELD - TS1001_001    ${group_value}


TS2001_002 - VALIDATE FIELD ID NO CASE INPUT ID AND CONFIRM ID NOT MATCH
    [Tags]    TS2001_002
    [Documentation]    Validate : Field ID No กรณี กรอก ID กับ Confirm ID ไม่ตรงกัน
    
    ${group_value}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    TS2001_002    ${Virual_Card_error_message}
    ${group_value_verify}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    error_message    ${Virual_Card_error_message}

        Key_in_step_1_feature.VERIFY FIELD - TS1001_002    ${group_value}    ${group_value_verify}


TS2001_003 - VALIDATE FIELD ID NO CASE INPUT WRONG FORMAT
    [Tags]    TS2001_003
    [Documentation]    Validate : Field ID No กรณี กรอกไม่ถูก Format ID
    
    ${group_value}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    TS2001_003    ${Virual_Card_error_message}
    ${group_value_verify}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    error_message_2    ${Virual_Card_error_message}

        Key_in_step_1_feature.VERIFY FIELD - TS1001_003    ${group_value}    ${group_value_verify} 


TS2001_004 - VALIDATE FIELD ID NO CASE INPUT INFORMATION CORRECTLY
    [Tags]    TS2001_004
    [Documentation]    Validate : Field ID No กรณี กรอก ID ถูกต้อง
    
    ${group_value}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    TS2001_004    ${Virual_Card_error_message}

        Key_in_step_1_feature.VERIFY FIELD - TS1001_004    ${group_value}


TS2002_001 - VALIDATE FIELD TITLE (THAI) CASE NOT SELECT
    [Tags]    TS2002_001
    [Documentation]    Validate : Field Title (Thai) กรณี ไม่เลือกข้อมูล
    
    ${group_value}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    TS2002_001    ${Virual_Card_error_message}
    ${group_value_verify}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    error_message    ${Virual_Card_error_message}

        Key_in_step_1_feature.VERIFY FIELD - TS1002_001    ${group_value}    ${group_value_verify} 


TS2002_002 - VALIDATE FIELD TITLE (THAI) CASE INPUT DATA DO NOT HAVE A LIST
    [Tags]    TS2002_002
    [Documentation]    Validate : Field Title (Thai) กรณี กรอกข้อมูลที่ไม่มีในตัวเลือก
    
    ${group_value}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    TS2002_002    ${Virual_Card_error_message}
    ${group_value_verify}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    error_message_2    ${Virual_Card_error_message}

        Key_in_step_1_feature.VERIFY FIELD - TS1002_002    ${group_value}    ${group_value_verify} 


TS2002_003 - VALIDATE FIELD TITLE (THAI) CASE INPUT ALL DATA FORM LIST
    [Tags]    TS2002_003
    [Documentation]    Validate : Field Title (Thai) กรณี กรอกข้อมูลที่มีในตัวเลือกทุกอัน
    
    ${group_value}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    TS2002_003    ${Virual_Card_error_message}

        Key_in_step_1_feature.VERIFY FIELD - TS1002_003    ${group_value}


TS2003_001 - VALIDATE FIELD TITLE (THAI) CASE OF ENTERING MORE THAN 100 CHARACTERS
    [Tags]    TS2003_001
    [Documentation]    Validate : Field Title (Thai) กรณี กรอกข้อมูลที่มีในตัวเลือกทุกอัน

    ${group_value}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    TS2003_001    ${Virual_Card_error_message}

        Key_in_step_1_feature.VERIFY FIELD - TS1003_001    ${group_value}


TS2003_002 - VALIDATE FIELD NAME (THAI) IN CASE OF INCOMPLETE DATA ENTRY
    [Tags]    TS2003_002
    [Documentation]    Validate : Field Name (Thai) :* กรณี กรอกข้อมูลเกิน 100 ตัวอักษร

    ${group_value}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    TS2003_002    ${Virual_Card_error_message}
    ${group_value_error}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    error_message    ${Virual_Card_error_message}

        Key_in_step_1_feature.VERIFY FIELD - TS1003_002    ${group_value}    ${group_value_error}


TS2004_001 - VALIDATE FIELD SURNAME (THAI) IN CASE OF ENTERING MORE THAN 100 CHARACTERS
    [Tags]    TS2004_001
    [Documentation]    Validate : Field Surname(Thai) :* กรณี กรอกข้อมูลเกิน 100 ตัวอักษร
    
    ${group_value}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    TS2004_001    ${Virual_Card_error_message}

        Key_in_step_1_feature.VERIFY FIELD - TS1004_001    ${group_value}


TS2004_002 - VALIDATE FIELD SURNAME (THAI) IN CASE OF INCOMPLETE DATA ENTRY
    [Tags]    TS2004_002
    [Documentation]    Validate : Field Surname (Thai) :* กรณี ไม่กรอกกรอกข้อมูล
    
    ${group_value}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    TS2004_002    ${Virual_Card_error_message}
    ${group_value_error}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    error_message    ${Virual_Card_error_message}

        Key_in_step_1_feature.VERIFY FIELD - TS1004_002    ${group_value}    ${group_value_error}

    
TS2005_001 - VALIDATE FIELD BIRTH DATE (THAI) IN CASE OF INCOMPLETE DATA ENTRY
    [Tags]    TS2005_001
    [Documentation]    Validate : Field Birth Date:* กรณี ไม่กรอกข้อมูล
    
    ${group_value}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    TS2005_001    ${Virual_Card_error_message}
    ${group_value_error}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    error_message    ${Virual_Card_error_message}

        Key_in_step_1_feature.VERIFY FIELD - TS1005_001    ${group_value}    ${group_value_error}


TS2005_002 - VALIDATE FIELD BIRTH DATE (THAI) IN CASE OF INCORRECT DATA ENTRY
    [Tags]    TS2005_002
    [Documentation]    Validate : Field Birth Date:* กรณี กรอกข้อมูลไม่ถูกต้อง
    
    ${group_value}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    TS2005_002    ${Virual_Card_error_message}
    ${group_value_error}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    error_message    ${Virual_Card_error_message}

        Key_in_step_1_feature.VERIFY FIELD - TS1005_002    ${group_value}    ${group_value_error}


TS2005_003 - VALIDATE FIELD BIRTH DATE (THAI) IN CASE OF DATA NOT SAME
    [Tags]    TS2005_003
    [Documentation]    Validate : Field Birth Date:* กรณี กรอกข้อมูลไม่ตรงกัน
    
    ${group_value}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    TS2005_003    ${Virual_Card_error_message}
    ${group_value_error}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    error_message    ${Virual_Card_error_message}

        Key_in_step_1_feature.VERIFY FIELD - TS1005_003    ${group_value}    ${group_value_error}


TS2006_001 - VALIDATE FIELD MOBILE NUMBER (THAI) IN CASE OF DATA OVER 10 CHARACTER
    [Tags]    TS2006_001
    [Documentation]    Validate : Field Mobile No. : ตรวจสอบกรอกได้ไม่เกิน 10 ตัว
    
    ${group_value}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    TS2006_001    ${Virual_Card_error_message}

        Key_in_step_1_feature.VERIFY FIELD - TS1006_001    ${group_value}


TS2007_001 - VALIDATE FIELD EXPIRE DATE (THAI) IN CASE OF DATA BLANK
    [Tags]    TS2007_001
    [Documentation]    Validate : Field Expire Date :* กรณี ไม่กรอกข้อมูล
    
    ${group_value}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    TS2007_001    ${Virual_Card_error_message}
    ${group_value_error}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    error_message    ${Virual_Card_error_message}

        Key_in_step_1_feature.VERIFY FIELD - TS1007_001    ${group_value}    ${group_value_error}


TS2007_002 - VALIDATE FIELD EXPIRE DATE (THAI) IN CASE OF INCORRECT DATA ENTRY
    [Tags]    TS2007_002
    [Documentation]    Validate : Field Expire Date :* กรณี กรอกข้อมูลไม่ถูกต้อง
    
    ${group_value}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    TS2007_002    ${Virual_Card_error_message}
    ${group_value_error}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    error_message    ${Virual_Card_error_message}

        Key_in_step_1_feature.VERIFY FIELD - TS1007_002    ${group_value}    ${group_value_error}


TS2008_001 - VALIDATE FIELD APPLY TYPE CASE INPUT DATA DO NOT HAVE A LIST
    [Tags]    TS2008_001
    [Documentation]    Validate : Field Apply Type :* กรณี กรอกข้อมูลที่ไม่มีในตัวเลือก

    ${group_value}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    TS2008_001    ${Virual_Card_error_message}
    ${group_value_verify}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    error_message_2    ${Virual_Card_error_message}

        Key_in_step_1_feature.VERIFY FIELD - TS1008_001    ${group_value}    ${group_value_verify}


TS2008_002 - VALIDATE FIELD APPLY TYPE CASE CASE NOT SELECT
    [Tags]    TS2008_002
    [Documentation]    Validate : Field Apply Type :* กรณี ไม่เลือกข้อมูล

    ${group_value}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    TS2008_002    ${Virual_Card_error_message}
    ${group_value_verify}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    error_message    ${Virual_Card_error_message}

        Key_in_step_1_feature.VERIFY FIELD - TS1008_002    ${group_value}    ${group_value_verify}


TS2008_003 - VALIDATE FIELD APPLY TYPE CASE SELECT ALL DATA FORM LIST
    [Tags]    TS2008_003
    [Documentation]    Validate : Field Apply Type :* กรณี เลือกข้อมูลที่มีในตัวเลือกทุกอัน

    ${group_value}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    TS2008_003    ${Virual_Card_error_message}

        Key_in_step_1_feature.VERIFY FIELD - TS1008_003    ${group_value}


TS2009_001 - VALIDATE FIELD APPLY VIA CASE OF NO DATA IN SELECTION
    [Tags]    TS2009_001
    [Documentation]    Validate : Field Apply Via :* กรณี กรอกข้อมูลที่ไม่มีในตัวเลือก
    
    ${group_value}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    TS2009_001    ${Virual_Card_error_message}
    ${group_value_error}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    error_message_2    ${Virual_Card_error_message}

        Key_in_step_1_feature.VERIFY FIELD - TS1009_001    ${group_value}    ${group_value_error}


TS2009_002 - VALIDATE FIELD APPLY VIA CASE OF DATA BLANK
    [Tags]    TS2009_002
    [Documentation]    Validate : Field Apply Via :* กรณี ไม่เลือกข้อมูล
    
    ${group_value}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    TS2009_002    ${Virual_Card_error_message}
    ${group_value_error}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    error_message    ${Virual_Card_error_message}

        Key_in_step_1_feature.VERIFY FIELD - TS1009_002    ${group_value}    ${group_value_error}


TS2009_003 - VALIDATE FIELD APPLY VIA CASE SELECT ALL DATA FORM LIST
    [Tags]    TS2009_003
    [Documentation]    'Validate : Field Apply Via :* กรณี เลือกข้อมูลที่มีในตัวเลือกทุกอัน

    ${group_value}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    TS2009_003    ${Virual_Card_error_message}

        Key_in_step_1_feature.VERIFY FIELD - TS1009_003    ${group_value}


TS2010_001 - VALIDATE FIELD APPLY CHANNEL CASE INPUT DATA DO NOT HAVE A LIST
    [Tags]    TS2010_001
    [Documentation]    Validate : Field Apply Channel :* กรณี กรอกข้อมูลที่ไม่มีในตัวเลือก

    ${group_value}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    TS2010_001    ${Virual_Card_error_message}
    ${group_value_verify}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    error_message_2    ${Virual_Card_error_message}

        Key_in_step_1_feature.VERIFY FIELD - TS1010_001    ${group_value}    ${group_value_verify}


TS2010_002 - VALIDATE FIELD APPLY CHANNEL CASE NOT SELECT
    [Tags]    TS2010_002
    [Documentation]    Validate : Field Apply Channel :* กรณี ไม่เลือกข้อมูล

    ${group_value}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    TS2010_002    ${Virual_Card_error_message}
    ${group_value_verify}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    error_message    ${Virual_Card_error_message}

        Key_in_step_1_feature.VERIFY FIELD - TS1010_002    ${group_value}    ${group_value_verify}


TS2010_003 - VALIDATE FIELD APPLY CHANNEL CASE SELECT ALL DATA FORM LIST
    [Tags]    TS2010_003
    [Documentation]    Validate : Field Apply Channel :* กรณี เลือกข้อมูลที่มีในตัวเลือกทุกอัน

    ${group_value}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    TS2010_003    ${Virual_Card_error_message}

        Key_in_step_1_feature.VERIFY FIELD - TS1010_003    ${group_value}


TS2011_001 - VALIDATE FIELD SLAE AGENT CODE CASE INPUT DATA DO NOT HAVE A LIST
    [Tags]    TS2011_001
    [Documentation]    Validate : Field Sale Agent Code : กรณี กรอกข้อมูลที่ไม่มีในตัวเลือก

    ${group_value}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    TS2011_001    ${Virual_Card_error_message}
    ${group_value_verify}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    error_message_2    ${Virual_Card_error_message}

        Key_in_step_1_feature.VERIFY FIELD - TS1011_001    ${group_value}    ${group_value_verify}


TS2011_002 - VALIDATE FIELD SLAE AGENT CODE CASE SELECT ALL DATA FORM LIST
    [Tags]    TS2011_002
    [Documentation]    Validate : Field Sale Agent Code : กรณี เลือกข้อมูลที่มีในตัวเลือกทุกอัน

    ${group_value}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    TS2011_002    ${Virual_Card_error_message}

        Key_in_step_1_feature.VERIFY FIELD - TS1011_002    ${group_value}


TS2012_001 - VALIDATE FIELD CAMPAIGN CODE CASE INPUT DATA DO NOT HAVE A LIST
    [Tags]    TS2012_001
    [Documentation]    Validate : Field Campaign Code : กรณี กรอกข้อมูลที่ไม่มีในตัวเลือก

    ${group_value}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    TS2012_001    ${Virual_Card_error_message}
    ${group_value_verify}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    error_message_2    ${Virual_Card_error_message}

        Key_in_step_1_feature.VERIFY FIELD - TS1012_001    ${group_value}    ${group_value_verify}


TS2012_002 - VALIDATE FIELD CAMPAIGN CODE CASE SELECT ALL DATA FORM LIST
    [Tags]    TS2012_002
    [Documentation]    Validate : Field Campaign Code : กรณี เลือกข้อมูลที่มีในตัวเลือกทุกอัน

    ${group_value}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    TS2012_002    ${Virual_Card_error_message}

        Key_in_step_1_feature.VERIFY FIELD - TS1012_002    ${group_value}


TS2013_001 - VALIDATE FIELD ACTIVITY CODE INPUT DATA DO NOT HAVE A LIST
    [Tags]    TS2013_001
    [Documentation]    Validate : Field Activity Code : กรณี กรอกข้อมูลที่ไม่มีในตัวเลือก

    ${group_value}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    TS2013_001    ${Virual_Card_error_message}
    ${group_value_verify}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    error_message_2    ${Virual_Card_error_message}

        Key_in_step_1_feature.VERIFY FIELD - TS1013_001    ${group_value}    ${group_value_verify}


TS2013_002 - VALIDATE FIELD ACTIVITY CODE CASE SELECT ALL DATA FORM LIST
    [Tags]    TS2013_002
    [Documentation]    Validate : Field Special Case : กรณี เลือกข้อมูลที่มีในตัวเลือกทุกอัน

    ${group_value}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    TS2013_002    ${Virual_Card_error_message}

        Key_in_step_1_feature.VERIFY FIELD - TS1013_002    ${group_value}


TS2014_001 - VALIDATE FIELD SPECIAL CASE CASE INPUT DATA DO NOT HAVE A LIST
    [Tags]    TS2014_001
    [Documentation]    Validate : Field Special Case : กรณี ไม่เลือกข้อมูล

    ${group_value}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    TS2014_001    ${Virual_Card_error_message}
    ${group_value_verify}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    error_message_2    ${Virual_Card_error_message}

        Key_in_step_1_feature.VERIFY FIELD - TS1014_001    ${group_value}    ${group_value_verify}


TS2014_002 - VALIDATE FIELD SPECIAL CASE CASE SELECT ALL DATA FORM LIST
    [Tags]    TS2014_002
    [Documentation]    Validate : Field Special Case : กรณี เลือกข้อมูลที่มีในตัวเลือกทุกอัน

    ${group_value}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    TS2014_002    ${Virual_Card_error_message}

        Key_in_step_1_feature.VERIFY FIELD - TS1014_002    ${group_value}


TS3001_001 - VALIDATE FIELD UMAY+ CARD CASE INPUT WRONG FORMAT
    [Tags]    TS3001_001
    [Documentation]    Validate : Field Umay+ Card : * กรณี กรอกไม่ถูกรูปแบบ

    ${group_value}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    TS3001_001    ${Umay+_Card_error_message}
    ${group_value_verify}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    error_message    ${Umay+_Card_error_message}

        Key_in_step_1_feature.VERIFY FIELD - TS3001_001    ${group_value}    ${group_value_verify}


TS3001_002 - VALIDATE FIELD UMAY+ CARD CASE INPUT IS NOT THE SAME
    [Tags]    TS3001_002
    [Documentation]    Validate : Field Umay+ Card : * กรณี กรอกไม่เหมือนกัน

    ${group_value}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    TS3001_002    ${Umay+_Card_error_message}
    ${group_value_verify}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    error_message_2    ${Umay+_Card_error_message}

        Key_in_step_1_feature.VERIFY FIELD - TS3001_002    ${group_value}    ${group_value_verify}


TS3001_003 - VALIDATE FIELD UMAY+ CARD CASE INFORMATION CORRECTLY
    [Tags]    TS3001_003
    [Documentation]    Validate : Field Umay+ Card : * กรณี กรอกถูกต้อง

    ${group_value}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    TS3001_003    ${Umay+_Card_error_message}

        Key_in_step_1_feature.VERIFY FIELD - TS3001_003    ${group_value}


TS3002_001 - VALIDATE FIELD ID NO CASE INPUT INCOMEPLETE 13 DIGITS 
    [Tags]    TS3002_001
    [Documentation]    Validate : Field ID No กรณี กรอกไม่ครบ 13 ตัว 
    
    ${group_value}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    TS3002_001    ${Umay+_Card_error_message}

        Key_in_step_1_feature.VERIFY FIELD - TS3002_001    ${group_value}


TS3002_002 - VALIDATE FIELD ID NO CASE INPUT ID AND CONFIRM ID NOT MATCH
    [Tags]    TS3002_002
    [Documentation]    Validate : Field ID No กรณี กรอก ID กับ Confirm ID ไม่ตรงกัน
    
    ${group_value}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    TS3002_002    ${Umay+_Card_error_message}
    ${group_value_verify}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    error_message    ${Umay+_Card_error_message}

        Key_in_step_1_feature.VERIFY FIELD - TS3002_002    ${group_value}    ${group_value_verify}


TS3002_003 - VALIDATE FIELD ID NO CASE INPUT WRONG FORMAT
    [Tags]    TS3002_003
    [Documentation]    Validate : Field ID No กรณี กรอกไม่ถูก Format ID
    
    ${group_value}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    TS3002_003    ${Umay+_Card_error_message}
    ${group_value_verify}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    error_message_2    ${Umay+_Card_error_message}

        Key_in_step_1_feature.VERIFY FIELD - TS3002_003    ${group_value}    ${group_value_verify} 


TS3002_004 - VALIDATE FIELD ID NO CASE INPUT INFORMATION CORRECTLY
    [Tags]    TS3002_004
    [Documentation]    Validate : Field ID No กรณี กรอก ID ถูกต้อง
    
    ${group_value}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    TS3002_004    ${Umay+_Card_error_message}

        Key_in_step_1_feature.VERIFY FIELD - TS3002_004    ${group_value}


TS3003_001 - VALIDATE FIELD TITLE (THAI) CASE NOT SELECT
    [Tags]    TS3003_001
    [Documentation]    Validate : Field Title (Thai) กรณี ไม่เลือกข้อมูล
    
    ${group_value}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    TS3003_001    ${Umay+_Card_error_message}
    ${group_value_verify}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    error_message    ${Umay+_Card_error_message}

        Key_in_step_1_feature.VERIFY FIELD - TS3003_001    ${group_value}    ${group_value_verify} 


TS3003_002 - VALIDATE FIELD TITLE (THAI) CASE INPUT DATA DO NOT HAVE A LIST
    [Tags]    TS3003_002
    [Documentation]    Validate : Field Title (Thai) กรณี กรอกข้อมูลที่ไม่มีในตัวเลือก
    
    ${group_value}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    TS3003_002    ${Umay+_Card_error_message}
    ${group_value_verify}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    error_message_2    ${Umay+_Card_error_message}

        Key_in_step_1_feature.VERIFY FIELD - TS3003_002    ${group_value}    ${group_value_verify} 


TS3003_003 - VALIDATE FIELD TITLE (THAI) CASE INPUT ALL DATA FORM LIST
    [Tags]    TS3003_003
    [Documentation]    Validate : Field Title (Thai) กรณี กรอกข้อมูลที่มีในตัวเลือกทุกอัน
    
    ${group_value}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    TS3003_003    ${Umay+_Card_error_message}

        Key_in_step_1_feature.VERIFY FIELD - TS3003_003    ${group_value}


TS3004_001 - VALIDATE FIELD TITLE (THAI) CASE OF ENTERING MORE THAN 100 CHARACTERS
    [Tags]    TS3004_001
    [Documentation]    Validate : Field Name (Thai) :* กรณี กรอกข้อมูลเกิน 100 ตัวอักษร

    ${group_value}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    TS3004_001    ${Umay+_Card_error_message}

        Key_in_step_1_feature.VERIFY FIELD - TS3004_001    ${group_value}


TS3004_002 - VALIDATE FIELD NAME (THAI) IN CASE OF INCOMPLETE DATA ENTRY
    [Tags]    TS3004_002
    [Documentation]    Validate : Field Name (Thai) :* กรณี ไม่กรอกกรอกข้อมูล
    
    ${group_value}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    TS3004_002    ${Umay+_Card_error_message}

    ${group_value_error}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    error_message    ${Umay+_Card_error_message}

        Key_in_step_1_feature.VERIFY FIELD - TS3004_002    ${group_value}    ${group_value_error}


TS3005_001 - VALIDATE FIELD SURNAME (THAI) IN CASE OF ENTERING MORE THAN 100 CHARACTERS
    [Tags]    TS3005_001
    [Documentation]    Validate : Field Surname(Thai) :* กรณี กรอกข้อมูลเกิน 100 ตัวอักษร
    
    ${group_value}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    TS3005_001    ${Umay+_Card_error_message}

        Key_in_step_1_feature.VERIFY FIELD - TS3005_001    ${group_value}


TS3005_002 - VALIDATE FIELD SURNAME (THAI) IN CASE OF INCOMPLETE DATA ENTRY
    [Tags]    TS3005_002
    [Documentation]    Validate : Field Surname (Thai) :* กรณี ไม่กรอกกรอกข้อมูล
    
    ${group_value}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    TS3005_002    ${Umay+_Card_error_message}
    ${group_value_error}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    error_message    ${Umay+_Card_error_message}

        Key_in_step_1_feature.VERIFY FIELD - TS3005_002    ${group_value}    ${group_value_error}

    
TS3006_001 - FIELD BIRTH DATE IN CASE OF INCOMPLETE DATA ENTRY
    [Tags]    TS3006_001
    [Documentation]    Validate : Field Birth Date:* กรณี ไม่กรอกข้อมูล
    
    ${group_value}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    TS3006_001    ${Umay+_Card_error_message}
    ${group_value_error}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    error_message    ${Umay+_Card_error_message}

        Key_in_step_1_feature.VERIFY FIELD - TS3006_001    ${group_value}    ${group_value_error}


TS3006_002 - FIELD BIRTH DATE IN CASE OF INCORRECT DATA ENTRY
    [Tags]    TS3006_002
    [Documentation]    Validate : Field Birth Date:* กรณี กรอกข้อมูลไม่ถูกต้อง
    
    ${group_value}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    TS3006_002    ${Umay+_Card_error_message}
    ${group_value_error}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    error_message    ${Umay+_Card_error_message}

        Key_in_step_1_feature.VERIFY FIELD - TS3006_002    ${group_value}    ${group_value_error}


TS3006_003 - FIELD BIRTH DATE IN CASE OF DATA NOT SAME
    [Tags]    TS3006_003
    [Documentation]    Validate : Field Birth Date:* กรณี กรอกข้อมูลไม่ตรงกัน
    
    ${group_value}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    TS3006_003    ${Umay+_Card_error_message}
    ${group_value_error}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    error_message    ${Umay+_Card_error_message}

        Key_in_step_1_feature.VERIFY FIELD - TS3006_003    ${group_value}    ${group_value_error}


TS3007_001 - FIELD MOBILE NUMBER IN CASE OF DATA OVER 10 CHARACTER
    [Tags]    TS3007_001
    [Documentation]    Validate : Field Mobile No. : ตรวจสอบกรอกได้ไม่เกิน 10 ตัว
    
    ${group_value}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    TS3007_001    ${Umay+_Card_error_message}

        Key_in_step_1_feature.VERIFY FIELD - TS3007_001    ${group_value}


TS3008_001 - FIELD EXPIRE DATE (THAI) IN CASE OF DATA BLANK
    [Tags]    TS3007_001
    [Documentation]    Validate : Field Expire Date :* กรณี ไม่กรอกข้อมูล
    
    ${group_value}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    TS3008_001    ${Umay+_Card_error_message}
    ${group_value_error}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    error_message    ${Umay+_Card_error_message}

        Key_in_step_1_feature.VERIFY FIELD - TS3008_001    ${group_value}    ${group_value_error}


TS3008_002 - FIELD EXPIRE DATE (THAI) IN CASE OF INCORRECT DATA ENTRY
    [Tags]    TS3008_002
    [Documentation]    Validate : Field Expire Date :* กรณี กรอกข้อมูลไม่ถูกต้อง
    
    ${group_value}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    TS3008_002    ${Umay+_Card_error_message}

    ${group_value_error}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    error_message    ${Umay+_Card_error_message}

        Key_in_step_1_feature.VERIFY FIELD - TS3008_002    ${group_value}    ${group_value_error}


TS3009_001 - VALIDATE FIELD APPLY TYPE CASE INPUT DATA DO NOT HAVE A LIST
    [Tags]    TS3009_001
    [Documentation]    Validate : Field Apply Type :* กรณี กรอกข้อมูลที่ไม่มีในตัวเลือก

    ${group_value}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    TS3009_001    ${Umay+_Card_error_message}
    ${group_value_verify}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    error_message_2    ${Umay+_Card_error_message}

        Key_in_step_1_feature.VERIFY FIELD - TS3009_001    ${group_value}    ${group_value_verify}


TS3009_002 - VALIDATE FIELD APPLY TYPE CASE CASE NOT SELECT
    [Tags]    TS3009_002
    [Documentation]    Validate : Field Apply Type :* กรณี ไม่เลือกข้อมูล

    ${group_value}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    TS3009_002    ${Umay+_Card_error_message}
    ${group_value_verify}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    error_message    ${Umay+_Card_error_message}

        Key_in_step_1_feature.VERIFY FIELD - TS3009_002    ${group_value}    ${group_value_verify}


TS3009_003 - VALIDATE FIELD APPLY TYPE CASE SELECT ALL DATA FORM LIST
    [Tags]    TS3009_003
    [Documentation]    Validate : Field Apply Type :* กรณี เลือกข้อมูลที่มีในตัวเลือกทุกอัน

    ${group_value}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    TS3009_003    ${Umay+_Card_error_message}

        Key_in_step_1_feature.VERIFY FIELD - TS3009_003    ${group_value}


TS3010_001 - FIELD APPLY VIA CASE OF NO DATA IN SELECTION
    [Tags]    TS3010_001
    [Documentation]    Validate : Field Apply Via :* กรณี กรอกข้อมูลที่ไม่มีในตัวเลือก
    
    ${group_value}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    TS3010_001    ${Umay+_Card_error_message}
    ${group_value_error}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    error_message_2    ${Umay+_Card_error_message}

        Key_in_step_1_feature.VERIFY FIELD - TS3010_001    ${group_value}    ${group_value_error}


TS3010_002 - FIELD APPLY VIA CASE OF DATA BLANK
    [Tags]    TS3010_002
    [Documentation]    Validate : Field Apply Via :* กรณี ไม่เลือกข้อมูล
    
    ${group_value}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    TS3010_002    ${Umay+_Card_error_message}
    ${group_value_error}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    error_message    ${Umay+_Card_error_message}

        Key_in_step_1_feature.VERIFY FIELD - TS3010_002    ${group_value}    ${group_value_error}


TS3010_003 - VALIDATE FIELD APPLY VIA CASE SELECT ALL DATA FORM LIST
    [Tags]    TS3010_003
    [Documentation]    'Validate : Field Apply Via :* กรณี เลือกข้อมูลที่มีในตัวเลือกทุกอัน

    ${group_value}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    TS3010_003    ${Umay+_Card_error_message}

        Key_in_step_1_feature.VERIFY FIELD - TS3010_003    ${group_value}


TS3011_001 - VALIDATE FIELD APPLY CHANNEL CASE INPUT DATA DO NOT HAVE A LIST
    [Tags]    TS3011_001
    [Documentation]    Validate : Field Apply Channel :* กรณี กรอกข้อมูลที่ไม่มีในตัวเลือก

    ${group_value}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    TS3011_001    ${Umay+_Card_error_message}
    ${group_value_verify}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    error_message_2    ${Umay+_Card_error_message}

        Key_in_step_1_feature.VERIFY FIELD - TS3011_001    ${group_value}    ${group_value_verify}


TS3011_002 - VALIDATE FIELD APPLY CHANNEL CASE NOT SELECT
    [Tags]    TS3011_002
    [Documentation]    Validate : Field Apply Channel :* กรณี ไม่เลือกข้อมูล

    ${group_value}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    TS3011_002    ${Umay+_Card_error_message}
    ${group_value_verify}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    error_message    ${Umay+_Card_error_message}

        Key_in_step_1_feature.VERIFY FIELD - TS3011_002    ${group_value}    ${group_value_verify}


TS3011_003 - VALIDATE FIELD APPLY CHANNEL CASE SELECT ALL DATA FORM LIST
    [Tags]    TS3011_003
    [Documentation]    Validate : Field Apply Channel :* กรณี เลือกข้อมูลที่มีในตัวเลือกทุกอัน

    ${group_value}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    TS3011_003    ${Umay+_Card_error_message}

        Key_in_step_1_feature.VERIFY FIELD - TS3011_003    ${group_value}


TS3012_001 - VALIDATE FIELD SLAE AGENT CODE CASE INPUT DATA DO NOT HAVE A LIST
    [Tags]    TS3012_001
    [Documentation]    Validate : Field Sale Agent Code : กรณี กรอกข้อมูลที่ไม่มีในตัวเลือก

    ${group_value}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    TS3012_001    ${Umay+_Card_error_message}
    ${group_value_verify}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    error_message_2    ${Umay+_Card_error_message}

        Key_in_step_1_feature.VERIFY FIELD - TS3012_001    ${group_value}    ${group_value_verify}


TS3012_002 - VALIDATE FIELD SLAE AGENT CODE CASE SELECT ALL DATA FORM LIST
    [Tags]    TS3012_002
    [Documentation]    Validate : Field Sale Agent Code : กรณี เลือกข้อมูลที่มีในตัวเลือกทุกอัน

    ${group_value}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    TS3012_002    ${Umay+_Card_error_message}

        Key_in_step_1_feature.VERIFY FIELD - TS3012_002    ${group_value}


TS3013_001 - VALIDATE FIELD CAMPAIGN CODE CASE INPUT DATA DO NOT HAVE A LIST
    [Tags]    TS3013_001
    [Documentation]    Validate : Field Campaign Code : กรณี กรอกข้อมูลที่ไม่มีในตัวเลือก

    ${group_value}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    TS3013_001    ${Umay+_Card_error_message}
    ${group_value_verify}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    error_message_2    ${Umay+_Card_error_message}

        Key_in_step_1_feature.VERIFY FIELD - TS3013_001    ${group_value}    ${group_value_verify}


TS3013_002 - VALIDATE FIELD CAMPAIGN CODE CASE SELECT ALL DATA FORM LIST
    [Tags]    TS3013_002
    [Documentation]    Validate : Field Campaign Code : กรณี เลือกข้อมูลที่มีในตัวเลือกทุกอัน

    ${group_value}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    TS3013_002    ${Umay+_Card_error_message}

        Key_in_step_1_feature.VERIFY FIELD - TS3013_002    ${group_value}


TS3014_001 - VALIDATE FIELD SPECIAL CASE CASE INPUT DATA DO NOT HAVE A LIST
    [Tags]    TS3014_001
    [Documentation]    Validate : Field Special Case : กรณี ไม่เลือกข้อมูล

    ${group_value}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    TS3014_001    ${Umay+_Card_error_message}
    ${group_value_verify}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    error_message_2    ${Umay+_Card_error_message}

        Key_in_step_1_feature.VERIFY FIELD - TS3014_001    ${group_value}    ${group_value_verify}


TS3014_002 - VALIDATE FIELD SPECIAL CASE CASE SELECT ALL DATA FORM LIST
    [Tags]    TS3014_002
    [Documentation]    Validate : Field Special Case : กรณี เลือกข้อมูลที่มีในตัวเลือกทุกอัน

    ${group_value}    Common_keyword.SET SHEET EXCEL AND ROW EXCEL    TS3014_002    ${Umay+_Card_error_message}

        Key_in_step_1_feature.VERIFY FIELD - TS3014_002    ${group_value}