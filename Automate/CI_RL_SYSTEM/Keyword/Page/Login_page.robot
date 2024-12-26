*** Settings ***
Resource    ${CURDIR}/../../Import/Path_import.robot    # robotcode: ignore


*** Keywords ***

SET LOGIN SSO TO RL MANUAL AND CHOOSE MENU INTERVIEW RL
   [Arguments]    ${TC_Index}     ${locator_menu} 
   
    ${group_value_User}     JSONLibrary.Get value from json      ${data_user_rl}       $[?(@.TC=='${TC_Index}')]

    Common_keyword.OPEN INTRANET

    Common_keyword.CLICK SSO ICON

    Common_keyword.INPUT USERNAME AND PASSWORD SSO    ${TC_Index}

    Common_keyword.CLICK MENU RL SYSTEM    ${link_menu_project_locator}    ${data_user_rl}[0][LINK]   

    Changepriority_Page.CHANGE PRIORITY - SELECT DROPDOWN MODE WORK PROCESS

    Changepriority_Page.CHANGE PRIORITY - CLICK BUTTON CONFRIM

    Changepriority_Page.CHANGE PRIORITY - SELECT DROPDOWN BRANCH    ${group_value_User}

    Changepriority_Page.CHANGE PRIORITY - CLICK BUTTON OK BRANCH

    Common_keyword.CHOOSE MENU BY LOCATOR    ${locator_menu}


SET LOGIN SSO TO RL
   [Arguments]    ${TC_Index}    
   
   Common_keyword.OPEN INTRANET

   Common_keyword.CLICK SSO ICON
   
   Common_keyword.START TIME    # บอกเวลาเริ่มต้น

   Common_keyword.INPUT USERNAME AND PASSWORD SSO    ${TC_Index}

   Capture_Screen.TEXT SET MESSAGE TO GLOBAL FOR PRINT TO CAPTURE SCREEN    PORTAL_PAGE

   Capture_Screen.CAPTURE SCREEN INTRO PAGE

   Common_keyword.CLICK MENU RL SYSTEM    ${link_menu_project_locator}    ${data_user_rl}[0][LINK]


