*** Settings ***
Resource    ${CURDIR}/../../../Import/Path_import.robot

*** Keywords ***

SET INPUT LASER ID TO CONFIRM
    [Arguments]    ${group_value}
        
    CLICK BUTTON YES CONFIRM
    
        # Recheck_Key_in_step_1_page.INPUT LASER ID    ${group_value}
    
        #     Recheck_Key_in_step_1_page.CLICK BUTTON DOPA
    
        #         Recheck_Key_in_step_1_page.CLICK BUTTON YES DOPA
    
                    Recheck_Key_in_step_1_page.CLICK BUTTON NCB 
    
                        # Recheck_Key_in_step_1_page.CLICK BUTTON SEND DOCUMENT    


SET INPUT NAME ENG AND CONFIRM TO KEY IN STEP 2
        
    Recheck_Key_in_step_1_page.RECHECK KEY IN STEP 1 - INPUT NAME ENG

        Recheck_Key_in_step_1_page.RECHECK KEY IN STEP 1 - INPUT SURNAME ENG

            Recheck_Key_in_step_1_page.CICLK CONFIRM NAME ENG
        
                Recheck_Key_in_step_1_page.CLICK BUTTON YES DOPA


SET RECHECK KEY IN STEP 1
    [Arguments]    ${group_value}

    Execute JavaScript    window.scrollTo(0, 0);

        Wait Until Element Is Visible    ${Locator_Title}    60s

    ${Title}    Get Text    ${Locator_Title}
      
        Run Keyword If    '${Title}'=='--Select--'    SELECT DROPDOWN TITLE NAME    ${group_value}
 
           BuiltIn.Wait Until Keyword Succeeds   20x    1s    Recheck_key_in_step_1_page.CLICK BUTTON CONFIRM

    ${Status_name_eng}    Run Keyword And Return Status    SeleniumLibrary.Wait Until Element Is Visible    ${Locator_name_eng}    20s    
    
    ${Status}    Run Keyword And Return Status    SeleniumLibrary.Wait Until Element Is Visible    ${Locator_Yes}    20s

        Run Keyword If    '${Status}'=='True'    CLICK BUTTON YES CONFIRM

        Run Keyword If    '${Status_name_eng}'=='True'    SET INPUT NAME ENG AND CONFIRM TO KEY IN STEP 2
        
        Run Keyword If    '${Status}'=='False'    SET INPUT LASER ID TO CONFIRM    ${group_value}

        ${Status}    Run Keyword And Return Status    SeleniumLibrary.Wait Until Element Is Visible    ${Locator_Ncb}    20s
          
            Run Keyword If    '${Status}'=='True'    SET INPUT LASER ID TO CONFIRM    ${group_value}

                Capture_screen.TEXT SET MESSAGE TO GLOBAL FOR PRINT TO CAPTURE SCREEN    RECHECK_KEY_IN_STEP 1

                    Capture_screen.CAPTURE SCREEN CURRENT PAGE
   