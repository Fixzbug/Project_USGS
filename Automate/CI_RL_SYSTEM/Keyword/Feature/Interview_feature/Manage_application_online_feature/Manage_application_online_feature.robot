*** Settings ***
Resource    ${CURDIR}/../../../../Import/Path_import.robot

*** Keywords ***

SET LOGIN SSO TO CHOOSE MENU MANAGE APPLICATION ONLINE
   [Arguments]    ${TC_Index}     ${locator_menu} 
   
    ${set_tc_value_User}     Set variable      ${TC_Index}
    ${group_value_User}     Get value from json      ${data_user_rl}       $[?(@.TC=='${set_tc_value_User}')]

    OPEN INTRANET
    
        CLICK SSO ICON
    
            INPUT USERNAME AND PASSWORD SSO    ${TC_Index}
    
                CLICK MENU RL SYSTEM    ${link_menu_project_locator}    ${data_user_rl}[0][LINK]   

                    # Changepriority_Page.CHANGE PRIORITY - SELECT DROPDOWN MODE WORK PROCESS
        
                    #     Changepriority_Page.CHANGE PRIORITY - CLICK BUTTON CONFRIM

                            Changepriority_Page.CHANGE PRIORITY - SELECT DROPDOWN BRANCH    ${group_value_User}
            
                                Changepriority_Page.CHANGE PRIORITY - CLICK BUTTON OK BRANCH

                                    CHOOSE MENU BY LOCATOR    ${locator_menu}

                                        BuiltIn.Sleep    3s


SET MANAGE APPLICATION ONLINE TO KEY IN STEP 1
    [Arguments]    ${TC_Index}

    Manage_application_page.INPUT ID    ${TC_Index}
    
        Manage_application_page.CLICK SEARCH
    
            Manage_application_page.VERIFY TITLE
    
                Manage_application_page.CLICK HYPER LINK VIEW
        
                    Manage_application_page.CLICK HYPER LINK PRINT
        
                        Manage_application_page.CLICK HYPER LINK KEY IN STEP 1


VERIFY DATA MANAGE APPLICATION ONLINE
    [Arguments]    ${TS_no}    ${field_name}

    ${set_tc_value}    Set variable    ${TS_no}
    ${group_value}    Get value from json    ${RL_migrate_apply_process_RL_F_0007}    $[?(@.TC=='${set_tc_value}')]

    ${set_tc_value}    Set variable    INDEX
    ${group_value_index}    Get value from json    ${RL_migrate_apply_process_RL_F_0007}    $[?(@.TC=='${set_tc_value}')]

    ${index_data_page}    Common_keyword.CONVERT DATA FLOAT TO STRING    ${group_value_index}[0][${field_name}]
    
        BuiltIn.Sleep    03s
                ${group_data_mangeapp}    Common_keyword.GET DATA TEXT BY LOCATOR AND SPLIT STRING BY SPECIAL MARK    ${table_data_mangeapp_locator}  

            BuiltIn.Run Keyword And Continue On Failure    Common_keyword.COMPARE THE DATA BETWEEN EXCEL AND PAGE AND YAML BY SHOULD BE EQUAL    ${field_name}    ${index_data_page}    ${group_value}   ${group_data_mangeapp}
