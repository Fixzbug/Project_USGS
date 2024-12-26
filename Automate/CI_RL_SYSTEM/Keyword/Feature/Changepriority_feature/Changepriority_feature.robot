*** Settings ***
Resource    ${CURDIR}/../../../Import/Path_import.robot    # robotcode: ignore

*** Variables ***
# ${state_check}    True
${state_check}    False
@{state_next_step_list}
...    Not Success : Key 1
...    Not Success : Changepriority_KS2	
...    Not Success : Key 2 	
...    Not Success : Changepriority_INT	
...    Not Success : INTERVIEW	
...    Not Success : Changepriority_KES
...    Not Success : Kessai


*** Keywords ***

SET FEATURE - CHANGE PRIORITY
    [Arguments]    ${state}    ${option}=Normal
    
    FOR    ${index}    ${data}    IN ENUMERATE    @{state_next_step_list}
        # ต้อง change ผ่านเท่านั้นถึงจะทำ key1,key2,interview,kessai
        IF  '${state_next_step}' != '${data}' and '${TC_no}' != '' and '${ID_no}' != '' and '${branch}' != '' and '${app_no}' != '' and '${card}' != ''

            BuiltIn.Log    !!REDY TO CHANGE PRIORITY!!
            Login_page.SET LOGIN SSO TO RL    Kessai         # Login SSO
            IF  '${state}' == 'MANUAL'
                IF  '${option}' == 'Normal'   
                    ${popup}    BuiltIn.Run Keyword And Return Status    Common_keyword.WAIT STATE AUTOALLOWCATE OR MANUAL    MANUAL
                    BuiltIn.Run Keyword If    '${popup}' == 'True'    Changepriority_page.SELECT MENU TO CHANGE PRIORITY PAGE 
                ELSE IF  '${option}' == 'GNO' 
                    ${popup}    BuiltIn.Run Keyword And Return Status    Common_keyword.WAIT STATE AUTOALLOWCATE OR MANUAL    MANUAL
                    BuiltIn.Run Keyword If    '${popup}' == 'True'    Changepriority_page.SELECT MENU TO CHANGE PRIORITY PAGE GNO 
                END
            ELSE IF  '${state}' == 'AUTOALLOWCATE'
                IF  '${option}' == 'Normal'   
                    ${popup}    BuiltIn.Run Keyword And Return Status    Common_keyword.WAIT STATE AUTOALLOWCATE OR MANUAL    AUTOALLOWCATE
                    BuiltIn.Run Keyword If    '${popup}' == 'True'    Changepriority_page.SELECT MENU TO CHANGE PRIORITY PAGE 
                ELSE IF  '${option}' == 'GNO' 
                    ${popup}    BuiltIn.Run Keyword And Return Status    Common_keyword.WAIT STATE AUTOALLOWCATE OR MANUAL    AUTOALLOWCATE
                    BuiltIn.Run Keyword If    '${popup}' == 'True'    Changepriority_page.SELECT MENU TO CHANGE PRIORITY PAGE GNO 
                END
            END
            BuiltIn.Exit For Loop
        ELSE
            BuiltIn.fail    !!NOT PASS ERROR SOME STEP CHECK LOG AND EXCEL!!    
            BuiltIn.Exit For Loop
        END
    END
  

   
 


   

